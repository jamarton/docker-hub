FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_CLIENT_ARGS="--ssl-mode=DISABLED"

COPY ./db /docker-entrypoint-initdb.d/
EXPOSE 3306

# docker build --file MySQL.Dockerfile -t jamarton/mysql-sakila:latest -t jamarton/mysql-sakila:9.4.0 .
# docker run -d -p 3306:3306 --name mysql-sakila mysql-sakila
# docker run -d -p 3306:3306 --name mysql-sakila jamarton/mysql-sakila