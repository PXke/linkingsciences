USE linkingsciences;
-- phpMyAdmin SQL Dump
-- version 3.5.8
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 03-08-2013 a las 19:48:09
-- Versión del servidor: 5.5.29
-- Versión de PHP: 5.4.10

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `linkingsciences`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log_master`
--

CREATE TABLE IF NOT EXISTS `log_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) COLLATE utf8_bin DEFAULT NULL,
  `ip` varchar(15) COLLATE utf8_bin NOT NULL,
  `datetime` datetime NOT NULL,
  `microtime` varchar(16) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `host` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE IF NOT EXISTS `projects` (
  `id` int(11) NOT NULL,
  `uid` char(32) COLLATE utf8_bin NOT NULL,
  `project_tag` char(10) COLLATE utf8_bin NOT NULL,
  `project_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `project_quick_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects_comments`
--

CREATE TABLE IF NOT EXISTS `projects_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) COLLATE utf8_bin NOT NULL,
  `project_tag` char(10) COLLATE utf8_bin NOT NULL,
  `content` text COLLATE utf8_bin NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `pass` char(128) COLLATE utf8_bin NOT NULL,
  `register_date` datetime NOT NULL,
  `language` char(2) COLLATE utf8_bin NOT NULL,
  `active` varchar(12) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_profile`
--

CREATE TABLE IF NOT EXISTS `users_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(32) COLLATE utf8_bin NOT NULL,
  `username` varchar(32) COLLATE utf8_bin NOT NULL,
  `usertag` char(8) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`),
  KEY `usertag` (`usertag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_profile_data`
--

CREATE TABLE IF NOT EXISTS `users_profile_data` (
  `id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `uid` char(32) COLLATE utf8_bin NOT NULL,
  `bio` varchar(255) COLLATE utf8_bin NULL,
  `skills` varchar(255) COLLATE utf8_bin NULL,
  `working_at` varchar(255) COLLATE utf8_bin NULL,
  `webpage` varchar(255) COLLATE utf8_bin NULL,
  `experience` int(11) NULL,
  `badges` varchar(128) COLLATE utf8_bin NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
