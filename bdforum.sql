-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Versão do servidor: 8.0.31
-- versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bdforum`
--
CREATE DATABASE IF NOT EXISTS `bdforum` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bdforum`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_mensagem`
--

CREATE TABLE `t_mensagem` (
  `idmensagem` int NOT NULL,
  `refidutilizador` int NOT NULL,
  `refidtopico` int NOT NULL,
  `mensagem` varchar(64000) NOT NULL,
  `datamensagem` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `t_mensagem`
--

INSERT INTO `t_mensagem` (`idmensagem`, `refidutilizador`, `refidtopico`, `mensagem`, `datamensagem`) VALUES
(1, 2, 1, 'Qual a tensão de arranque de um díodo de silício?', '1980-01-01 00:00:00'),
(2, 4, 1, 'É de cerca de 0,7V.', '1980-01-01 00:00:00'),
(3, 2, 1, 'E de um díodo de germânio?', '1980-01-01 00:00:00'),
(4, 5, 1, 'No caso dos díodos de germânio, a tensão de arranque é de cerca de 0,3V.', '1980-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_palavras`
--

CREATE TABLE `t_palavras` (
  `id_palavra` int NOT NULL,
  `palavra` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `t_palavras`
--

INSERT INTO `t_palavras` (`id_palavra`, `palavra`) VALUES
(1, 'guerra'),
(2, 'ódio'),
(3, 'racismo'),
(4, 'xenofobia');

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_topico`
--

CREATE TABLE `t_topico` (
  `idtopico` int NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `refidutilizador` int NOT NULL,
  `datatopico` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `t_topico`
--

INSERT INTO `t_topico` (`idtopico`, `titulo`, `refidutilizador`, `datatopico`) VALUES
(1, 'Díodos', 1, '1980-01-01 00:00:00'),
(2, 'Transístores Bipolares (BJT)', 6, '1980-01-01 00:00:00'),
(3, 'Transístores Efeito de Campo (FET)', 6, '1980-01-01 00:00:00'),
(4, 'Amplificadores Operacionais', 1, '1980-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `t_utilizador`
--

CREATE TABLE `t_utilizador` (
  `idutilizador` int NOT NULL,
  `utilizador` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipo` int NOT NULL DEFAULT '1',
  `dataregisto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `t_utilizador`
--

INSERT INTO `t_utilizador` (`idutilizador`, `utilizador`, `senha`, `tipo`, `dataregisto`, `ativo`) VALUES
(1, 'admin1', '25d55ad283aa400af464c76d713c07ad', 0, '1980-01-01 00:00:00', 1),
(2, 'admin2', '25d55ad283aa400af464c76d713c07ad', 0, '1980-01-01 00:00:00', 1),
(3, 'moderador1', '25d55ad283aa400af464c76d713c07ad', 1, '1980-01-01 00:00:00', 1),
(4, 'moderador2', '25d55ad283aa400af464c76d713c07ad', 1, '1980-01-01 00:00:00', 1),
(5, 'utilizador1', '25d55ad283aa400af464c76d713c07ad', 2, '1980-01-01 00:00:00', 1),
(6, 'utilizador2', '25d55ad283aa400af464c76d713c07ad', 2, '1980-01-01 00:00:00', 1);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `t_mensagem`
--
ALTER TABLE `t_mensagem`
  ADD PRIMARY KEY (`idmensagem`);

--
-- Índices para tabela `t_palavras`
--
ALTER TABLE `t_palavras`
  ADD PRIMARY KEY (`id_palavra`);

--
-- Índices para tabela `t_topico`
--
ALTER TABLE `t_topico`
  ADD PRIMARY KEY (`idtopico`);

--
-- Índices para tabela `t_utilizador`
--
ALTER TABLE `t_utilizador`
  ADD PRIMARY KEY (`idutilizador`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `t_mensagem`
--
ALTER TABLE `t_mensagem`
  MODIFY `idmensagem` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `t_palavras`
--
ALTER TABLE `t_palavras`
  MODIFY `id_palavra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `t_topico`
--
ALTER TABLE `t_topico`
  MODIFY `idtopico` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `t_utilizador`
--
ALTER TABLE `t_utilizador`
  MODIFY `idutilizador` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
