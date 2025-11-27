# Stage 1 — Build React App
FROM node:18-alpine AS build
WORKDIR /app

# Copy package files & install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the project and build it
COPY . .
RUN npm run build

# Stage 2 — Serve the production build using Nginx
FROM nginx:alpine
WORKDIR /usr/share/nginx/html

# Remove default HTML files & copy build from previous stage
RUN rm -rf ./*
COPY --from=build /app/build .

# Expose port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
