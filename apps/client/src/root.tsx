import "@/global.css";
import { api, apiClient, queryClient } from "@/utils/api";
import {
  Links,
  Meta,
  Outlet,
  Scripts,
  ScrollRestoration,
} from "@remix-run/react";
import { QueryClientProvider } from "@tanstack/react-query";
import { ReactQueryDevtools } from "@tanstack/react-query-devtools";

export default function App() {
  return (
    <html lang="de">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Scapp</title>
        <Meta />
        <Links />
      </head>
      <body className="min-h-screen">
        <api.Provider client={apiClient} queryClient={queryClient}>
          <QueryClientProvider client={queryClient}>
            <ReactQueryDevtools
              initialIsOpen={false}
              buttonPosition="bottom-left"
            />
            <Outlet />
          </QueryClientProvider>
        </api.Provider>
        <ScrollRestoration />
        <Scripts />
      </body>
    </html>
  );
}

export function HydrateFallback() {
  return (
    <html lang="de">
      <head>
        <meta charSet="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Scapp</title>
        <Meta />
        <Links />
      </head>
      <body>
        <Scripts />
        <script
          // biome-ignore lint/security/noDangerouslySetInnerHtml: this is because we need to set the environment variables for the client via import-meta-env
          dangerouslySetInnerHTML={{
            __html: `globalThis.import_meta_env =
          JSON.parse('"import_meta_env_placeholder"')`,
          }}
        />
      </body>
    </html>
  );
}
