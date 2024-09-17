import {
  boolean,
  foreignKey,
  pgTable,
  primaryKey,
  text,
  timestamp,
  uuid,
} from "drizzle-orm/pg-core";

export const session = pgTable(
  "session",
  {
    id: text("id").notNull(),
    userId: uuid("user_id").notNull(),
    expiresAt: timestamp("expires_at", {
      withTimezone: true,
      mode: "date",
    }).notNull(),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.id] }),
    fkUser: foreignKey({
      columns: [table.userId],
      foreignColumns: [user.id],
      name: "fk_user",
    }).onDelete("cascade"),
  }),
);

export const user = pgTable(
  "user",
  {
    id: uuid("id").defaultRandom().notNull(),
    email: text("email").unique().notNull(),
    password: text("password").notNull(),
    firstName: text("first_name").notNull(),
    lastName: text("last_name").notNull(),
    deactivated: boolean("deactivated").default(false).notNull(),
    createdAt: timestamp("created_at").defaultNow().notNull(),
    updatedAt: timestamp("updated_at").$onUpdate(() => new Date()),
  },
  (table) => ({
    pk: primaryKey({ columns: [table.id] }),
  }),
);
