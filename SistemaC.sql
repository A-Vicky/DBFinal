-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 27-06-2020 a las 07:37:37
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `SistemaC`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Departamento`
--

CREATE TABLE `Departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_pais` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Departamento`
--

INSERT INTO `Departamento` (`id_departamento`, `nombre_departamento`, `id_pais`) VALUES
(1, 'Quetzaltenango', NULL),
(2, 'San Marcos', NULL),
(3, 'Totonicapan', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Empleado`
--

CREATE TABLE `Empleado` (
  `id_empleado` int(11) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `id_puesto` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `id_locacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Empleado`
--

INSERT INTO `Empleado` (`id_empleado`, `salario`, `id_puesto`, `id_persona`, `id_locacion`) VALUES
(1, '8000.00', 2, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Locacion`
--

CREATE TABLE `Locacion` (
  `id_locacion` int(11) NOT NULL,
  `direccion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre_locacion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Locacion`
--

INSERT INTO `Locacion` (`id_locacion`, `direccion`, `nombre_locacion`, `id_municipio`) VALUES
(1, '3-34 zona 4', 'Parque central sede', 1),
(2, '1-12 zona 2', 'sede 2', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Municipio`
--

CREATE TABLE `Municipio` (
  `id_municipio` int(11) NOT NULL,
  `nombre_municipio` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `id_departamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Municipio`
--

INSERT INTO `Municipio` (`id_municipio`, `nombre_municipio`, `id_departamento`) VALUES
(1, 'Salcajá', 1),
(2, 'El tumbador', 2),
(3, 'San Cristobal', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Ornato`
--

CREATE TABLE `Ornato` (
  `id_ornato` int(11) NOT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `fecha_pago` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Ornato`
--

INSERT INTO `Ornato` (`id_ornato`, `id_tipo`, `id_persona`, `fecha_pago`) VALUES
(1, 3, 1, '2020-06-24'),
(2, 2, 1, '2019-12-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pagos`
--

CREATE TABLE `Pagos` (
  `id_pago` int(11) NOT NULL,
  `fecha_pago` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad_pago` decimal(10,2) DEFAULT NULL,
  `id_tipo` int(11) DEFAULT NULL,
  `id_persona` int(11) DEFAULT NULL,
  `correlativo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Pagos`
--

INSERT INTO `Pagos` (`id_pago`, `fecha_pago`, `cantidad_pago`, `id_tipo`, `id_persona`, `correlativo`) VALUES
(1, '2020-06-26', '10.00', 1, 1, 0),
(9, '12.94871794869230769', '10.00', 1, 1, 0),
(10, '12.94871794869230769', '10.00', 1, 1, 0),
(11, '12.46913580244444444', '100.00', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Pais`
--

CREATE TABLE `Pais` (
  `id_pais` int(11) NOT NULL,
  `nombre_pais` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Pais`
--

INSERT INTO `Pais` (`id_pais`, `nombre_pais`) VALUES
(1, 'Guatemala');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Persona`
--

CREATE TABLE `Persona` (
  `id_persona` int(11) NOT NULL,
  `nombres` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `apellidos` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cui` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `direccion` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `empleado` bit(1) DEFAULT NULL,
  `id_municipio` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Persona`
--

INSERT INTO `Persona` (`id_persona`, `nombres`, `apellidos`, `cui`, `fecha_nacimiento`, `direccion`, `telefono`, `empleado`, `id_municipio`) VALUES
(1, 'José', 'Lopez', '1234567891234', '1989-12-03', 'zona 4', 123123, b'0', 2),
(2, 'Mario', 'Escobar', '2131311211111', '2020-06-02', 'zona 4 1-12', 32132123, b'1', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Puesto`
--

CREATE TABLE `Puesto` (
  `id_puesto` int(11) NOT NULL,
  `nombre_puesto` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `descripcion_puesto` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Puesto`
--

INSERT INTO `Puesto` (`id_puesto`, `nombre_puesto`, `descripcion_puesto`) VALUES
(1, 'Secretaria', '--'),
(2, 'Digitador', NULL),
(3, 'Guardia', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Roles`
--

CREATE TABLE `Roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Roles`
--

INSERT INTO `Roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Lectura');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_ornato`
--

CREATE TABLE `Tipo_ornato` (
  `id_tipo` int(11) NOT NULL,
  `costo` double(10,2) DEFAULT NULL,
  `salario` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Tipo_ornato`
--

INSERT INTO `Tipo_ornato` (`id_tipo`, `costo`, `salario`) VALUES
(1, 10.00, '0-1000'),
(2, 20.00, '1000-2000'),
(3, 50.00, '2000-10000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Tipo_Pago`
--

CREATE TABLE `Tipo_Pago` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(40) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Tipo_Pago`
--

INSERT INTO `Tipo_Pago` (`id_tipo`, `tipo`) VALUES
(1, 'Transferencia bancaria'),
(2, 'Efectivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `Usuarios`
--

CREATE TABLE `Usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `id_rol` int(11) NOT NULL,
  `password` varchar(200) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `Usuarios`
--

INSERT INTO `Usuarios` (`id_usuario`, `nombre_usuario`, `id_rol`, `password`) VALUES
(1, 'bd3', 1, 'bd3'),
(2, 'Eric', 2, 'Eric'),
(3, 'vicky', 1, 'bd3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD UNIQUE KEY `id_departamento` (`id_departamento`),
  ADD KEY `IX_Relationship3` (`id_pais`);

--
-- Indices de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD PRIMARY KEY (`id_empleado`),
  ADD UNIQUE KEY `id_empleado` (`id_empleado`),
  ADD KEY `IX_Relationship12` (`id_puesto`),
  ADD KEY `IX_Relationship14` (`id_persona`),
  ADD KEY `IX_Relationship15` (`id_locacion`);

--
-- Indices de la tabla `Locacion`
--
ALTER TABLE `Locacion`
  ADD PRIMARY KEY (`id_locacion`),
  ADD UNIQUE KEY `id_locacion` (`id_locacion`),
  ADD KEY `IX_Relationship10` (`id_municipio`);

--
-- Indices de la tabla `Municipio`
--
ALTER TABLE `Municipio`
  ADD PRIMARY KEY (`id_municipio`),
  ADD UNIQUE KEY `id_municipio` (`id_municipio`),
  ADD KEY `IX_Relationship4` (`id_departamento`);

--
-- Indices de la tabla `Ornato`
--
ALTER TABLE `Ornato`
  ADD PRIMARY KEY (`id_ornato`),
  ADD UNIQUE KEY `id_ornato` (`id_ornato`),
  ADD KEY `IX_Relationship5` (`id_tipo`),
  ADD KEY `IX_Relationship6` (`id_persona`);

--
-- Indices de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD UNIQUE KEY `id_pago` (`id_pago`),
  ADD KEY `IX_Relationship2` (`id_tipo`),
  ADD KEY `IX_Relationship7` (`id_persona`);

--
-- Indices de la tabla `Pais`
--
ALTER TABLE `Pais`
  ADD PRIMARY KEY (`id_pais`),
  ADD UNIQUE KEY `id_pais` (`id_pais`);

--
-- Indices de la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `id_persona` (`id_persona`),
  ADD KEY `IX_Relationship11` (`id_municipio`);

--
-- Indices de la tabla `Puesto`
--
ALTER TABLE `Puesto`
  ADD PRIMARY KEY (`id_puesto`),
  ADD UNIQUE KEY `id_pues` (`id_puesto`);

--
-- Indices de la tabla `Roles`
--
ALTER TABLE `Roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `Tipo_ornato`
--
ALTER TABLE `Tipo_ornato`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `id_tipo` (`id_tipo`);

--
-- Indices de la tabla `Tipo_Pago`
--
ALTER TABLE `Tipo_Pago`
  ADD PRIMARY KEY (`id_tipo`),
  ADD UNIQUE KEY `id` (`id_tipo`);

--
-- Indices de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `Departamento`
--
ALTER TABLE `Departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Empleado`
--
ALTER TABLE `Empleado`
  MODIFY `id_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Locacion`
--
ALTER TABLE `Locacion`
  MODIFY `id_locacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Municipio`
--
ALTER TABLE `Municipio`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Ornato`
--
ALTER TABLE `Ornato`
  MODIFY `id_ornato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Pagos`
--
ALTER TABLE `Pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `Pais`
--
ALTER TABLE `Pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `Persona`
--
ALTER TABLE `Persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Puesto`
--
ALTER TABLE `Puesto`
  MODIFY `id_puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Roles`
--
ALTER TABLE `Roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Tipo_ornato`
--
ALTER TABLE `Tipo_ornato`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `Tipo_Pago`
--
ALTER TABLE `Tipo_Pago`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `Departamento`
--
ALTER TABLE `Departamento`
  ADD CONSTRAINT `Relationship3` FOREIGN KEY (`id_pais`) REFERENCES `Pais` (`id_pais`);

--
-- Filtros para la tabla `Empleado`
--
ALTER TABLE `Empleado`
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`id_puesto`) REFERENCES `Puesto` (`id_puesto`),
  ADD CONSTRAINT `Relationship14` FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`),
  ADD CONSTRAINT `Relationship15` FOREIGN KEY (`id_locacion`) REFERENCES `Locacion` (`id_locacion`);

--
-- Filtros para la tabla `Locacion`
--
ALTER TABLE `Locacion`
  ADD CONSTRAINT `Relationship10` FOREIGN KEY (`id_municipio`) REFERENCES `Municipio` (`id_municipio`);

--
-- Filtros para la tabla `Municipio`
--
ALTER TABLE `Municipio`
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_departamento`) REFERENCES `Departamento` (`id_departamento`);

--
-- Filtros para la tabla `Ornato`
--
ALTER TABLE `Ornato`
  ADD CONSTRAINT `Relationship5` FOREIGN KEY (`id_tipo`) REFERENCES `Tipo_ornato` (`id_tipo`),
  ADD CONSTRAINT `Relationship6` FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

--
-- Filtros para la tabla `Pagos`
--
ALTER TABLE `Pagos`
  ADD CONSTRAINT `Relationship2` FOREIGN KEY (`id_tipo`) REFERENCES `Tipo_Pago` (`id_tipo`),
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id_persona`);

--
-- Filtros para la tabla `Persona`
--
ALTER TABLE `Persona`
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`id_municipio`) REFERENCES `Municipio` (`id_municipio`);

--
-- Filtros para la tabla `Usuarios`
--
ALTER TABLE `Usuarios`
  ADD CONSTRAINT `Usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `Roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
