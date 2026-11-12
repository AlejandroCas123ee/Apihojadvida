CREATE DATABASE hojas_de_vida;

USE hojas_de_vida;

CREATE TABLE hojas_vida (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad INT,
    ciudad VARCHAR(100),
    correo VARCHAR(150) NOT NULL,
    fotografia VARCHAR(255),
    programa VARCHAR(150),
    ficha VARCHAR(20),
    jornada VARCHAR(50)
);

CREATE TABLE estudios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hoja_vida_id INT NOT NULL,
    nivel VARCHAR(100),
    institucion VARCHAR(150),
    titulo VARCHAR(150),
    anio_graduacion YEAR,
    FOREIGN KEY (hoja_vida_id) REFERENCES hojas_vida(id)
);

CREATE TABLE cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hoja_vida_id INT NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    FOREIGN KEY (hoja_vida_id) REFERENCES hojas_vida(id)
);

CREATE TABLE experiencias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    hoja_vida_id INT NOT NULL,
    empresa VARCHAR(150) NOT NULL,
    cargo VARCHAR(100),
    tiempo VARCHAR(100),
    funciones TEXT,
    FOREIGN KEY (hoja_vida_id) REFERENCES hojas_vida(id)
);

CREATE TABLE habilidades (
    id INT AUTO_INCREMENT PRIMARY KEY,
    experiencia_id INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (experiencia_id) REFERENCES experiencias(id)
);

CREATE TABLE IF NOT EXISTS USUARIO (
    id_USER INT AUTO_INCREMENT PRIMARY KEY,
    nombre_user VARCHAR(100) NOT NULL,
    correo_user VARCHAR(150) NOT NULL UNIQUE,
    contraseña VARCHAR(255) NOT NULL,
    rol ENUM('Aprendiz','Reclutador') NOT NULL DEFAULT 'Aprendiz',
    estado TINYINT(1) DEFAULT 1,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
