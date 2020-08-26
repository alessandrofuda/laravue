-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: laravue
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_03_16_102314_add_simple_role_to_user_table',1),(4,'2019_04_20_125200_create_permission_tables',1),(5,'2019_04_20_130706_setup_role_permissions',1),(6,'2019_08_19_000000_create_failed_jobs_table',1),(7,'2019_12_14_000001_create_personal_access_tokens_table',1),(8,'2020_03_25_170854_remove_passport',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\Laravue\\Models\\User',1),(2,'App\\Laravue\\Models\\User',2),(3,'App\\Laravue\\Models\\User',3),(4,'App\\Laravue\\Models\\User',4),(5,'App\\Laravue\\Models\\User',5),(5,'App\\Laravue\\Models\\User',6),(5,'App\\Laravue\\Models\\User',7),(4,'App\\Laravue\\Models\\User',8),(4,'App\\Laravue\\Models\\User',9),(2,'App\\Laravue\\Models\\User',10),(5,'App\\Laravue\\Models\\User',11),(5,'App\\Laravue\\Models\\User',12),(3,'App\\Laravue\\Models\\User',13),(4,'App\\Laravue\\Models\\User',14),(2,'App\\Laravue\\Models\\User',15),(4,'App\\Laravue\\Models\\User',16),(4,'App\\Laravue\\Models\\User',17),(5,'App\\Laravue\\Models\\User',18),(2,'App\\Laravue\\Models\\User',19),(5,'App\\Laravue\\Models\\User',20),(3,'App\\Laravue\\Models\\User',21),(3,'App\\Laravue\\Models\\User',22),(5,'App\\Laravue\\Models\\User',23),(4,'App\\Laravue\\Models\\User',24),(4,'App\\Laravue\\Models\\User',25),(4,'App\\Laravue\\Models\\User',26),(3,'App\\Laravue\\Models\\User',27),(4,'App\\Laravue\\Models\\User',28),(5,'App\\Laravue\\Models\\User',29),(2,'App\\Laravue\\Models\\User',30),(2,'App\\Laravue\\Models\\User',31),(2,'App\\Laravue\\Models\\User',32),(3,'App\\Laravue\\Models\\User',33),(4,'App\\Laravue\\Models\\User',34),(2,'App\\Laravue\\Models\\User',35),(5,'App\\Laravue\\Models\\User',36),(3,'App\\Laravue\\Models\\User',37),(5,'App\\Laravue\\Models\\User',38),(5,'App\\Laravue\\Models\\User',39),(4,'App\\Laravue\\Models\\User',40),(2,'App\\Laravue\\Models\\User',41),(4,'App\\Laravue\\Models\\User',42),(4,'App\\Laravue\\Models\\User',43),(3,'App\\Laravue\\Models\\User',44),(3,'App\\Laravue\\Models\\User',45),(3,'App\\Laravue\\Models\\User',46),(5,'App\\Laravue\\Models\\User',47),(5,'App\\Laravue\\Models\\User',48),(5,'App\\Laravue\\Models\\User',49),(2,'App\\Laravue\\Models\\User',50),(4,'App\\Laravue\\Models\\User',51),(4,'App\\Laravue\\Models\\User',52),(5,'App\\Laravue\\Models\\User',53),(4,'App\\Laravue\\Models\\User',54),(2,'App\\Laravue\\Models\\User',55),(4,'App\\Laravue\\Models\\User',56);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view menu element ui','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(2,'view menu permission','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(3,'view menu components','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(4,'view menu charts','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(5,'view menu nested routes','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(6,'view menu table','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(7,'view menu administrator','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(8,'view menu theme','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(9,'view menu clipboard','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(10,'view menu excel','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(11,'view menu zip','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(12,'view menu pdf','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(13,'view menu i18n','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(14,'manage user','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(15,'manage article','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(16,'manage permission','api','2020-08-20 10:08:40','2020-08-20 10:08:40');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),(11,2),(12,2),(13,2),(14,2),(15,2),(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(15,3),(1,4),(2,4),(1,5),(2,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(2,'manager','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(3,'editor','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(4,'user','api','2020-08-20 10:08:40','2020-08-20 10:08:40'),(5,'visitor','api','2020-08-20 10:08:40','2020-08-20 10:08:40');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@laravue.dev',NULL,'$2y$10$jZomRqanj4PNSiJFrZtztOkeFw6ZJB6QGa4DEvbGQjahJd/LQoCOi',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(2,'Manager','manager@laravue.dev',NULL,'$2y$10$Rz.YtkMTLYdSeOyExHuAuOl8M30Au0KtpcePlxQDPxR2vEqIDYS.m',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(3,'Editor','editor@laravue.dev',NULL,'$2y$10$iXdHvV44oDRYKOhdgu6mlORtqQN1Lznk6Oo23k97lz1VaU6wv2rLi',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(4,'User','user@laravue.dev',NULL,'$2y$10$Hx0xOfyGaPAO8sXOXhRvCeSAPVu1U19dYxQ6f2SbNeSUNW/3CG88K',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(5,'Visitor','visitor@laravue.dev',NULL,'$2y$10$OqZ5TjCLgjGQJm.ZKuwXL.qO6dZSS3mxL7yzKctPab1Y3ym9LMbh2',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(6,'Adriana C. Ocampo Uria','adriana.c..ocampo.uria@laravue.dev',NULL,'$2y$10$YuzeLvjdQxb3iPA33xHDmeCMqpNG7VvwuZP9TfxYEOf8CN.mqclgG',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(7,'Albert Einstein','albert.einstein@laravue.dev',NULL,'$2y$10$bioFcV30UZAm3xhxqH1aS.Qo01UCJNkWoxCTaDDAHj8Hm.w8qm0xW',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(8,'Anna K. Behrensmeyer','anna.k..behrensmeyer@laravue.dev',NULL,'$2y$10$rqmXmG5vnD/ZNjzwflcxT.G0gace6ZDbLpvXH6NiSyk/xdCwEXsaS',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(9,'Blaise Pascal','blaise.pascal@laravue.dev',NULL,'$2y$10$kyEl7pRGbE8MGF3uZNaBAO.VT9IC9A3oKzjSvqffY8322x2RiJgVi',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(10,'Caroline Herschel','caroline.herschel@laravue.dev',NULL,'$2y$10$tW0GC1RvArR4Ne5Xq0cR/eMdJWJa7naAyI.ZNWIOkuvqP7WjY279W',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(11,'Cecilia Payne-Gaposchkin','cecilia.payne-gaposchkin@laravue.dev',NULL,'$2y$10$cjMvZMM5p6gbFtrNZJsTQuTYgN9H85lGbTGzJfKfx9PTGo.aaMDDK',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(12,'Chien-Shiung Wu','chien-shiung.wu@laravue.dev',NULL,'$2y$10$v32AwaEfN2w18FGx3Yw6sOqfxZZ1qQOS1/meNRjcM7JRFUSzt3nGK',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(13,'Dorothy Hodgkin','dorothy.hodgkin@laravue.dev',NULL,'$2y$10$ipiWBPUffmWECCVI/PRLFO5RMoc5pzlMrg75cmuy.gCUB1itTNYWe',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(14,'Edmond Halley','edmond.halley@laravue.dev',NULL,'$2y$10$saXCWkmDNNEW4CFDv/4/WOtsJWBigio47F8dW/r/FILo68bNPSA4q',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(15,'Edwin Powell Hubble','edwin.powell.hubble@laravue.dev',NULL,'$2y$10$1CzkYMJfyqrYP6/IT3AfIeH8cDV1e94BNH6YzQEVyqSkzPJS7mldW',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(16,'Elizabeth Blackburn','elizabeth.blackburn@laravue.dev',NULL,'$2y$10$JTvQ.wCWbh1DCvnp7NwE2OcPvwzhfi1pxXlraL21.VPlYUpq.Lk/W',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(17,'Enrico Fermi','enrico.fermi@laravue.dev',NULL,'$2y$10$2767kSpDvbJarsp36c.NKuO5.2StPYLYaVWjeAULnvUKPDBbW/feC',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(18,'Erwin Schroedinger','erwin.schroedinger@laravue.dev',NULL,'$2y$10$REud61K/MX51dm4Hx7qpruYn730TGlZuw7B19GxyjKOifPApUfhNq',NULL,'2020-08-20 10:08:41','2020-08-20 10:08:41'),(19,'Flossie Wong-Staal','flossie.wong-staal@laravue.dev',NULL,'$2y$10$GpuxR4R4HmDCnAzuz.DC7.4XbL09QKLAPLHoWvExobiFkSmselvOa',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(20,'Frieda Robscheit-Robbins','frieda.robscheit-robbins@laravue.dev',NULL,'$2y$10$whkfINlWJKnySp.3O2uWauEzqzJIDdLTZ6HDVAoRU.kKWGs3VYV9i',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(21,'Geraldine Seydoux','geraldine.seydoux@laravue.dev',NULL,'$2y$10$AO3Y9ZqDXD1Vb7ahFgGcXeoeseOWzrU4yDXb79mdOcpF3uOcRBEXO',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(22,'Gertrude B. Elion','gertrude.b..elion@laravue.dev',NULL,'$2y$10$dXKsEfB4aS.zLGT.NtqAJepNbe7vPSjoW7l1n4DjTLGLMn1GP8nFG',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(23,'Ingrid Daubechies','ingrid.daubechies@laravue.dev',NULL,'$2y$10$1Wcjg64wlHZaoiyJHe7UnuJIauGFKKazyM44XlKha.EQ9UoIWoXOG',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(24,'Jacqueline K. Barton','jacqueline.k..barton@laravue.dev',NULL,'$2y$10$mNfR0yUtgTBy67cH1/jh2e5O2tUzCxaEs1NGpxFWw5VVKoTx.i3EO',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(25,'Jane Goodall','jane.goodall@laravue.dev',NULL,'$2y$10$.SOdWCZFdDiFKQ64rUAqyOI3xm.E/vefg6w/mZe5x3HzB08rpXZjG',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(26,'Jocelyn Bell Burnell','jocelyn.bell.burnell@laravue.dev',NULL,'$2y$10$ZEpBY3ZvA8RsJQfK0flXiOFJBYAQIZLBBURo8bHpNVRbCDsijdYha',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(27,'Johannes Kepler','johannes.kepler@laravue.dev',NULL,'$2y$10$Ru.RlvemoDgGvTV8PofNvuZq4FJ0NgP0/s9yYK5sjzpSWSFzOKyuy',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(28,'Lene Vestergaard Hau','lene.vestergaard.hau@laravue.dev',NULL,'$2y$10$lA0cE.zvILJ5AvAtPspP7.UWkqJDpjc/dWXMesgpWEW4UKRUpdxGK',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(29,'Lise Meitner','lise.meitner@laravue.dev',NULL,'$2y$10$UOqttfDLU7upxGwsW88Z4uwYQysEuT1kBSXTChdUu9crz1o7VVkf6',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(30,'Lord Kelvin','lord.kelvin@laravue.dev',NULL,'$2y$10$bCrb4SP.CFLC2SCTivtElOAWqfHW/jLaOpikm25BP0ku23KDMIweG',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(31,'Maria Mitchell','maria.mitchell@laravue.dev',NULL,'$2y$10$0YwpWCyb6r1K5Wzcs5j9Q.DEWoeoSINkSc.lpfnVFPvG6YWfDA3Sq',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(32,'Marie Curie','marie.curie@laravue.dev',NULL,'$2y$10$QoNTxB/UJu4XZtuHNh4pxe8kpqz9UPr.p1FuFE8ISdcqbQbezRalm',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(33,'Max Born','max.born@laravue.dev',NULL,'$2y$10$8t1dO6mfjYdLnRsbsXWqZORVQXphZO/RYE/KpgnPjFGEwIn301dH.',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(34,'Max Planck','max.planck@laravue.dev',NULL,'$2y$10$iFuJeS0jtZa1eQ6f7IykS.WdSd2NQhuhyDu0bbbPa3OGZ0vcxDRn6',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(35,'Melissa Franklin','melissa.franklin@laravue.dev',NULL,'$2y$10$bLIeo9z7b8fV6FeLcTPptuYDqx9J/5a/IHsCVSrqTndPUudXxJlFW',NULL,'2020-08-20 10:08:42','2020-08-20 10:08:42'),(36,'Michael Faraday','michael.faraday@laravue.dev',NULL,'$2y$10$W.VSHB9hxCS0HtSXJGMPsuWIQpn361TJ1/EEySkst0NgvGRYhymEG',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(37,'Mildred S. Dresselhaus','mildred.s..dresselhaus@laravue.dev',NULL,'$2y$10$DHmHyXD8EvcUdmCxN1mDJ.2y0Ku82meD2st8NxxV2MhI8QhTwa22q',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(38,'Nicolaus Copernicus','nicolaus.copernicus@laravue.dev',NULL,'$2y$10$MnRqE4Dmlap2XYXImBc8I.0X5z9o7sARLaf6CywmkDQso0GIbDs9a',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(39,'Niels Bohr','niels.bohr@laravue.dev',NULL,'$2y$10$c6.JcncN5UWcgz8OhY4LfezRPixz/.2e.7Qlh6dL9Bq/C7hjdUjx2',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(40,'Patricia S. Goldman-Rakic','patricia.s..goldman-rakic@laravue.dev',NULL,'$2y$10$559jmi1cAgRJCIjL8HtJDO.iJRbAH0O.sCjPmDvr1KZusnMp.QMma',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(41,'Patty Jo Watson','patty.jo.watson@laravue.dev',NULL,'$2y$10$5xhUaapEWAsEth17pIoxd.zrdbKDco2HMAbv85bS6Y7p1U25aOXPa',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(42,'Polly Matzinger','polly.matzinger@laravue.dev',NULL,'$2y$10$ESPJ3r9QuWkAgVo92nAlVuBpGNuFhLDEi8kDuBUgfBzAvzAXJM7K6',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(43,'Richard Phillips Feynman','richard.phillips.feynman@laravue.dev',NULL,'$2y$10$uHAGTfc1mPywpXMz8.SpbOIETiNXX/LVvGQ4rJUw.9kyQm7j604Gy',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(44,'Rita Levi-Montalcini','rita.levi-montalcini@laravue.dev',NULL,'$2y$10$WfiFrCTyleohB4ptGelUuOeQHYuVNSJqMnNW4BiKMwXQPfJp.m5T.',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(45,'Rosalind Franklin','rosalind.franklin@laravue.dev',NULL,'$2y$10$vOuofqnU2dSaRIZ/z8lqF.gfldb1PWDiEk7opYkdtSp7DlZlO76Gm',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(46,'Ruzena Bajcsy','ruzena.bajcsy@laravue.dev',NULL,'$2y$10$g.bgCPUPZNwsdkkN0GX2QunKaq.jJmY.4rlFgavt1L6dcxfQJ08pG',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(47,'Sarah Boysen','sarah.boysen@laravue.dev',NULL,'$2y$10$25Zjhf12pJbIKFpGkOGmK.EdKymBXgLAIRZhDKKlkRB8hmNzTFuNG',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(48,'Shannon W. Lucid','shannon.w..lucid@laravue.dev',NULL,'$2y$10$RVCj3nwX6syEiXlbwzbPSONHUHU/al.zOfzFhR9rfCyzjswFQ4IVu',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(49,'Shirley Ann Jackson','shirley.ann.jackson@laravue.dev',NULL,'$2y$10$JEuC0kNSnd4h9sm1i53Xu.PZIbHWnTKR/10kphXd0VxhHOHZIfX8a',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(50,'Sir Ernest Rutherford','sir.ernest.rutherford@laravue.dev',NULL,'$2y$10$vywIQTixI52bMsEcx0rX1.Stp5v6uW.f5rKCipPfkgd9iIMTNIaHK',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(51,'Sir Isaac Newton','sir.isaac.newton@laravue.dev',NULL,'$2y$10$HA3D/83l9XKLJrG2OoYoOe9AlveMeNJ7LHzTXpFlC26aqtKCEirO6',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(52,'Stephen Hawking','stephen.hawking@laravue.dev',NULL,'$2y$10$ZsFlhiI05NkptQG7YQFIpOjdohxzxqpOLcGRn5/5oUbiPm/gfF4we',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(53,'Werner Karl Heisenberg','werner.karl.heisenberg@laravue.dev',NULL,'$2y$10$XWsH5mk03fQw7LK8aA76neZIWkHkc5nTFSTVzT0YtIMPTSgLVB5WS',NULL,'2020-08-20 10:08:43','2020-08-20 10:08:43'),(54,'Wilhelm Conrad Roentgen','wilhelm.conrad.roentgen@laravue.dev',NULL,'$2y$10$GzG3.ZlPI7iSnD2lCMqsfuK5NrDyowSCS1gdpIxT4F0nmfFtMITFi',NULL,'2020-08-20 10:08:44','2020-08-20 10:08:44'),(55,'Wolfgang Ernst Pauli','wolfgang.ernst.pauli@laravue.dev',NULL,'$2y$10$8hDOXKkEyY.tvb9IU5Jm9OLAhURz1KUvkMssW1Bd/BCVxvu2kmofm',NULL,'2020-08-20 10:08:44','2020-08-20 10:08:44'),(56,'AlessandroUser','alessandro.fuda@gmail.com',NULL,'$2y$10$qi1hlabRMnmYlki.Ol0tqumQc1wPnoLljywmiDerAU15XF/rKj7JO',NULL,'2020-08-20 12:13:07','2020-08-20 12:13:07');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-26  9:52:01
