CREATE DATABASE negocio;
USE negocio;

CREATE TABLE `clientes` (
  `cliente_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `correo` VARCHAR(100) UNIQUE NOT NULL,
  `telefONo` VARCHAR(15),
  `direcciON` TEXT,
  `fecha_registro` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `productos` (
  `producto_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripciON` TEXT,
  `precio` DECIMAL(10,2) NOT NULL,
  `stock` INT DEFAULT 0,
  `categoria` VARCHAR(100)
);

CREATE TABLE `pedidos` (
  `pedido_id` INT PRIMARY KEY AUTO_INCREMENT,
  `cliente_id` INT,
  `fecha_pedido` TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
  `total` DECIMAL(10,2) NOT NULL,
  `estado` VARCHAR(50) DEFAULT 'Pendiente'
);

CREATE TABLE `detalles_pedido` (
  `detalle_id` INT PRIMARY KEY AUTO_INCREMENT,
  `pedido_id` INT,
  `producto_id` INT,
  `cantidad` INT NOT NULL,
  `precio_unitario` DECIMAL(10,2) NOT NULL
);

ALTER TABLE `pedidos` ADD FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`);
ALTER TABLE `detalles_pedido` ADD FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`);
ALTER TABLE `detalles_pedido` ADD FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);


-- Insertar en la tabla clientes
INSERT INTO clientes
  (nombre, correo, telefONo, direcciON)
VALUES
  ('Carlos Gutiérrez', 'carlos.gutierrez@gmail.com', '78451236', 'Av. Cañoto 123, Santa Cruz'),
  ('Ana Fernández', 'ana.fernandez@hotmail.com', '72984512', 'Calle Murillo 456, La Paz'),
  ('Luis Arce', 'luis.arce@hotmail.com', '72513489', 'Av. Camacho 789, La Paz'),
  ('María Paz', 'maria.paz@yahoo.com', '76321456', 'Calle Bolívar 321, Cochabamba'),
  ('Fernando VargAS', 'fernando.vargAS@outlook.com', '78452134', 'Av. Banzer 789, Santa Cruz'),
  ('Andrea RojAS', 'andrea.rojAS@gmail.com', '71234567', 'Calle Aroma 456, Cochabamba'),
  ('Jorge Zambrana', 'jorge.zambrana@hotmail.com', '72658941', 'Av. Melchor Pérez 741, Sucre'),
  ('Valeria Flores', 'valeria.flores@yahoo.com', '78562314', 'Av. Circunvalación 852, Oruro'),
  ('Rodrigo Pérez', 'rodrigo.perez@gmail.com', '76453210', 'Calle 24 de Septiembre 123, Santa Cruz'),
  ('Sofía Quiroga', 'sofia.quiroga@outlook.com', '75481236', 'Av. Ballivián 456, El Alto');



INSERT INTO productos
  (nombre, descripciON, precio, stock, categoria)
VALUES
  ('Laptop Lenovo ThinkPad', 'Laptop Lenovo ThinkPad X1 CarbON, 16GB RAM, 1TB SSD', 5400.00, 15, 'Electrónica'),
  ('SmartphONe Xiaomi Mi 11', 'SmartphONe Xiaomi Mi 11, 128GB, 5G', 3150.00, 30, 'Electrónica'),
  ('Televisor Samsung 55"', 'Televisor Samsung UHD 4K de 55 pulgadAS', 4600.00, 20, 'Electrónica'),
  ('AudífONos SONy WH-1000XM4', 'AudífONos inalámbricos cON cancelación de ruido', 1000.00, 50, 'Electrónica'),
  ('Tablet iPad Pro', 'iPad Pro 12.9 pulgadAS, 256GB', 6650.00, 10, 'Electrónica'),
  ('Cámara CanON EOS R5', 'Cámara Mirrorless CanON EOS R5, 45MP', 15750.00, 5, 'Electrónica'),
  ('CONsola PlayStatiON 5', 'CONsola PlayStatiON 5 cON lector de discos', 4200.00, 25, 'Electrónica'),
  ('Reloj Smartwatch Garmin Fenix 6', 'Smartwatch Garmin Fenix 6 Pro cON GPS', 3150.00, 12, 'Electrónica'),
  ('Disco Duro Externo Seagate 4TB', 'Disco duro externo Seagate de 4TB USB 3.0', 595.00, 40, 'Electrónica'),
  ('Router TP-Link Archer AX6000', 'Router inalámbrico WiFi 6 TP-Link AX6000', 1330.00, 18, 'Electrónica');

-- 0 = Pendiente
-- 1 = Completado
-- 2 = Cancelado
ALTER TABLE pedidos 
MODIFY estado TINYINT DEFAULT 0;

INSERT INTO pedidos
  (cliente_id, total, estado)
VALUES
  (1, 5400.00, 1),
  (2, 1000.00, 0),
  (3, 4600.00, 1),
  (4, 3150.00, 1),
  (5, 1330.00, 0),
  (6, 4200.00, 1),
  (7, 6650.00, 0),
  (8, 595.00, 1),
  (9, 7050.00, 0),
  (10, 3150.00, 1);

INSERT INTO detalles_pedido
  (pedido_id, producto_id, cantidad, precio_unitario)
VALUES
  (1, 1, 1, 5400.00),
  -- Pedido 1: Laptop Lenovo ThinkPad
  (2, 4, 1, 1000.00),
  -- Pedido 2: AudífONos SONy WH-1000XM4
  (3, 3, 1, 4600.00),
  -- Pedido 3: Televisor Samsung
  (4, 2, 1, 3150.00),
  -- Pedido 4: SmartphONe Xiaomi Mi 11
  (5, 10, 1, 1330.00),
  -- Pedido 5: Router TP-Link Archer AX6000
  (6, 7, 1, 4200.00),
  -- Pedido 6: CONsola PlayStatiON 5
  (7, 5, 1, 6650.00),
  -- Pedido 7: Tablet iPad Pro
  (8, 9, 1, 595.00),
  -- Pedido 8: Disco Duro Externo Seagate 4TB
  (9, 6, 1, 7050.00),
  -- Pedido 9: Cámara CanON EOS R5
  (10, 8, 1, 3150.00); -- Pedido 10: Reloj Smartwatch Garmin Fenix 6

-- Actualice varios registros para mejorar la visibilidad de los datos en lAS cONsultAS futurAS 
-- y ASegura que cada pedido esté ASociado cON el cliente correcto.
UPDATE `negocio`.`pedidos` SET `cliente_id` = '5' WHERE (`pedido_id` = '3');
UPDATE `negocio`.`pedidos` SET `cliente_id` = '5' WHERE (`pedido_id` = '2');
UPDATE `negocio`.`pedidos` SET `cliente_id` = '2' WHERE (`pedido_id` = '4');
UPDATE `negocio`.`pedidos` SET `cliente_id` = '3' WHERE (`pedido_id` = '5');
UPDATE `negocio`.`pedidos` SET `cliente_id` = '8' WHERE (`pedido_id` = '7');


UPDATE `negocio`.`pedidos` SET `fecha_pedido` = '2021-10-24 20:06:45' WHERE (`pedido_id` = '4');
UPDATE `negocio`.`pedidos` SET `fecha_pedido` = '2022-10-24 20:06:45' WHERE (`pedido_id` = '2');
UPDATE `negocio`.`pedidos` SET `fecha_pedido` = '2024-08-24 20:06:45' WHERE (`pedido_id` = '6');
UPDATE `negocio`.`pedidos` SET `fecha_pedido` = '2024-05-24 20:06:45' WHERE (`pedido_id` = '7');
UPDATE `negocio`.`pedidos` SET `fecha_pedido` = '2023-02-24 20:06:45' WHERE (`pedido_id` = '10');

UPDATE `negocio`.`detalles_pedido` SET `cantidad` = '2', `precio_unitario` = '9200.00' WHERE (`detalle_id` = '3');
UPDATE `negocio`.`detalles_pedido` SET `cantidad` = '6' WHERE (`detalle_id` = '5');
UPDATE `negocio`.`detalles_pedido` SET `precio_unitario` = '4600.00' WHERE (`detalle_id` = '3');
UPDATE `negocio`.`pedidos` SET `total` = '9200.00' WHERE (`pedido_id` = '3');

-- ! CONSLULTAS ! --

-- 1
SELECT 
  c.cliente_id,
  c.nombre,
  c.correo,
  COUNT(p.pedido_id) AS num_pedidos
FROM 
  clientes c
INNER JOIN 
  pedidos p ON c.cliente_id = p.cliente_id
WHERE 
  p.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) AND p.estado = 1
GROUP BY
  c.cliente_id,
  c.nombre,
  c.correo
ORDER BY 
  num_pedidos DESC;

-- Optimizaria la cONsulta agregando índices en lAS columnAS que se utilizan en lAS cONdiciONes ON y WHERE,
--  como cliente_id, fecha_pedido, y estado.
-- filtraria por fecha y esto en una  subconsulta antes de hacer JOIN para reducir las filas que se unen 
-- Crear índices para optimizar la consulta
CREATE INDEX idx_cliente_id_pedidos ON pedidos(cliente_id);
CREATE INDEX idx_estado ON pedidos(estado);

SELECT 
    c.cliente_id, 
    c.nombre, 
    c.correo, 
    COUNT(p.pedido_id) AS num_pedidos
FROM 
    clientes c
INNER JOIN 
    pedidos p ON c.cliente_id = p.cliente_id
WHERE 
    p.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH) 
    AND p.estado = 1
GROUP BY 
    c.cliente_id, c.nombre, c.correo
ORDER BY 
    num_pedidos DESC;

-- 2
SELECT 
    p.producto_id, 
    p.nombre, 
    SUM(dp.cantidad) AS cant, 
    SUM(CASE WHEN pe.total > 0 THEN pe.total ELSE 0 END) AS Total
FROM 
    productos p
LEFT JOIN 
    detalles_pedido dp ON p.producto_id = dp.producto_id 
LEFT JOIN 
    pedidos pe ON pe.pedido_id = dp.pedido_id 
WHERE 
    (pe.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) OR pe.fecha_pedido IS NULL)
    AND (pe.estado = 1)
GROUP BY 
    p.producto_id, p.nombre
ORDER BY 
    cant DESC;

-- Optimizaría la consulta asegurándome de que existan índices en las columnas utilizadas en las condiciones ON y WHERE,
-- como producto_id en la tabla detalles_pedido y pedido_id en la tabla pedidos.
-- Filtraría por fecha y estado en una subconsulta antes de hacer el JOIN para reducir el número de filas que se unen, lo que puede mejorar el rendimiento al minimizar el volumen de datos procesados en las operaciones de agrupamiento.
-- Además, consideraría utilizar INNER JOIN en lugar de LEFT JOIN si se requiere que todos los productos tengan al menos un detalle de pedido.
-- Crear índices para optimizar la consulta

CREATE INDEX idx_producto_id_detalles ON detalles_pedido(producto_id);
CREATE INDEX idx_pedido_id ON detalles_pedido(pedido_id);

SELECT 
    p.producto_id, 
    p.nombre, 
    SUM(COALESCE(filtered_dp.cantidad, 0)) AS cant, 
    SUM(CASE WHEN pe.total > 0 THEN pe.total ELSE 0 END) AS Total
FROM 
    productos p
LEFT JOIN (
    SELECT 
        dp.producto_id, 
        dp.cantidad, 
        pe.pedido_id 
    FROM 
        detalles_pedido dp 
    JOIN 
        pedidos pe ON dp.pedido_id = pe.pedido_id 
    WHERE 
        pe.fecha_pedido >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH) 
        AND pe.estado = 1
) AS filtered_dp ON p.producto_id = filtered_dp.producto_id
LEFT JOIN pedidos pe ON pe.pedido_id = filtered_dp.pedido_id
GROUP BY 
    p.producto_id, p.nombre
ORDER BY 
    cant DESC;



-- 3
SELECT 
  p.cliente_id,
  p.fecha_pedido AS 'ultimo_pedido', 
  c.nombre, 
  c.correo
FROM 
  pedidos p
LEFT JOIN 
  clientes c ON p.cliente_id = c.cliente_id
WHERE 
  fecha_pedido <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- Optimizaría la consulta asegurándome de que existan índices en las columnas utilizadas en las condiciones ON y WHERE,
-- como cliente_id en la tabla pedidos y fecha_pedido en la tabla pedidos.
-- Filtraría por fecha en una subconsulta para reducir el número de filas que se unen,
-- lo que puede mejorar el rendimiento al minimizar el volumen de datos procesados en las operaciones de unión.
-- Además, consideraría utilizar INNER JOIN en lugar de LEFT JOIN si solo se necesitan los clientes que realmente tienen pedidos.


CREATE INDEX idx_cliente_id ON pedidos(cliente_id);
CREATE INDEX idx_fecha_pedido ON pedidos(fecha_pedido);
CREATE INDEX idx_cliente_id_clientes ON clientes(cliente_id);

SELECT 
    p.cliente_id, 
    p.fecha_pedido AS 'ultimo_pedido', 
    c.nombre, 
    c.correo
FROM 
    (SELECT cliente_id, fecha_pedido 
     FROM pedidos 
     WHERE fecha_pedido <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)) AS p
JOIN clientes c ON p.cliente_id = c.cliente_id;


-- 4 
SELECT 
  pedido_id,
  total 
FROM
  pedidos 
WHERE 
  total >= 5000 AND estado = 1;

-- Optimizaría la consulta asegurándome de que existan índices en las columnas utilizadas en las condiciones WHERE,
-- como total y estado en la tabla pedidos.
-- Consideraría utilizar una subconsulta para filtrar los pedidos que cumplen con los criterios antes de seleccionarlos,
-- lo que podría mejorar el rendimiento al reducir el número de filas que se procesan.

CREATE INDEX idx_total_estado ON pedidos (total, estado);


SELECT pedido_id, total 
FROM pedidos 
WHERE total >= 5000 AND estado = 1;

SELECT * FROM pedidos;
SELECT * FROM detalles_pedido;
SELECT * FROM productos;
SELECT * FROM clientes;