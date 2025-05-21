# Projeto Docker - Calculadora

Este projeto utiliza Docker para orquestrar os containers do MySQL, backend e frontend, conectados em uma rede Docker customizada.

---

## Comandos para rodar o ambiente Docker

### 1. Criar a rede Docker

```bash
docker network create minha-rede
```

### 2. Rodar o container MySQL

```bash
docker run -d --name mysql-container --network minha-rede \
  -e MYSQL_ROOT_PASSWORD=123456789 \
  -e MYSQL_DATABASE=calculadora_db \
  -p 3307:3306 \
  mysql:8.0
```

### 3. Rodar o container Backend

```bash
docker run -d --name backend-container --network minha-rede -p 8000:8000 \
  -e DB_USER=root \
  -e DB_PASSWORD=123456789 \
  -e DB_HOST=mysql-container \
  -e DB_NAME=calculadora_db \
  backend-image
```

### 4. Rodar o container Frontend

```bash
docker run -it --rm -p 5173:5173 frontend-image
```

---

## Usando Docker Compose

Para facilitar o gerenciamento dos containers, utilize o Docker Compose. 

### Comando para subir os containers com build

```bash
docker-compose up --build
```

---

## Dicas úteis sobre Docker

- **Volumes:** Para persistência de dados do MySQL, considere usar volumes Docker para não perder os dados ao parar o container.
- **Logs:** Use `docker logs <container>` para visualizar logs e ajudar na depuração.
- **Interação:** Para acessar o shell de um container em execução, utilize:

  ```bash
  docker exec -it <nome-do-container> bash
  ```
- **Listar containers:**

  ```bash
  docker ps -a
  ```
- **Parar todos os containers:**

  ```bash
  docker stop $(docker ps -aq)
  ```
- **Remover todos os containers:**

  ```bash
  docker rm $(docker ps -aq)
  ```
- **Rede Docker:** Usar uma rede customizada permite que os containers se comuniquem facilmente pelo nome do container (exemplo: `mysql-container`).

---
