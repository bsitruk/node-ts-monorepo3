# Node.js TypeScript Monorepo

A simple pnpm TypeScript monorepo with a shared library and a Node.js application.

## Requirements

- Node.js 22+
- pnpm

## Project Structure

- `packages/shared-lib`: Contains shared utility functions
- `apps/app`: A simple Node.js application that uses the shared library

## Setup

Install dependencies:

```bash
pnpm install
```

## Development

Run the app in development mode:

```bash
pnpm dev
```

or from the app directory:

```bash
cd apps/app
pnpm dev
```

## Production

Run the app in production mode:

```bash
pnpm start
```

## Docker

Build the Docker image:

```bash
docker build -t node-ts-monorepo .
```

Run the Docker container:

```bash
docker run -p 3000:3000 node-ts-monorepo
```

## Features

- Native TypeScript execution using `--experimental-transform-types`
- No build/transpilation step needed
- Shared library setup with workspace dependencies
- Docker support for production deployment
