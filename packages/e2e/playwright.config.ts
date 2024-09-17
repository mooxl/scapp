import { defineConfig, devices } from "@playwright/test";

const timeout = 10 * 1000; // 10 seconds
export default defineConfig({
  testDir: "./tests",
  fullyParallel: true,
  retries: 4,
  reporter: "html",
  use: {
    baseURL: "http://localhost:3000",
    trace: "on",
  },
  timeout,
  expect: {
    timeout,
  },
  webServer: process.env.CI
    ? [
        {
          command: "pnpm run -w preview:client",
          url: "http://127.0.0.1:3000",
          timeout: 120 * 1000,
          reuseExistingServer: false,
          stdout: "pipe",
          stderr: "pipe",
        },
        {
          command: "pnpm run -w preview:server",
          url: "http://127.0.0.1:8000",
          timeout: 120 * 1000,
          reuseExistingServer: false,
          stdout: "pipe",
          stderr: "pipe",
        },
      ]
    : [],
  projects: [
    {
      name: "authentication",
      use: { ...devices["Desktop Chrome"] },
      testMatch: "/tests/authentication.setup.ts",
      teardown: "teardown",
    },
    {
      name: "teardown",
      testMatch: "/tests/authentication.teardown.ts",
    },
    {
      name: "chromium",
      use: {
        ...devices["Desktop Chrome"],
        viewport: { width: 1920, height: 1080 },
      },
      dependencies: ["authentication"],
    },
    // {
    // 	name: "firefox",
    // 	use: { ...devices["Desktop Firefox"] },
    // 	dependencies: ["authentication"],
    // },

    // {
    // 	name: "webkit",
    // 	use: { ...devices["Desktop Safari"] },
    // 	dependencies: ["authentication"],
    // },
  ],
});
