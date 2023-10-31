-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 31/10/2023 às 13:55
-- Versão do servidor: 8.0.31
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
CREATE DATABASE IF NOT EXISTS `db_consultorio` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_consultorio`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `Cod_Consulta` int NOT NULL,
  `Dta_Consulta` datetime DEFAULT NULL,
  `Val_Consulta` decimal(20,2) DEFAULT NULL,
  `Cod_Medico` int DEFAULT NULL,
  `Cod_Paciente` int DEFAULT NULL,
  PRIMARY KEY (`Cod_Consulta`),
  KEY `FK_Medico_Consulta` (`Cod_Medico`),
  KEY `FK_Paciente_Consulta` (`Cod_Paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
CREATE TABLE IF NOT EXISTS `especialidade` (
  `Cod_Especialidade` smallint NOT NULL,
  `Nom_Especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Especialidade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

DROP TABLE IF EXISTS `medico`;
CREATE TABLE IF NOT EXISTS `medico` (
  `Cod_Medico` int NOT NULL,
  `Nom_Medico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Medico`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico_especialidade`
--

DROP TABLE IF EXISTS `medico_especialidade`;
CREATE TABLE IF NOT EXISTS `medico_especialidade` (
  `Cod_Medico_Especialidade` int NOT NULL,
  `Cod_Medico` int DEFAULT NULL,
  `Cod_Especialidade` smallint DEFAULT NULL,
  PRIMARY KEY (`Cod_Medico_Especialidade`),
  KEY `FK_Medico_Medico_Especialidade` (`Cod_Medico`),
  KEY `FK_Especialidade_Medico_Especialidade` (`Cod_Especialidade`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

DROP TABLE IF EXISTS `paciente`;
CREATE TABLE IF NOT EXISTS `paciente` (
  `Cod_Paciente` int NOT NULL,
  `Nom_Paciente` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_Paciente`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
