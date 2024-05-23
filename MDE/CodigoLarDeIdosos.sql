-- MySQL Script generated by MySQL Workbench
-- Thu May 23 00:08:43 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LardeIdoso
-- -----------------------------------------------------
-- Situação Problema:
-- 
-- 1.	Com o avanço da terceira idade, estão surgindo muitas casas de repouso. As pessoas internadas precisam ter um atendimento especializado por profissionais capacitados, pois muitos deles precisam tomar diversos tipos de medicamentos e em horários específicos. Tudo precisa ser muito bem controlado. Você precisará realizar a modelagem do banco de dados da Casa de Repouso para controlar o atendimento aos idosos ali internados. Uma análise de requisitos já foi previamente realizada e foram apontados os seguintes aspectos fundamentais para o banco de dados:
-- •	Cadastrar os idosos e seus responsáveis. 
-- •	Médicos e enfermeiros não são funcionários, devendo ser cadastrados separadamente, pois serão terceirizados. 
-- •	Toda vez que um idoso precisar de atendimento médico, sempre haverá um enfermeiro para ajudar.
-- Crie o Diagrama de Entidade-Relacionamentos, seus relacionamentos e aplique as cardinalidades. 
-- 

-- -----------------------------------------------------
-- Schema LardeIdoso
--
-- Situação Problema:
-- 
-- 1.	Com o avanço da terceira idade, estão surgindo muitas casas de repouso. As pessoas internadas precisam ter um atendimento especializado por profissionais capacitados, pois muitos deles precisam tomar diversos tipos de medicamentos e em horários específicos. Tudo precisa ser muito bem controlado. Você precisará realizar a modelagem do banco de dados da Casa de Repouso para controlar o atendimento aos idosos ali internados. Uma análise de requisitos já foi previamente realizada e foram apontados os seguintes aspectos fundamentais para o banco de dados:
-- •	Cadastrar os idosos e seus responsáveis. 
-- •	Médicos e enfermeiros não são funcionários, devendo ser cadastrados separadamente, pois serão terceirizados. 
-- •	Toda vez que um idoso precisar de atendimento médico, sempre haverá um enfermeiro para ajudar.
-- Crie o Diagrama de Entidade-Relacionamentos, seus relacionamentos e aplique as cardinalidades. 
-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LardeIdoso` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `LardeIdoso` ;

-- -----------------------------------------------------
-- Table `LardeIdoso`.`Responsaveis`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LardeIdoso`.`Responsaveis` (
  `idResponsaveis` INT NOT NULL,
  `NomeResp` VARCHAR(45) NULL,
  `TelefoneResp` VARCHAR(45) NULL,
  PRIMARY KEY (`idResponsaveis`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LardeIdoso`.`Idosos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LardeIdoso`.`Idosos` (
  `idIdosos` INT NOT NULL,
  `NomeIdoso` VARCHAR(45) NULL,
  `Responsaveis_idResponsaveis` INT NOT NULL,
  PRIMARY KEY (`idIdosos`),
  INDEX `fk_Idosos_Responsaveis_idx` (`Responsaveis_idResponsaveis` ASC) VISIBLE,
  CONSTRAINT `fk_Idosos_Responsaveis`
    FOREIGN KEY (`Responsaveis_idResponsaveis`)
    REFERENCES `LardeIdoso`.`Responsaveis` (`idResponsaveis`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LardeIdoso`.`Medicos_e_Enfermeiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LardeIdoso`.`Medicos_e_Enfermeiros` (
  `idMedicos_e_Enfermeiros` INT NOT NULL,
  `NomeMedEnf` VARCHAR(45) NULL,
  `RegistroMed_Enf` VARCHAR(45) NULL,
  PRIMARY KEY (`idMedicos_e_Enfermeiros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LardeIdoso`.`Atendimento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LardeIdoso`.`Atendimento` (
  `idAtendimento` INT NOT NULL,
  `TipoAtendimento` LONGTEXT NULL,
  `Medicos_e_Enfermeiros_idMedicos_e_Enfermeiros` INT NOT NULL,
  `Idosos_idIdosos` INT NOT NULL,
  PRIMARY KEY (`idAtendimento`),
  INDEX `fk_Atendimento_Medicos-e-Enfermeiros1_idx` (`Medicos_e_Enfermeiros_idMedicos_e_Enfermeiros` ASC) VISIBLE,
  INDEX `fk_Atendimento_Idosos1_idx` (`Idosos_idIdosos` ASC) VISIBLE,
  CONSTRAINT `fk_Atendimento_Medicos-e-Enfermeiros1`
    FOREIGN KEY (`Medicos_e_Enfermeiros_idMedicos_e_Enfermeiros`)
    REFERENCES `LardeIdoso`.`Medicos_e_Enfermeiros` (`idMedicos_e_Enfermeiros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Atendimento_Idosos1`
    FOREIGN KEY (`Idosos_idIdosos`)
    REFERENCES `LardeIdoso`.`Idosos` (`idIdosos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;