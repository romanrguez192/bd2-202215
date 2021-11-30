-- Actualización práctica 04
ALTER TABLE Vacantes
ADD COLUMN fecha_vencimiento DATE NOT NULL,
ADD COLUMN cedula_candidato_seleccionado INT,
ADD FOREIGN KEY(cedula_candidato_seleccionado)
REFERENCES Candidatos(cedula);

-- Actualización prácica 06
ALTER TABLE Vacantes
ADD COLUMN pagada INT NOT NULL,
MODIFY fecha_vencimiento DATE;