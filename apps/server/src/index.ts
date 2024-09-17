import fastifyCors from "@fastify/cors";
import { ENV } from "@scapp/shared/environment";
import { fastifyTRPCPlugin } from "@trpc/server/adapters/fastify";
import fastify from "fastify";
import * as routers from "./routers";
import { createContext, router as trpcRouter } from "./utils/api";

const router = trpcRouter({
  ...routers,
});

const server = fastify({
  maxParamLength: 5000,
  logger: false,
  bodyLimit: 100 * 1024 * 1024,
});

await server.register(fastifyCors, {
  origin: ENV.SERVER_CLIENT_URL,
  credentials: true,
  methods: ["GET", "POST", "PUT", "DELETE", "OPTIONS"],
});

await server.register(fastifyTRPCPlugin, {
  prefix: "/trpc",
  useWSS: true,
  trpcOptions: { router, createContext },
});

server.get("/", async (_, reply) => {
  reply.code(200);
});

process.on("SIGINT", () => {
  server.close(() => {
    console.log("server closed");
    process.exit(0);
  });
});

try {
  console.log("⏳ Starting server...");
  await server.listen({
    port: 8000,
    host: process.env.NODE_ENV === "production" ? "0.0.0.0" : "localhost",
  });
} catch (_) {
  await server.close();
}

export type Router = typeof router;
