-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-05-2019 a las 14:09:36
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `adm_bdd`
--
CREATE DATABASE IF NOT EXISTS `adm_bdd` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `adm_bdd`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistentes`
--

DROP TABLE IF EXISTS `asistentes`;
CREATE TABLE `asistentes` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `asistentes`
--

INSERT INTO `asistentes` (`cod_voluntario`, `cod_evento`) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(4, 3),
(4, 5),
(5, 2),
(6, 6),
(7, 3),
(7, 4),
(8, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campanna`
--

DROP TABLE IF EXISTS `campanna`;
CREATE TABLE `campanna` (
  `cod_campanna` int(11) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `ambito` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `campanna`
--

INSERT INTO `campanna` (`cod_campanna`, `tipo`, `ambito`) VALUES
(1, 'Europea', 'EU'),
(2, 'Nacional', 'Nacional'),
(3, 'Municipal', 'Barcelona'),
(4, 'Municipal', 'Madrid'),
(5, 'Municipal', 'León'),
(6, 'Municipal', 'Cádiz'),
(7, 'Municipal', 'Málaga'),
(8, 'Autonómica', 'Comunidad Castilla y León'),
(9, 'Autonómica', 'Comunidad Galicia'),
(10, 'Autonómica', 'Comunidad Madrid'),
(11, 'Autonómica', 'Comunidad Catalunya'),
(12, 'Autonómica', 'Comunidad Andalucía'),
(13, 'Municipal', 'Puerto Real (Cádiz)'),
(14, 'Municipal', 'Fuengirola (Málaga)'),
(15, 'Municipal', 'Murcia'),
(16, 'Municipal', 'Rivas (Madrid)'),
(17, 'Municipal', 'Getafe (Madrid)'),
(18, 'Autonómica', 'Comunidad Valenciana'),
(19, 'Autonómica', 'Comunidad Canaria'),
(20, 'Autonómica', 'Comunidad de Baleares'),
(21, 'Autonómica', 'Comunidad Castilla La Mancha');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
CREATE TABLE `candidatos` (
  `cod_candidato` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nac` date NOT NULL,
  `lugar_nac` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL,
  `provincia` varchar(50) NOT NULL,
  `autonomia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `candidatos`
--

INSERT INTO `candidatos` (`cod_candidato`, `nombre`, `apellidos`, `fecha_nac`, `lugar_nac`, `municipio`, `provincia`, `autonomia`) VALUES
(1, 'Francisco Javier', 'Cuesta Ramos', '1971-10-16', 'España', 'León', 'León', 'Castilla y León'),
(2, 'Daniel', 'Carbonell de las Heras', '1972-08-06', 'España', 'Barcelona', 'Barcelona', 'Catalunya'),
(3, 'Ana Isabel', 'Alonso Gómez', '1964-11-11', 'España', 'Baracaldo', 'Vizcaya', 'Pais Vasco'),
(4, 'Albert Arnold', 'Gore', '1948-03-31', 'Estados Unidos', '', '', 'Washington DC'),
(5, 'Marta', 'Martinez Queimadelos', '1968-05-17', 'España', 'Madrid', 'Madrid', 'Madrid'),
(6, 'Dolores', 'De los Rios Montaña', '1985-01-09', 'España', 'Alhaurín de la Torre', 'Málaga', 'Andalucía'),
(7, 'Daniel', 'González Güiza', '1980-08-17', 'España', 'Jerez de la Frontera', 'Cádiz', 'Andalucía'),
(8, 'Adolfo', 'Suárez Campo', '1988-04-10', 'España', 'Pontevedra', 'Pontevedra', 'Galicia'),
(9, 'Gema', 'Camps Lloret', '1992-08-03', 'España', 'Gandía', 'Valencia', 'Comunidad Valenciana'),
(10, 'Sonia', 'Pim Plas', '1969-09-01', 'España', 'Villarobledo', 'Albacete', 'Castilla la Mancha'),
(11, 'Bárbara', 'Gómez Lupín', '1989-10-02', 'Perú', 'Lima', 'Lima', 'Lima'),
(12, 'Juán José', 'Blas Cheriszev', '1979-03-03', 'España', 'Córdoba', 'Córdoba', 'Andalucía'),
(13, 'Carlos', 'Domínguez Carvajal', '1991-12-03', 'España', 'Arrecife', 'Lanzarote', 'Comunidad Canaria'),
(14, 'Julio', 'Iglesias Garzón', '1974-08-30', 'España', 'Mallorca', 'Mallorca', 'Comunidad Balear'),
(15, 'Eduardo', 'Primavera Alegre', '1982-04-02', 'España', 'Madrid', 'Madrid', 'Madrid'),
(16, 'Luisa', 'Ordoñez Gil', '1981-02-02', 'España', 'Getafe', 'Madrid', 'Madrid');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `candidaturas`
--

DROP TABLE IF EXISTS `candidaturas`;
CREATE TABLE `candidaturas` (
  `cod_candidato` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `cabeza_lista` tinyint(1) NOT NULL,
  `posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `candidaturas`
--

INSERT INTO `candidaturas` (`cod_candidato`, `cod_campanna`, `cabeza_lista`, `posicion`) VALUES
(1, 2, 1, 1),
(2, 11, 1, 1),
(3, 2, 0, 2),
(4, 1, 1, 1),
(5, 7, 1, 1),
(6, 7, 0, 2),
(7, 6, 1, 1),
(10, 21, 1, 1),
(11, 19, 1, 1),
(12, 13, 1, 1),
(13, 1, 0, 3),
(14, 1, 0, 2),
(15, 15, 1, 1),
(16, 17, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eventos`
--

DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `cod_evento` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `ubicacion` varchar(50) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `municipio` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `eventos`
--

INSERT INTO `eventos` (`cod_evento`, `cod_campanna`, `descripcion`, `ubicacion`, `fecha`, `hora`, `nombre`, `municipio`) VALUES
(1, 1, 'Acto realizado en Plaza España, Madrid. Nuestro candidato para las europeas, Al Gore, analizará los puntos de nuestro programa para esta campaña.', 'Plaza de España, 28008 Madrid', '2019-05-24', '12:00:00', 'Acto Plaza España ADM Europeas', 'Madrid'),
(2, 1, 'Acto realizado en Las Ramblas, Barcelona. Nuestro candidato para las europeas, Al Gore, analizará los puntos de nuestro programa para esta campaña.', 'Las Ramblas, 08007 Barcelona', '2019-05-27', '10:00:00', 'Acto Las Ramblas ADM Europeas', 'Barcelona'),
(3, 2, 'Acto realizado en La plaza de la constitución, Málaga. Nuestro candidato para las elecciones para la presidencia de España, Frank Cuesta, analizará los puntos de nuestro programa para esta campaña.', 'Plaza de la Constitución, 1, 29005 Málaga', '2019-10-10', '10:30:00', 'Acto Plaza de la Constitución ADM Nacionales', 'Málaga'),
(4, 2, 'Acto realizado en La plaza de toros de las ventas, Madrid. Nuestro candidato para las elecciones para la presidencia de España, Frank Cuesta, analizará los puntos de nuestro programa para esta campaña. En especial de los puntos sobre el maltrato animal y la tauromaquia.', 'Calle de Alcalá, 237, 28028 Madrid', '2019-05-25', '11:00:00', 'Acto Las Ventas ADM Nacionales', 'Madrid'),
(5, 14, 'Acto realizado en La plaza amarilla, Fuengirola (Málaga). Nuestro candidata para las elecciones para la presidencia municipal de Fuengirola, Marta Martínez Queimadelos, analizará los puntos de nuestro programa para esta campaña.', 'Plaza de la Constitución, 9, 29640 Fuengirola, Mál', '2019-12-07', '09:30:00', 'Acto ADM Municipales (Fuengirola)', 'Fuengirola'),
(6, 11, 'Acto realizado en el paseo de la muralla, Girona. Nuestro candidato para las elecciones para la presidencia de Catalunya, Daniel Carbonell De Las Heras "Macaco", analizará los puntos de nuestro programa para esta campaña.', 'Carrer dels Alemanys, 20, 17004 Girona', '2019-07-10', '09:00:00', 'Acto ADM Autonómicas (Catalunya)', 'Girona'),
(7, 1, 'Acto realizado en parroquia de santa maría, Pineda de Mar. Nuestro candidato para las europeas, Al Gore, analizará los puntos de nuestro programa para esta campaña.', ' Carrer Muntaner, 6 Pineda de Mar, Barcelona', '2019-05-28', '19:00:00', 'Acto Pineda de mar ADM Europea', 'Pineda de mar'),
(8, 1, 'Acto realizado en Plaza Mayor, Alcorcón (Madrid). Nuestro candidato para las europeas, Al Gore, analizará los puntos de nuestro programa para esta campaña.', '28922 Alcorcón, Madrid', '2019-05-26', '19:00:00', 'Acto Plaza Mayor (Alcorcón) ADM Europeas', 'Alcorcón'),
(9, 17, 'Acto en la plaza de la constitución sobre el programa electoral para las elecciones municipales de Getafe (Madrid). Luisa Ordoñez leerá los puntos de nuestro programa y contestará preguntas.', '28901 Getafe, Madrid', '2019-09-19', '10:00:00', 'Acto Municipales Getafe ADM', 'Getafe'),
(10, 21, 'Acto en el parque Abelardo Sánchez (Albacete) sobre el programa electoral para las elecciones Autonómicas de Castilla la Mancha. Nuestra candidata Sonia Pim nos hablará de como mejorar Castilla La Mancha.', 'Av. de España, s/n, 02002 Albacete', '2019-06-13', '17:00:00', 'Acto Autonómicas Castilla La Mancha', 'Castilla La Mancha'),
(11, 15, 'Acto en el parque de los patos (Murcia) sobre el programa electoral para las elecciones Municipales de Murcia. En este Acto nuestro candidato Eduardo Primavera señalará el camino. Se debatirán puntos como el soterrameinto de Murcia.', 'Avenida Los limones, 15', '2019-09-13', '18:00:00', 'Acto municipales Murcia', 'Murcia'),
(12, 13, 'Acto en el Parque de las canteras (Puerto Real) sobre el programa electoral para las elecciones Municipales de Puerto Real. Nuestro candidato Juan José nos hablará de lo que le parece imprescindible debe hacerse ya en Puerto Real', 'Av de la constitución s/n (puerto real)', '2019-07-10', '09:00:00', 'Acto Municipales Puerto Real', 'Puerto Real'),
(13, 19, 'Acto en la playa de las canteras (Gran canaria) sobre el programa electoral para las elecciones Autonómicas de la comunidad Canaria. Bárbara analizará los puntos de nuestro programa para gobernar fuera de la peninsula.', 'Paseo de Gracia, 9', '2019-06-27', '19:30:00', 'Acto Autonómicas Canarias', 'Comunidad Canaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticias`
--

DROP TABLE IF EXISTS `noticias`;
CREATE TABLE `noticias` (
  `cod_noticia` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `cuerpo` text NOT NULL,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `noticias`
--

INSERT INTO `noticias` (`cod_noticia`, `titulo`, `cuerpo`, `cod_campanna`) VALUES
(1, 'Frank Cuesta lleno Las Ventas sin necesidad de torturar un animal', 'El candidato de ADM para la presidencia Española realizó un Acto en la famosas plaza de toros de Las Ventas el pasado lunes, ADM se empieza a hacer un hueco en las encuestas electorales como favorito para la presidencia."En el partido tenemos claro que la tauromaquia tiene que desaparecer, pero haremos las cosas bien y eso toma tiempo, no queremos hacer promesas vacías, ni destrozar la economía interna de un día para otro, poco a poco esta tradición dejará de representar a nuestro país" subrayaba Frank. ', 2),
(2, 'Frank Cuesta arrasa en el debate a cuatro sobre las elecciones Nacionales', 'Nuestro candidato a la presidencia fue el claro ganador del debate realizado la pasada noche emitido por la Sexta.Los candidatos del resto de partidos no estuvieron a la altura y realizaron ataques personales contra Frank Cuesta, este no se puso a su altura y se mantuvo respetuoso durante todo el Debate.Señaló puntos muy interesantes del programa para las elecciones Nacionales de ADM, cómo la importancia que tiene la protección del medio ambiente o la eliminación progresiva de la tauromaquia para no dañar la economía interior del Pais.El candidato de ATPC, Pocholo Martínez, se marchó en mitad del debate gritando algo a cerca de una mochila.\r\n\r\nFrank Cuesta estará presente en el debate cara a cara con Pocholo Martínez el próximo Martes, donde seguirá dejando clara las intenciones del partido.', 2),
(3, 'Al Gore "La solución para curar la Tierra comienza  en nosotros"', 'Al Gore habló para una entrevista en The Times, allí aclaró los puntos del programa de ADM para las elecciones Europeas."Debemos luchar unidos y entender que si no hacemos algo el mundo se va a morir, hay que tomar partido y hay que hacerlo ya" señalaba Al Gore.Trás el exitoso acto dado en Madrid, son muchos los que tienen claro que es necesario luchar por el medioambiente y apoyan a ADM en su presidencia para representar a España en la UE.', 1),
(4, 'Al Gore sería el primer representante de España nacido en los Estados Unidos', 'Al Gore siempre ha sido un defensor del medio ambiente y hace un año al ver que no estaba consiguiendo nada en Estados Unidos decidió venirse a España donde ADM le ofrecían un puesto de importancia en el Partido, desde aqui no ha parado de seguir su lucha a favor del planeta Tierra y ahora quiere llevarla a Europa."Esto no podemos solucionarlo desde España o Europa, necesitamos el mundo entero remando a favor de la Tierra, pero poco a poco conseguiremos concienciarnos" Decía Al gore en una entrevista para El País.', 1),
(5, 'Leonardo Dicaprio se suma como colaborador a ADM para su campaña europea', 'Leonardo Dicaprio es conocido por ser un defensor del planeta Tierra, este se ha sumado como colaborador con el partido ADM apoyando a su compatriota Al Gore en las elecciones Europeas.\r\n\r\nLeo aún no se perdona por haber destruido aquel iceberg y hará lo que sea por luchar contra el calentamiento global, se dice que en sus ratos libres llena su jet privado de cubitos de hielo y los tira al oceano.', 1),
(6, 'ADM favoritos en todas las encuestas oficiales como representante en Europa', 'Todas las encuestas están a su favor, las elecciones están cada vez más cerca y ADM ya se ve elegido.Al Gore no quiere dar nada por ganado hasta que suceda y se mantiene humilde y a la espera de que lleguen las elecciones pero todo apunta a que podrá seguir su lucha en Europa.', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

DROP TABLE IF EXISTS `programa`;
CREATE TABLE `programa` (
  `cod_punto` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`cod_punto`, `descripcion`, `cod_campanna`) VALUES
(1, 'Queremos abrir un proceso constituyente europeo desde abajo, para avanzar hacia una Europa Federal más democrática y transparente, con garantías para las libertades políticas, con más poder para el Parlamento Europeo y para la ciudadanía.\r\n', 1),
(2, 'Reclamamos una nueva Carta de los Derechos Fundamentales, que amplíe su alcance y garantice su cumplimiento efectivo y exigible. La Unión Europea debe ser un espacio en el que estén garantizados los derechos sociales, los derechos de las mujeres en la lucha por la igualdad, de colectivos como LGTBI+, y de las personas con diversidad funcional y dependientes. ', 1),
(3, 'Promovemos el respeto y el apoyo de la UE a la diversidad cultural y lingüística de los pueblos europeos, incluyendo las minorías y naciones sin Estado de cada Estado miembro.', 1),
(4, 'Apostamos por la transición ecológica de la economía, hacia otro modelo económico y productivo, basado en la economía verde, social, de valor añadido y sostenible y en la prosperidad compartida.', 1),
(5, 'Promovemos un nuevo modelo energético europeo, limpio, gradualmente libre de energías fósiles, sin energía nuclear, sin fracking y basado en las energías renovables y la eficiencia. Un modelo de autosuficiencia energética y producción lo más cercana posible, frente al de los oligopolios energéticos, y en el que el suministro de energía sea considerado un derecho.', 1),
(6, 'Lucharemos contra la corrupción y el fraude a todos los niveles, mediante más y mejores mecanismos de transparencia, participación ciudadana y democracia directa. Exigimos justicia fiscal y social. Tolerancia cero a los paraísos fiscales y poniendo en marcha la tasa a las transacciones financieras internacionales.', 1),
(7, 'Exigimos para las políticas de austeridad de la Troika y apostamos por una solución a la deuda desde la solidaridad, en la que deudores y acreedores sean partícipes de un análisis, reestructuración, auditoría y renegociación de la deuda, detectando qué parte de ella se considera ilegítima.', 1),
(8, 'Consideramos urgente priorizar la lucha contra la pobreza y la exclusión social y reclamamos la apertura de un debate europeo sobre la renta básica de ciudadanía y la renta máxima, acompañado de una armonización fiscal bajo el principio de que paguen más quienes más tienen y quienes más contaminan.', 1),
(9, 'Trabajamos por una Europa de los jóvenes, atendiendo al drama del desempleo juvenil, con una dotación de fondos suficientes a la Garantía Juvenil Europea y políticas de vivienda para su emancipación, o medidas para el empoderamiento político juvenil, como el derecho a voto en elecciones al Parlamento Europeo para mayores de 16 años.', 1),
(10, 'Queremos que la UE vuelva a ejercer el liderazgo global en la defensa de la solidaridad, la libertad y los derechos humanos. Que fomente sólidas políticas que dignifiquen la migración interna y externa.', 1),
(11, 'Crear una Ley estatal contra el cambio climático para limitar la subida de la temperatura global por debajo de 1.5 grados.', 2),
(12, 'Medidas contra la obsolescencia programada.', 2),
(13, 'Ley estatal de residuos basada en la reducción y la economía circular: penalización del sobreembalaje.', 2),
(14, 'Ley de movilidad sostenible y transporte.', 2),
(15, 'Impulsar un plan de emergencia para detener la pérdida de biodiversidad.', 2),
(16, 'Ayudas económicas y servicios para niños menores de tres años, personas mayores, personas dependientes y animales.', 2),
(17, 'Impulsar una ley integral LGTBIQ+ y aprobar una ley Trans estatal.', 2),
(18, 'Programas educativos de prevención de violencia sobre las mujeres en todas las etapas educativas, desde la educación primaria hasta la universidad.\r\n', 2),
(19, 'Derogación de la ‘Ley Mordaza’.', 2),
(20, 'Plan contra la corrupción y endurecimiento de las penas por motivos de corrupción.', 2),
(21, 'Analizar y acometer el Ciclo integral del agua en la CV y la legislación vigente, para revisar la gestión de forma global, en coordinación y colaboración con los municipios, las confederaciones, las sociedades de regantes y el sistema productivo.', 18),
(22, 'Depuración de aguas. Analizar el sistema de depuración, su optimización, el tratamiento y destino de los lodos de depuradoras y su nivel de contaminación.', 18),
(23, 'Devolver la gestión del ciclo del agua al sector público en colaboración con los Ayuntamientos proveyéndoles del asesoramiento y la ayuda necesarios.', 18),
(24, 'Llevar a cabo un Plan de ayuda a los municipios para que puedan realizar aquellas obras que interfieran en el ciclo urbano integral del agua.', 18),
(25, 'Plan energético de autoconsumo para sociedades de regantes, de manera que puedan autoabastecerse mediante energía solar o eólica sin depender de las suministradoras.', 18),
(26, 'Apuesta decidida por un nuevo modelo energético para Canarias basado en las energías limpias, el ahorro y la eficiencia energética, que potencie el autoconsumo.', 19),
(27, 'Garantizar el abastecimiento y la calidad del agua potable como un derecho de la ciudadanía a través de la gestión pública, minimizando el impacto de la demanda sobre los acuíferos insulares mediante la desalación con energías limpias.', 19),
(28, 'Promover la conservación y la restauración ecológica del medio natural canario, incluyendo la revisión del catálogo de especies amenazadas de Canarias y la creación de nuevos espacios protegidos, tanto terrestres como marinos.', 19),
(29, 'Defender los derechos de los animales a través de la ley autonómica de protección animal.', 19),
(30, 'Creación de una “tarjeta verde” que se otorgue a los establecimientos que cumplan los requisitos que abarquen el impacto medioambiental, social y cultural, utilizando las leyes fundamentales de la sostenibilidad turística.', 19),
(31, 'Mejorar la red de medidores de la contaminación y cerrar un pacto ciudadano por la gestión del aire.', 10),
(32, 'Crear un observatorio del agua y realizar una auditoría ciudadana de su gestión por parte del Canal de Isabel II.', 10),
(33, 'Poner todos los medios y recursos de la comunidad para la paralización de desahucios y desalojos de primera vivienda y para garantizar una alternativa habitacional.', 10),
(34, 'Garantizar los suministros básicos (luz y agua) a todos los hogares que no puedan pagarlos.', 10),
(35, 'Desarrollar un plan urgente para la inserción laboral de jóvenes y parados de larga duración.', 10),
(36, 'Diversificar la economía, superar la dependencia del turismo y transformar el modelo destructivo e insostenible de la balearización.', 20),
(37, 'Comer bien para vivir bien. Apostar por la producción local para impulsar la economía, revitalizar el campo y apoyar el cultivo ecológico.', 20),
(38, 'Otro modelo de movilidad. Impulsaremos nuestros medios de transportes poco contaminantes y adoptaremos medidas para favorecer el uso del transporte público y el uso de bicicletas.', 20),
(39, 'La Tierra, el único planeta que tenemos. Defenderemos el medio ambiente como la casa de todos y por eso recogeremos el concepto de democracia ecológica.', 20),
(40, 'Energías y cambio climático. Para poder combatir el cambio climático necesitamos urgentemente una revolución en la forma de producir, consumir y distribuir la energía. Hay que sustituir los combustibles fósiles por energías renovables.', 20),
(41, 'Para AMD de Castilla-La Mancha, el agua es un recurso natural y un bien universal, por lo que el acceso a ella ha de ser garantizado como un derecho humano. Nos  oponemos a la privatización de cualquiera de las fases del ciclo integral del agua y defendemos una política de tasas y cánones claramente progresiva.', 21),
(42, 'Estableceremos una dotación de agua asegurada (entre 60 y 100 litros por persona y día), incluso en caso de impago. ', 21),
(43, 'Proponemos que se inicien políticas para paralizar la deforestación ligada al urbanismo además de erradicar la explotación forestal de carácter insostenible. Los bosques son esenciales por sus beneficios ambientales, socioculturales y económicos. Contienen el 90% de la biodiversidad, y en el contexto de cambio climático en que nos encontramos son esenciales para la regulación del clima.', 21),
(44, 'Impulsaremos la agricultura y  ganadería ecológicas mediante la defensa de la explotación familiar y por medio del compendio de técnicas agrarias y ganaderas cuyo objetivo esencial es la obtención de alimentos con todas las propiedades naturales.', 21),
(45, 'Iniciar un cambio de modelo urbanístico que tienda a ocupar espacios ya urbanizados y no crear nuevos como medio para ampliar el territorio urbano.', 21),
(46, 'Profundizar en el programa de mejora de la eficiencia energética de los edificios y espacios públicos de Puerto Real para conseguir un balance 0 de emisiones de gases de efecto invernadero mediante el ahorro energético y el uso de energías renovables.', 13),
(47, 'Desarrollar programas de captación turística nacional e internacional en torno al valor paisajístico, ornitológico y gastronómico del Parque Natural de la Bahía de Cádiz.', 13),
(48, 'Desarrollar un sistema de retorno de envases para valorizar este tipo de residuos, reducir el volumen generado, combatir el incivismo y reducir la suciedad en el término municipal', 13),
(49, 'Desarrollar un programa de creación de nuevas zonas verdes y poner en marcha un plan de eficiencia hídrica que mejore el sistema de riego y promueva el sembrado de especies vegetales adaptadas al clima y las condiciones hídricas de Puerto Real.', 13),
(50, 'Reivindicar y exigir la puesta en marcha el Proyecto Las Aletas Real y Sostenible como ejemplo de gestión medioambiental, creación de empleo y desarrollo sostenible en el entorno de la Bahía de Cádiz.', 13),
(51, 'Solución definitiva a la pérdida de las playas del municipio que no obligue a tener que parchear la situación cada temporada con aportes de arena. Para ello, instalación de espigones ecológicos horizontales que protejan nuestras playas de los temporales de invierno.', 14),
(52, 'Garantizar la continuidad del desplazamiento peatonal y en bici en toda la franja litoral. Creación de un servicio municipal de alquiler de bicicletas que permitiría utilizar a un precio económico bicicletas que pudieran cogerse y dejarse en distintos puntos de la ciudad. Dicho servicio podría empezar a funcionar de forma experimental durante los meses de verano y tendría un gran potencial de uso turístico.', 14),
(53, 'Favorecer el turismo rural, el turismo en viviendas particulares, el deportivo y cultural, la agricultura y ganadería ecológicas.', 14),
(54, 'Estudio y mejora de espacios verdes, y posibilidad de uso de suelo municipal como huertos urbanos, con implicación de los escolares, como aprendizaje.', 14),
(55, 'Impulso de la renovación de los sistemas de alumbrado público y privado en todo el municipio pasándolo a LED e iluminación de bajo consumo.', 14),
(56, 'Nuevo modelo protector de las personas y el planeta, para garantizar la justicia social y ambiental.', 15),
(57, 'Transición a energías limpias, para adaptarnos al cambio climático y acabar con la pobreza energética y el oligopolio eléctrico.', 15),
(58, 'Nuevo modelo productivo y de consumo sostenible, para poner la economía al servicio de las personas.', 15),
(59, 'Más democracia y participación, para limpiar las instituciones y abrirlas a la ciudadanía.', 15),
(60, 'Plan de empleo verde, para garantizar el derecho de las personas a tener su propio proyecto vital.', 15),
(61, 'Desarrollo de normas para la reducción de envases y favorecer la compra a granel en los comercios de proximidad.', 16),
(62, 'Potenciar las diversas modalidades de uso de los carriles bici, además de la ampliación de la red.', 16),
(63, 'Impulso del conocimiento y protección de la riqueza de flora y fauna de la ciudad', 16),
(64, 'Modificación de ordenanzas municipales para implementar medidas de sostenibilidad, como las cubiertas verdes.', 16),
(65, 'Desarrollo de un Plan Anticontaminación participado con la ciudadanía, apoyándose en actuaciones de concienciación sobre políticas para combatir el cambio climático, aprovechando el impulso de movimientos como el de la Ola Verde a nivel europeo.', 16),
(66, 'Recuperar el río Manzanares a su paso por Perales creando un gran pulmón verde en este enclave.', 17),
(67, 'Recuperar la plaza de toros de Getafe Norte para acoger eventos culturales y deportivos.', 17),
(68, 'Preparar un Plan de Actuación General sobre Parques y Jardines en Getafe, prestando atención especial al Cerro de los Ángeles, parque de la Alhóndiga, Prado Acedinos, parque de Castilla la Mancha y parque de Andalucía.', 17),
(69, 'Desarrollar un Plan de Soberanía Alimentaria en nuestro municipio, colaborando de esta forma en el largo camino hacia un mundo sostenible, en el que el consumo de alimentos de proximidad sea prioritario y en el que el ocio familiar e intergeneracional sea piedra angular para las nuevas generaciones, unas generaciones que puedan disfrutar de un Getafe más ecológico y humano.', 17),
(70, 'Prestar especial atención a las industrias contaminantes del municipio y proponer medidas para disminuir su carga contaminadora.', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntariados`
--

DROP TABLE IF EXISTS `voluntariados`;
CREATE TABLE `voluntariados` (
  `cod_voluntario` int(11) NOT NULL,
  `cod_campanna` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `voluntariados`
--

INSERT INTO `voluntariados` (`cod_voluntario`, `cod_campanna`) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 7),
(5, 1),
(6, 2),
(7, 11),
(8, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `voluntarios`
--

DROP TABLE IF EXISTS `voluntarios`;
CREATE TABLE `voluntarios` (
  `cod_voluntario` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `fecha_nac` date NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `autoriza_com` tinyint(1) NOT NULL,
  `autoriza_gdpd` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `voluntarios`
--

INSERT INTO `voluntarios` (`cod_voluntario`, `nombre`, `apellidos`, `fecha_nac`, `email`, `telefono`, `autoriza_com`, `autoriza_gdpd`) VALUES
(1, 'Leonardo', 'Wilhelm DiCaprio', '1974-11-11', 'leotheceo@gmail.com', '658123214', 1, 1),
(2, 'Antoine', 'Griezmann', '2019-03-21', 'AntoineBallondor@gmail.com', '658854110', 1, 1),
(3, 'Sebastián', 'Fernández Reyes', '1974-06-21', 'basti_elpalo@hotmail.com', '666555841', 1, 1),
(4, 'Jesus', 'Sánchez Burgos', '1975-04-03', 'jesusito@gmail.com', '658487777', 1, 1),
(5, 'Edward Michael', 'Grylls', '1980-12-11', 'beargrylls@gmail.com', '623220154', 1, 1),
(6, 'David', 'Broncano Aguilera', '1983-12-30', 'pachacho83@hotmail.com', '658999519', 1, 1),
(7, 'Ingrid', 'García Jonsson', '1990-09-06', 'melocoton90@gmail.com', '652551532', 1, 1),
(8, 'Adriana Sofía', 'Ugarte Pardal', '1985-01-17', 'Paraunpoco@gmail.com', '658878118', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD PRIMARY KEY (`cod_voluntario`,`cod_evento`),
  ADD KEY `Asistentes_FK_1` (`cod_evento`);

--
-- Indices de la tabla `campanna`
--
ALTER TABLE `campanna`
  ADD PRIMARY KEY (`cod_campanna`);

--
-- Indices de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  ADD PRIMARY KEY (`cod_candidato`);

--
-- Indices de la tabla `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD PRIMARY KEY (`cod_candidato`,`cod_campanna`),
  ADD KEY `candidaturas_FK_1` (`cod_campanna`);

--
-- Indices de la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD PRIMARY KEY (`cod_evento`),
  ADD KEY `Eventos_FK_1` (`cod_campanna`);

--
-- Indices de la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`cod_noticia`),
  ADD KEY `Noticias_FK_1` (`cod_campanna`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`cod_punto`),
  ADD KEY `programa_FK_1` (`cod_campanna`);

--
-- Indices de la tabla `voluntariados`
--
ALTER TABLE `voluntariados`
  ADD PRIMARY KEY (`cod_voluntario`,`cod_campanna`),
  ADD KEY `Voluntariados_FK_1` (`cod_campanna`);

--
-- Indices de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  ADD PRIMARY KEY (`cod_voluntario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `campanna`
--
ALTER TABLE `campanna`
  MODIFY `cod_campanna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `candidatos`
--
ALTER TABLE `candidatos`
  MODIFY `cod_candidato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `eventos`
--
ALTER TABLE `eventos`
  MODIFY `cod_evento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `noticias`
--
ALTER TABLE `noticias`
  MODIFY `cod_noticia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `cod_punto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT de la tabla `voluntarios`
--
ALTER TABLE `voluntarios`
  MODIFY `cod_voluntario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asistentes`
--
ALTER TABLE `asistentes`
  ADD CONSTRAINT `Asistentes_FK_1` FOREIGN KEY (`cod_evento`) REFERENCES `eventos` (`cod_evento`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Asistentes_FK_2` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `candidaturas`
--
ALTER TABLE `candidaturas`
  ADD CONSTRAINT `candidaturas_FK_1` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidaturas_FK_2` FOREIGN KEY (`cod_candidato`) REFERENCES `candidatos` (`cod_candidato`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `eventos`
--
ALTER TABLE `eventos`
  ADD CONSTRAINT `Eventos_FK_1` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `Noticias_FK_1` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `programa`
--
ALTER TABLE `programa`
  ADD CONSTRAINT `programa_FK_1` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `voluntariados`
--
ALTER TABLE `voluntariados`
  ADD CONSTRAINT `Voluntariados_FK_1` FOREIGN KEY (`cod_campanna`) REFERENCES `campanna` (`cod_campanna`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Voluntariados_FK_2` FOREIGN KEY (`cod_voluntario`) REFERENCES `voluntarios` (`cod_voluntario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
