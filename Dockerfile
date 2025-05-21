# Build stage for typechecking and creating a production deployment
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package.json files
COPY package.json pnpm-workspace.yaml pnpm-lock.yaml ./
COPY packages/shared-lib/package.json ./packages/shared-lib/
COPY apps/app/package.json ./apps/app/

# Install pnpm
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install all dependencies (including dev dependencies)
RUN pnpm install --frozen-lockfile

# Copy source files
COPY tsconfig.json ./
COPY packages/shared-lib/src ./packages/shared-lib/src
COPY packages/shared-lib/tsconfig.json ./packages/shared-lib/
COPY apps/app/src ./apps/app/src
COPY apps/app/tsconfig.json ./apps/app/

# Run typecheck
RUN pnpm -r typecheck

# Create a production deployment using pnpm deploy
RUN mkdir -p /tmp/prod-deploy
RUN pnpm deploy --filter=@node-ts-monorepo/app --prod /tmp/prod-deploy

# Production stage with only the necessary files
FROM node:22-alpine

WORKDIR /app

# Set production environment
ENV NODE_ENV=production

# Copy the production deployment created by pnpm deploy
COPY --from=builder /tmp/prod-deploy .

# Command to run the app
CMD ["node", "--experimental-transform-types", "./apps/app/src/index.ts"]

# Expose any necessary ports
EXPOSE 3000
