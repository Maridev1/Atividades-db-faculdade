-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 07/11/2023 às 18:12
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
-- Banco de dados: `db_consultorio`
--
CREATE DATABASE IF NOT EXISTS `db_consultorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_consultorio`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `Cod_Consulta` int(11) NOT NULL,
  `Dta_Consulta` datetime DEFAULT NULL,
  `Val_Consulta` decimal(20,2) DEFAULT NULL,
  `Cod_Medico` int(11) DEFAULT NULL,
  `Cod_Paciente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Cod_Consulta`),
  KEY `FK_MEDICO_CONSULTA` (`Cod_Medico`),
  KEY `FK_PACIENTE_CONSULTA` (`Cod_Paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`Cod_Consulta`, `Dta_Consulta`, `Val_Consulta`, `Cod_Medico`, `Cod_Paciente`) VALUES
(2, '2000-11-01 15:04:59', '598.95', 2, 2),
(3, '2023-02-16 17:05:10', '332.75', 3, 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `Cod_Especialidade` smallint(6) NOT NULL,
  `Nom_Especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Especialidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `especialidade`
--

INSERT INTO `especialidade` (`Cod_Especialidade`, `Nom_Especialidade`) VALUES
(1, 'Ortopedista'),
(2, 'Clinico Geral'),
(3, 'Fisioterapeuta'),
(4, 'Clinico Geral'),
(5, 'Oftalmologista');

-- --------------------------------------------------------

--
-- Estrutura para tabela `exame`
--

DROP TABLE IF EXISTS `exame`;
CREATE TABLE IF NOT EXISTS `exame` (
  `Cod_Exame` int(11) NOT NULL,
  `Nom_Exame` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Exame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `Cod_Medico` int(11) NOT NULL,
  `Nom_Medico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`Cod_Medico`, `Nom_Medico`) VALUES
(1, 'João da Silva'),
(2, 'Maria Lucia de Souza'),
(3, 'Edson Ferreira');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico_especialidade`
--

DROP TABLE IF EXISTS `medico_especialidade`;
CREATE TABLE IF NOT EXISTS `medico_especialidade` (
  `Cod_Medico_Especialidade` int(11) NOT NULL,
  `Cod_Medico` int(11) DEFAULT NULL,
  `Cod_Especialidade` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`Cod_Medico_Especialidade`),
  KEY `FK_ESPECIALIDADE_MEDICO_ESPECIALIDADE` (`Cod_Especialidade`),
  KEY `FK_MEDICO_MEDICO_ESPECIALIDADE` (`Cod_Medico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `medico_especialidade`
--

INSERT INTO `medico_especialidade` (`Cod_Medico_Especialidade`, `Cod_Medico`, `Cod_Especialidade`) VALUES
(1, 1, 1),
(2, 3, 5),
(3, 2, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `Cod_Paciente` int(11) NOT NULL,
  `Nom_Paciente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Paciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`Cod_Paciente`, `Nom_Paciente`) VALUES
(1, 'Rosa da Silva Sauro'),
(2, 'Pedro de Souza Vieira'),
(3, 'Jéssica Soares');

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `FK_MEDICO_CONSULTA` FOREIGN KEY (`Cod_Medico`) REFERENCES `medico` (`Cod_Medico`),
  ADD CONSTRAINT `FK_PACIENTE_CONSULTA` FOREIGN KEY (`Cod_Paciente`) REFERENCES `paciente` (`Cod_Paciente`);

--
-- Restrições para tabelas `medico_especialidade`
--
ALTER TABLE `medico_especialidade`
  ADD CONSTRAINT `FK_ESPECIALIDADE_MEDICO_ESPECIALIDADE` FOREIGN KEY (`Cod_Especialidade`) REFERENCES `especialidade` (`Cod_Especialidade`),
  ADD CONSTRAINT `FK_MEDICO_MEDICO_ESPECIALIDADE` FOREIGN KEY (`Cod_Medico`) REFERENCES `medico` (`Cod_Medico`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
