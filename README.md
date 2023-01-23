# Introducción a Structred Query Language

<p align="center">
  <img src="sql.avif" />
</p>

SQL (Structured Query Language) es un lenguaje de programación utilizado para comunicarse con bases de datos relacionales. Con SQL, los usuarios pueden crear, modificar y consultar bases de datos, así como también controlar el acceso a los datos almacenados en ellas.

SQL es un estándar de la industria y es soportado por la mayoría de los sistemas de gestión de bases de datos populares como MySQL, SQL Server, Oracle, PostgreSQL y SQLite.
## Historia

SQL (Structured Query Language) es un lenguaje de programación utilizado para comunicarse con bases de datos relacionales. Fue desarrollado en los años 1970 por IBM y se convirtió en un estándar de la industria en 1986.

## Orígenes de SQL

SQL fue desarrollado originalmente por IBM en los años 1970 como parte del proyecto System R. El objetivo de System R era desarrollar un sistema de gestión de bases de datos relacionales que pudiera ser utilizado en una variedad de aplicaciones. SQL fue desarrollado como el lenguaje de programación utilizado para interactuar con el sistema de gestión de bases de datos.

## Estandarización de SQL

En 1986, SQL se convirtió en un estándar de la industria a través de la American National Standards Institute (ANSI) y de la International Standards Organization (ISO). Desde entonces, ha sido adoptado por una gran variedad de sistemas de gestión de bases de datos y se ha convertido en el lenguaje estándar para trabajar con bases de datos relacionales.

## Evolución de SQL

SQL ha evolucionado a lo largo de los años para incluir una variedad de características adicionales, como soporte para transacciones, vistas, procedimientos almacenados y desencadenadores. Además, con el tiempo se han desarrollado diferentes versiones y extensiones de SQL que han mejorado su funcionalidad y rendimiento.

# Sintaxis Básica de SQL

## Operadores en SQL
1. `=`: igualdad
2. `<>` o `!=`: desigualdad
3. `>`: mayor que
4. `<`: menor que
5. `>=`: mayor o igual que
6. `<=`: menor o igual que
7. `BETWEEN ... AND ...`: valor entre dos valores específicos
8. `LIKE`: buscar un patrón específico en una cadena de caracteres
9. `IN`: buscar si un valor específico se encuentra en una lista
10. `IS NULL`: buscar valores nulos
11. `EXISTS`: buscar si una subconsulta devuelve al menos un resultado
12. `ALL`: compara un valor con todos los valores de una subconsulta
13. `ANY` o `SOME`: compara un valor con al menos un valor de una subconsulta

## Tipos de datos en SQL
1. `INT`: número entero
2. `BIGINT`: número entero de mayor tamaño
3. `FLOAT`: número con punto flotante
4. `DOUBLE`: número con punto flotante de mayor precisión
5. `DECIMAL`: número decimal con precisión específica
6. `DATE`: fecha (yyyy-mm-dd)
7. `DATETIME`: fecha y hora (yyyy-mm-dd hh:mm:ss)
8. `TIMESTAMP`: marca de tiempo (yyyy-mm-dd hh:mm:ss)
9. `CHAR(n)`: cadena de caracteres fijos de longitud n
10. `VARCHAR(n)`: cadena de caracteres variables de longitud máxima n
11. `TEXT`: cadena de caracteres de longitud variable


# Creación de tablas

1. Conectarse a la base de datos: antes de crear una tabla, es necesario conectarse a la base de datos en la que deseas crearla.

2. Crear una sentencia CREATE TABLE: para crear una tabla, debes utilizar la sentencia CREATE TABLE seguida del nombre de la tabla que deseas crear. Dentro de paréntesis, debes especificar los campos de la tabla, junto con sus tipos de datos y cualquier otra restricción o característica.

3. Especificar los campos de la tabla: cada campo debe ser especificado con un nombre, un tipo de dato y cualquier restricción necesaria. Por ejemplo:

```sql
CREATE TABLE clientes (
    id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    telefono INT NOT NULL
);
```


4. Ejecutar la sentencia: una vez que hayas creado la sentencia CREATE TABLE, debes ejecutarla para que se cree la tabla en la base de datos.

Es importante recordar que al crear una tabla, debes tener en cuenta las restricciones de la base de datos, como por ejemplo la longitud de los campos, los tipos de datos y las claves primarias y foraneas para poder relacionar tablas entre si.

## Constraints & restricciones

En SQL, las restricciones son similares a los constraints, ya que ambos se utilizan para garantizar la integridad de los datos en una tabla. 

* `DEFAULT`: establece un valor predeterminado para una columna.
* `CHECK`: verifica que los valores en una columna cumplan con una condición específica.
* `NOT NULL`: garantiza que una columna no tenga un valor nulo.
* `UNIQUE`: garantiza que los valores en una columna sean únicos.
* `PRIMARY KEY`: establece una clave principal para una tabla y garantiza que los valores en una columna sean únicos e irrepetibles.
* `FOREIGN KEY`: establece una relación entre dos tablas y garantiza que los datos en una tabla se refieran a datos válidos en otra tabla.

```sql
ALTER TABLE clientes
ADD CONSTRAINT check_telefono CHECK (telefono > 9999999);
```

# Consultas Básicas

* **SELECT**: esta es la consulta más básica y se utiliza para seleccionar datos de una tabla. Ejemplo:

```sql
SELECT * FROM tabla_ejemplo
```

* *WHERE*: esta cláusula se utiliza para filtrar los resultados de la consulta. Ejemplo:

```sql
SELECT * FROM tabla_ejemplo WHERE nombre='Juan'
```

* *ORDER* BY: esta cláusula se utiliza para ordenar los resultados de la consulta. Ejemplo:

```sql
SELECT * FROM tabla_ejemplo ORDER BY edad DESC
```

* *INSERT INTO*: esta consulta se utiliza para insertar nuevos registros en una tabla. Ejemplo:

```sql
INSERT INTO tabla_ejemplo (nombre, edad) VALUES ('Juan', 25)
```

* *UPDATE*: esta consulta se utiliza para actualizar los datos existentes en una tabla. Ejemplo:

```sql
UPDATE tabla_ejemplo SET nombre='Juan', edad=26 WHERE id=1
```

* *DELETE*: esta consulta se utiliza para eliminar registros de una tabla. Ejemplo:

```sql
DELETE FROM tabla_ejemplo WHERE id=1
```

## Selección de datos
## Ordenamiento de datos
## Agrupamiento de datos

# Consultas Avanzadas   

## Funciones de agregación
## Unión de tablas
## Subconsultas
## Consultas anidadas

# Índices y claves

## Rendimiento de consultas
## Integridad de datos

# Transacciones y Bloqueos

## Transacciones
## Bloqueos

# Optimización de consultas
