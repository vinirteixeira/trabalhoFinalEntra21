-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Ago-2022 às 20:48
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hortifruti`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(4) NOT NULL,
  `nome` tinytext NOT NULL,
  `categoria` tinytext NOT NULL,
  `epocaCultivo` set('All','1','2','3','4','5','6','7','8','9','10','11','12') NOT NULL,
  `descricao` tinytext NOT NULL,
  `img` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`img`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtor`
--

CREATE TABLE `produtor` (
  `idProdutor` varchar(10) NOT NULL,
  `nome` tinytext NOT NULL,
  `sobrenome` tinytext NOT NULL,
  `DDD` bit(2) NOT NULL,
  `celular` char(10) NOT NULL,
  `whatsApp` tinyint(1) NOT NULL,
  `telFixo` char(9) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `CEP` char(10) NOT NULL,
  `endereco` char(100) NOT NULL,
  `cidade` char(25) NOT NULL,
  `UF` tinytext NOT NULL,
  `entregaProduto` tinyint(1) NOT NULL,
  `dataCadastro` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_produtor`
--

CREATE TABLE `produto_produtor` (
  `idEdit` int(4) NOT NULL,
  `idProduto` int(4) NOT NULL COMMENT 'Estrangeira',
  `idProdutor` varchar(10) NOT NULL COMMENT 'Estrangeira',
  `tipoCultivo` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `produtor`
--
ALTER TABLE `produtor`
  ADD PRIMARY KEY (`idProdutor`);

--
-- Índices para tabela `produto_produtor`
--
ALTER TABLE `produto_produtor`
  ADD PRIMARY KEY (`idEdit`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(4) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
