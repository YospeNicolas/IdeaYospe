-- Crear la base de datos "Base de Datos Cine"
CREATE DATABASE `Base de Datos Cine`;

USE `Base de Datos Cine`;

-- Tabla Funcion
CREATE TABLE Funcion (
    id_funcion INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100),
    fecha DATE,
    lugar VARCHAR(100),
    categoria ENUM('Estreno', 'Reestreno', 'Festival')
);

-- Tabla Espectador
CREATE TABLE Espectador (
    id_espectador INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    telefono VARCHAR(15),
    email VARCHAR(100),
    id_cliente INT,
    INDEX idx_id_cliente (id_cliente) -- Agregar índice a la columna 'id_cliente'
);

-- Tabla Butaca
CREATE TABLE Butaca (
    id_butaca INT AUTO_INCREMENT PRIMARY KEY,
    cantidad_asientos INT,
    id_funcion INT,
    disponibilidad ENUM('Disponible', 'No disponible'),
    FOREIGN KEY (id_funcion) REFERENCES Funcion(id_funcion)
);

-- Tabla Compra
CREATE TABLE Compra (
    id_compra INT AUTO_INCREMENT PRIMARY KEY,
    id_funcion INT,
    cantidad_asientos INT,
    id_cliente INT,
    fecha_funcion DATE,
    estado_compra ENUM('Rechazada', 'Realizada', 'Suspendida'),
    FOREIGN KEY (id_funcion) REFERENCES Funcion(id_funcion),
    FOREIGN KEY (id_cliente) REFERENCES Espectador(id_cliente)
);
