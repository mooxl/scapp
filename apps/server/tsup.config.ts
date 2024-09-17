import { defineConfig } from "tsup";

export default defineConfig({
  entry: ["src/index.ts"],
  clean: true,
  format: "esm",
  noExternal: ["@scapp/shared", "@scapp/database", "@scapp/types"],
  tsconfig: "tsconfig.json",
});
