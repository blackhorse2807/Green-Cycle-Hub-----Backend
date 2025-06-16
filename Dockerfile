# Stage 1: Build
FROM node:18 AS builder

RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app


COPY package*.json ./

COPY prisma ./prisma

RUN ls -l

RUN npm install typescript

RUN npm install

COPY . .

RUN npx prisma generate

RUN npx tsc -b

# stage - 2
FROM node:18-slim

RUN apt-get update -y && apt-get install -y openssl

WORKDIR /app

# Only copy necessary files from the builder
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/prisma ./prisma
COPY --from=builder /app/generated ./generated
COPY --from=builder /app/.env .env
COPY --from=builder /app/templates ./templates

ENV PRISMA_SCHEMA=prisma/schema.prisma

EXPOSE 8000

# Start the app
CMD ["node", "dist/index.js"]
