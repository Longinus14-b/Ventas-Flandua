DROP SCHEMA IF EXISTS NEPTUNO ;
CREATE SCHEMA IF NOT EXISTS NEPTUNO;
USE NEPTUNO ;

DROP TABLE IF EXISTS Pedidos;
CREATE TABLE Pedidos
(
Id_Pedido INT PRIMARY KEY NOT NULL,
Id_Cliente INT,
Id_Empleado INT,
FechaPedido DATETIME,
FechaEntrega DATETIME,
FechaEnvio DATETIME,
Envio Varchar (30),
MontoTotal FLOAT (10), 
Destinatario VARCHAR (30),
DireccionDestinatario VARCHAR (30),
Ciudad VARCHAR (30),
CodPostal VARCHAR (30),
Pais VARCHAR (30),
FOREIGN KEY (Id_Empleado) REFERENCES Empleados (Id_Empleado),
FOREIGN KEY (Id_Cliente) REFERENCES Clientes (Id_Cliente)
);

DROP TABLE IF EXISTS TablaPuente;
CREATE TABLE TablaPuente
(
Id_Pedido INT,
Id_Orden INT PRIMARY KEY NOT NULL,
MontoTotal FLOAT (30),
FOREIGN KEY (Id_Pedido) REFERENCES Pedidos (Id_Pedido)
);

DROP TABLE IF EXISTS DetalleDePedidos;
CREATE TABLE DetalleDePedidos
(
Id_Orden INT,
Id_D_Pedido INT PRIMARY KEY NOT NULL,
Id_Producto INT,
NombreDeProducto VARCHAR (50),
PrecioUnidad FLOAT (30),
Cantidad INT,
Descuento DECIMAL,
TotalOrden FLOAT (30),
FOREIGN KEY (Id_Orden) REFERENCES TablaPuente (Id_Orden),
FOREIGN KEY (Id_Producto) REFERENCES Productos (Id_Producto)
);

DROP TABLE IF EXISTS Productos;
CREATE TABLE Productos
(
Id_Producto INT PRIMARY KEY NOT NULL,
Id_Proveedor INT,
Id_Categoria INT,
CantidadPorUnidad VARCHAR (50),
PrecioUnidad FLOAT (30),
UnidadesEnExistencias INT,
UnidadesEnPedido INT,
NivelNuevoPedido INT,
FOREIGN KEY (Id_Proveedor) REFERENCES Proveedores (Id_Proveedor),
FOREIGN KEY (Id_Categoria) REFERENCES Categoria (Id_Categoria)
);

DROP TABLE IF EXISTS Categoria;
CREATE TABLE Categoria
(
Id_Categoria INT PRIMARY KEY NOT NULL,
NombreCategoria VARCHAR (50),
Descripcion VARCHAR (50)
);

DROP TABLE IF EXISTS Proveedores;
CREATE TABLE Proveedores
(
Id_Proveedor INT PRIMARY KEY NOT NULL,
NombreCompañia VARCHAR (50),
NombreContacto VARCHAR (50),
CargoProveedor VARCHAR (50),
Direccion VARCHAR (30),
Ciudad VARCHAR (10),
CodPostal VARCHAR (10),
Pais VARCHAR (50),
Telefono VARCHAR (30),
Fax VARCHAR (30)
);

DROP TABLE IF EXISTS Empleados;
CREATE TABLE Empleados
(
Id_Empleado INT PRIMARY KEY NOT NULL,
Apellidos VARCHAR (50),
Nombre VARCHAR (50),
Cargo VARCHAR (50),
Genero ENUM ('M', 'F'),
Tratamiento VARCHAR (10),
FechaNacimiento DATETIME,
FechaContratacion DATETIME,
Direccion VARCHAR (30),
Ciudad VARCHAR (50),
CodPostal VARCHAR (50),
Pais VARCHAR (50),
Telefono VARCHAR (30)
);

DROP TABLE IF EXISTS Clientes;
CREATE TABLE Clientes
(
Id_Cliente INT PRIMARY KEY NOT NULL,
NombreCompañia VARCHAR (50),
NombreContacto VARCHAR (50),
Cargo VARCHAR (50),
Direccion VARCHAR (30),
Ciudad VARCHAR (50),
CodPostal VARCHAR (50),
Pais VARCHAR (50),
Telefono VARCHAR (30),
Fax VARCHAR (30)
);