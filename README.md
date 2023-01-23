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

* **WHERE**: esta cláusula se utiliza para filtrar los resultados de la consulta. Ejemplo:

```sql
SELECT * FROM tabla_ejemplo WHERE nombre='Juan'
```

* **ORDER** BY: esta cláusula se utiliza para ordenar los resultados de la consulta. Ejemplo:

```sql
SELECT * FROM tabla_ejemplo ORDER BY edad DESC
```

* **INSERT INTO**: esta consulta se utiliza para insertar nuevos registros en una tabla. Ejemplo:

```sql
INSERT INTO tabla_ejemplo (nombre, edad) VALUES ('Juan', 25)
```

* **UPDATE**: esta consulta se utiliza para actualizar los datos existentes en una tabla. Ejemplo:

```sql
UPDATE tabla_ejemplo SET nombre='Juan', edad=26 WHERE id=1
```

* **DELETE**: esta consulta se utiliza para eliminar registros de una tabla. Ejemplo:

```sql
DELETE FROM tabla_ejemplo WHERE id=1
```

# Consultas Avanzadas   

* **JOIN**: Utiliza esta consulta para combinar filas de dos o más tablas en base a una columna común.

```sql
SELECT * FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;
```

* **SUBQUERY**: Utiliza esta consulta para seleccionar datos de una tabla en función de otra tabla.

```sql
SELECT * FROM orders
WHERE customer_id = (SELECT customer_id FROM customers WHERE country = 'USA');
```

* **GROUP BY**: Utiliza esta consulta para agrupar los resultados de una consulta en función de una columna específica.

```sql
SELECT COUNT(*) as total_orders, country FROM orders
GROUP BY country;
```

* **HAVING**: Utiliza esta consulta en conjunto con **GROUP BY** para filtrar los resultados de una consulta agrupada en función de una condición específica.

```sql
SELECT COUNT(*) as total_orders, country FROM orders
GROUP BY country
HAVING COUNT(*) > 10;
```

* **UNION**: Utiliza esta consulta para combinar los resultados de dos o más consultas en una sola tabla.

```sql
SELECT * FROM orders WHERE country = 'USA'
UNION
SELECT * FROM orders WHERE country = 'Canada';
```

* **EXISTS**: Utiliza esta consulta para verificar si existen datos en una tabla que cumplen con una determinada condición.

```sql
SELECT * FROM customers
WHERE EXISTS (SELECT * FROM orders WHERE customers.customer_id = orders.customer_id);
```

* **INNER JOIN**: Utiliza esta consulta para combinar filas de dos tablas que cumplen una determinada condición.

```sql
SELECT * FROM orders
INNER JOIN customers
ON orders.customer_id = customers.customer_id
WHERE customers.country = 'USA';
```

* **OUTER JOIN**: Utiliza esta consulta para combinar filas de dos tablas, incluyendo aquellas que no cumplen con una determinada condición.

```sql
SELECT * FROM orders
LEFT OUTER JOIN customers
ON orders.customer_id = customers.customer_id;
```

**Ten en cuenta que estos son solo ejemplos básicos y pueden variar dependiendo de la estructura de tu base de datos y las necesidades específicas de una determinada consulta.**

## Funciones de agregación comunes

1. **COUNT()**: cuenta el número de filas de una tabla o columna específica.

```sql
SELECT COUNT(*) FROM orders;
```

2. **SUM()**: suma el valor de una columna específica.

```sql
SELECT SUM(price) FROM orders;
```

3. **AVG()**: calcula el promedio de una columna específica.

```sql
SELECT AVG(price) FROM orders;
```

4. **MIN()**: selecciona el valor mínimo de una columna específica.

```sql
SELECT MIN(price) FROM orders;
```

5. **MAX()**: selecciona el valor máximo de una columna específica.

```sql
SELECT MAX(price) FROM orders;
```

6. **GROUP_CONCAT()**: agrupa valores de una columna y los concatena en una sola cadena de texto.

```sql
SELECT GROUP_CONCAT(product_name) FROM orders;
```

7. **CAST()**: convierte un valor de un tipo de datos a otro.

```sql
SELECT CAST(price AS INT) FROM orders;
```

8. **CONCAT()**: Concatena dos o más valores de una columna.

```sql
SELECT CONCAT(first_name, last_name) FROM customers;
```

# Claves

* **Claves**: Una clave es una columna o conjunto de columnas en una tabla que se utilizan para identificar de manera única una fila en la tabla. Las claves son importantes en SQL debido a que garantizan la integridad referencial entre las tablas.

* **Clave primaria**: Es una clave especial que se utiliza para identificar de manera única una fila en una tabla. Cada tabla debe tener una clave primaria y no puede tener valores nulos.

* **Clave foranea**: Es una clave utilizada para establecer una relación entre dos tablas. La clave foranea se refiere a la clave primaria de otra tabla.

# Índices 

* **Índice simple**: Es el tipo de índice más básico, se utiliza para buscar valores en una sola columna.

* **Índice compuesto**: Es un tipo de índice que se utiliza para buscar valores en más de una columna.

* **Índice árbol B**: Es un tipo de índice que organiza los datos en una estructura de árbol binario. Este tipo de índice es muy eficiente para buscar valores en grandes tablas.

