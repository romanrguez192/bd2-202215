ALTER TABLE Vacantes
ADD COLUMN fecha_vencimiento DATE NOT NULL,
ADD COLUMN cedula_candidato_seleccionado INT,
ADD FOREIGN KEY(cedula_candidato_seleccionado)
REFERENCES Candidatos(cedula);