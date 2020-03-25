-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  mer. 25 mars 2020 à 12:43
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP :  7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `insta`
--
CREATE DATABASE IF NOT EXISTS `insta` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `insta`;

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `idUser` tinyint(3) UNSIGNED NOT NULL,
  `publicationDate` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `filename`, `keyword`, `idUser`, `publicationDate`) VALUES
(29, '2-5e6cc42d3c569.jpg', '', 2, '2020-03-14 12:46:53'),
(30, '2-5e6cc433d8d49.jpg', '', 2, '2020-03-14 12:46:59'),
(31, '2-5e6cc911918cb.jpg', 'coiffeur', 2, '2020-03-14 13:07:45'),
(38, '1-5e6e9d62b0c53.jpg', '', 1, '2020-03-15 22:25:54');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `mail` varchar(255) NOT NULL,
  `motDePasse` char(60) NOT NULL,
  `dateInscription` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `mail`, `motDePasse`, `dateInscription`) VALUES
(1, 'admin@gmail.com', '$2y$10$QCDRQGMhEp4O7bCBo3hCjeMah3i2NKrffn98xjkae7zq.sktRFKja', '2020-03-13 14:17:39'),
(2, 'selim@gmail', '$2y$10$mb4KIqRiCMPRFF04LpKV8O2PPzWWYYh0ymVn6LWkHrdt8r2mHkHhm', '2020-03-14 12:46:06'),
(3, 'Jean', '$2y$12$enLeOn3akSE7ycB0nvpl6ed98GZnz2gwMa0CWNXueeDldTOop.Zn2', '2020-03-24 19:46:53'),
(6, '1z', '$2y$12$P.dIGqMNKjcHO7T17ELbwOTyoPt5B065olWh3WtbCcCLEJbeIEN/2', '2020-03-24 19:56:27');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `filename` (`filename`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mail` (`mail`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `user` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
