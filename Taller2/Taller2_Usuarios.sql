-- TALLER 2
-- FABIAN LEONARDO BELLO ARIAS

-- USAR LA BASE DE DATOS CARGADA
USE taller2;


--  ROL LECTOR SOLO LECTURA

CREATE USER 'lector_grupo'@'localhost' IDENTIFIED BY 'Lector123*';
GRANT SELECT ON taller2.* TO 'lector_grupo'@'localhost';

-- VERIFICACION LECTOR:
SELECT * FROM Books LIMIT 5;
-- NO FUNCIONA
DELETE FROM Books WHERE BookID = 1;


-- ROL EDITOR, PERMITE MODIFICAR DATOS, PERO NO ESTRUCTURA DE LA BASE DE DATOS.

CREATE USER 'editor_grupo'@'localhost' IDENTIFIED BY 'Editor123*';
GRANT SELECT, INSERT, UPDATE, DELETE ON taller2.* TO 'editor_grupo'@'localhost';

-- VERIFICACION EDITOR:
INSERT INTO BookCategories (CategoryID, CategoryName) VALUES (11, 'Prueba');
UPDATE BookCategories SET CategoryName = 'Test Editor' WHERE CategoryID = 11;
DELETE FROM BookCategories WHERE CategoryID = 11;
-- NO FUNCIONA
CREATE TABLE tabla_error (id INT);


-- ROL ADMINISTRADOR, UNICO ROL PARA EL DBA

CREATE USER 'admin_grupo'@'localhost' IDENTIFIED BY 'Admin123*';
GRANT ALL PRIVILEGES ON taller2.* TO 'admin_grupo'@'localhost';

-- VERIFICACION ADMIN:
-- TODO FUNCIONA
CREATE TABLE admin_test (id INT, nota VARCHAR(50));
INSERT INTO admin_test VALUES (1, 'Prueba de Admin');
DROP TABLE admin_test;

FLUSH PRIVILEGES;