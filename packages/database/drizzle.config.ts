import { ENV } from "@scapp/shared/environment";
import type { Config } from "drizzle-kit";

export default {
  schema: ["./src/schema/*"],
  out: "./migration",
  dialect: "postgresql",
  dbCredentials: {
    url: ENV.SERVER_DB_URL,
  },
} satisfies Config;
