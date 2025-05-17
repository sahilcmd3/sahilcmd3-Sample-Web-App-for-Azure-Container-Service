# Build stage
FROM node:18-alpine AS build
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source files and build the application
COPY tsconfig.json ./
COPY src/ ./src/
RUN npm run build

# Production stage
FROM node:18-alpine
WORKDIR /app

# Copy built application and package files
COPY --from=build /app/dist ./dist
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/package*.json ./

# Copy static files
COPY src/public ./dist/public

# Set environment variables
ENV PORT=80
ENV NODE_ENV=production

# Expose the port
EXPOSE 80

# Start the application
CMD ["node", "dist/app.js"]