* **Índice B+**: Es una variante del índice árbol B que se utiliza en muchas bases de datos relacionales. Es una estructura de datos que organiza los datos en un árbol binario, donde todos los datos se almacenan en hojas y tiene un mayor número de punteros a hojas que el índice árbol B, lo que permite una mejor utilización del espacio en disco. 

* **Índice Hash**: Es un tipo de índice que utiliza una función hash para asignar un valor a cada valor en la columna. Es muy eficiente para buscar valores exactos, pero no es tan eficiente para buscar valores similares.

* **Índice espacial**: Es un tipo de índice que se utiliza para buscar datos geoespaciales, como puntos en un mapa.

* **Índice full-text**: Es un tipo de índice que se utiliza para buscar palabras o frases en una columna de texto.

* **Índice temporal**: Es un tipo de índice que se utiliza para buscar valores en una columna de tipo temporal, como fechas y horas.

# Transacciones 

Las transacciones en SQL son un conjunto de operaciones que se ejecutan como una sola unidad de trabajo. Es decir, son un grupo de sentencias SQL que se ejecutan juntas como si fueran una sola sentencia. Si una transacción se ejecuta correctamente, todas las operaciones que la componen se aplican a la base de datos, y si una transacción falla, todas las operaciones que la componen se deshacen (es decir, se revierten).

**Algunas de las características de las transacciones son:**

* **Atomicidad**: Una transacción es una unidad de trabajo atomicidad, es decir, es indivisible. Si una transacción se ejecuta correctamente, todas las operaciones que la componen se aplican a la base de datos. Si una transacción falla, todas las operaciones que la componen se deshacen (es decir, se revierten).

* **Consistencia**: Una transacción mantiene la consistencia de la base de datos. Esto significa que, al final de una transacción, la base de datos debe cumplir con todas las reglas de integridad.

* **Aislamiento**: Las transacciones son aisladas entre sí. Esto significa que, durante la ejecución de una transacción, ninguna otra transacción puede acceder a los datos que están siendo modificados.

* **Durabilidad**: Una vez que una transacción se ha completado correctamente, los cambios que se han realizado en la base de datos son permanentes y resistentes a fallos del sistema.

Para controlar las transacciones en SQL se utilizan las sentencias `BEGIN TRANSACTION`, `COMMIT` y `ROLLBACK`. La sentencia `BEGIN TRANSACTION` inicia una transacción, la sentencia `COMMIT` aplica los cambios de la transacción a la base de datos y la sentencia `ROLLBACK` deshace los cambios de la transacción.

```sql
BEGIN TRANSACTION;
-- Sentencias SQL para modificar la base de datos
-- Por ejemplo:
UPDATE Customers SET CreditLimit = CreditLimit + 1000 WHERE CustomerID = '1';
UPDATE Orders SET OrderDate = '2022-01-01' WHERE OrderID = '100';
-- Comprobar si todas las sentencias se ejecutan correctamente
IF @@ERROR = 0
BEGIN
    COMMIT;
    PRINT 'Transacción completada con éxito.';
END
ELSE
BEGIN
    ROLLBACK;
    PRINT 'Error en la transacción, los cambios se han deshecho.';
END
```

**En este ejemplo se esta iniciando una transacción con la sentencia BEGIN TRANSACTION. luego se estan realizando dos actualizaciones de las tablas customers y orders. Se comprueba si todas las sentencias se ejecutan correctamente con la sentencia IF @@ERROR = 0, si se cumple se aplican los cambios con COMMIT y se imprime en pantalla un mensaje de éxito. Si no se cumple se deshacen los cambios con ROLLBACK y se imprime un mensaje de error.**


# Triggers

Los **triggers** (o disparadores) son sentencias SQL que se ejecutan automáticamente en respuesta a un evento específico en una tabla o vista de una base de datos. Los eventos comunes que pueden activar un trigger incluyen la inserción, actualización o eliminación de datos en una tabla.

Los triggers se utilizan para automatizar tareas que deben realizarse cada vez que se produce un cambio en los datos. Por ejemplo, puedes utilizar un trigger para actualizar un histórico de cambios, registrar una auditor o una actualización o validar los datos antes de insertarlos o actualizarlos.

```sql
CREATE TRIGGER tr_Example
ON dbo.ExampleTable
AFTER INSERT
AS
BEGIN
    -- Acciones a realizar
    -- Por ejemplo:
    INSERT INTO dbo.ExampleHistory (ID, Value, CreatedDate)
    SELECT ID, Value, GETDATE() FROM inserted;
END
```

# **Autor**
* 👨‍💻[Omar](https://github.com/OmarUTEC)
<p align="center">
  <img src="Tigre.jpg" />
</p>

# Referencias 

- SQL Tutorial - W3Schools: https://www.w3schools.com/sql/
- SQL Tutorial - Learn SQL: https://www.sql-tutorial.com/
- PostgreSQL, The world's most advanced open source database: https://www.postgresql.org/docs/
- SQL Server Central: https://www.sqlservercentral.com/
- MySQL :: MySQL 8.0 Reference Manual, https://dev.mysql.com/doc/

#