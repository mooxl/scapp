import { TRPCError, initTRPC } from "@trpc/server";
import type { CreateFastifyContextOptions } from "@trpc/server/adapters/fastify";

import { ERROR_MESSAGES } from "@scapp/shared/constants";
import { auth } from "./auth";

export const createContext = ({ req, res }: CreateFastifyContextOptions) => {
  return { req, res };
};

export type Context = Awaited<ReturnType<typeof createContext>>;

const t = initTRPC.context<Context>().create();

export const router = t.router;
export const middleware = t.middleware;

const isAuthenticated = t.middleware(async ({ ctx, next }) => {
  const sessionId = auth.readSessionCookie(ctx.req.headers.cookie || "");
  const session = await auth.validateSession(sessionId || "");
  if (!session.session || !session.user) {
    throw new TRPCError({
      code: "UNAUTHORIZED",
      message: ERROR_MESSAGES.UAUTHORIZED,
    });
  }
  return next({ ctx: { userId: session.user.id } });
});

export const procedure = t.procedure.use(isAuthenticated);
export const publicProcedure = t.procedure;
