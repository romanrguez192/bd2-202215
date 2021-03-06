INSERT INTO `Candidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `codigo_pais`, `codigo_validacion`, `validado`, `fechaRegistro`) VALUES (24789321, 'Andreina', 'Ordaz', 'Caracas', '0416-0674511', 8, 219176067, 1, '2020-12-07');
INSERT INTO `Candidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `codigo_pais`, `codigo_validacion`, `validado`, `fechaRegistro`) VALUES (25901732, 'Maria', 'Delgado', 'Puerto Ordaz', '0424-8675421', 8, NULL, 0, '2021-07-01');
INSERT INTO `Candidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `codigo_pais`, `codigo_validacion`, `validado`, `fechaRegistro`) VALUES (28678109, 'Andres', 'Lopez', 'San Felix', '0412-7892321', 8, NULL, 0, '2021-09-22');
INSERT INTO `Candidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `telefono`, `codigo_pais`, `codigo_validacion`, `validado`, `fechaRegistro`) VALUES (29907275, 'Roman', 'Rodriguez', 'Puerto Ordaz', '0424-9184591', 8, NULL, 1, '2021-04-23');
INSERT INTO `Categorias` (`codigo`, `nombre`) VALUES (1, 'Diseño gráfico');
INSERT INTO `Categorias` (`codigo`, `nombre`) VALUES (2, 'IT');
INSERT INTO `Categorias` (`codigo`, `nombre`) VALUES (3, 'Ingeniería');
INSERT INTO `Categorias` (`codigo`, `nombre`) VALUES (4, 'Ciencia');
INSERT INTO `Categorias` (`codigo`, `nombre`) VALUES (5, 'Negocios');
INSERT INTO `Empresas` (`rif`, `nombre`, `direccion`, `telefono`, `codigo_pais`) VALUES ('476821189', 'Medimar', 'San Felix', '0286-9941287', 8);
INSERT INTO `Empresas` (`rif`, `nombre`, `direccion`, `telefono`, `codigo_pais`) VALUES ('527894092', 'La Pastora', 'Puerto Ordaz', '0286-9728922', 7);
INSERT INTO `Empresas` (`rif`, `nombre`, `direccion`, `telefono`, `codigo_pais`) VALUES ('589072654', 'Servi-Mant', 'Sucre', '0286-9526572', 8);
INSERT INTO `Empresas` (`rif`, `nombre`, `direccion`, `telefono`, `codigo_pais`) VALUES ('796783210', 'Palermo', 'Puerto Ordaz', '0286-9943267', 5);
INSERT INTO `Empresas` (`rif`, `nombre`, `direccion`, `telefono`, `codigo_pais`) VALUES ('825720917', 'Camila', 'Caracas', '0286-9237831', 8);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (1, 'Photoshop', 3, 1);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (2, 'Adobe Xd', 2, 1);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (3, 'Nodejs', 5, 2);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (4, 'Reactjs', 3, 2);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (5, 'Java', 5, 2);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (6, 'Matlab', 4, 3);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (7, 'Arduino', 2, 4);
INSERT INTO `Habilidades` (`codigo`, `descripcion`, `annos_experiencia`, `codigo_categoria`) VALUES (8, 'Angular', 4, 2);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (24789321, 2);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (24789321, 3);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (25901732, 1);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (25901732, 2);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (28678109, 4);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (28678109, 5);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (29907275, 3);
INSERT INTO `HabilidadesCandidatos` (`cedula_candidato`, `codigo_habilidad`) VALUES (29907275, 8);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (1, 3);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (1, 4);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (1, 8);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (2, 1);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (2, 5);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (2, 8);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (3, 2);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (4, 4);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (4, 6);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (5, 7);
INSERT INTO `HabilidadesVacantes` (`codigo_vacante`, `codigo_habilidad`) VALUES (5, 8);
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (1, 'Argentina');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (2, 'Colombia');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (3, 'Chile');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (4, 'Estados Unidos');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (5, 'Francia');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (6, 'Inglaterra');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (7, 'Perú');
INSERT INTO `Paises` (`codigo`, `nombre`) VALUES (8, 'Venezuela');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (1, 24789321, '2021-10-25', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (1, 25901732, '2021-10-22', 'rechazada');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (1, 28678109, '2021-11-29', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (2, 29907275, '2021-10-25', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (3, 24789321, '2021-10-26', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (4, 28678109, '2021-10-26', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (5, 25901732, '2021-10-24', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (5, 28678109, '2021-10-23', 'rechazada');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (6, 24789321, '2021-11-29', 'pendiente');
INSERT INTO `Postulaciones` (`codigo_vacante`, `cedula_candidato`, `fecha_postulacion`, `status`) VALUES (6, 25901732, '2021-11-28', 'pendiente');
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (1, 'Líder', 1, '2021-10-20', '527894092', '2021-12-28', 25901732, 1, 10, 0, NULL, 300.00);
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (2, 'Gerente de TI', 0, '2021-09-15', '796783210', '2021-11-30', NULL, 1, 0, 1, NULL, NULL);
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (3, 'Empleado', 0, '2021-10-14', '589072654', '2021-11-16', NULL, 1, 0, 1, NULL, NULL);
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (4, 'Asistente', 1, '2021-10-06', '825720917', '2021-11-28', 28678109, 1, 5, 1, NULL, NULL);
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (5, 'Analista', 1, '2021-09-17', '476821189', '2022-02-08', NULL, 1, 0, 1, '2022-01-17', NULL);
INSERT INTO `Vacantes` (`codigo`, `posicion`, `es_remota`, `fecha_publicacion`, `rif_empresa`, `fecha_vencimiento`, `cedula_candidato_seleccionado`, `pagada`, `porcentaje_promocional`, `inactiva`, `fecha_pago`, `expectativa_salarial`) VALUES (6, 'Programador', 0, '2021-11-16', '527894092', '2021-12-03', NULL, 1, 20, 1, NULL, NULL);
INSERT INTO `VistaCandidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `codigo_pais`, `validado`) VALUES (24789321, 'Andreina', 'Ordaz', 'Caracas', 8, 1);
INSERT INTO `VistaCandidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `codigo_pais`, `validado`) VALUES (25901732, 'Maria', 'Delgado', 'Puerto Ordaz', 8, 0);
INSERT INTO `VistaCandidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `codigo_pais`, `validado`) VALUES (28678109, 'Andres', 'Lopez', 'San Felix', 8, 0);
INSERT INTO `VistaCandidatos` (`cedula`, `nombre`, `apellido`, `direccion`, `codigo_pais`, `validado`) VALUES (29907275, 'Roman', 'Rodriguez', 'Puerto Ordaz', 8, 1);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (1, 300.00);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (2, NULL);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (3, NULL);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (4, NULL);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (5, NULL);
INSERT INTO `VistaVacantes` (`codigo`, `expectativa_salarial`) VALUES (6, NULL);
