-- -----------------------------------------------------
-- Schema always
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema always
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `always` DEFAULT CHARACTER SET utf8 ;
USE `always` ;

-- -----------------------------------------------------
-- Table `always`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `always`.`Funcionario` (
  `idFuncionario` INT NOT NULL auto_increment,
  `nomeFuncionario` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `regra` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
	`isRemovido` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`idFuncionario`));

-- -----------------------------------------------------
-- Table `always`.`Orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `always`.`Orcamento` (
  `idOrcamento` INT NOT NULL auto_increment,
  `Status` VARCHAR(20) NOT NULL,
  `detalhamentoStd` VARCHAR(80) NOT NULL,
  `detalhamentoPrm` VARCHAR(80) NOT NULL,
  `emailFuncionario` VARCHAR(45) NOT NULL,
  `emailCliente1` VARCHAR(45) NOT NULL,
  `emailCliente2` VARCHAR(45) NOT NULL,
    `valorPremium` double not null,
  `valorStandard` double not null,
  PRIMARY KEY (`idOrcamento`));


-- -----------------------------------------------------
-- Table `always`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `always`.`Pedido` (
  `idPedido` INT NOT NULL auto_increment,
  `statusOrcamento` VARCHAR(20) NOT NULL,
  `Orcamento_idOrcamento` INT NOT NULL,
  PRIMARY KEY (`idPedido`, `Orcamento_idOrcamento`),
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `always`.`Orcamento` (`idOrcamento`)
);


-- -----------------------------------------------------
-- Table `always`.`Orcamento_Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `always`.`Orcamento_Funcionario` (
  `Orcamento_idOrcamento` INT NOT NULL auto_increment,
  `Funcionario_idFuncionario` INT NOT NULL,
  PRIMARY KEY (`Orcamento_idOrcamento`, `Funcionario_idFuncionario`),
    FOREIGN KEY (`Orcamento_idOrcamento`)
    REFERENCES `always`.`Orcamento` (`idOrcamento`),
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `always`.`Funcionario` (`idFuncionario`)
);


INSERT INTO Funcionario(idFuncionario, nomeFuncionario, email, regra, senha) values
(1,'Admin', 'admin@admin.com', ' ', 'nimda'),
(808080,'Ailton dos santos', 'ailtonSantos@gmail.com', ' ', 'b423973681b571359fc30dc04d0bbf85'),
(140455,'Ronald miranda', 'ronaldPow@gmail.com', '','6fb457cd867d3f261522f118c9a4eb45'),
(402306,'Maria Loquenta', 'mariaLoq@gmail.com', '','4b6df872d5790c5f7d7b69ccf044956c'),
(787888,'Gabriel Novaes ', 'gab.nov@hotmail.com', ' ', '4d319d6e5284611afca8927396ca55bd'),
(103389,'Thaisa moreira', 'thaisa.moreira@gmail.com', ' ', '357474dd5b7d9c344508afd0f53fb7b2');

INSERT INTO Orcamento(`Status`, `detalhamentoStd`, `detalhamentoPrm`, `emailFuncionario`, `emailCliente1`, `emailCliente2`,`valorPremium`,`valorStandard`) values
('Pendente','Dados do orçamento Standard','Dados do orçamento Premium','ronaldPow@gmail.com','tadeu.rocha@gmail.com','mirian.goncalves@gmail.com',50.000, 42.000),
('Efetivado','O padrão está de acordo com o o convecional','Com o premium há cotagem de preços mais adequadas ao seu bolso','ronaldPow@gmail.com','wagner.mendoca@gmail.com','mara.deg@gmail.com',50.000, 42.000),
('Efetivado','O padrão está incluso com o tradicional do pacote básico somente','Além de incluir o básico há o premium por pacote modular','mariaLoq@gmail.com','manoelson.silva@gmail.com','mirian.goncalves@gmail.com',50.000, 42.000);

INSERT INTO Pedido(idPedido, statusOrcamento, Orcamento_idOrcamento) values
(1212,'Rejeitado',1),
(1111,'Rejeitado',2),
(4545,'Aprovado',3);

INSERT INTO Orcamento_Funcionario(Orcamento_idOrcamento, Funcionario_idFuncionario) values
(1, 140455),
(2, 140455),
(3, 140455);