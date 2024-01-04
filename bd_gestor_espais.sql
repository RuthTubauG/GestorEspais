-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 29-12-2023 a las 14:18:01
-- Versión del servidor: 8.0.31
-- Versión de PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_gestor_espais`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `espais`
--

CREATE TABLE `espais` (
  `id` bigint UNSIGNED NOT NULL,
  `localitzacio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_de_salas` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `espais`
--

INSERT INTO `espais` (`id`, `localitzacio`, `numero_de_salas`, `created_at`, `updated_at`) VALUES
(1, 'Girona', 4, NULL, NULL),
(2, 'Barcelona', 4, NULL, NULL),
(3, 'Tarragona', 4, NULL, NULL),
(4, 'Terres Ebre', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `id` bigint UNSIGNED NOT NULL,
  `data_inici` date NOT NULL,
  `data_fi` date NOT NULL,
  `horari` time NOT NULL,
  `disponibilitat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_salas` bigint UNSIGNED NOT NULL,
  `id_usuaris` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`id`, `data_inici`, `data_fi`, `horari`, `disponibilitat`, `id_salas`, `id_usuaris`, `created_at`, `updated_at`) VALUES
(1, '2024-01-01', '2024-01-15', '15:00:00', 'No disponible', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salas`
--

CREATE TABLE `salas` (
  `id` bigint UNSIGNED NOT NULL,
  `tipo_sala` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom_sala` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_sala` int NOT NULL,
  `metros_cuadrats` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacitat` int NOT NULL,
  `homologacio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `disponibilitat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_espais` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `salas`
--

INSERT INTO `salas` (`id`, `tipo_sala`, `nom_sala`, `numero_sala`, `metros_cuadrats`, `capacitat`, `homologacio`, `disponibilitat`, `id_espais`, `created_at`, `updated_at`) VALUES
(1, 'Sala', 'Sala 1', 1, '65 m²', 15, '[ADGA12DCP]', 'Disponible', 1, NULL, NULL),
(2, 'Sala', 'Sala 2', 2, '65 m²', 15, '[ADGA13DCP]', 'Disponible', 2, NULL, NULL),
(3, 'Sala', 'Sala 3', 3, '65 m²', 15, '[ADGD0108]', 'Disponible', 3, NULL, NULL),
(4, 'Sala', 'Sala 4', 4, '65 m²', 15, '[ADGD0110]', 'Disponible', 4, NULL, NULL),
(5, 'Aula', 'Aula 1', 1, '65 m²', 15, '[ADGD0208]', 'Disponible', 1, NULL, NULL),
(6, 'Aula', 'Aula 2', 2, '65 m²', 15, '[ADGD0210]', 'Disponible', 2, NULL, NULL),
(7, 'Aula', 'Aula 3', 3, '65 m²', 15, '[ADGD0308]', 'Disponible', 3, NULL, NULL),
(8, 'Aula', 'Aula 4', 4, '65 m²', 15, '[ADGD123PO]', 'Disponible', 4, NULL, NULL),
(9, 'Despatx', 'Despatx 1', 1, '65 m²', 15, '[ADGD149PO]', 'Disponible', 1, NULL, NULL),
(10, 'Despatx', 'Despatx 2', 2, '65 m²', 15, '[ADGD236PO]', 'Disponible', 2, NULL, NULL),
(11, 'Despatx', 'Despatx 3', 3, '65 m²', 15, '[ADGD265PO]', 'Disponible', 3, NULL, NULL),
(12, 'Despatx', 'Despatx 4', 4, '65 m²', 15, '[ADGG001PO]', 'Disponible', 4, NULL, NULL),
(13, 'Sala', 'Sala 1', 1, '65 m²', 15, '[ADGG0108]', 'Disponible', 1, NULL, NULL),
(14, 'Sala', 'Sala 2', 2, '65 m²', 15, '[ADGG020PO]', 'Disponible', 2, NULL, NULL),
(15, 'Sala', 'Sala 3', 3, '65 m²', 15, '[ADGG0208]', 'Disponible', 3, NULL, NULL),
(16, 'Sala', 'Sala 4', 4, '65 m²', 15, '[ADGG0308]', 'Disponible', 4, NULL, NULL),
(17, 'Aula', 'Aula 1', 1, '65 m²', 15, '[ADGG038PO]', 'Disponible', 1, NULL, NULL),
(18, 'Aula', 'Aula 2', 2, '65 m²', 15, '[ADGG040PO]', 'Disponible', 2, NULL, NULL),
(19, 'Aula', 'Aula 3', 3, '65 m²', 15, '[ADGG0408]', 'Disponible', 3, NULL, NULL),
(20, 'Aula', 'Aula 4', 4, '65 m²', 15, '[ADGG0508]', 'Disponible', 4, NULL, NULL),
(21, 'Despatx', 'Despatx 1', 1, '65 m²', 15, '[ADGG052PO]', 'Disponible', 1, NULL, NULL),
(22, 'Despatx', 'Despatx 2', 2, '65 m²', 15, '[ADGG084PO]', 'Disponible', 2, NULL, NULL),
(23, 'Despatx', 'Despatx 3', 3, '65 m²', 15, '[ADGI11DCP]', 'Disponible', 3, NULL, NULL),
(24, 'Despatx', 'Despatx 4', 4, '65 m²', 15, '[ADGN0108]', 'Disponible', 4, NULL, NULL),
(25, 'Sala', 'Sala 1', 1, '65 m²', 15, '[ADGX01]', 'Disponible', 1, NULL, NULL),
(26, 'Sala', 'Sala 2', 2, '65 m²', 15, '[AFDP019PO]', 'Disponible', 2, NULL, NULL),
(27, 'Sala', 'Sala 3', 3, '65 m²', 15, '[COML022PO]', 'Disponible', 3, NULL, NULL),
(28, 'Sala', 'Sala 4', 4, '65 m²', 15, '[COML023PO]', 'Disponible', 4, NULL, NULL),
(29, 'Aula', 'Aula 1', 1, '65 m²', 15, '[COML0309]', 'Disponible', 1, NULL, NULL),
(30, 'Aula', 'Aula 2', 2, '65 m²', 15, '[COMM002PO]', 'Disponible', 2, NULL, NULL),
(31, 'Aula', 'Aula 3', 3, '65 m²', 15, '[COMM078PO]', 'Disponible', 3, NULL, NULL),
(32, 'Aula', 'Aula 4', 4, '65 m²', 15, '[COMM108PO]', 'Disponible', 4, NULL, NULL),
(33, 'Despatx', 'Despatx 1', 1, '65 m²', 15, '[COMT004PO]', 'Disponible', 1, NULL, NULL),
(34, 'Despatx', 'Despatx 2', 2, '65 m²', 15, '[COMT0110]', 'Disponible', 2, NULL, NULL),
(35, 'Despatx', 'Despatx 3', 3, '65 m²', 15, '[COMT012PO]', 'Disponible', 3, NULL, NULL),
(36, 'Despatx', 'Despatx 4', 4, '65 m²', 15, '[COMT0411]', 'Disponible', 4, NULL, NULL),
(37, 'Sala', 'Sala 1', 1, '65 m²', 15, '[ENAE019PO]', 'Disponible', 1, NULL, NULL),
(38, 'Sala', 'Sala 2', 2, '65 m²', 15, '[FCOI02]', 'Disponible', 2, NULL, NULL),
(39, 'Sala', 'Sala 3', 3, '65 m²', 15, '[FCOI10]', 'Disponible', 3, NULL, NULL),
(40, 'Sala', 'Sala 4', 4, '65 m²', 15, '[FCOI11]', 'Disponible', 4, NULL, NULL),
(41, 'Aula', 'Aula 1', 1, '65 m²', 15, '[FCOI12]', 'Disponible', 1, NULL, NULL),
(42, 'Aula', 'Aula 2', 2, '65 m²', 15, '[FCOI15]', 'Disponible', 2, NULL, NULL),
(43, 'Aula', 'Aula 3', 3, '65 m²', 15, '[FCOI16]', 'Disponible', 3, NULL, NULL),
(44, 'Aula', 'Aula 4', 4, '65 m²', 15, '[FCOI17]', 'Disponible', 4, NULL, NULL),
(45, 'Despatx', 'Despatx 1', 1, '65 m²', 15, '[FCOI18]', 'Disponible', 1, NULL, NULL),
(46, 'Despatx', 'Despatx 2', 2, '65 m²', 15, '[FCOI19]', 'Disponible', 2, NULL, NULL),
(47, 'Despatx', 'Despatx 3', 3, '65 m²', 15, '[FCOI20]', 'Disponible', 3, NULL, NULL),
(48, 'Despatx', 'Despatx 4', 4, '65 m²', 15, '[FCOI21]', 'Disponible', 4, NULL, NULL),
(49, 'Sala', 'Sala 1', 1, '65 m²', 15, '[FCOI22]', 'Disponible', 1, NULL, NULL),
(50, 'Sala', 'Sala 2', 2, '65 m²', 15, '[FCOI23]', 'Disponible', 2, NULL, NULL),
(51, 'Sala', 'Sala 3', 3, '65 m²', 15, '[FCOI24]', 'Disponible', 3, NULL, NULL),
(52, 'Sala', 'Sala 4', 4, '65 m²', 15, '[FCOI25]', 'Disponible', 4, NULL, NULL),
(53, 'Aula', 'Aula 1', 1, '65 m²', 15, '[FCOI26]', 'Disponible', 1, NULL, NULL),
(54, 'Aula', 'Aula 2', 2, '65 m²', 15, '[FCOO01]', 'Disponible', 2, NULL, NULL),
(55, 'Aula', 'Aula 3', 3, '65 m²', 15, '[FCOO02]', 'Disponible', 3, NULL, NULL),
(56, 'Aula', 'Aula 4', 4, '65 m²', 15, '[FCOO03]', 'Disponible', 4, NULL, NULL),
(57, 'Despatx', 'Despatx 1', 1, '65 m²', 15, '[FCOO04]', 'Disponible', 1, NULL, NULL),
(58, 'Despatx', 'Despatx 2', 2, '65 m²', 15, '[FCOO07]', 'Disponible', 2, NULL, NULL),
(59, 'Despatx', 'Despatx 3', 3, '65 m²', 15, '[FCOO08]', 'Disponible', 3, NULL, NULL),
(60, 'Despatx', 'Despatx 4', 4, '65 m²', 15, '[FCOS02]', 'Disponible', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuaris`
--

CREATE TABLE `usuaris` (
  `id` bigint UNSIGNED NOT NULL,
  `nom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cognom` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuaris`
--

INSERT INTO `usuaris` (`id`, `nom`, `cognom`, `mail`, `created_at`, `updated_at`) VALUES
(1, 'Ruth', 'Tubau', 'ruthtubaugonzalez@gmail.com', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `espais`
--
ALTER TABLE `espais`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservas_id_salas_foreign` (`id_salas`),
  ADD KEY `reservas_id_usuaris_foreign` (`id_usuaris`);

--
-- Indices de la tabla `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salas_id_espais_foreign` (`id_espais`);

--
-- Indices de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `espais`
--
ALTER TABLE `espais`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `salas`
--
ALTER TABLE `salas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT de la tabla `usuaris`
--
ALTER TABLE `usuaris`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_id_salas_foreign` FOREIGN KEY (`id_salas`) REFERENCES `salas` (`id`),
  ADD CONSTRAINT `reservas_id_usuaris_foreign` FOREIGN KEY (`id_usuaris`) REFERENCES `usuaris` (`id`);

--
-- Filtros para la tabla `salas`
--
ALTER TABLE `salas`
  ADD CONSTRAINT `salas_id_espais_foreign` FOREIGN KEY (`id_espais`) REFERENCES `espais` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
