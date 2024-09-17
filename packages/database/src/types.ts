import { userSchema } from "@scapp/shared/types";
import type { BuildSelectSchema } from "drizzle-zod";
import type { z } from "zod";
import type { user } from "./schema";

userSchema satisfies z.ZodObject<BuildSelectSchema<typeof user, {}>>;
