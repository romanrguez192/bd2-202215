/*
 Navicat Premium Data Transfer

 Source Server         : BD2
 Source Server Type    : MySQL
 Source Server Version : 100507
 Source Host           : labs-dbservices01.ucab.edu.ve:3306
 Source Schema         : bd2_202215_29907275

 Target Server Type    : MySQL
 Target Server Version : 100507
 File Encoding         : 65001

 Date: 26/10/2021 11:50:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for Candidatos
-- ----------------------------
DROP TABLE IF EXISTS `Candidatos`;
CREATE TABLE `Candidatos`  (
  `cedula` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `codigo_pais` int NOT NULL,
  PRIMARY KEY (`cedula`) USING BTREE,
  INDEX `fk_Candidatos_Paises_1`(`codigo_pais`) USING BTREE,
  CONSTRAINT `fk_Candidatos_Paises_1` FOREIGN KEY (`codigo_pais`) REFERENCES `Paises` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Candidatos
-- ----------------------------
INSERT INTO `Candidatos` VALUES (24789321, 'Andreina', 'Ordaz', 'Caracas', '0416-0674511', 8);
INSERT INTO `Candidatos` VALUES (25901732, 'Maria', 'Delgado', 'Puerto Ordaz', '0424-8675421', 8);
INSERT INTO `Candidatos` VALUES (28678109, 'Andres', 'Lopez', 'San Felix', '0412-7892321', 8);
INSERT INTO `Candidatos` VALUES (29907275, 'Roman', 'Rodriguez', 'Puerto Ordaz', '0424-9184591', 8);

-- ----------------------------
-- Table structure for Categorias
-- ----------------------------
DROP TABLE IF EXISTS `Categorias`;
CREATE TABLE `Categorias`  (
  `codigo` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Categorias
-- ----------------------------
INSERT INTO `Categorias` VALUES (1, 'Diseño gráfico');
INSERT INTO `Categorias` VALUES (2, 'IT');
INSERT INTO `Categorias` VALUES (3, 'Ingeniería');
INSERT INTO `Categorias` VALUES (4, 'Ciencia');
INSERT INTO `Categorias` VALUES (5, 'Negocios');

-- ----------------------------
-- Table structure for Empresas
-- ----------------------------
DROP TABLE IF EXISTS `Empresas`;
CREATE TABLE `Empresas`  (
  `rif` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rif`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Empresas
-- ----------------------------
INSERT INTO `Empresas` VALUES ('476821189', 'Medimar', 'San Felix', '0286-9941287');
INSERT INTO `Empresas` VALUES ('527894092', 'La Pastora', 'Puerto Ordaz', '0286-9728922');
INSERT INTO `Empresas` VALUES ('589072654', 'Servi-Mant', 'Sucre', '0286-9526572');
INSERT INTO `Empresas` VALUES ('796783210', 'Palermo', 'Puerto Ordaz', '0286-9943267');
INSERT INTO `Empresas` VALUES ('825720917', 'Camila', 'Caracas', '0286-9237831');

-- ----------------------------
-- Table structure for Habilidades
-- ----------------------------
DROP TABLE IF EXISTS `Habilidades`;
CREATE TABLE `Habilidades`  (
  `codigo` int NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `annos_experiencia` int NOT NULL,
  `codigo_categoria` int NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE,
  INDEX `fk_Habilidad_Categorias_1`(`codigo_categoria`) USING BTREE,
  CONSTRAINT `fk_Habilidad_Categorias_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `Categorias` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Habilidades
-- ----------------------------
INSERT INTO `Habilidades` VALUES (1, 'Photoshop', 3, 1);
INSERT INTO `Habilidades` VALUES (2, 'Adobe Xd', 2, 1);
INSERT INTO `Habilidades` VALUES (3, 'Nodejs', 5, 2);
INSERT INTO `Habilidades` VALUES (4, 'Reactjs', 3, 2);
INSERT INTO `Habilidades` VALUES (5, 'Java', 5, 2);
INSERT INTO `Habilidades` VALUES (6, 'Matlab', 4, 3);
INSERT INTO `Habilidades` VALUES (7, 'Arduino', 2, 4);
INSERT INTO `Habilidades` VALUES (8, 'Angular', 4, 2);

-- ----------------------------
-- Table structure for HabilidadesCandidatos
-- ----------------------------
DROP TABLE IF EXISTS `HabilidadesCandidatos`;
CREATE TABLE `HabilidadesCandidatos`  (
  `cedula_candidato` int NOT NULL,
  `codigo_habilidad` int NOT NULL,
  PRIMARY KEY (`cedula_candidato`, `codigo_habilidad`) USING BTREE,
  INDEX `fk_HabilidadesCandidatos_Habilidades_1`(`codigo_habilidad`) USING BTREE,
  CONSTRAINT `fk_HabilidadesCandidatos_Candidatos_1` FOREIGN KEY (`cedula_candidato`) REFERENCES `Candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_HabilidadesCandidatos_Habilidades_1` FOREIGN KEY (`codigo_habilidad`) REFERENCES `Habilidades` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HabilidadesCandidatos
-- ----------------------------
INSERT INTO `HabilidadesCandidatos` VALUES (24789321, 2);
INSERT INTO `HabilidadesCandidatos` VALUES (24789321, 3);
INSERT INTO `HabilidadesCandidatos` VALUES (25901732, 1);
INSERT INTO `HabilidadesCandidatos` VALUES (25901732, 2);
INSERT INTO `HabilidadesCandidatos` VALUES (28678109, 4);
INSERT INTO `HabilidadesCandidatos` VALUES (28678109, 5);
INSERT INTO `HabilidadesCandidatos` VALUES (29907275, 3);
INSERT INTO `HabilidadesCandidatos` VALUES (29907275, 8);

-- ----------------------------
-- Table structure for HabilidadesVacantes
-- ----------------------------
DROP TABLE IF EXISTS `HabilidadesVacantes`;
CREATE TABLE `HabilidadesVacantes`  (
  `codigo_vacante` int NOT NULL,
  `codigo_habilidad` int NOT NULL,
  PRIMARY KEY (`codigo_vacante`, `codigo_habilidad`) USING BTREE,
  INDEX `fk_HabilidadesVacantes_Habilidades_1`(`codigo_habilidad`) USING BTREE,
  CONSTRAINT `fk_HabilidadesVacantes_Habilidades_1` FOREIGN KEY (`codigo_habilidad`) REFERENCES `Habilidades` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_HabilidadesVacantes_Vacantes_1` FOREIGN KEY (`codigo_vacante`) REFERENCES `Vacantes` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HabilidadesVacantes
-- ----------------------------
INSERT INTO `HabilidadesVacantes` VALUES (1, 3);
INSERT INTO `HabilidadesVacantes` VALUES (1, 4);
INSERT INTO `HabilidadesVacantes` VALUES (1, 8);
INSERT INTO `HabilidadesVacantes` VALUES (2, 1);
INSERT INTO `HabilidadesVacantes` VALUES (2, 5);
INSERT INTO `HabilidadesVacantes` VALUES (2, 8);
INSERT INTO `HabilidadesVacantes` VALUES (3, 2);
INSERT INTO `HabilidadesVacantes` VALUES (4, 4);
INSERT INTO `HabilidadesVacantes` VALUES (4, 6);
INSERT INTO `HabilidadesVacantes` VALUES (5, 7);
INSERT INTO `HabilidadesVacantes` VALUES (5, 8);

-- ----------------------------
-- Table structure for Paises
-- ----------------------------
DROP TABLE IF EXISTS `Paises`;
CREATE TABLE `Paises`  (
  `codigo` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Paises
-- ----------------------------
INSERT INTO `Paises` VALUES (1, 'Argentina');
INSERT INTO `Paises` VALUES (2, 'Colombia');
INSERT INTO `Paises` VALUES (3, 'Chile');
INSERT INTO `Paises` VALUES (4, 'Estados Unidos');
INSERT INTO `Paises` VALUES (5, 'Francia');
INSERT INTO `Paises` VALUES (6, 'Inglaterra');
INSERT INTO `Paises` VALUES (7, 'Perú');
INSERT INTO `Paises` VALUES (8, 'Venezuela');

-- ----------------------------
-- Table structure for Postulaciones
-- ----------------------------
DROP TABLE IF EXISTS `Postulaciones`;
CREATE TABLE `Postulaciones`  (
  `codigo_vacante` int NOT NULL,
  `cedula_candidato` int NOT NULL,
  `fecha_postulacion` date NOT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo_vacante`, `cedula_candidato`) USING BTREE,
  INDEX `fk_Postulaciones_Candidatos_1`(`cedula_candidato`) USING BTREE,
  CONSTRAINT `fk_Postulaciones_Candidatos_1` FOREIGN KEY (`cedula_candidato`) REFERENCES `Candidatos` (`cedula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Postulaciones_Vacantes_1` FOREIGN KEY (`codigo_vacante`) REFERENCES `Vacantes` (`codigo`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Postulaciones
-- ----------------------------
INSERT INTO `Postulaciones` VALUES (1, 24789321, '2021-10-25', 'pendiente');
INSERT INTO `Postulaciones` VALUES (1, 25901732, '2021-10-22', 'rechazada');
INSERT INTO `Postulaciones` VALUES (2, 29907275, '2021-10-25', 'pendiente');
INSERT INTO `Postulaciones` VALUES (3, 24789321, '2021-10-26', 'pendiente');
INSERT INTO `Postulaciones` VALUES (4, 28678109, '2021-10-26', 'pendiente');
INSERT INTO `Postulaciones` VALUES (5, 25901732, '2021-10-24', 'pendiente');
INSERT INTO `Postulaciones` VALUES (5, 28678109, '2021-10-23', 'rechazada');

-- ----------------------------
-- Table structure for Vacantes
-- ----------------------------
DROP TABLE IF EXISTS `Vacantes`;
CREATE TABLE `Vacantes`  (
  `codigo` int NOT NULL,
  `posicion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `es_remota` int NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `rif_empresa` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE,
  INDEX `fk_Vacantes_Empresas_1`(`rif_empresa`) USING BTREE,
  CONSTRAINT `fk_Vacantes_Empresas_1` FOREIGN KEY (`rif_empresa`) REFERENCES `Empresas` (`rif`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Vacantes
-- ----------------------------
INSERT INTO `Vacantes` VALUES (1, 'Líder', 1, '2021-10-20', '527894092');
INSERT INTO `Vacantes` VALUES (2, 'Gerente de TI', 0, '2021-09-15', '796783210');
INSERT INTO `Vacantes` VALUES (3, 'Empleado', 0, '2021-10-14', '589072654');
INSERT INTO `Vacantes` VALUES (4, 'Asistente', 1, '2021-10-06', '825720917');
INSERT INTO `Vacantes` VALUES (5, 'Analista', 1, '2021-09-17', '476821189');

SET FOREIGN_KEY_CHECKS = 1;
