import { db } from "@scapp/database/client";
import { user } from "@scapp/database/schema";
import { ERROR_MESSAGES } from "@scapp/shared/constants";
import {
  createUserInput,
  deleteUserInput,
  getUserInput,
  loginInput,
  updateUserInput,
} from "@scapp/shared/types";
import { TRPCError } from "@trpc/server";
import { and, eq } from "drizzle-orm";
import { procedure, publicProcedure, router } from "../utils/api";
import { argon2id, auth } from "../utils/auth";

const Router = router({
  test: publicProcedure.query(async () => {
    console.log("test");
    return "Hello World";
  }),
  get: procedure
    .input(getUserInput.optional())
    .query(async ({ input, ctx }) => {
      const userRecord = await db.query.user.findFirst({
        where: eq(user.id, input?.id ?? ctx.userId),
        columns: { password: false },
        with: { memberships: { with: { group: true } } },
      });
      if (!userRecord) {
        console.error("User not found");
        throw new TRPCError({
          code: "NOT_FOUND",
          message: ERROR_MESSAGES.NOT_FOUND,
        });
      }
      return userRecord;
    }),

  update: procedure.input(updateUserInput).mutation(async ({ input }) => {
    try {
      return await db.transaction(async (tx) => {
        if (input.deactivated) {
          await auth.invalidateUserSessions(input.id);
        }
        if (input.newPassword) {
          const hashedPassword = await argon2id.hash(input.newPassword);
          const [userRecordWithNewPassword] = await tx
            .update(user)
            .set({ password: hashedPassword })
            .where(eq(user.id, input.id))
            .returning();
          if (!userRecordWithNewPassword) {
            console.error("Password not updated");
            tx.rollback();
          }
        }
        const [userRecord] = await tx
          .update(user)
          .set(input)
          .where(eq(user.id, input.id))
          .returning();
        if (!userRecord) {
          console.error("User not updated");
          tx.rollback();
        }
        return null;
      });
    } catch (error) {
      throw new TRPCError({
        code: "INTERNAL_SERVER_ERROR",
        message: ERROR_MESSAGES.INTERNAL_SERVER_ERROR,
        cause: error,
      });
    }
  }),

  delete: procedure.input(deleteUserInput).mutation(async ({ input }) => {
    try {
      return await db.transaction(async (tx) => {
        const userRecord = await tx
          .delete(user)
          .where(eq(user.id, input.id))
          .returning();
        if (!userRecord.length) {
          console.error("User not deleted");
          tx.rollback();
        }
        return null;
      });
    } catch (error) {
      throw new TRPCError({
        code: "INTERNAL_SERVER_ERROR",
        message: ERROR_MESSAGES.INTERNAL_SERVER_ERROR,
        cause: error,
      });
    }
  }),

  getAll: procedure.query(async () => {
    const userRecords = await db.query.user.findMany();
    return userRecords;
  }),

  create: procedure.input(createUserInput).mutation(async ({ input }) => {
    try {
      return await db.transaction(async (tx) => {
        const hashedPassword = await argon2id.hash(input.password);
        const userRecord = await tx
          .insert(user)
          .values({
            ...input,
            password: hashedPassword,
          })
          .returning();
        if (!userRecord.length) {
          console.error("User not created");
          tx.rollback();
        }
        return null;
      });
    } catch (error) {
      throw new TRPCError({
        code: "INTERNAL_SERVER_ERROR",
        message: ERROR_MESSAGES.INTERNAL_SERVER_ERROR,
        cause: error,
      });
    }
  }),

  validate: publicProcedure.query(async ({ ctx }) => {
    const sessionId = auth.readSessionCookie(ctx.req.headers.cookie || "");
    if (!sessionId) {
      return null;
    }
    const session = await auth.validateSession(sessionId || "");
    if (session.session && session.user) {
      return {
        id: session.user.id,
        firstName: session.user.firstName,
        lastName: session.user.lastName,
        permissions: [
          "can_edit_users",
          "can_edit_dossiers",
          "can_edit_tickets",
          "can_edit_groups",
        ],
      };
    }
    return null;
  }),
  login: publicProcedure.input(loginInput).mutation(async ({ ctx, input }) => {
    try {
      const userRecord = await db.query.user.findFirst({
        where: and(eq(user.email, input.email), eq(user.deactivated, false)),
      });
      if (!userRecord) {
        console.error("User not found");
        throw new TRPCError({
          code: "UNAUTHORIZED",
          message: ERROR_MESSAGES.UAUTHORIZED,
        });
      }
      const isPasswordValid = await argon2id.verify(
        userRecord.password,
        input.password,
      );
      if (!isPasswordValid) {
        console.error("Invalid password");
        throw new TRPCError({
          code: "UNAUTHORIZED",
          message: ERROR_MESSAGES.UAUTHORIZED,
        });
      }
      const session = await auth.createSession(userRecord.id, {});
      ctx.res.header(
        "Set-Cookie",
        auth.createSessionCookie(session.id).serialize(),
      );
      return null;
    } catch {
      throw new TRPCError({
        code: "UNAUTHORIZED",
        message: "Fehler bei der Anmeldung. Ungültige E-Mail oder Kennwort.",
      });
    }
  }),
  logout: procedure.mutation(async ({ ctx }) => {
    await auth.invalidateUserSessions(ctx.userId);
    ctx.res.header("Set-Cookie", auth.createBlankSessionCookie().serialize());
    return null;
  }),
});

export default Router;
