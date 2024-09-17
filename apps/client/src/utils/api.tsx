import type { Router } from "@server";
import { QueryClient } from "@tanstack/react-query";
import {
  createTRPCQueryUtils,
  createTRPCReact,
  httpBatchLink,
} from "@trpc/react-query";
import type { inferRouterInputs, inferRouterOutputs } from "@trpc/server";

export const api = createTRPCReact<Router>();

export const apiClient = api.createClient({
  links: [
    httpBatchLink({
      url: `${import.meta.env.CLIENT_SERVER_URL}/trpc`,
      fetch(url, options) {
        return fetch(url, {
          ...options,
          credentials: "include",
        });
      },
    }),
  ],
});

export const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: false,
    },
  },
});

export const cache = createTRPCQueryUtils({
  queryClient,
  client: apiClient,
});

export type RouterOutput = inferRouterOutputs<Router>;
export type RouterInput = inferRouterInputs<Router>;
