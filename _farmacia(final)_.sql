-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 21/11/2023 às 22:12
-- Versão do servidor: 10.10.2-MariaDB
-- Versão do PHP: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_farmacia`
--
CREATE DATABASE IF NOT EXISTS `bd_farmacia` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bd_farmacia`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cliente`
--

DROP TABLE IF EXISTS `cliente`;
CREATE TABLE IF NOT EXISTS `cliente` (
  `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `CPF` varchar(14) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  `Endereco` varchar(255) DEFAULT NULL,
  `Geolocalizacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id_Cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Nome`, `CPF`, `Email`, `Telefone`, `Endereco`, `Geolocalizacao`) VALUES
(1, 'Severino Murilo Cardoso', '352.405.270-32', 'severino_murilo_cardoso@mesquita.not.br', '(51) 98120-4920', 'Rua Grandiuva 264 Jardim do Bosque Cachoeirinha', '-29.93188486564134 -47.95181284371802'),
(2, 'Lara Maria Fernandes', '546.220.156-76', 'lara_fernandes@tce.sp.gov.br', '(31) 98830-3997', 'Rua Benjamim Guimarães 582 Centro Belo Horizonte', '-19.93188486564134 -43.95181284371802'),
(3, 'Liz Stella Campos', '012.983.906-05', 'liz.stella.campos@engineer.com', '(31) 99271-7306', 'Rua Rocha Lagoa 274 Cachoeirinha Belo Horizonte', '-16.93188486564134 -41.95181284371802'),
(4, 'Helena Maitê Marina da Cunha', '154.155.786-76', 'helena-dacunha96@randstad.com.br', '(31) 99544-2910', 'Rua Barão de Ibituruna 980 Caiçaras ', '-10.93188486564134 -25.95181284371802');

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

