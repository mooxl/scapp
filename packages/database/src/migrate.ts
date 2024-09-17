import { ENV } from "@scapp/shared/environment";
import { drizzle } from "drizzle-orm/postgres-js";
import { migrate as drizzle_migrate } from "drizzle-orm/postgres-js/migrator";
import postgres from "postgres";

export const migrate = async () => {
  try {
    const db = drizzle(postgres(ENV.SERVER_DB_URL, { max: 1 }));
    console.log("⏳ Running migrations...");
    const start = Date.now();
    await drizzle_migrate(db, {
      migrationsFolder: "./migration",
    });
    const end = Date.now();
    console.log(`✅ Migrations complete in ${end - start}ms`);
  } catch (err) {
    console.error("❌ Migration failed");
    console.error(err);
  }
};
