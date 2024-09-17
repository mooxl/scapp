import { z } from "zod";

export const userSchema = z.object({
  id: z.string().uuid(),
  email: z.string().email(),
  firstName: z.string().min(3).max(255),
  lastName: z.string().min(3).max(255),
  password: z.string().min(1).max(255),
  deactivated: z.coerce.boolean(),
  createdAt: z.date(),
  updatedAt: z.date().nullable(),
});

export const loginInput = userSchema.pick({
  email: true,
  password: true,
});

export const updateUserInput = userSchema
  .pick({
    id: true,
    firstName: true,
    lastName: true,
    email: true,
    deactivated: true,
  })
  .merge(z.object({ newPassword: z.string().optional() }));
export const deleteUserInput = userSchema.pick({
  id: true,
});

export const getUserInput = userSchema.pick({
  id: true,
});

export const createUserInput = userSchema
  .pick({
    firstName: true,
    lastName: true,
    email: true,
    password: true,
  })
  .merge(z.object({ confirmPassword: z.string() }))
  .refine((data) => data.password === data.confirmPassword, {
    message: "Die Passwörter stimmen nicht überein",
    path: ["confirmPassword"],
  })
  .superRefine((data, ctx) => {
    if (data.password.length < 8) {
      ctx.addIssue({
        code: z.ZodIssueCode.too_small,
        type: "string",
        minimum: 8,
        inclusive: true,
        message: "Das Passwort muss mind. 8 Zeichen lang sein",
        path: ["password"],
      });
    }
    const containsLowerCaseLetter = new RegExp(/(?=.*[a-zäöü])/);
    if (!containsLowerCaseLetter.test(data.password)) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: "Das Passwort muss mind. 1 Kleinbuchstaben beinhalten",
        path: ["password"],
      });
    }
    const containsUpperCaseLetter = new RegExp(/(?=.*[A-ZÄÖÜ])/);
    if (!containsUpperCaseLetter.test(data.password)) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: "Das Passwort muss mind. 1 Großbuchstaben beinhalten",
        path: ["password"],
      });
    }
    const containsSpecialCharacter = new RegExp(
      /(?=.*[`!@#$%^&*()_\-+=\[\]{};':"\\|,.<>\/?~§])/,
    );
    if (!containsSpecialCharacter.test(data.password)) {
      ctx.addIssue({
        code: z.ZodIssueCode.custom,
        message: "Das Passwort muss mind. 1 Sonderzeichen beinhalten",
        path: ["password"],
      });
    }
  });

export const getAllUsersAssignedToTaskInput = z.object({
  processId: z.string().uuid(),
  taskId: z.string().uuid(),
});
