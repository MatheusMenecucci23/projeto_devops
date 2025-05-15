docker network create minha-rede
docker run -d --name mysql-container --network minha-rede   -e MYSQL_ROOT_PASSWORD=123456789   -e MYSQL_DATABASE=calculadora_db   -p 3307:3306 mysql:8.0
docker run -d --name backend-container --network minha-rede -p 8000:8000 \
>   -e DB_USER=root \
>   -e DB_PASSWORD=123456789 \
>   -e DB_HOST=mysql-container \
>   -e DB_NAME=calculadora_db \
>   backend-image
ocker run -it --rm -p 5173:5173 frontend-image

