-- Actualización práctica 04
ALTER TABLE Vacantes
ADD COLUMN fecha_vencimiento DATE NOT NULL,
ADD COLUMN cedula_candidato_seleccionado INT,
ADD FOREIGN KEY(cedula_candidato_seleccionado)
REFERENCES Candidatos(cedula);

-- Actualización prácica 06
ALTER TABLE Vacantes
ADD COLUMN pagada INT NOT NULL,
ADD COLUMN porcentaje_promocional INT NOT NULL,
MODIFY fecha_vencimiento DATE;

-- Actualización práctica 07
ALTER TABLE Candidatos
ADD COLUMN codigo_validacion INT,
ADD COLUMN validado INT NOT NULL;

ALTER TABLE Vacantes
ADD COLUMN inactiva INT NOT NULL;

-- Actualización práctica 08
ALTER TABLE Vacantes
ADD COLUMN fecha_pago DATE;

-- Actualización práctica 09
ALTER TABLE Vacantes
ADD COLUMN expectativa_salarial DECIMAL(12, 2);

-- Actualzación práctica 10
ALTER TABLE Candidatos
ADD COLUMN fecha_registro DATE NOT NULL;