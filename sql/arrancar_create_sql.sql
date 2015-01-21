SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';


CREATE DATABASE IF NOT EXISTS `u377836624_arr` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `u377836624_arr` ;
DROP TABLE IF EXISTS  `u377836624_arr`.`facturas_reserva`;
DROP TABLE IF EXISTS  `u377836624_arr`.`factura`;
DROP TABLE IF EXISTS  `u377836624_arr`.`reserva`;
DROP TABLE IF EXISTS  `u377836624_arr`.`servicio`;
DROP TABLE IF EXISTS  `u377836624_arr`.`proveedor`;
DROP TABLE IF EXISTS  `u377836624_arr`.`ciudad`;
DROP TABLE IF EXISTS  `u377836624_arr`.`tipo_servicio`;
DROP TABLE IF EXISTS   `u377836624_arr`.`users`;
DROP TABLE IF EXISTS   `u377836624_arr`.`secuencia_reserva`;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`proveedor`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`proveedor` (
  `prov_id` INT NOT NULL AUTO_INCREMENT ,
  `prov_nombre` VARCHAR(60) NOT NULL ,
  `prov_nit` VARCHAR(45) NOT NULL ,
  `prov_telefono` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`prov_id`) )
ENGINE = InnoDB AUTO_INCREMENT=0;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`ciudad`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`ciudad` (
  `ciudad_id` INT NOT NULL ,
  `ciudad_nombre` VARCHAR(60) NOT NULL ,
  PRIMARY KEY (`ciudad_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`tipo_servicio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`tipo_servicio` (
  `tipo_srv_id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_srv_nombre` VARCHAR(20) NOT NULL ,
  `tipo_srv_descripcion` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`tipo_srv_id`) )
ENGINE = InnoDB  AUTO_INCREMENT=0;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`servicio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`servicio` (
  `servicio_id` INT NOT NULL AUTO_INCREMENT ,
  `tipo_servicio_tipo_srv_id` INT NOT NULL ,
  `proveedor_prov_id` INT NOT NULL ,
  `ciudad_ciudad_id` INT NOT NULL ,
  `servicio_costo` DECIMAL(10,2) NOT NULL ,
  `servicio_descripcion` VARCHAR(100) NOT NULL ,
  `servicio_fecha` DATE NOT NULL,
  `servicio_hora` TIME NOT NULL,
  PRIMARY KEY (`servicio_id`) ,
  INDEX `fk_servicio_tipo_servicio` (`tipo_servicio_tipo_srv_id` ASC) ,
  INDEX `fk_servicio_proveedor1` (`proveedor_prov_id` ASC) ,
  INDEX `fk_servicio_ciudad1` (`ciudad_ciudad_id` ASC) ,
  CONSTRAINT `fk_servicio_tipo_servicio`
    FOREIGN KEY (`tipo_servicio_tipo_srv_id` )
    REFERENCES `u377836624_arr`.`tipo_servicio` (`tipo_srv_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_proveedor1`
    FOREIGN KEY (`proveedor_prov_id` )
    REFERENCES `u377836624_arr`.`proveedor` (`prov_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_ciudad1`
    FOREIGN KEY (`ciudad_ciudad_id` )
    REFERENCES `u377836624_arr`.`ciudad` (`ciudad_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB  AUTO_INCREMENT=0;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`reserva`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`reserva` (
  `reserva_id` INT NOT NULL AUTO_INCREMENT ,
  `servicio_servicio_id` INT NOT NULL ,
  `reserva_cantidad` INT NOT NULL ,
  `reserva_fecha` DATE NOT NULL,
  `reserva_hora` TIME NOT NULL,
  `reserva_costo_u` DECIMAL(10,2) NOT NULL ,
  `reserva_costo_t` DECIMAL(10,2) NOT NULL ,
  `reserva_estado` INT NOT NULL ,
  `reserva_ref` INT NOT NULL ,
  PRIMARY KEY (`reserva_id`) ,
  INDEX `fk_reserva_servicio1` (`servicio_servicio_id` ASC) ,
  CONSTRAINT `fk_reserva_servicio1`
    FOREIGN KEY (`servicio_servicio_id` )
    REFERENCES `u377836624_arr`.`servicio` (`servicio_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB  AUTO_INCREMENT=0;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`factura`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`factura` (
  `factura_id` INT NOT NULL AUTO_INCREMENT ,
  `factura_fecha` DATETIME NOT NULL ,
  `factura_nombre_cli` VARCHAR(60) NOT NULL ,
  `factura_cedula_cli` VARCHAR(45) NOT NULL ,
  `factura_total` DECIMAL(10,2) NOT NULL ,
  PRIMARY KEY (`factura_id`) )
ENGINE = InnoDB  AUTO_INCREMENT=0;


-- -----------------------------------------------------
-- Table `u377836624_arr`.`facturas_reserva`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `u377836624_arr`.`facturas_reserva` (
  `facturas_reserva_id` INT NOT NULL AUTO_INCREMENT ,
  `factura_factura_id` INT NOT NULL ,
  `reserva_reserva_id` INT NOT NULL ,
  PRIMARY KEY (`facturas_reserva_id`) ,
  INDEX `fk_facturas_reserva_factura1` (`factura_factura_id` ASC) ,
  INDEX `fk_facturas_reserva_reserva1` (`reserva_reserva_id` ASC) ,
  CONSTRAINT `fk_facturas_reserva_factura1`
    FOREIGN KEY (`factura_factura_id` )
    REFERENCES `u377836624_arr`.`factura` (`factura_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_facturas_reserva_reserva1`
    FOREIGN KEY (`reserva_reserva_id` )
    REFERENCES `u377836624_arr`.`reserva` (`reserva_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB  AUTO_INCREMENT=0;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phpjobscheduler`
--

CREATE TABLE IF NOT EXISTS `phpjobscheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `scriptpath` varchar(255) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `time_interval` int(11) DEFAULT NULL,
  `fire_time` int(11) NOT NULL DEFAULT '0',
  `time_last_fired` int(11) DEFAULT NULL,
  `run_only_once` tinyint(1) NOT NULL DEFAULT '0',
  `currently_running` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  AUTO_INCREMENT=0;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `phpjobscheduler_logs`
--

CREATE TABLE IF NOT EXISTS `phpjobscheduler_logs` (
  `id` int(11) NOT NULL,
  `script` varchar(128) DEFAULT NULL,
  `output` text,
  `execution_time` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;


--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usrName` varchar(25) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  AUTO_INCREMENT=0;


--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `usrName`, `pwd`) 
VALUES
(0, 'admin', '81dc9bdb52d04dc20036dbd8313ed055');


--
-- Estructura de tabla para la tabla `logusuarios`
--

CREATE TABLE IF NOT EXISTS `logusuarios` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `nomusr_log` varchar(25) NOT NULL,
  `pwd_log` varchar(255) NOT NULL,
  `fecha_log` date NOT NULL,
  `hora_log` time NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=MyISAM  AUTO_INCREMENT=0;

CREATE TABLE IF NOT EXISTS `secuencia_reserva` (
	`seq_reserva_id` INT(11) NOT NULL,
	`seq_reserva_dato` INT(11) NOT NULL,
	PRIMARY KEY (`seq_reserva_id`)	
) ENGINE=InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;