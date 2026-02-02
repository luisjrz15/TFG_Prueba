-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tfg
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id_carrito` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1,
  PRIMARY KEY (`id_carrito`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_categoria` varchar(100) NOT NULL,
  `id_subcategoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`),
  KEY `id_subcategoria` (`id_subcategoria`),
  CONSTRAINT `categorias_ibfk_1` FOREIGN KEY (`id_subcategoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Ordenadores',NULL),(2,'Consolas',NULL),(3,'Reparaciones',NULL),(4,'Ordenadores',1),(5,'Periféricos',1),(6,'Controladores',1),(7,'Componentes',1),(8,'PlayStation',2),(9,'Xbox',2),(10,'Nintendo',2),(11,'Consolas Portatiles',2),(12,'Reparaciones',3),(13,'Modificaciones',3),(14,'Ratones',6),(15,'Teclados',6),(16,'Placas base',7),(17,'Fuentes de alimentación',7),(18,'Memorias RAM',7),(19,'Tarjetas gráficas',7),(20,'Procesadores',7),(21,'Almacenamiento',7),(22,'Disipadores',7),(23,'Cajas',7);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id_faq` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` text NOT NULL,
  PRIMARY KEY (`id_faq`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'¿Cuánto tardan las reparaciones?','Suelen tardar entre 3 y 5 días hábiles dependiendo de la pieza.');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formulario`
--

DROP TABLE IF EXISTS `formulario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formulario` (
  `id_formulario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `servicio` enum('Reparacion','Modificacion') NOT NULL,
  `descripcion` text NOT NULL,
  `presupuesto` decimal(10,2) DEFAULT NULL,
  `estado` enum('Pendiente','En_Proceso','Completado') DEFAULT 'Pendiente',
  PRIMARY KEY (`id_formulario`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `formulario_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formulario`
--

LOCK TABLES `formulario` WRITE;
/*!40000 ALTER TABLE `formulario` DISABLE KEYS */;
/*!40000 ALTER TABLE `formulario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(200) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) DEFAULT 0,
  `imagen_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,4,'PC Gaming Entry Level','i5 + GTX 1650, perfecto para empezar',650.00,10,NULL),(2,4,'PC Workstation Pro','Ryzen 9 + 64GB RAM para edición 4K',2100.00,3,NULL),(3,4,'PC Office Silent','i3 + 8GB RAM, ultra silencioso',450.00,15,NULL),(4,4,'PC Extreme RGB','i9 + RTX 4080 con refrigeración líquida',2800.00,2,NULL),(5,5,'Monitor LG 24\" IPS','Full HD 75Hz para oficina',129.00,20,NULL),(6,5,'Monitor MSI Optix 27\"','Curvo 165Hz para gaming',249.00,8,NULL),(7,5,'Monitor Samsung Odyssey G9','49 pulgadas UltraWide',1100.00,2,NULL),(8,5,'Monitor ASUS ProArt','4K Calibrado para fotografía',550.00,5,NULL),(9,14,'Logitech G502 Hero','Ratón gaming con pesos ajustables',59.99,30,NULL),(10,14,'Razer DeathAdder V3','Ratón ergonómico profesional',79.00,12,NULL),(11,14,'Corsair Scimitar RGB','Especial para MMO con 12 botones laterales',85.00,10,NULL),(12,14,'Ratón Oficina Básico','Inalámbrico y silencioso',15.00,50,NULL),(13,15,'Teclado Mecánico TKL','Switches Blue, tamaño compacto',45.00,15,NULL),(14,15,'Ducky One 2 Mini','Teclado 60% premium',120.00,5,NULL),(15,15,'Logitech G915 TKL','Inalámbrico de bajo perfil',199.00,4,NULL),(16,15,'Teclado Membrana Estándar','Resistente a salpicaduras',20.00,40,NULL),(25,20,'AMD Ryzen 5 7600','6 núcleos/12 hilos, incluye disipador Wraith Stealth',210.00,15,NULL),(26,20,'AMD Ryzen 7 7700X','8 núcleos/16 hilos, alto rendimiento gaming',330.00,10,NULL),(27,20,'AMD Ryzen 7 7800X3D','El mejor procesador para juegos con 3D V-Cache',395.00,8,NULL),(28,20,'AMD Ryzen 9 7950X','16 núcleos/32 hilos para productividad extrema',550.00,5,NULL),(29,16,'ASUS TUF Gaming B650-PLUS','ATX, PCIe 5.0, WiFi 6, robusta y fiable',215.00,12,NULL),(30,16,'MSI MAG X670E TOMAHAWK','Chipset entusiasta, máxima conectividad',310.00,6,NULL),(31,16,'Gigabyte B650 AORUS ELITE','Excelente gestión térmica y diseño',225.00,9,NULL),(32,16,'ASRock B650M Pro RS','Formato Micro-ATX, gran calidad-precio',160.00,14,NULL),(33,18,'Corsair Vengeance DDR5 32GB','6000MHz CL30, optimizada para AMD EXPO',125.00,25,NULL),(34,18,'G.Skill Trident Z5 Neo 32GB','6000MHz, diseño RGB premium',140.00,18,NULL),(35,18,'Kingston FURY Beast 16GB','5200MHz, perfil bajo y estable',65.00,40,NULL),(36,18,'Crucial RAM DDR5 32GB Kit','Kit básico de 4800MHz, alta fiabilidad',105.00,20,NULL),(37,22,'Noctua NH-D15 chromax.black','El rey de la refrigeración por aire',110.00,10,NULL),(38,22,'DeepCool AK620','Doble torre, rendimiento excepcional',65.00,15,NULL),(39,22,'NZXT Kraken 240','Refrigeración líquida con pantalla LCD',140.00,7,NULL),(40,22,'Cooler Master Hyper 212 Halo','Un clásico renovado con iluminación RGB',45.00,25,NULL),(41,17,'Corsair RM850e 850W','80+ Gold, Totalmente Modular, PCIe 5.0 ready',130.00,12,NULL),(42,17,'EVGA SuperNOVA 750 GT','750W 80+ Gold, compacta y eficiente',110.00,15,NULL),(43,17,'Seasonic FOCUS GX-1000','1000W para configuraciones de gama muy alta',180.00,5,NULL),(44,17,'Be Quiet! Pure Power 12 M 750W','Silencio absoluto y eficiencia alemana',115.00,10,NULL),(45,21,'Samsung 980 Pro 1TB','Velocidades de hasta 7000MB/s',105.00,30,NULL),(46,21,'WD Black SN850X 2TB','Ideal para gaming y carga rápida',170.00,15,NULL),(47,21,'Crucial P5 Plus 500GB','Opción económica pero muy rápida',60.00,20,NULL),(48,21,'Kingston KC3000 1TB','Excelente rendimiento térmico',95.00,22,NULL),(49,19,'ASUS Dual RTX 4070 SUPER','12GB GDDR6X, perfecta para 1440p',660.00,6,NULL),(50,19,'Sapphire Pulse RX 7800 XT','16GB VRAM, potencia de AMD',550.00,8,NULL),(51,19,'MSI Ventus 2X RTX 4060 Ti','8GB, consumo eficiente, ideal 1080p',410.00,15,NULL),(52,19,'Gigabyte Gaming OC RX 7600','Gama media económica y fresca',290.00,12,NULL),(53,23,'Corsair 4000D Airflow','Excelente flujo de aire y gestión de cables',95.00,20,NULL),(54,23,'NZXT H5 Flow','Diseño minimalista con ventilación optimizada',105.00,15,NULL),(55,23,'Lian Li Lancool 216','Espaciosa y con ventiladores de 160mm',115.00,10,NULL),(56,23,'Fractal Design Pop Air','Estética única con toques de color',90.00,12,NULL),(57,8,'PlayStation 5 Slim','Consola con lector de discos y 1TB SSD',549.00,10,NULL),(58,8,'Mando DualSense','Control inalámbrico con respuesta háptica',74.90,25,NULL),(59,8,'Estación de recarga DualSense','Carga hasta dos mandos simultáneamente',29.99,15,NULL),(60,8,'Auriculares Pulse 3D','Audio 3D optimizado para PS5',99.00,12,NULL),(61,8,'Cubiertas para PS5 (Negro)','Personaliza el color de tu consola',54.00,20,NULL),(62,9,'Xbox Series X','La consola más potente, 4K nativo y 1TB',520.00,8,NULL),(63,9,'Mando Inalámbrico Xbox','Diseño ergonómico en color Carbon Black',59.90,30,NULL),(64,9,'Tarjeta de Expansión Seagate 1TB','Amplía el almacenamiento sin perder velocidad',159.00,10,NULL),(65,9,'Kit Carga y Juega Xbox','Batería recargable + cable USB-C',22.99,40,NULL),(66,9,'Mando Xbox Elite Series 2','Control profesional para alta competición',165.00,5,NULL),(67,10,'Nintendo Switch OLED','Pantalla de 7 pulgadas con colores vibrantes',345.00,15,NULL),(68,10,'Set Joy-Con (Azul/Rojo)','Mandos oficiales con vibración HD',79.00,20,NULL),(69,10,'Mando Pro de Nintendo Switch','Control clásico para sesiones largas',69.90,15,NULL),(70,10,'Funda de transporte rígida','Protección total con soporte para juegos',19.90,50,NULL),(71,10,'Adaptador Ethernet para Switch','Conexión por cable estable para el Dock',25.00,15,NULL),(72,11,'Steam Deck OLED 512GB','PC portátil de alto rendimiento',569.00,5,NULL),(73,11,'ASUS ROG Ally Z1 Extreme','Consola portátil con Windows 11',649.00,4,NULL),(74,11,'Docking Station para Portátiles','Salida HDMI y puertos USB para modo TV',49.00,12,NULL),(75,11,'Protector de pantalla templado','Dureza 9H para evitar arañazos',12.00,100,NULL),(76,11,'Tarjeta MicroSD 512GB Ultra','Añade espacio para toda tu librería',55.00,30,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resenas`
--

DROP TABLE IF EXISTS `resenas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resenas` (
  `id_resena` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `puntuacion` int(11) DEFAULT NULL CHECK (`puntuacion` between 1 and 5),
  `comentario` text DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_resena`),
  KEY `id_producto` (`id_producto`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `resenas_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`),
  CONSTRAINT `resenas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resenas`
--

LOCK TABLES `resenas` WRITE;
/*!40000 ALTER TABLE `resenas` DISABLE KEYS */;
/*!40000 ALTER TABLE `resenas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin@admin.com','admin1234','2026-01-24 10:42:08');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-27 11:17:31
