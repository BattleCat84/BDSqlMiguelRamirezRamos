-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2017 a las 19:45:09
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `hospitalsanjosevp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citamedica`
--

CREATE TABLE `citamedica` (
  `ID` int(10) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `DoctorID` int(10) NOT NULL,
  `PacienteID` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `citamedica`
--

INSERT INTO `citamedica` (`ID`, `Fecha`, `Hora`, `DoctorID`, `PacienteID`) VALUES
(1, '2017-12-29', '08:00:00', 1, 1),
(2, '2017-12-29', '08:30:00', 1, 2),
(3, '2017-12-29', '09:00:00', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `ID` int(10) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido1` varchar(35) DEFAULT NULL,
  `Apellido2` varchar(35) DEFAULT NULL,
  `AiosTrabajados` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`ID`, `Nombre`, `Apellido1`, `Apellido2`, `AiosTrabajados`) VALUES
(1, 'Juan', 'Rodriguez', 'Perez', 2),
(2, 'Jeremy', 'Lopez', 'Martinez', 6),
(4, 'Marcos', 'Sanchez', 'Rodriguez', 4),
(5, 'Fátima', 'Ramírez', 'Ramos', 2),
(6, 'Ilenia', 'Matinez', 'Socas', 1),
(7, 'Fran', 'Coruña', 'Suarez', 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `ID` int(10) NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  `Apellido1` varchar(35) DEFAULT NULL,
  `Apellido2` varchar(35) DEFAULT NULL,
  `Edad` int(10) NOT NULL,
  `FechaNacimiento` date DEFAULT NULL,
  `Telefono` int(10) NOT NULL,
  `Calle` varchar(40) DEFAULT NULL,
  `Localidad` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`ID`, `Nombre`, `Apellido1`, `Apellido2`, `Edad`, `FechaNacimiento`, `Telefono`, `Calle`, `Localidad`) VALUES
(1, 'Augusto', 'Idalgo', 'Martinez', 52, '1965-12-05', 928452452, 'C/ La Alegria', 'Las Palmas de Gran Canaria'),
(2, 'Maria', 'Gomez', 'Sanchez', 25, '1992-09-12', 928254587, 'C/ Los Angeles', 'Las Palmas de Gran Canaria'),
(3, 'Carlos', 'Santana', 'Valido', 45, '1972-05-10', 928452463, 'C/La Naval', 'Las Palmas de Gran Canaria');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `citamedica`
--
ALTER TABLE `citamedica`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `CitaMedica` (`DoctorID`),
  ADD KEY `CitaMedica2` (`PacienteID`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `citamedica`
--
ALTER TABLE `citamedica`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `doctor`
--
ALTER TABLE `doctor`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `citamedica`
--
ALTER TABLE `citamedica`
  ADD CONSTRAINT `CitaMedica` FOREIGN KEY (`DoctorID`) REFERENCES `doctor` (`ID`),
  ADD CONSTRAINT `CitaMedica2` FOREIGN KEY (`PacienteID`) REFERENCES `paciente` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
