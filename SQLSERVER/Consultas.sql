
-- creacion de base de datos 
CREATE DATABASE DBproductos ;


-- tabla cliente 
CREATE TABLE  tb_cliente(
    ID_client INT PRIMARY KEY IDENTITY , 
    nombre_client VARCHAR(50) NOT NULL, 
    appelido_client VARCHAR(50) NOT NULL, 
    edad_client  INT NOT NULL, 


);  



-- table productos  
CREATE TABLE tb_productos(
    ID_prod INT PRIMARY KEY IDENTITY , 
    nombre_prod VARCHAR(50) NOT NULL, 
    description_prod VARCHAR(50) NOT NULL,
    cantidad_prod INT NOT NULL, 
    
); 





--  tabla compra 
CREATE TABLE clien_compra_prod(
    ID_client_compra INT PRIMARY KEY IDENTITY, 
    ID_client INT  ,
    ID_product INT NOT NULL , 
    fecha_realizada_compra DATE NOT NULL, 
    CONSTRAINT fk_id_client FOREIGN KEY (ID_client) REFERENCES tb_cliente(ID_client) , 
    CONSTRAINT fk_id_prod FOREIGN KEY (ID_product) REFERENCES tb_productos(ID_prod) 
); 



-- llenar tablas  


-- Insertar registros en la tabla tb_cliente
INSERT INTO tb_cliente (nombre_client, appelido_client, edad_client)
VALUES ('Nombre1', 'Apellido1', 25),
       ('Nombre2', 'Apellido2', 30),
       ('Nombre3', 'Apellido3', 35);

-- Insertar registros en la tabla tb_productos
INSERT INTO tb_productos (nombre_prod, description_prod, cantidad_prod)
VALUES ('Producto1', 'Descripción1', 10),
       ('Producto2', 'Descripción2', 5),
       ('Producto3', 'Descripción3', 8);

-- Insertar registros en la tabla clien_compra_prod
INSERT INTO clien_compra_prod (ID_client, ID_product, fecha_realizada_compra)
VALUES (1, 1, '2023-01-01'),
       (2, 2, '2023-02-02'),
       (3, 3, '2023-03-03');




-- listar productos 
SELECT * FROM tb_productos; 

-- creacion de procedimiento almacenado 
CREATE PROC sp_ListarTodosLosProductos 
AS 

SELECT * FROM tb_productos; 

GO 

-- ejecutar procedimiento almacenado  
EXEC sp_ListarTodosLosProductos


-- Procedimiento almacenado para descontar  
CREATE PROCEDURE sp_DescontarProducto 
@codproducto as INT, 
@cantidad as INT  
AS 
UPDATE tb_productos SET  cantidad_prod = cantidad_prod-@cantidad  WHERE   ID_prod = @codproducto ; 

GO  

-- aqui pide 2 parametro  el id del producto y la cantidad que se va descontar  
EXEC sp_DescontarProducto 2 , 1

-- Parte 1: Crear el procedimiento almacenado
CREATE PROCEDURE sp_aumentarCantidadDeProducto 
    @idProducto INT, 
    @cantidadAumentar INT 
AS 
BEGIN
    UPDATE tb_productos SET cantidad_prod = cantidad_prod + @cantidadAumentar WHERE ID_prod = @idProducto;
END
GO


EXEC sp_ListarTodosLosProductos

-- Parte 2: Ejecutar el procedimiento almacenado
EXEC sp_aumentarCantidadDeProducto @idProducto = 1, @cantidadAumentar = 5;




SELECT nombre_prod , cantidad_prod FROM tb_productos WHERE cantidad_prod < 5;



