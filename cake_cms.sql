-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-04-2023 a las 07:18:23
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cake_cms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

CREATE TABLE `articles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(191) NOT NULL,
  `body` text DEFAULT NULL,
  `published` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `title`, `slug`, `body`, `published`, `created`, `modified`) VALUES
(1, 1, 'First Post', 'first-post', 'This is the first post.', 1, '2023-04-17 23:27:57', '2023-04-19 01:02:17'),
(2, 1, 'Second POST', 'mesa', 'This is de second post and is cool', 0, '2023-04-18 21:30:50', '2023-04-19 00:04:42'),
(4, 1, 'PythonPOST', 'PythonPOST', 'This articls is about delovepming on Django framework', 0, '2023-04-19 00:00:30', '2023-04-19 01:52:05'),
(5, 1, 'ComedyStandUp', 'ComedyStandUp', 'Really funny Stand UP', 0, '2023-04-19 01:41:16', '2023-04-19 01:43:04'),
(6, 1, 'Xiamoredmi6', 'Xiamoredmi6', 'this is a phone', 0, '2023-04-19 02:28:14', '2023-04-19 02:28:35'),
(8, 2, 'celularesfinos', 'celularesfinos', 'esto son celulares', 0, '2023-04-19 21:20:51', '2023-04-19 21:25:52'),
(9, 2, 'celularesnuevos', 'celularesnuevos', 'estos son celulares', 0, '2023-04-19 21:41:33', '2023-04-19 21:41:33'),
(10, 1, 'nuevoarticulo', 'nuevoarticulo', 'este es nuevo', 0, '2023-04-19 21:50:18', '2023-04-19 21:50:18'),
(11, 1, 'nuevolisto', 'nuevolisto', 'este si tiene hora', 0, '2023-04-20 02:06:11', '2023-04-20 02:06:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles_tags`
--

CREATE TABLE `articles_tags` (
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `articles_tags`
--

INSERT INTO `articles_tags` (`article_id`, `tag_id`) VALUES
(2, 1),
(4, 2),
(5, 3),
(6, 4),
(8, 6),
(9, 6),
(10, 7),
(11, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `title`, `created`, `modified`) VALUES
(1, 'Marketing', '2023-04-18 23:28:26', '2023-04-18 23:28:38'),
(2, 'Technology', '2023-04-18 23:45:06', '2023-04-18 23:45:06'),
(3, 'funny', '2023-04-19 01:42:48', '2023-04-19 01:42:48'),
(4, 'phones', '2023-04-19 02:28:14', '2023-04-19 02:28:14'),
(5, 'Telefonia', '2023-04-20 01:14:01', '2023-04-20 01:14:01'),
(6, 'celular', '2023-04-20 01:23:35', '2023-04-20 01:23:35'),
(7, 'nuevo', '2023-04-20 01:49:50', '2023-04-20 01:49:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created`, `modified`) VALUES
(1, 'cakephp@example.com', '$2y$10$1mx1cjlXFgrwOPaxPK.Y2e/P3EdbOxPDufnzlYEM4H6OcNEFYlH5i', '2023-04-17 23:27:57', '2023-04-19 16:16:10'),
(2, 'admin@ejemplo.com', '$2y$10$Woirs/NNWevq41cALtTAtuaNo5jg7oXH0Kra1L2f5uIETB2LKXE8e', '2023-04-19 16:17:30', '2023-04-19 16:18:55'),
(3, 'gerente@gmail.com', '$2y$10$wQwdWKhmLHba9Kaw1SdftuVDiHmesmEkoe0KA0uExFMKOlN68WQC.', '2023-04-19 21:54:44', '2023-04-19 21:54:44'),
(4, 'lastuser@gmail.com', '$2y$10$k8HIsN3CTGRG0F3FzhFAve9ImlInrlQ.y5iJmLd0r7a2yi5jxJRRa', '2023-04-20 03:46:35', '2023-04-20 03:46:35');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_key` (`user_id`);

--
-- Indices de la tabla `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD PRIMARY KEY (`article_id`,`tag_id`),
  ADD KEY `tag_key` (`tag_id`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `user_key` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `articles_tags`
--
ALTER TABLE `articles_tags`
  ADD CONSTRAINT `article_key` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `tag_key` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
