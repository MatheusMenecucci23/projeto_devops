# Etapa 1: build da aplicação
FROM node:18-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build 

# Etapa 2: imagem final, usando nginx para servir a build
FROM nginx:stable-alpine

# Copia os arquivos da build para o diretório padrão do nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copia configuração personalizada do nginx (opcional)
COPY default.conf /etc/nginx/conf.d/default.conf

# Expor porta 80, que é a padrão do nginx
EXPOSE 80

# Comando padrão do nginx
CMD ["nginx", "-g", "daemon off;"]
