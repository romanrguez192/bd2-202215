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

 Date: 26/10/2021 11:47:03
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
-- Table structure for Categorias
-- ----------------------------
DROP TABLE IF EXISTS `Categorias`;
CREATE TABLE `Categorias`  (
  `codigo` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
-- Table structure for Paises
-- ----------------------------
DROP TABLE IF EXISTS `Paises`;
CREATE TABLE `Paises`  (
  `codigo` int NOT NULL,
  `nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`codigo`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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

SET FOREIGN_KEY_CHECKS = 1;
