CREATE DATABASE funcionariosdb;


USE funcionariosdb;



CREATE TABLE funcionario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento ENUM('CC', 'TI', 'CE', 'PA', 'OTRO') NOT NULL,
    numero_identificacion VARCHAR(20) NOT NULL UNIQUE,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    estado_civil ENUM('SOLTERO', 'CASADO', 'DIVORCIADO', 'VIUDO', 'UNIÓN_LIBRE') NOT NULL,
    sexo ENUM('M', 'F', 'O') NOT NULL,
    direccion VARCHAR(255),
    telefono VARCHAR(20),
    fecha_nacimiento DATE
);


CREATE TABLE grupo_familiar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    relacion VARCHAR(50) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) ON DELETE CASCADE
);

CREATE TABLE formacion_academica (
    id INT AUTO_INCREMENT PRIMARY KEY,
    funcionario_id INT NOT NULL,
    universidad VARCHAR(100) NOT NULL,
    nivel_estudio ENUM('BACHILLER', 'TÉCNICO', 'TECNÓLOGO', 'PROFESIONAL', 'ESPECIALIZACIÓN', 'MAESTRÍA', 'DOCTORADO') NOT NULL,
    titulo_estudio VARCHAR(100) NOT NULL,
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) ON DELETE CASCADE
);

-- Insertar datos en funcionario usando los nuevos valores para sexo ('M', 'F', 'O')
INSERT INTO funcionario (tipo_documento, numero_identificacion, nombres, apellidos, estado_civil, sexo, direccion, telefono, fecha_nacimiento)
VALUES 
('CC', '123456789', 'Juan', 'Pérez', 'CASADO', 'M', 'Calle 1 #23-45', '3001234567', '1985-06-15'),
('TI', '987654321', 'María', 'Gómez', 'SOLTERO', 'F', 'Carrera 45 #10-11', '3107654321', '1990-09-30'),
('CE', '456789123', 'Andrés', 'Rodríguez', 'DIVORCIADO', 'M', 'Avenida 9 #50-20', '3123456789', '1978-12-01'),
('CC', '654321987', 'Laura', 'Martínez', 'SOLTERO', 'F', 'Calle 10 #15-30', '3012345678', '1995-03-22'),
('TI', '321654987', 'Oscar', 'López', 'CASADO', 'O', 'Carrera 20 #25-40', '3056789123', '1988-07-18'),
('CC', '789123456', 'Camila', 'Fernández', 'VIUDO', 'F', 'Avenida 15 #35-50', '3023456789', '1982-11-05');

INSERT INTO grupo_familiar (funcionario_id, nombre, relacion)
VALUES
(1, 'Ana Pérez', 'Hija'),
(1, 'Laura Pérez', 'Esposa'),
(2, 'Carlos Gómez', 'Padre');

INSERT INTO formacion_academica (funcionario_id, universidad, nivel_estudio, titulo_estudio)
VALUES
(1, 'Universidad de Antioquia', 'PROFESIONAL', 'Ingeniería de Sistemas'),
(2, 'Universidad Nacional', 'TÉCNICO', 'Técnico en Sistemas');