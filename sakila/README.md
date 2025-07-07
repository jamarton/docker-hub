# Base de datos Sakila

## Servidor MySQL (con ejemplos)

Servidor de bases de datos MySQL para los cursos de desarrollo con la base de datos de ejemplos Sakila instalada y otras.

### Instalación

    docker run -d -p 3306:3306 --name mysql-sakila jamarton/mysql-sakila

### Configuración

- Motor: MySQL
- Puerto: 3306
- Usuario: root
- Contraseña: root
- Base de datos: Sakila
- SSL: DISABLED

## Servidor MariaDB (con ejemplos)

Servidor de bases de datos MariaDB para los cursos de desarrollo con la base de datos de ejemplos Sakila instalada.  

### Instalación

    docker run -d -p 3306:3306 --name mariadb-sakila jamarton/mariadb-sakila

### Configuración

- Motor: MariaDB
- Puerto: 3306
- Usuario: root
- Contraseña: root
- Base de datos: Sakila