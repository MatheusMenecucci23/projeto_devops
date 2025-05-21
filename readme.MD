# Guia de Instalação e Execução do Projeto com Docker

## Pré-requisitos
- Docker instalado na sua máquina  
- Docker Compose instalado (se for usar Docker Compose)  

---

## Passo 1: Instalar o Docker

Siga as instruções oficiais para instalar o Docker na sua plataforma:  
https://docs.docker.com/get-docker/

---

## Passo 2: Criar uma rede Docker para comunicação entre containers

```bash
docker network create minha-rede

## Passo 3: Executar o container do MySQL

```bash
docker run -d --name mysql-container --network minha-rede \
  -e MYSQL_ROOT_PASSWORD=123456789 \
  -e MYSQL_DATABASE=calculadora_db \
  -p 3307:3306 \
  mysql:8.0

## Passo 4: Executar o container do backend

```bash
docker run -d --name backend-container --network minha-rede \
  -p 8000:8000 \
  -e DB_USER=root \
  -e DB_PASSWORD=123456789 \
  -e DB_HOST=mysql-container \
  -e DB_NAME=calculadora_db \
  backend-image

## Passo 5: Executar o container do frontend

```bash
docker run -it --rm -p 5173:5173 frontend-image

## Passo 6: Usar Docker Compose para subir toda a aplicação
docker-compose up --build


## Dicas Úteis para Docker

- **Listar todos os containers ativos:**

  ```bash
  docker ps
  ```

- **Parar todos os containers em execução:**

  ```bash
  docker stop $(docker ps -q)
  ```

- **Remover todos os containers parados:**

  ```bash
  docker rm $(docker ps -aq)
  ```

- **Acessar o terminal de um container em execução:**

  ```bash
  docker exec -it <nome-do-container> bash
  ```

- **Visualizar logs de um container em tempo real:**

  ```bash
  docker logs -f <nome-do-container>
  ```

- **Reconstruir imagens e reiniciar containers com Docker Compose:**

  ```bash
  docker-compose up --build
  ```

- **Listar imagens Docker locais:**

  ```bash
  docker images
  ```

- **Remover imagens Docker não utilizadas:**

  ```bash
  docker image prune
  ```

---