DROP TABLE IF EXISTS `compra`;
CREATE TABLE IF NOT EXISTS `compra` (
  `Cod_Compra` int(11) NOT NULL AUTO_INCREMENT,
  `Id_Cliente` int(11) DEFAULT NULL,
  `Cod_pagamento` int(11) DEFAULT NULL,
  `Dta_Compra` datetime DEFAULT NULL,
  `Dta_retirada` date NOT NULL,
  `Modo_Retirada` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Compra`),
  KEY `Id_Cliente` (`Id_Cliente`),
  KEY `FK_Cod_Pagamento` (`Cod_pagamento`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `compra`
--

INSERT INTO `compra` (`Cod_Compra`, `Id_Cliente`, `Cod_pagamento`, `Dta_Compra`, `Dta_retirada`, `Modo_Retirada`, `Status`) VALUES
(1, 1, 1, '2023-11-13 12:32:36', '2023-11-16', 'Retire Fácil - Ponto Fixo', 'Aprovada'),
(2, 2, 8, '2023-11-21 12:32:36', '2023-11-21', 'Retire Fácil - Ponto Fixo', 'Aprovada'),
(3, 3, 5, '2023-11-19 11:00:00', '2023-11-30', 'Retire Fácil - Loja', 'Aguardando Pagamento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

DROP TABLE IF EXISTS `departamento`;
CREATE TABLE IF NOT EXISTS `departamento` (
  `Cod_Departamento` int(11) NOT NULL AUTO_INCREMENT,
  `Des_Departamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_Departamento`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `departamento`
--

INSERT INTO `departamento` (`Cod_Departamento`, `Des_Departamento`) VALUES
(101, 'Medicamentos Gerais'),
(102, 'Suplementos Nutricionais'),
(103, 'Cuidados Pessoais e Beleza'),
(104, ' Produtos Oftalmológicos'),
(105, 'Produtos Alimentícios');

-- --------------------------------------------------------

--
-- Estrutura para tabela `itens_da_compra`
--

DROP TABLE IF EXISTS `itens_da_compra`;
CREATE TABLE IF NOT EXISTS `itens_da_compra` (
  `Cod_Compra` int(11) NOT NULL,
  `Cod_Produto` int(11) NOT NULL,
  `Qntd` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Compra`,`Cod_Produto`),
  KEY `Cod_Produto` (`Cod_Produto`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `itens_da_compra`
--

INSERT INTO `itens_da_compra` (`Cod_Compra`, `Cod_Produto`, `Qntd`) VALUES
(1, 3, 2),
(2, 4, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ponto_ou_loja`
--

DROP TABLE IF EXISTS `ponto_ou_loja`;
CREATE TABLE IF NOT EXISTS `ponto_ou_loja` (
  `Cod_Ponto_Loja` int(11) NOT NULL,
  `Nom_Ponto_Loja` varchar(30) DEFAULT NULL,
  `End_Ponto_Loja` varchar(255) DEFAULT NULL,
  `Metodo_Retirada` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Cod_Ponto_Loja`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `ponto_ou_loja`
--

INSERT INTO `ponto_ou_loja` (`Cod_Ponto_Loja`, `Nom_Ponto_Loja`, `End_Ponto_Loja`, `Metodo_Retirada`) VALUES
(1, 'Farmácia Saúde Total - Sede', 'Avenida Principal, 456 Funcionários', 'Retire Fácil - Loja'),
(2, 'Farmácia Saúde Total - Retire ', 'Avenida do Bem, 701 - Eldorado', 'Retire Fácil - Ponto Fixo'),
(3, 'Farmácia Saúde Total - Filial ', 'Av Presidente Antônio Carlos, 7596 São Luíz - Pampulha ', 'Retire Fácil - Loja'),
(4, 'Store 7', 'Praça Central, 789 - Centro', 'Retire Fácil - Ponto Fixo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

DROP TABLE IF EXISTS `produto`;
CREATE TABLE IF NOT EXISTS `produto` (
  `Cod_produto` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Departamento` int(11) NOT NULL,
  `Nome_Produto` varchar(255) NOT NULL,
  `Fornecedor` varchar(100) DEFAULT NULL,
  `Qnt_estoque` smallint(6) DEFAULT NULL,
  `Dta_Validade` date DEFAULT NULL,
  `Dta_Fabricacao` date DEFAULT NULL,
  `Preco` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`Cod_produto`),
  KEY `Cod_Departamento` (`Cod_Departamento`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `produto`
--

INSERT INTO `produto` (`Cod_produto`, `Cod_Departamento`, `Nome_Produto`, `Fornecedor`, `Qnt_estoque`, `Dta_Validade`, `Dta_Fabricacao`, `Preco`) VALUES
(1, 101, 'Aspirina 500mg', 'PharmaCo', 100, '2024-12-01', '2023-12-01', '9.99'),
(2, 102, 'Vitamina D 1000UI', 'HealthSup', 75, '2025-06-01', '2023-11-15', '12.49'),
(3, 103, 'Creme Hidratante 200ml', 'BeautyCare', 50, '2024-09-01', '2023-08-20', '15.75'),
(4, 104, 'Solução Oftálmica', 'EyePharma', 30, '2024-10-01', '2023-09-05', '22.99'),
(5, 105, 'Sabonete Facial', 'BeautyCare', 80, '2025-02-01', '2023-07-18', '8.50'),
(6, 101, 'Analgésico em Gel', 'PharmaCo', 45, '2024-11-01', '2023-10-10', '19.99'),
(7, 103, 'Loção Corporal', 'BeautyCare', 60, '2025-03-01', '2023-09-25', '11.25'),
(8, 102, 'Omega-3 1000mg', 'HealthSup', 55, '2025-01-01', '2023-08-05', '18.75'),
(9, 104, 'Colírio Lubrificante', 'EyePharma', 40, '2024-08-01', '2023-07-10', '27.50'),
(10, 101, 'Antiácido Efervescente', 'PharmaCo', 70, '2024-10-01', '2023-09-15', '14.99');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto_estoque`
--

DROP TABLE IF EXISTS `produto_estoque`;
CREATE TABLE IF NOT EXISTS `produto_estoque` (
  `Cod_Produto_Estoque` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Produto` int(11) NOT NULL,
  `Cod_Ponto_Loja` int(11) NOT NULL,
  `Qnt_Disponivel` smallint(6) DEFAULT NULL,
  `Dta_Atualizacao` datetime DEFAULT NULL,
  PRIMARY KEY (`Cod_Produto_Estoque`),
  KEY `Cod_Produto` (`Cod_Produto`),
  KEY `Cod_Ponto_Loja` (`Cod_Ponto_Loja`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `produto_estoque`
--

INSERT INTO `produto_estoque` (`Cod_Produto_Estoque`, `Cod_Produto`, `Cod_Ponto_Loja`, `Qnt_Disponivel`, `Dta_Atualizacao`) VALUES
(1, 1, 1, 50, '2023-11-21 07:01:00'),
(2, 1, 2, 50, '2023-11-20 07:05:00'),
(3, 2, 1, 25, '2023-11-20 07:13:00'),
(4, 2, 2, 25, '2023-11-20 07:20:00'),
(5, 2, 3, 25, '2023-11-20 09:05:00'),
(6, 3, 1, 20, '2023-11-21 15:08:00'),
(7, 3, 2, 20, '2023-11-21 00:00:00'),
(8, 3, 2, 20, '2023-11-21 00:00:00'),
(9, 3, 3, 20, '2023-11-21 00:00:00'),
(10, 3, 4, 10, '2023-11-21 00:00:00'),
(11, 4, 4, 5, '2023-11-21 05:00:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `retirada`
--

DROP TABLE IF EXISTS `retirada`;
CREATE TABLE IF NOT EXISTS `retirada` (
  `Cod_Retirada` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Ponto_Loja` int(11) NOT NULL,
  `Id_Cliente` int(11) NOT NULL,
  `Pgt_Retirada` varchar(10) DEFAULT NULL,
  `Dta_Retirada` datetime DEFAULT NULL,
  PRIMARY KEY (`Cod_Retirada`),
  KEY `Cod_Ponto_Loja` (`Cod_Ponto_Loja`),
  KEY `Id_Cliente` (`Id_Cliente`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `retirada`
--

INSERT INTO `retirada` (`Cod_Retirada`, `Cod_Ponto_Loja`, `Id_Cliente`, `Pgt_Retirada`, `Dta_Retirada`) VALUES
(1, 4, 1, 'Não', '2023-11-16 13:06:00'),
(2, 4, 2, 'Sim', '2023-11-21 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_pgto`
--

DROP TABLE IF EXISTS `tipo_pgto`;
CREATE TABLE IF NOT EXISTS `tipo_pgto` (
  `Cod_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Desc_pagamento` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Cod_pagamento`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tipo_pgto`
--

INSERT INTO `tipo_pgto` (`Cod_pagamento`, `Desc_pagamento`) VALUES
(1, 'Cartão de Crédito'),
(2, 'Cartão de Débito'),
(3, 'Dinheiro'),
(4, 'Pix'),
(5, 'Boleto bancário'),
(6, 'Transferência bancária'),
(7, 'Link de pagamento'),
(8, 'Dinheiro no local de retirada');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
