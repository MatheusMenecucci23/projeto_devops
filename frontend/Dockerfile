# frontend/Dockerfile
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve com nginx
FROM nginx:stable-alpine

COPY --from=build /app/dist /usr/share/nginx/html

# Remove o default config nginx para evitar conflito
RUN rm /etc/nginx/conf.d/default.conf

# Copie um config nginx customizado para roteamento de SPA
COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
