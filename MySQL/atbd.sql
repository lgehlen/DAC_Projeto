-- MySQL Script generated by MySQL Workbench
-- Mon Jun  4 16:23:46 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `regra` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orcamento` (
  `idOrcamento` INT NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  `detalhamentoStd` VARCHAR(80) NOT NULL,
  `detalhamentoPrm` VARCHAR(80) NOT NULL,
  `emailFuncionario` VARCHAR(45) NOT NULL,
  `emailCliente` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idOrcamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `idPedido` INT NOT NULL,
  `statusOrcamento` INT NOT NULL,
  `Orcamento_idOrcamento` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_Pedido_Orcamento1_idx` (`Orcamento_idOrcamento` ASC),
  CONSTRAINT `fk_Pedido_Orcamento1`
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `mydb`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Orcamento_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Orcamento_Funcionario` (
  `Orcamento_idOrcamento` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`Orcamento_idOrcamento`, `Funcionario_idFuncionario`),
  INDEX `fk_Orcamento_has_Funcionario_Funcionario1_idx` (`Funcionario_idFuncionario` ASC),
  INDEX `fk_Orcamento_has_Funcionario_Orcamento1_idx` (`Orcamento_idOrcamento` ASC),
  CONSTRAINT `fk_Orcamento_has_Funcionario_Orcamento1`
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `mydb`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orcamento_has_Funcionario_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
