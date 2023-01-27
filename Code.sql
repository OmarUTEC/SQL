-- Establece la ruta de búsqueda en el esquema "AUTOMOVIL"
set search_path = "AUTOMOVIL";

-- Crea el esquema "automovil"
CREATE SCHEMA automovil;

-- Establece la ruta de búsqueda en el esquema "automovil"
set search_path = automovil;

-- Crea una secuencia llamada "carros_venta_seq"
CREATE SEQUENCE carros_venta_seq;

-- Crea una tabla "carros" dentro del esquema "automovil"
CREATE TABLE carros (
    -- Columna "id" es la clave primaria y tiene un valor predeterminado de la siguiente secuencia en "carros_venta_seq"
    id INT PRIMARY KEY DEFAULT nextval('carros_venta_seq'),
    -- Columna "marca" es de tipo VARCHAR y no puede ser nula
    marca VARCHAR(255) NOT NULL,
    -- Columna "modelo" es de tipo VARCHAR y no puede ser nula
    modelo VARCHAR(255) NOT NULL,
    -- Columna "anio" es de tipo INT y no puede ser nula
    anio INT NOT NULL,
    -- Columna "precio" es de tipo FLOAT y no puede ser nula
    precio FLOAT NOT NULL
);

-- Crea una tabla "clientes" con las siguientes columnas
CREATE TABLE clientes (
    -- Columna "id" es la clave primaria y tiene un valor predeterminado de la siguiente secuencia en "carros_venta_seq"
    id INT PRIMARY KEY DEFAULT nextval('carros_venta_seq'),
    -- Columna "nombre" es de tipo VARCHAR y no puede ser nula
    nombre VARCHAR(255) NOT NULL,
    -- Columna "correo" es de tipo VARCHAR y no puede ser nula
    correo VARCHAR(255) NOT NULL,
    -- Columna "direccion" es de tipo VARCHAR y no puede ser nula
    direccion VARCHAR(255) NOT NULL,
    -- Columna "telefono" es de tipo VARCHAR y no puede ser nula
    telefono VARCHAR(15) NOT NULL
);

-- Crea una tabla "ventas" con las siguientes columnas
CREATE TABLE ventas (
    -- Columna "id" es la clave primaria y tiene un valor predeterminado de la siguiente secuencia en "carros_venta_seq"
    id INT PRIMARY KEY DEFAULT nextval('carros_venta_seq'),
    -- Columna "id_carro" es de tipo INT y no puede ser nula, además tiene una relación con la columna "id" de la tabla "carros"
    id_carro INT NOT NULL,
    -- Columna "id_cliente" es de tipo INT y no puede ser nula, además tiene una relación con la columna "id" de la tabla "clientes"
    id_cliente INT NOT NULL,
    -- Columna "fecha" es de tipo DATE y no puede ser nula
    fecha DATE NOT NULL,
    -- Columna "precio" es de tipo FLOAT y no puede ser nula
    precio FLOAT NOT NULL,
    -- Restriccion de llave foranea que indica que la columna "id_carro" debe tener un valor existente en la columna "id" de la tabla "carros"
    FOREIGN KEY (id_carro) REFERENCES carros(id),
    -- Restriccion de llave foranea que indica que la columna "id_cliente" debe tener un valor existente en la columna "id" de la tabla "clientes"
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE OR REPLACE FUNCTION update_car_prices() RETURNS TRIGGER AS $$
BEGIN
    UPDATE carros SET precio = precio * 1.05;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_car_prices
AFTER INSERT OR UPDATE ON ventas
EXECUTE FUNCTION update_car_prices();

/*
En este ejemplo, se crea una función llamada 
"update_car_prices" que utiliza el lenguaje PL/pgSQL 
para actualizar el precio de los carros en un 5% cada 
vez que se realice una inserción o actualización en la
 tabla "ventas". Luego se crea un trigger llamado 
 "update_car_prices" que se activa después de cada 
 inserción o actualización en la tabla ventas y ejecuta
  la función anterior.
*/

