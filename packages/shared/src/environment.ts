import { createEnv } from "@t3-oss/env-core";
import { z } from "zod";

export const ENV = createEnv({
  server: {
    SERVER_DB_URL: z.string(),
    SERVER_CLIENT_URL: z.string().url(),
  },
  runtimeEnv: process.env,
});
