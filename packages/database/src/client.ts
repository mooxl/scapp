import { ENV } from "@scapp/shared/environment";
import { drizzle } from "drizzle-orm/postgres-js";
import postgres from "postgres";
import * as schema from "./schema";

export const client = postgres(ENV.SERVER_DB_URL);
export const db = drizzle(client, { schema });
