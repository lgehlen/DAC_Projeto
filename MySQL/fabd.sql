-- MySQL Script generated by MySQL Workbench
-- Mon Jun 11 00:47:14 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema forever
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema forever
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `forever` DEFAULT CHARACTER SET utf8 ;
USE `forever` ;

-- -----------------------------------------------------
-- Table `forever`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `datanasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2) NOT NULL,
  `nome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idEstado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `nomeCidade` VARCHAR(100) NOT NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idCidade`),
  INDEX `fk_Cidade_Estado1_idx` (`Estado_idEstado` ASC),
  CONSTRAINT `fk_Cidade_Estado1`
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `forever`.`Estado` (`idEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(50) NOT NULL,
  `CEP` VARCHAR(9) NOT NULL,
  `numero` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
  INDEX `fk_Endereco_Cidade_idx` (`Cidade_idCidade` ASC),
  CONSTRAINT `fk_Endereco_Cidade`
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `forever`.`Cidade` (`idCidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `horario` VARCHAR(5) NOT NULL,
  `local` VARCHAR(45) NOT NULL,
  `Convidado_idPar` INT NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idEvento`, `Convidado_idPar`),
  INDEX `fk_Evento_Funcionario1_idx` (`Funcionario_idFuncionario` ASC),
  INDEX `fk_Evento_Endereco1_idx` (`Endereco_idEndereco` ASC),
  CONSTRAINT `fk_Evento_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `forever`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Evento_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Atributo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Atributo` (
  `IdAtributo` INT NOT NULL AUTO_INCREMENT,
  `corDeCabelo` VARCHAR(20) NOT NULL,
  `codDePele` VARCHAR(20) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `descricao` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`IdAtributo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(13) NOT NULL,
  `datanasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `escolaridade` VARCHAR(20) NOT NULL,
  `dataCad` DATE NOT NULL,
  `senha` VARCHAR(30) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Atributo_IdAtributoPreferencia` INT NOT NULL,
  `Atributo_IdAtributoAtributo` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `fk_Cliente_Endereco1_idx` (`Endereco_idEndereco` ASC),
  INDEX `fk_Cliente_Atributo1_idx` (`Atributo_IdAtributoPreferencia` ASC),
  INDEX `fk_Cliente_Atributo2_idx` (`Atributo_IdAtributoAtributo` ASC),
  CONSTRAINT `fk_Cliente_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Atributo1`
    FOREIGN KEY (`Atributo_IdAtributoPreferencia`)
    REFERENCES `forever`.`Atributo` (`IdAtributo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cliente_Atributo2`
    FOREIGN KEY (`Atributo_IdAtributoAtributo`)
    REFERENCES `forever`.`Atributo` (`IdAtributo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Encontro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Encontro` (
  `idEncontro` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  `data` INT NOT NULL,
  `horario` VARCHAR(5) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idEncontro`),
  INDEX `fk_Encontro_Endereco1_idx` (`Endereco_idEndereco` ASC),
  INDEX `fk_Encontro_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Encontro_Cliente2_idx` (`Cliente_idCliente1` ASC),
  CONSTRAINT `fk_Encontro_Endereco1`
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encontro_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Encontro_Cliente2`
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Orcamento` (
  `idOrcamento` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `detalhamentoStd` VARCHAR(80) NOT NULL,
  `detalhamentoPrm` VARCHAR(80) NOT NULL,
  `valorStd` DOUBLE NOT NULL,
  `valorPrm` DOUBLE NOT NULL,
  `emailFuncionario` VARCHAR(45) NOT NULL,
  `emailCliente` VARCHAR(45) NOT NULL,
  `idUltimoFuncionario` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idOrcamento`),
  INDEX `fk_Orcamento_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_Orcamento_Cliente2_idx` (`Cliente_idCliente1` ASC),
  CONSTRAINT `fk_Orcamento_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Orcamento_Cliente2`
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`Produtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Produtividade` (
  `data` DATE NOT NULL,
  `isOrcamentoAceito` TINYINT NOT NULL,
  `Orcamento_idOrcamento` INT NOT NULL,
  INDEX `fk_Produtividade_Orcamento1_idx` (`Orcamento_idOrcamento` ASC),
  CONSTRAINT `fk_Produtividade_Orcamento1`
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `forever`.`Orcamento` (`idOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `forever`.`ListaConvidados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`ListaConvidados` (
  `Cliente_idCliente` INT NOT NULL,
  `Evento_idEvento` INT NOT NULL,
  `Evento_Convidado_idPar` INT NOT NULL,
  INDEX `fk_ListaConvidados_Cliente1_idx` (`Cliente_idCliente` ASC),
  INDEX `fk_ListaConvidados_Evento1_idx` (`Evento_idEvento` ASC, `Evento_Convidado_idPar` ASC),
  CONSTRAINT `fk_ListaConvidados_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ListaConvidados_Evento1`
    FOREIGN KEY (`Evento_idEvento` , `Evento_Convidado_idPar`)
    REFERENCES `forever`.`Evento` (`idEvento` , `Convidado_idPar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
