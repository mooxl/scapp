ARG ARCH=x64

FROM node:lts-alpine AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

FROM base AS prune
WORKDIR /prune
RUN pnpm install -g turbo@2.1.2
COPY . .
RUN turbo prune @scapp/server --docker --out-dir pruned-server
RUN turbo prune @scapp/client --docker --out-dir pruned-client

FROM base AS build-server
WORKDIR /build
COPY --from=prune /prune/pruned-server/json/ .
COPY --from=prune /prune/pruned-server/pnpm-lock.yaml .
RUN pnpm install --frozen-lockfile
COPY --from=prune /prune/pruned-server/full/ .
RUN pnpm install --frozen-lockfile
RUN pnpm build
RUN pnpm deploy --filter=server --prod server

FROM base AS build-client
WORKDIR /build
ARG ARCH
COPY --from=prune /prune/pruned-client/json/ .
COPY --from=prune /prune/pruned-client/pnpm-lock.yaml .
RUN pnpm install --frozen-lockfile
RUN pnpm add -g pkg
RUN pnpm exec pkg ./apps/client/node_modules/@import-meta-env/cli/bin/import-meta-env.js \
  -t node18-alpine-${ARCH} \
  -o import-meta-env-alpine
COPY --from=prune /prune/pruned-client/full/ .
RUN pnpm build 
RUN pnpm deploy --filter=client --prod client

FROM base AS server
WORKDIR /app
ENV NODE_ENV=production
COPY --from=build-server /build/server/package.json .
COPY --from=build-server /build/server/dist .
COPY --from=build-server /build/server/node_modules node_modules
COPY --from=build-server /build/packages/database/migration migration
EXPOSE 8000
CMD [ "node", "index.js" ]

FROM nginx:stable-alpine AS client
WORKDIR /app
COPY --from=build-client /build/client/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build-client /build/client/dist dist
COPY --from=build-client /build/client/env.sh .
COPY --from=build-client /build/client/.import-meta-env .
COPY --from=build-client /build/import-meta-env-alpine .
ENTRYPOINT ["/bin/sh", "env.sh"]
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]