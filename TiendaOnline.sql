-- Crear la base de datos
CREATE DATABASE TiendaOnline;

-- Usar la base de datos
USE TiendaOnline;

-- Crear la tabla Direcciones (Relación 1:1 con Clientes)
CREATE TABLE Direcciones (
    ID_Direccion INT AUTO_INCREMENT PRIMARY KEY,       -- Clave primaria de la dirección
    Calle VARCHAR(255) NOT NULL,                       -- Calle de la dirección
    Ciudad VARCHAR(100) NOT NULL,                      -- Ciudad
    Estado VARCHAR(100) NOT NULL,                      -- Estado
    Codigo_Postal VARCHAR(10) NOT NULL,                -- Código postal
    Pais VARCHAR(100) NOT NULL                         -- País
);

-- Crear la tabla Clientes (con relación 1:1 con Direcciones)
CREATE TABLE Clientes (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,         -- Clave primaria de clientes
    Nombre VARCHAR(100) NOT NULL,                      -- Nombre del cliente
    Email VARCHAR(100) NOT NULL UNIQUE,                -- Email único del cliente
    Telefono VARCHAR(15),                              -- Teléfono del cliente
    Fecha_Registro DATE,                               -- Fecha de registro del cliente
    ID_Direccion INT UNIQUE,                           -- Relación 1:1 con Direcciones
    FOREIGN KEY (ID_Direccion) REFERENCES Direcciones(ID_Direccion)  -- Clave foránea a Direcciones
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,        -- Clave primaria de productos
    Nombre VARCHAR(100) NOT NULL,                      -- Nombre del producto
    Descripcion TEXT,                                  -- Descripción del producto
    Precio DECIMAL(10, 2) NOT NULL,                    -- Precio del producto
    Stock INT NOT NULL,                                -- Cantidad en stock
    Fecha_Agregado DATE                                -- Fecha en la que se agregó el producto
);

-- Crear la tabla Pedidos (Relación 1:N con Clientes)
CREATE TABLE Pedidos (
    ID_Pedido INT AUTO_INCREMENT PRIMARY KEY,          -- Clave primaria de pedidos
    ID_Cliente INT,                                    -- Relación con Clientes (1:N)
    Fecha_Pedido DATE NOT NULL,                        -- Fecha en que se hizo el pedido
    Estado VARCHAR(50),                                -- Estado del pedido (Ej. En proceso, Enviado, etc.)
    Total DECIMAL(10, 2),                              -- Total del pedido
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID_Cliente)  -- Clave foránea a Clientes
);

-- Crear la tabla intermedia Pedidos_Productos (Relación N:M entre Pedidos y Productos)
CREATE TABLE Pedidos_Productos (
    ID_Pedido INT,                                     -- Relación con Pedidos
    ID_Producto INT,                                   -- Relación con Productos
    Cantidad INT NOT NULL,                             -- Cantidad de producto en el pedido
    Precio_Unitario DECIMAL(10, 2) NOT NULL,           -- Precio del producto al momento del pedido
    PRIMARY KEY (ID_Pedido, ID_Producto),              -- Clave primaria compuesta (relación N:M)
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID_Pedido),  -- Clave foránea a Pedidos
    FOREIGN KEY (ID_Producto) REFERENCES Productos(ID_Producto) -- Clave foránea a Productos
);


