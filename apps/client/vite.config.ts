import ImportMetaEnvPlugin from "@import-meta-env/unplugin";
import { vitePlugin } from "@remix-run/dev";
import { remixRoutes } from "remix-routes/vite";
import { defineConfig } from "vite";
import tsconfigPaths from "vite-tsconfig-paths";

export default defineConfig({
  plugins: [
    ImportMetaEnvPlugin.vite({ example: ".import-meta-env" }),
    vitePlugin({ ssr: false, buildDirectory: "dist", appDirectory: "src" }),
    remixRoutes({ outDir: "." }),
    tsconfigPaths(),
  ],
  server: {
    port: 3000,
  },
});
