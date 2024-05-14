CREATE DATABASE  IF NOT EXISTS `biblioteca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `biblioteca`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3i2witj7owyq34rxecbx753sa` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Marías','javier.marias@example.com','Javier'),(2,'Rosa Quintana','ana.rosa.quintana@example.com','Ana'),(3,'Pérez-Reverte','arturo.perezreverte@example.com','Arturo'),(4,'Chaparro','carme.chaparro@example.com','Carme'),(5,'Cercas','javier.cercas@example.com','Javier'),(6,'Évole','jordi.evole@example.com','Jordi'),(7,'Rahola','pilar.rahola@example.com','Pilar'),(8,'Herrero','nieves.herrero@example.com','Nieves'),(9,'Cintora','jesus.cintora@example.com','Jesús'),(10,'Pastor','ana.pastor@example.com','Ana');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cmxo70m08n43599l3h0h07cc6` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `noticia`
--

DROP TABLE IF EXISTS `noticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `noticia` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_noticia` date DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `noticia_texto` text,
  `autor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8bfkpq3ywylllsl3ydcctpe68` (`autor_id`),
  CONSTRAINT `FK8bfkpq3ywylllsl3ydcctpe68` FOREIGN KEY (`autor_id`) REFERENCES `autores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `noticia`
--

LOCK TABLES `noticia` WRITE;
/*!40000 ALTER TABLE `noticia` DISABLE KEYS */;
INSERT INTO `noticia` VALUES (11,'Un equipo de científicos ha descubierto una nueva especie de medusa en las profundidades del océano Pacífico','2024-05-14','https://picsum.photos/600/400/?random=1','Descubrimiento de nueva especie marina en el océano Pacífico','Un grupo de científicos liderado por la Dra. María García realizó un emocionante descubrimiento en las profundidades del océano Pacífico. Durante una expedición de investigación submarina, el equipo encontró una especie de medusa nunca antes vista. Esta nueva especie, bautizada como \"Medusa pacífica\", presenta características únicas que la distinguen de otras especies conocidas. Los científicos están entusiasmados con este hallazgo, ya que podría proporcionar nuevas perspectivas sobre la biodiversidad marina y ayudar en la conservación de los ecosistemas oceánicos.',1),(12,'Un equipo médico ha logrado avances significativos en el tratamiento del cáncer de pulmón','2024-05-15','https://picsum.photos/600/400/?random=2','Avances en la investigación del cáncer de pulmón','Un equipo de investigadores del Centro Médico Nacional ha anunciado un importante avance en la lucha contra el cáncer de pulmón. Después de años de investigación exhaustiva, el equipo ha desarrollado un nuevo enfoque terapéutico que ha demostrado ser altamente efectivo en la detención del crecimiento tumoral en pacientes con cáncer de pulmón avanzado. Este avance prometedor ofrece esperanza a millones de personas afectadas por esta enfermedad devastadora y podría cambiar radicalmente el panorama del tratamiento del cáncer de pulmón en el futuro.',2),(13,'Una nueva vacuna experimental contra la malaria ha demostrado ser efectiva en ensayos clínicos','2024-05-16','https://picsum.photos/600/400/?random=3','Nueva vacuna contra la malaria muestra resultados prometedores','Los resultados preliminares de un ensayo clínico han revelado que una nueva vacuna experimental contra la malaria ha alcanzado una eficacia del 90% en la prevención de la infección por el parásito de la malaria en regiones endémicas. Este avance representa un hito significativo en la lucha contra una de las enfermedades más mortales del mundo. Los investigadores están optimistas sobre el potencial de esta vacuna para salvar vidas y reducir la carga de la malaria en las poblaciones más vulnerables.',3),(14,'Arqueólogos han descubierto los restos de una antigua ciudad egipcia que se creía perdida','2024-05-17','https://picsum.photos/600/400/?random=4','Hallazgo arqueológico en Egipto revela una antigua ciudad perdida','Un equipo de arqueólogos dirigido por el Dr. Ahmed Mahmoud ha hecho un descubrimiento sorprendente en el desierto egipcio. Durante una excavación en una remota región del valle del Nilo, el equipo encontró los restos de una antigua ciudad egipcia que se creía perdida hace siglos. Los hallazgos incluyen templos, casas y tumbas bien conservadas, lo que sugiere que esta ciudad fue una vez un importante centro de civilización en el antiguo Egipto. Este descubrimiento arroja nueva luz sobre la historia y la cultura del antiguo Egipto y promete revelar nuevos secretos sobre esta fascinante civilización.',4),(15,'Avances en inteligencia artificial están cambiando la forma en que se fabrican y conducen los automóviles','2024-05-18','https://picsum.photos/600/400/?random=5','Desarrollo de inteligencia artificial revoluciona la industria automotriz','Los avances recientes en inteligencia artificial están transformando radicalmente la industria automotriz. Empresas líderes en tecnología están desarrollando sistemas de conducción autónoma que prometen mejorar la seguridad vial, reducir la congestión del tráfico y revolucionar la forma en que nos desplazamos. Estos avances también están cambiando la forma en que se fabrican los vehículos, con la automatización de procesos de producción que aumentan la eficiencia y reducen los costos. La inteligencia artificial se está convirtiendo en una fuerza disruptiva en la industria automotriz, y su impacto se sentirá en los próximos años.',5),(16,'Astrónomos han descubierto un exoplaneta con características similares a las de la Tierra','2024-05-19','https://picsum.photos/600/400/?random=6','Descubrimiento de exoplaneta similar a la Tierra','Un equipo de astrónomos del Observatorio Espacial ha anunciado el descubrimiento de un exoplaneta que podría albergar vida. El planeta, bautizado como Kepler-452b, tiene un tamaño y una órbita similares a los de la Tierra, lo que lo convierte en un candidato prometedor para la habitabilidad. Los científicos están entusiasmados con la posibilidad de estudiar la atmósfera de este exoplaneta en busca de signos de vida, lo que podría tener importantes implicaciones para nuestra comprensión del universo y nuestro lugar en él.',6),(17,'Una tecnología innovadora está ayudando a reducir la contaminación plástica en los océanos','2024-05-20','https://picsum.photos/600/400/?random=7','Nueva tecnología reduce la contaminación en los océanos','Un grupo de ingenieros ha desarrollado una tecnología revolucionaria para combatir la contaminación plástica en los océanos. Esta innovación utiliza drones equipados con cámaras y sensores avanzados para detectar y recoger desechos plásticos flotantes en alta mar. Los resultados preliminares son prometedores, con una reducción significativa en la cantidad de plástico que contamina los océanos. Los expertos esperan que esta tecnología pueda desempeñar un papel crucial en la protección de los ecosistemas marinos y la conservación de la vida marina.',7),(18,'Investigadores han desarrollado nuevas estrategias para combatir el cambio climático y reducir las emisiones de carbono','2024-05-21','https://picsum.photos/600/400/?random=8','Avances en la lucha contra el cambio climático','Un equipo internacional de científicos ha anunciado avances significativos en la lucha contra el cambio climático. Mediante el desarrollo de nuevas tecnologías de energía renovable y la implementación de políticas ambientales ambiciosas, los investigadores han logrado reducir las emisiones de carbono a niveles históricamente bajos. Estos avances son un paso importante hacia la mitigación de los impactos del cambio climático y la protección del medio ambiente para las generaciones futuras.',8),(19,'La NASA ha lanzado una nueva misión para explorar Marte en busca de signos de vida pasada','2024-05-22','https://picsum.photos/600/400/?random=9','Inicio de la misión espacial para explorar Marte','La NASA ha dado inicio a una emocionante nueva misión para explorar el planeta Marte en busca de signos de vida pasada. La misión, denominada \"Mars Explorer\", enviará una sonda espacial equipada con instrumentos científicos de última generación para estudiar la superficie marciana y buscar evidencia de condiciones que pudieran haber sido propicias para la vida en el pasado. Los científicos esperan que este ambicioso proyecto arroje luz sobre los misterios de Marte y nos acerque un paso más a responder la pregunta fundamental: ¿estamos solos en el universo?',9),(20,'Paleontólogos han descubierto los restos de una nueva especie de dinosaurio en la Patagonia argentina','2024-05-23','https://picsum.photos/600/400/?random=10','Descubrimiento de nueva especie de dinosaurio en Argentina','Un equipo de paleontólogos liderado por el Dr. Javier López ha hecho un emocionante descubrimiento en la remota región de la Patagonia argentina. Durante una expedición de campo, el equipo encontró los restos fosilizados de una nueva especie de dinosaurio que habría habitado la región hace millones de años. El dinosaurio, bautizado como \"Argentinosaurus patagonicus\", es uno de los especímenes más grandes jamás descubiertos y arroja nueva luz sobre la diversidad y evolución de los dinosaurios en Sudamérica.',10);
/*!40000 ALTER TABLE `noticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `fecha_devolucion` date NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `libro_id` bigint NOT NULL,
  `usuario_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKr286bkdfeej4vd3o9cdr7w2sq` (`libro_id`),
  KEY `FKeqd1t799y0x5ck9mdeltepy1w` (`usuario_id`),
  CONSTRAINT `FKeqd1t799y0x5ck9mdeltepy1w` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `FKr286bkdfeej4vd3o9cdr7w2sq` FOREIGN KEY (`libro_id`) REFERENCES `noticia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Lete','javier@email.net','Javier','$2a$12$mof.u/4EIo58hR7On9DnPevyqBC7kb9FHzT.LN/BjF8xOqQVTP1NO','ADMIN'),(2,'Arretxea','koldo@email.net','Koldo','$2a$12$NhIMIVI5wNYc97crXmW9rupNsEbeea1BxPu.H0gSDkiDQrhhmXeZO','ADMIN'),(3,'Peponez','pepe@email.net','Pepe','$2a$12$Dij9cgV3mXDQYtOo4nvQTOLaUz3URoe7DGjhBrqGa1fEEzkNVhBgq','USER');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'biblioteca'
--

--
-- Dumping routines for database 'biblioteca'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 12:08:31
