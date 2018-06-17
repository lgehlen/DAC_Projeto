
CREATE SCHEMA IF NOT EXISTS `forever` DEFAULT CHARACTER SET utf8 ;
USE `forever` ;

-- -----------------------------------------------------
-- Table `forever`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `nomeFuncionario` VARCHAR(50) NOT NULL,
  `datanasc` DATE NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idFuncionario`));


-- -----------------------------------------------------
-- Table `forever`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Estado` (
  `idEstado` INT NOT NULL AUTO_INCREMENT,
  `uf` CHAR(2) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstado`));


-- -----------------------------------------------------
-- Table `forever`.`Cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Cidade` (
  `idCidade` INT NOT NULL AUTO_INCREMENT,
  `nomeCidade` VARCHAR(100) NOT NULL,
  `Estado_idEstado` INT NOT NULL,
  PRIMARY KEY (`idCidade`),
    FOREIGN KEY (`Estado_idEstado`)
    REFERENCES `forever`.`Estado` (`idEstado`));


-- -----------------------------------------------------
-- Table `forever`.`Endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Endereco` (
  `idEndereco` INT NOT NULL AUTO_INCREMENT,
  `rua` VARCHAR(50) NOT NULL,
  `CEP` VARCHAR(8) NOT NULL,
  `numero` INT NOT NULL,
  `Cidade_idCidade` INT NOT NULL,
  PRIMARY KEY (`idEndereco`),
    FOREIGN KEY (`Cidade_idCidade`)
    REFERENCES `forever`.`Cidade` (`idCidade`)
    );



-- -----------------------------------------------------
-- Table `forever`.`Evento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Evento` (
  `idEvento` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `local` VARCHAR(50) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  PRIMARY KEY (`idEvento`),
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `forever`.`Funcionario` (`idFuncionario`),
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`)
   );


-- -----------------------------------------------------
-- Table `forever`.`Atributo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Atributo` (
  `IdAtributo` INT NOT NULL AUTO_INCREMENT,
  `corDeCabelo` VARCHAR(20) NULL,
  `corDePele` VARCHAR(20) NULL,
  `sexo` CHAR(1) NULL,
  `descricao` VARCHAR(150) NULL,
  PRIMARY KEY (`IdAtributo`));


-- -----------------------------------------------------
-- Table `forever`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nomeCliente` VARCHAR(50) NOT NULL,
  `CPF` VARCHAR(11) NOT NULL,
  `datanasc` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `escolaridade` VARCHAR(50) NOT NULL,
  `dataCad` DATE NOT NULL,
  `senha` VARCHAR(50) NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Atributo_IdAtributoPreferencia` INT NULL,
  `Atributo_IdAtributoAtributo` INT NULL,
  `isRemovido` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idCliente`),
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`),
    FOREIGN KEY (`Atributo_IdAtributoPreferencia`)
    REFERENCES `forever`.`Atributo` (`IdAtributo`),
    FOREIGN KEY (`Atributo_IdAtributoAtributo`)
    REFERENCES `forever`.`Atributo` (`IdAtributo`)
    );


Alter table Cliente
Modify senha varchar(50) NOT NULL;

-- -----------------------------------------------------
-- Table `forever`.`Encontro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Encontro` (
  `idEncontro` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  `data` DATE NOT NULL,
  `horario` TIME NOT NULL,
  `Endereco_idEndereco` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idEncontro`),
    FOREIGN KEY (`Endereco_idEndereco`)
    REFERENCES `forever`.`Endereco` (`idEndereco`),
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`),
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    );


-- -----------------------------------------------------
-- Table `forever`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Orcamento` (
  `idOrcamento` INT NOT NULL AUTO_INCREMENT,
  `status` varchar(20) NOT NULL,
  `detalhamentoStd` VARCHAR(500) NOT NULL,
  `detalhamentoPrm` VARCHAR(500) NOT NULL,
  `valorStd` DOUBLE NOT NULL,
  `valorPrm` DOUBLE NOT NULL,
  `emailFuncionario` VARCHAR(50) NOT NULL,
  `emailCliente` VARCHAR(50) NOT NULL,
  `idUltimoFuncionario` INT NOT NULL,
  `idPedido` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Cliente_idCliente1` INT NOT NULL,
  PRIMARY KEY (`idOrcamento`),
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`),
    FOREIGN KEY (`Cliente_idCliente1`)
    REFERENCES `forever`.`Cliente` (`idCliente`)
    );

-- -----------------------------------------------------
-- Table `forever`.`Produtividade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`Produtividade` (
  `data` DATE NOT NULL,
  `isOrcamentoAceito` TINYINT NOT NULL,
  `Orcamento_idOrcamento` INT NOT NULL,
  INDEX `fk_Produtividade_Orcamento1_idx` (`Orcamento_idOrcamento` ASC),
  PRIMARY KEY (`Orcamento_idOrcamento`),
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `forever`.`Orcamento` (`idOrcamento`)
    );


-- -----------------------------------------------------
-- Table `forever`.`ListaConvidados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `forever`.`ListaConvidados` (
  `Cliente_idCliente` INT NOT NULL,
  `Evento_idEvento` INT NOT NULL,
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `forever`.`Cliente` (`idCliente`),
    FOREIGN KEY (`Evento_idEvento`)
    REFERENCES `forever`.`Evento` (`idEvento`)
    );
