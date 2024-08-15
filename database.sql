-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: huberwaytheme
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'xvmHHo3XqqqrviI94smeYUyQ1E5at8dX',1,'2024-01-25 00:45:04','2024-01-25 00:45:04','2024-01-25 00:45:04'),(2,2,'4WqyYZw5DMy13VqjdAVHVbxgPSAFPzkp',1,'2024-01-25 00:45:05','2024-01-25 00:45:05','2024-01-25 00:45:05');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads`
--

DROP TABLE IF EXISTS `ads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expired_at` datetime DEFAULT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clicked` bigint NOT NULL DEFAULT '0',
  `order` int DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `open_in_new_tab` tinyint(1) NOT NULL DEFAULT '1',
  `tablet_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ads_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads`
--

LOCK TABLES `ads` WRITE;
/*!40000 ALTER TABLE `ads` DISABLE KEYS */;
INSERT INTO `ads` VALUES (1,'Top Slider Image 1','2029-01-25 00:00:00','not_set','VC2C8Q1UGCBG','promotion/1.jpg','/products',0,1,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(2,'Top Slider Image 2','2029-01-25 00:00:00','not_set','NBDWRXTSVZ8N','promotion/2.jpg','/products',0,2,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(3,'Homepage middle 1','2029-01-25 00:00:00','not_set','IZ6WU8KUALYD','promotion/3.jpg','/products',0,3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(4,'Homepage middle 2','2029-01-25 00:00:00','not_set','ILSFJVYFGCPZ','promotion/4.jpg','/products',0,4,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(5,'Homepage middle 3','2029-01-25 00:00:00','not_set','ZDOZUZZIU7FT','promotion/5.jpg','/products',0,5,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(6,'Homepage big 1','2029-01-25 00:00:00','not_set','Q9YDUIC9HSWS','promotion/6.jpg','/products',0,6,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(7,'Homepage bottom small','2029-01-25 00:00:00','not_set','NCBV1KQ05HQZ','promotion/7.jpg','/products',0,7,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(8,'Product sidebar','2029-01-25 00:00:00','product-sidebar','QY8EUM1KMRWE','promotion/8.jpg','/products',0,8,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL),(9,'Homepage big 2','2029-01-25 00:00:00','not_set','IZ6WU8KUALYE','promotion/9.jpg','/products',0,9,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',1,NULL,NULL);
/*!40000 ALTER TABLE `ads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ads_translations`
--

DROP TABLE IF EXISTS `ads_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ads_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ads_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ads_translations`
--

LOCK TABLES `ads_translations` WRITE;
/*!40000 ALTER TABLE `ads_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ads_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HuberwayCMS\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Ecommerce',0,'Earum incidunt aut molestias eos. Beatae ullam voluptas quia dolorum consequuntur voluptas non. Laborum dicta dolorum ut sequi et. Eaque et rem quia error magni.','published',2,'HuberwayCMS\\ACL\\Models\\User',NULL,0,0,1,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(2,'Fashion',0,'Dolore veritatis aut rerum eos dolores. Assumenda molestias ut rerum sed est omnis quo. Quos voluptatem enim odio labore excepturi.','published',2,'HuberwayCMS\\ACL\\Models\\User',NULL,0,1,0,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(3,'Electronic',0,'Odio molestias quia modi qui aperiam eos aliquam consectetur. Dignissimos aliquam iure nam. Repellendus aut doloribus qui atque aperiam omnis debitis sed. Debitis sit et nostrum sed ipsum natus.','published',2,'HuberwayCMS\\ACL\\Models\\User',NULL,0,1,0,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(4,'Commercial',0,'Et soluta itaque consequatur. Omnis ea vero qui facere et tenetur occaecati vel. Molestiae sed voluptates perferendis dolorem.','published',2,'HuberwayCMS\\ACL\\Models\\User',NULL,0,1,0,'2024-01-25 00:45:05','2024-01-25 00:45:05');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Gladyce Jaskolski','burley.hilpert@example.com','1-772-621-6390','7002 Crist Trail Suite 902\nNew Magaliton, AK 96284','Molestiae est qui tempora minima.','Impedit est quas tenetur et corporis voluptates numquam. Minus eum non dolorum aut omnis et. Perferendis inventore eum cumque debitis. Commodi sit temporibus dolorem corporis cumque hic. Et et non laborum omnis aliquid laborum et. Cumque laboriosam sunt est nulla sed. Quo praesentium reiciendis dolorem officiis quasi aut voluptatibus. Non cumque quia hic qui consequatur quasi.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(2,'Audra Barrows','fweber@example.com','1-402-989-9562','3129 Hortense Station\nWest Cletus, MO 75627','Fugit sed deleniti eaque commodi quidem aut.','Fugiat optio voluptatem voluptas quo qui sunt consectetur. Ut facere voluptatem quas eaque. Ut voluptates ratione porro voluptatem. Molestiae ducimus incidunt dolorum porro consequatur. Qui cum omnis iusto beatae maiores facilis ipsam. Provident sint ex sint ullam minus. Sed mollitia voluptatum est sequi aperiam. Qui ipsum doloribus blanditiis voluptates reprehenderit molestiae. Assumenda dolor dolores laboriosam id eos.','unread','2024-01-25 00:45:04','2024-01-25 00:45:04'),(3,'Mrs. Dena Heathcote','natasha23@example.net','(651) 991-9767','46966 Lynch Freeway\nWest Arlene, CO 70175','Ipsam ut voluptatum quasi.','Autem incidunt ab in iure accusantium animi expedita. Sunt tenetur et autem non consequuntur sunt enim. Maiores id repudiandae dolorem sed sit ab laboriosam. Rerum sint tempora et quia voluptas non inventore. Sapiente quo beatae vitae et voluptatem cum reprehenderit ut. Aliquid id eius quae unde natus ut.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(4,'Eriberto Crist','fbuckridge@example.com','(585) 230-7698','1049 Anderson Ridge Suite 229\nEnricoport, WY 31274','Voluptatem vel aut quas ea eum.','Quae enim esse expedita perspiciatis porro sequi. Eaque rerum vel eos esse qui laborum est inventore. Sed rerum nihil non aut voluptatem dignissimos corporis. Dolorum autem eius quia est quis. Atque officiis voluptatem quo sit fugit repudiandae. Minus dolor voluptate adipisci tempore eius. Pariatur eius excepturi saepe. Cupiditate et eum alias sit accusamus aut. Quae quis adipisci fuga est voluptate modi.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(5,'Germaine Wisozk','grant95@example.net','+1-919-450-6445','136 Audra Ville\nOllieview, CA 25342-3628','Aut molestias et non quisquam et.','Atque et nesciunt rerum et possimus. Odit labore illum ut sed odio. Voluptatem quia consequatur at mollitia. Quidem nulla omnis officiis quis iusto et culpa. Adipisci laboriosam dolor et culpa. Nisi suscipit dolorem aliquam molestias accusantium dolore ducimus. Cupiditate sunt aut omnis voluptatem voluptate qui. Magni sint voluptatem voluptatibus in sit et amet. Ratione odio sapiente est error. Veniam officia dolores praesentium aliquam perspiciatis.','unread','2024-01-25 00:45:04','2024-01-25 00:45:04'),(6,'Dale Mills','khalid.franecki@example.net','+13392408961','7790 Kris Street\nMafaldaview, AK 64302','Soluta ipsum ea in et.','Et ipsa et animi in quas dolores. Dolor adipisci iste rerum nihil sed. Maxime quod aut totam deleniti vero consequatur perspiciatis. Sapiente ipsam fugiat odit dignissimos. Error officia ut odit. Dolores vero eos sequi repellendus eum omnis. Omnis alias qui et et sit vero dolor. Minima voluptatem et molestiae ex asperiores.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(7,'Bertrand Kerluke','zdicki@example.net','1-534-252-9631','88727 Stiedemann Ways Suite 838\nPort Edmond, TN 37617-8723','Quis dolore magnam sunt.','Voluptas sapiente et a eos. Corrupti sed et similique amet. Optio sapiente voluptatum consectetur vero laborum laborum error. Tempore ut tempora quas blanditiis consequatur repudiandae. Aut minus nisi perspiciatis quidem nobis. Sequi inventore voluptatem autem nostrum labore blanditiis nemo. Corporis est cumque aspernatur id vitae. Aspernatur explicabo a possimus laudantium. Eaque est ut et porro voluptatem aut cupiditate. Id vel rerum eaque aut placeat dolorum nam.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(8,'Devonte Witting','kcole@example.com','1-838-403-5072','2635 Kaelyn River Suite 332\nTorphyview, CT 48717','Perferendis quas sunt ducimus voluptas voluptas.','Ea quo numquam nobis sed rerum in eveniet. Et aperiam temporibus voluptate ea quos. Corporis eos autem beatae provident esse nihil esse. Aliquam dolorem ut eveniet dicta itaque animi error. Veniam sit consequatur tenetur mollitia est sunt et. Voluptates commodi praesentium architecto consequatur quasi dolorem explicabo. Molestiae quis rerum quis deserunt. Et nulla magnam non reiciendis non nihil. Autem eaque dicta cum quo. Ullam voluptatum consectetur aut quasi.','read','2024-01-25 00:45:04','2024-01-25 00:45:04'),(9,'Tevin Morissette','nick26@example.com','440-783-3457','8863 Harvey Locks\nWyattmouth, KS 36073-7000','Quod tenetur atque porro possimus.','In maxime hic eum consequuntur enim sit sint. Et quo doloribus perspiciatis minus similique. Fuga at culpa aut beatae optio. Molestiae qui et cumque facere est consequuntur itaque. Recusandae possimus sunt placeat adipisci velit velit. Sed eius aut repudiandae doloremque mollitia delectus. Consequatur accusamus assumenda sed placeat omnis similique. Ab excepturi reiciendis est velit. Non dignissimos eos et voluptas non voluptates ducimus. Cupiditate ipsam est pariatur.','unread','2024-01-25 00:45:04','2024-01-25 00:45:04'),(10,'Geraldine Schaefer','grayce.steuber@example.com','1-832-578-4856','711 Kristopher Meadows Suite 155\nKyleland, MD 06169','Qui explicabo vitae et.','Eum laborum expedita quia provident. Facere aut enim mollitia laborum expedita. Libero temporibus voluptate non labore et in eum. Animi libero nesciunt assumenda blanditiis est quos earum. Molestiae illo ex ipsam. Eum dolores nemo beatae est facere. Et sed unde itaque earum praesentium facere quia. Et voluptatem omnis in maiores ut aut. Est consequatur pariatur a totam quasi commodi. Et aperiam perferendis id quam fugit nam qui. Blanditiis eligendi iure debitis.','unread','2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands`
--

DROP TABLE IF EXISTS `ec_brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands`
--

LOCK TABLES `ec_brands` WRITE;
/*!40000 ALTER TABLE `ec_brands` DISABLE KEYS */;
INSERT INTO `ec_brands` VALUES (1,'Fashion live',NULL,NULL,'brands/1.jpg','published',0,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(2,'Hand crafted',NULL,NULL,'brands/2.jpg','published',1,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(3,'Mestonix',NULL,NULL,'brands/3.jpg','published',2,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(4,'Sunshine',NULL,NULL,'brands/4.jpg','published',3,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(5,'Pure',NULL,NULL,'brands/5.jpg','published',4,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(6,'Anfold',NULL,NULL,'brands/6.jpg','published',5,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(7,'Automotive',NULL,NULL,'brands/7.jpg','published',6,1,'2024-01-25 00:44:55','2024-01-25 00:44:55');
/*!40000 ALTER TABLE `ec_brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_brands_translations`
--

DROP TABLE IF EXISTS `ec_brands_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_brands_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_brands_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_brands_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_brands_translations`
--

LOCK TABLES `ec_brands_translations` WRITE;
/*!40000 ALTER TABLE `ec_brands_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_brands_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_cart`
--

DROP TABLE IF EXISTS `ec_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_cart` (
  `identifier` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instance` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`identifier`,`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_cart`
--

LOCK TABLES `ec_cart` WRITE;
/*!40000 ALTER TABLE `ec_cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_currencies`
--

DROP TABLE IF EXISTS `ec_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned DEFAULT '0',
  `order` int unsigned DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_currencies`
--

LOCK TABLES `ec_currencies` WRITE;
/*!40000 ALTER TABLE `ec_currencies` DISABLE KEYS */;
INSERT INTO `ec_currencies` VALUES (1,'USD','$',1,2,0,1,1,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(2,'EUR','€',0,2,1,0,0.84,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(3,'VND','₫',0,0,2,0,23203,'2024-01-25 00:44:55','2024-01-25 00:44:55'),(4,'NGN','₦',1,2,2,0,895.52,'2024-01-25 00:44:55','2024-01-25 00:44:55');
/*!40000 ALTER TABLE `ec_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_addresses`
--

DROP TABLE IF EXISTS `ec_customer_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned NOT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_addresses`
--

LOCK TABLES `ec_customer_addresses` WRITE;
/*!40000 ALTER TABLE `ec_customer_addresses` DISABLE KEYS */;
INSERT INTO `ec_customer_addresses` VALUES (1,'Reva Legros','customer@huberway.com','+15073516517','MK','District of Columbia','Port Morris','127 Brenda Forest',1,1,'2024-01-25 00:45:02','2024-01-25 00:45:02','88089-4846'),(2,'Reva Legros','customer@huberway.com','+14346168193','TO','Missouri','Greenholtstad','661 Abe Manor Apt. 773',1,0,'2024-01-25 00:45:02','2024-01-25 00:45:02','95247-4047'),(3,'Rachelle Koch','vendor@huberway.com','+19379103204','MH','Pennsylvania','Littelfort','6553 Scotty Ranch Apt. 809',2,1,'2024-01-25 00:45:02','2024-01-25 00:45:02','56725-0125'),(4,'Rachelle Koch','vendor@huberway.com','+15519771541','NG','New York','Bauchport','223 Leffler Harbors',2,0,'2024-01-25 00:45:02','2024-01-25 00:45:02','77432'),(5,'Prof. Jaunita O\'Connell','pharris@example.org','+17123324423','VU','Maine','Alvertaview','5030 Shanelle Fort',3,1,'2024-01-25 00:45:02','2024-01-25 00:45:02','67319'),(6,'Lacy Volkman','dejah32@example.org','+18482801035','FM','Rhode Island','Stiedemannchester','531 Hazel Valleys',4,1,'2024-01-25 00:45:02','2024-01-25 00:45:02','07088'),(7,'Greyson Trantow','bahringer.rocio@example.org','+18438367067','AS','Indiana','Jaskolskifurt','406 Ferry Green',5,1,'2024-01-25 00:45:03','2024-01-25 00:45:03','87907'),(8,'Prof. Orland Schaefer IV','maymie02@example.com','+13026004099','IQ','Hawaii','Padbergfort','1230 Hauck Union',6,1,'2024-01-25 00:45:03','2024-01-25 00:45:03','21194'),(9,'Maggie Beier','blick.alford@example.org','+15137607472','GH','Virginia','South Janystad','3677 Hand Fields',7,1,'2024-01-25 00:45:03','2024-01-25 00:45:03','66056'),(10,'Theresa Eichmann DVM','marta67@example.com','+15754719241','VI','Wyoming','West Marshallport','64053 Keanu Mount',8,1,'2024-01-25 00:45:03','2024-01-25 00:45:03','59747'),(11,'Hilbert Prosacco','bartoletti.candelario@example.net','+12524530462','IO','Pennsylvania','Port Todfort','14955 Jon Tunnel Suite 507',9,1,'2024-01-25 00:45:04','2024-01-25 00:45:04','58241-7047'),(12,'Chaz Donnelly','ksmitham@example.net','+16407498133','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',10,1,'2024-01-25 00:45:04','2024-01-25 00:45:04','81047');
/*!40000 ALTER TABLE `ec_customer_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_password_resets`
--

DROP TABLE IF EXISTS `ec_customer_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `ec_customer_password_resets_email_index` (`email`),
  KEY `ec_customer_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_password_resets`
--

LOCK TABLES `ec_customer_password_resets` WRITE;
/*!40000 ALTER TABLE `ec_customer_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_recently_viewed_products`
--

DROP TABLE IF EXISTS `ec_customer_recently_viewed_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_recently_viewed_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_recently_viewed_products`
--

LOCK TABLES `ec_customer_recently_viewed_products` WRITE;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_recently_viewed_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customer_used_coupons`
--

DROP TABLE IF EXISTS `ec_customer_used_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customer_used_coupons` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customer_used_coupons`
--

LOCK TABLES `ec_customer_used_coupons` WRITE;
/*!40000 ALTER TABLE `ec_customer_used_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_customer_used_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_customers`
--

DROP TABLE IF EXISTS `ec_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'activated',
  `private_notes` text COLLATE utf8mb4_unicode_ci,
  `is_vendor` tinyint(1) NOT NULL DEFAULT '0',
  `vendor_verified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_customers_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_customers`
--

LOCK TABLES `ec_customers` WRITE;
/*!40000 ALTER TABLE `ec_customers` DISABLE KEYS */;
INSERT INTO `ec_customers` VALUES (1,'Reva Legros','customer@huberway.com','$2y$12$aHpHOCJypcndH55e/RXfneBLJUSKTbsPdFbrdFj4iJfOORCGk5lu6','customers/9.jpg','1997-12-31','+14636403990',NULL,'2024-01-25 00:45:02','2024-01-25 00:45:02','2024-01-25 07:45:02',NULL,'activated',NULL,0,NULL),(2,'Rachelle Koch','vendor@huberway.com','$2y$12$XCcrIP8Uo8JNZn4Lqwr8x.pg1DJ2SvN36W1dfn.Pk0SGlL1dQq81K','customers/2.jpg','1998-01-19','+12069494141',NULL,'2024-01-25 00:45:02','2024-01-25 00:45:08','2024-01-25 07:45:02',NULL,'activated',NULL,1,'2024-01-25 07:45:08'),(3,'Prof. Jaunita O\'Connell','pharris@example.org','$2y$12$Z3h1/ffDBI8gSV1.Iow4Huho6t.BJFNQ2p1MIUmdTpdec2RW1mklS','customers/1.jpg','1985-12-28','+12094697270',NULL,'2024-01-25 00:45:02','2024-01-25 00:45:02','2024-01-25 07:45:02',NULL,'activated',NULL,0,NULL),(4,'Lacy Volkman','dejah32@example.org','$2y$12$nbZDeMx6V50HEzCd38NyjeodWc6Vk8O0KcimjpZVY6aE.tJX9MYle','customers/2.jpg','2001-01-18','+12708958949',NULL,'2024-01-25 00:45:02','2024-01-25 00:45:08','2024-01-25 07:45:02',NULL,'activated',NULL,1,'2024-01-25 07:45:08'),(5,'Greyson Trantow','bahringer.rocio@example.org','$2y$12$WR6J.14wgfqIKgCBALajhu4JT0BI.753BoBVRm8zufvykJDCNLLQ.','customers/3.jpg','1974-01-24','+14237399942',NULL,'2024-01-25 00:45:03','2024-01-25 00:45:03','2024-01-25 07:45:03',NULL,'activated',NULL,0,NULL),(6,'Prof. Orland Schaefer IV','maymie02@example.com','$2y$12$UHDxJcxuvy4QUfNi.xxnTeiPxR7RfVBpLqGK0Y2iAqMcPfTDjZb2G','customers/4.jpg','1984-12-28','+13025018561',NULL,'2024-01-25 00:45:03','2024-01-25 00:45:03','2024-01-25 07:45:03',NULL,'activated',NULL,0,NULL),(7,'Maggie Beier','blick.alford@example.org','$2y$12$k.GM2.22ERjyPUv7qotl/ujVB/Uv1LsLDsMWiPUIUn.WiopZpR3ky','customers/5.jpg','1990-01-18','+14848708068',NULL,'2024-01-25 00:45:03','2024-01-25 00:45:08','2024-01-25 07:45:03',NULL,'activated',NULL,1,'2024-01-25 07:45:08'),(8,'Theresa Eichmann DVM','marta67@example.com','$2y$12$/0HxGQFQ0ViTf4/VHOqgLOYaLA8IDvb2dxynJKXhgAM94vwjrvj1a','customers/6.jpg','1977-12-28','+19497074245',NULL,'2024-01-25 00:45:03','2024-01-25 00:45:09','2024-01-25 07:45:03',NULL,'activated',NULL,1,'2024-01-25 07:45:09'),(9,'Hilbert Prosacco','bartoletti.candelario@example.net','$2y$12$ykk3f.SjohjIxIV.VOCUz.lpHpHpO.FIK2l14nHR9r3GQ2hjT6PzW','customers/7.jpg','1995-01-06','+17152808345',NULL,'2024-01-25 00:45:04','2024-01-25 00:45:09','2024-01-25 07:45:04',NULL,'activated',NULL,1,'2024-01-25 07:45:09'),(10,'Chaz Donnelly','ksmitham@example.net','$2y$12$0z.ojvrILVAx3s7xiqUgDuxyzksElJLMrgA1i2sVG8hWwBXrlFbj6','customers/8.jpg','1993-01-23','+14637448922',NULL,'2024-01-25 00:45:04','2024-01-25 00:45:04','2024-01-25 07:45:04',NULL,'activated',NULL,0,NULL);
/*!40000 ALTER TABLE `ec_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_customers`
--

DROP TABLE IF EXISTS `ec_discount_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_customers` (
  `discount_id` bigint unsigned NOT NULL,
  `customer_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_customers`
--

LOCK TABLES `ec_discount_customers` WRITE;
/*!40000 ALTER TABLE `ec_discount_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_categories`
--

DROP TABLE IF EXISTS `ec_discount_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_categories` (
  `discount_id` bigint unsigned NOT NULL,
  `product_category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_categories`
--

LOCK TABLES `ec_discount_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_product_collections`
--

DROP TABLE IF EXISTS `ec_discount_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_product_collections` (
  `discount_id` bigint unsigned NOT NULL,
  `product_collection_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_collection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_product_collections`
--

LOCK TABLES `ec_discount_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_discount_product_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discount_products`
--

DROP TABLE IF EXISTS `ec_discount_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discount_products` (
  `discount_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`discount_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discount_products`
--

LOCK TABLES `ec_discount_products` WRITE;
/*!40000 ALTER TABLE `ec_discount_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discount_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_discounts`
--

DROP TABLE IF EXISTS `ec_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `value` double DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'coupon',
  `can_use_with_promotion` tinyint(1) NOT NULL DEFAULT '0',
  `discount_on` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int unsigned DEFAULT NULL,
  `type_option` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'amount',
  `target` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'all-orders',
  `min_order_price` decimal(15,2) DEFAULT NULL,
  `apply_via_url` tinyint(1) NOT NULL DEFAULT '0',
  `display_at_checkout` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_discounts_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_discounts`
--

LOCK TABLES `ec_discounts` WRITE;
/*!40000 ALTER TABLE `ec_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sale_products`
--

DROP TABLE IF EXISTS `ec_flash_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sale_products` (
  `flash_sale_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `price` double unsigned DEFAULT NULL,
  `quantity` int unsigned DEFAULT NULL,
  `sold` int unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sale_products`
--

LOCK TABLES `ec_flash_sale_products` WRITE;
/*!40000 ALTER TABLE `ec_flash_sale_products` DISABLE KEYS */;
INSERT INTO `ec_flash_sale_products` VALUES (1,1,38.52,6,5),(1,2,27.54,8,5),(1,3,10.2,9,2),(1,4,299.0944,17,1),(1,5,649.89,11,4),(1,6,141.05,15,3),(1,7,431.34,13,2),(1,8,750.0048,7,4),(1,9,404.78,17,3),(1,10,994.5,20,2);
/*!40000 ALTER TABLE `ec_flash_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales`
--

DROP TABLE IF EXISTS `ec_flash_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` datetime NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales`
--

LOCK TABLES `ec_flash_sales` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales` DISABLE KEYS */;
INSERT INTO `ec_flash_sales` VALUES (1,'Winter Sale','2024-02-24 00:00:00','published','2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `ec_flash_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_flash_sales_translations`
--

DROP TABLE IF EXISTS `ec_flash_sales_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_flash_sales_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_flash_sales_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_flash_sales_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_flash_sales_translations`
--

LOCK TABLES `ec_flash_sales_translations` WRITE;
/*!40000 ALTER TABLE `ec_flash_sales_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_flash_sales_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value`
--

DROP TABLE IF EXISTS `ec_global_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value` (
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value`
--

LOCK TABLES `ec_global_option_value` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value` DISABLE KEYS */;
INSERT INTO `ec_global_option_value` VALUES (1,1,'1 Year',0,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(1,2,'2 Year',10,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(1,3,'3 Year',20,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,4,'4GB',0,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,5,'8GB',10,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,6,'16GB',20,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,7,'Core i5',0,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,8,'Core i7',10,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,9,'Core i9',20,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,10,'128GB',0,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,11,'256GB',10,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,12,'512GB',20,9999,0,'2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `ec_global_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_option_value_translations`
--

DROP TABLE IF EXISTS `ec_global_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_option_value_translations`
--

LOCK TABLES `ec_global_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options`
--

DROP TABLE IF EXISTS `ec_global_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'option type',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options`
--

LOCK TABLES `ec_global_options` WRITE;
/*!40000 ALTER TABLE `ec_global_options` DISABLE KEYS */;
INSERT INTO `ec_global_options` VALUES (1,'Warranty','HuberwayCMS\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,'RAM','HuberwayCMS\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,'CPU','HuberwayCMS\\Ecommerce\\Option\\OptionType\\RadioButton',1,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,'HDD','HuberwayCMS\\Ecommerce\\Option\\OptionType\\Dropdown',0,'2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `ec_global_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_global_options_translations`
--

DROP TABLE IF EXISTS `ec_global_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_global_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_global_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_global_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_global_options_translations`
--

LOCK TABLES `ec_global_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_global_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_global_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_grouped_products`
--

DROP TABLE IF EXISTS `ec_grouped_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_grouped_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `parent_product_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `fixed_qty` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_grouped_products`
--

LOCK TABLES `ec_grouped_products` WRITE;
/*!40000 ALTER TABLE `ec_grouped_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_grouped_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoice_items`
--

DROP TABLE IF EXISTS `ec_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_invoice_items_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoice_items`
--

LOCK TABLES `ec_invoice_items` WRITE;
/*!40000 ALTER TABLE `ec_invoice_items` DISABLE KEYS */;
INSERT INTO `ec_invoice_items` VALUES (1,1,'HuberwayCMS\\Ecommerce\\Models\\Product',45,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10-1.jpg',2,1170.00,2340.00,0.00,0.00,2340.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(2,1,'HuberwayCMS\\Ecommerce\\Models\\Product',78,'Ciate Palemore Lipstick Bold Red Color',NULL,'products/23-1.jpg',2,561.00,1122.00,0.00,0.00,1122.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(3,2,'HuberwayCMS\\Ecommerce\\Models\\Product',34,'Red &amp; Black Headphone',NULL,'products/4-1.jpg',1,586.00,586.00,0.00,0.00,586.00,'{\"sku\":\"SW-197-A0-A1\",\"attributes\":\"(Size: M, Color: Black)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(4,3,'HuberwayCMS\\Ecommerce\\Models\\Product',62,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-1.jpg',2,563.00,1126.00,0.00,0.00,1126.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(5,3,'HuberwayCMS\\Ecommerce\\Models\\Product',78,'Ciate Palemore Lipstick Bold Red Color',NULL,'products/23-1.jpg',3,561.00,1683.00,0.00,0.00,1683.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(6,4,'HuberwayCMS\\Ecommerce\\Models\\Product',39,'Audio Equipment',NULL,'products/7.jpg',1,553.00,553.00,0.00,0.00,553.00,'{\"sku\":\"SW-140-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(7,4,'HuberwayCMS\\Ecommerce\\Models\\Product',63,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-2.jpg',2,563.00,1126.00,0.00,0.00,1126.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(8,5,'HuberwayCMS\\Ecommerce\\Models\\Product',76,'Baxter Care Hair Kit For Bearded Mens',NULL,'products/22-1.jpg',3,517.00,1551.00,0.00,0.00,1551.00,'{\"sku\":\"SW-173-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(9,6,'HuberwayCMS\\Ecommerce\\Models\\Product',38,'Nikon HD camera',NULL,'products/6.jpg',3,455.00,1365.00,0.00,0.00,1365.00,'{\"sku\":\"SW-114-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-25 00:45:10','2024-01-25 00:45:10'),(10,7,'HuberwayCMS\\Ecommerce\\Models\\Product',42,'Samsung Smart Phone (Digital)',NULL,'products/9.jpg',3,547.00,1641.00,0.00,0.00,1641.00,'{\"sku\":\"SW-177-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-25 00:45:11','2024-01-25 00:45:11'),(11,8,'HuberwayCMS\\Ecommerce\\Models\\Product',51,'EPSION Plaster Printer',NULL,'products/12-2.jpg',2,529.00,1058.00,0.00,0.00,1058.00,'{\"sku\":\"SW-109-A0-A2\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-25 00:45:11','2024-01-25 00:45:11'),(12,9,'HuberwayCMS\\Ecommerce\\Models\\Product',55,'Sound Intone I65 Earphone White Version (Digital)',NULL,'products/13.jpg',2,543.00,1086.00,0.00,0.00,1086.00,'{\"sku\":\"SW-163-A0-A2\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-25 00:45:11','2024-01-25 00:45:11'),(13,10,'HuberwayCMS\\Ecommerce\\Models\\Product',33,'Red &amp; Black Headphone',NULL,'products/4.jpg',2,586.00,1172.00,0.00,0.00,1172.00,'{\"sku\":\"SW-197-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}','2024-01-25 00:45:11','2024-01-25 00:45:11'),(14,11,'HuberwayCMS\\Ecommerce\\Models\\Product',59,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,'products/15-1.jpg',1,591.00,591.00,0.00,0.00,591.00,'{\"sku\":\"SW-169-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-25 00:45:11','2024-01-25 00:45:11'),(15,12,'HuberwayCMS\\Ecommerce\\Models\\Product',63,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-2.jpg',2,563.00,1126.00,0.00,0.00,1126.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(16,13,'HuberwayCMS\\Ecommerce\\Models\\Product',30,'Beat Headphone',NULL,'products/3.jpg',2,20.00,40.00,0.00,0.00,40.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(17,14,'HuberwayCMS\\Ecommerce\\Models\\Product',46,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10-2.jpg',2,1170.00,2340.00,0.00,0.00,2340.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(18,15,'HuberwayCMS\\Ecommerce\\Models\\Product',75,'Baxter Care Hair Kit For Bearded Mens',NULL,'products/22.jpg',3,517.00,1551.00,0.00,0.00,1551.00,'{\"sku\":\"SW-173-A0\",\"attributes\":\"(Size: L, Color: Brown)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(19,15,'HuberwayCMS\\Ecommerce\\Models\\Product',76,'Baxter Care Hair Kit For Bearded Mens',NULL,'products/22-1.jpg',1,517.00,517.00,0.00,0.00,517.00,'{\"sku\":\"SW-173-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(20,16,'HuberwayCMS\\Ecommerce\\Models\\Product',30,'Beat Headphone',NULL,'products/3.jpg',1,20.00,20.00,0.00,0.00,20.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:12','2024-01-25 00:45:12'),(21,17,'HuberwayCMS\\Ecommerce\\Models\\Product',47,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10.jpg',1,1170.00,1170.00,0.00,0.00,1170.00,'{\"sku\":\"SW-170-A0-A3\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(22,17,'HuberwayCMS\\Ecommerce\\Models\\Product',65,'Aveeno Moisturizing Body Shower 450ml',NULL,'products/18-1.jpg',2,1097.00,2194.00,0.00,0.00,2194.00,'{\"sku\":\"SW-120-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(23,18,'HuberwayCMS\\Ecommerce\\Models\\Product',71,'NYX Beauty Couton Pallete Makeup 12',NULL,'products/20-1.jpg',1,706.00,706.00,0.00,0.00,706.00,'{\"sku\":\"SW-193-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(24,19,'HuberwayCMS\\Ecommerce\\Models\\Product',30,'Beat Headphone',NULL,'products/3.jpg',3,20.00,60.00,0.00,0.00,60.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(25,19,'HuberwayCMS\\Ecommerce\\Models\\Product',36,'Smart Watch External (Digital)',NULL,'products/5.jpg',1,783.00,783.00,0.00,0.00,783.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(26,20,'HuberwayCMS\\Ecommerce\\Models\\Product',46,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10-2.jpg',2,1170.00,2340.00,0.00,0.00,2340.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(27,20,'HuberwayCMS\\Ecommerce\\Models\\Product',63,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-2.jpg',3,563.00,1689.00,0.00,0.00,1689.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(28,21,'HuberwayCMS\\Ecommerce\\Models\\Product',25,'Dual Camera 20MP (Digital)',NULL,'products/1.jpg',2,80.25,160.50,0.00,0.00,160.50,'{\"sku\":\"SW-110-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(29,21,'HuberwayCMS\\Ecommerce\\Models\\Product',35,'Red &amp; Black Headphone',NULL,'products/4-2.jpg',2,586.00,1172.00,0.00,0.00,1172.00,'{\"sku\":\"SW-197-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(30,22,'HuberwayCMS\\Ecommerce\\Models\\Product',42,'Samsung Smart Phone (Digital)',NULL,'products/9.jpg',2,547.00,1094.00,0.00,0.00,1094.00,'{\"sku\":\"SW-177-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-25 00:45:13','2024-01-25 00:45:13'),(31,23,'HuberwayCMS\\Ecommerce\\Models\\Product',26,'Dual Camera 20MP (Digital)',NULL,'products/1.jpg',1,80.25,80.25,0.00,0.00,80.25,'{\"sku\":\"SW-110-A0-A2\",\"attributes\":\"(Color: Green, Size: L)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(32,24,'HuberwayCMS\\Ecommerce\\Models\\Product',62,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-1.jpg',2,563.00,1126.00,0.00,0.00,1126.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(33,25,'HuberwayCMS\\Ecommerce\\Models\\Product',70,'NYX Beauty Couton Pallete Makeup 12',NULL,'products/20.jpg',3,706.00,2118.00,0.00,0.00,2118.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(34,26,'HuberwayCMS\\Ecommerce\\Models\\Product',49,'EPSION Plaster Printer',NULL,'products/12.jpg',1,529.00,529.00,0.00,0.00,529.00,'{\"sku\":\"SW-109-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(35,26,'HuberwayCMS\\Ecommerce\\Models\\Product',52,'EPSION Plaster Printer',NULL,'products/12-3.jpg',1,529.00,529.00,0.00,0.00,529.00,'{\"sku\":\"SW-109-A0-A3\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(36,26,'HuberwayCMS\\Ecommerce\\Models\\Product',70,'NYX Beauty Couton Pallete Makeup 12',NULL,'products/20.jpg',3,706.00,2118.00,0.00,0.00,2118.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(37,27,'HuberwayCMS\\Ecommerce\\Models\\Product',46,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10-2.jpg',1,1170.00,1170.00,0.00,0.00,1170.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:14','2024-01-25 00:45:14'),(38,28,'HuberwayCMS\\Ecommerce\\Models\\Product',60,'Apple MacBook Air Retina 12-Inch Laptop',NULL,'products/16.jpg',1,501.00,501.00,0.00,0.00,501.00,'{\"sku\":\"SW-195-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(39,29,'HuberwayCMS\\Ecommerce\\Models\\Product',55,'Sound Intone I65 Earphone White Version (Digital)',NULL,'products/13.jpg',2,543.00,1086.00,0.00,0.00,1086.00,'{\"sku\":\"SW-163-A0-A2\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(40,30,'HuberwayCMS\\Ecommerce\\Models\\Product',58,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,'products/15.jpg',2,591.00,1182.00,0.00,0.00,1182.00,'{\"sku\":\"SW-169-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(41,31,'HuberwayCMS\\Ecommerce\\Models\\Product',34,'Red &amp; Black Headphone',NULL,'products/4-1.jpg',2,586.00,1172.00,0.00,0.00,1172.00,'{\"sku\":\"SW-197-A0-A1\",\"attributes\":\"(Size: M, Color: Black)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(42,32,'HuberwayCMS\\Ecommerce\\Models\\Product',36,'Smart Watch External (Digital)',NULL,'products/5.jpg',2,783.00,1566.00,0.00,0.00,1566.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(43,33,'HuberwayCMS\\Ecommerce\\Models\\Product',56,'B&amp;O Play Mini Bluetooth Speaker',NULL,'products/14.jpg',3,564.00,1692.00,0.00,0.00,1692.00,'{\"sku\":\"SW-114-A0\",\"attributes\":\"(Color: Green, Size: M)\"}','2024-01-25 00:45:15','2024-01-25 00:45:15'),(44,34,'HuberwayCMS\\Ecommerce\\Models\\Product',62,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,'products/17-1.jpg',2,563.00,1126.00,0.00,0.00,1126.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(45,35,'HuberwayCMS\\Ecommerce\\Models\\Product',27,'Smart Watches',NULL,'products/2.jpg',1,40.50,40.50,0.00,0.00,40.50,'{\"sku\":\"SW-105-A0\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(46,35,'HuberwayCMS\\Ecommerce\\Models\\Product',39,'Audio Equipment',NULL,'products/7.jpg',1,553.00,553.00,0.00,0.00,553.00,'{\"sku\":\"SW-140-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(47,36,'HuberwayCMS\\Ecommerce\\Models\\Product',36,'Smart Watch External (Digital)',NULL,'products/5.jpg',3,783.00,2349.00,0.00,0.00,2349.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(48,37,'HuberwayCMS\\Ecommerce\\Models\\Product',48,'Xbox One Wireless Controller Black Color',NULL,'products/11.jpg',1,1104.00,1104.00,0.00,0.00,1104.00,'{\"sku\":\"SW-129-A0\",\"attributes\":\"(Size: S, Color: Black)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(49,38,'HuberwayCMS\\Ecommerce\\Models\\Product',52,'EPSION Plaster Printer',NULL,'products/12-3.jpg',3,529.00,1587.00,0.00,0.00,1587.00,'{\"sku\":\"SW-109-A0-A3\",\"attributes\":\"(Color: Black, Size: XL)\"}','2024-01-25 00:45:16','2024-01-25 00:45:16'),(50,39,'HuberwayCMS\\Ecommerce\\Models\\Product',60,'Apple MacBook Air Retina 12-Inch Laptop',NULL,'products/16.jpg',2,501.00,1002.00,0.00,0.00,1002.00,'{\"sku\":\"SW-195-A0\",\"attributes\":\"(Color: Green, Size: S)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(51,40,'HuberwayCMS\\Ecommerce\\Models\\Product',64,'Aveeno Moisturizing Body Shower 450ml',NULL,'products/18.jpg',1,1097.00,1097.00,0.00,0.00,1097.00,'{\"sku\":\"SW-120-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(52,41,'HuberwayCMS\\Ecommerce\\Models\\Product',30,'Beat Headphone',NULL,'products/3.jpg',1,20.00,20.00,0.00,0.00,20.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(53,42,'HuberwayCMS\\Ecommerce\\Models\\Product',45,'Herschel Leather Duffle Bag In Brown Color',NULL,'products/10-1.jpg',3,1170.00,3510.00,0.00,0.00,3510.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(54,43,'HuberwayCMS\\Ecommerce\\Models\\Product',40,'Audio Equipment',NULL,'products/7.jpg',3,553.00,1659.00,0.00,0.00,1659.00,'{\"sku\":\"SW-140-A0-A1\",\"attributes\":\"(Size: M, Color: Red)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(55,44,'HuberwayCMS\\Ecommerce\\Models\\Product',48,'Xbox One Wireless Controller Black Color',NULL,'products/11.jpg',1,1104.00,1104.00,0.00,0.00,1104.00,'{\"sku\":\"SW-129-A0\",\"attributes\":\"(Size: S, Color: Black)\"}','2024-01-25 00:45:17','2024-01-25 00:45:17'),(56,45,'HuberwayCMS\\Ecommerce\\Models\\Product',57,'B&amp;O Play Mini Bluetooth Speaker',NULL,'products/14.jpg',2,564.00,1128.00,0.00,0.00,1128.00,'{\"sku\":\"SW-114-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}','2024-01-25 00:45:18','2024-01-25 00:45:18'),(57,45,'HuberwayCMS\\Ecommerce\\Models\\Product',70,'NYX Beauty Couton Pallete Makeup 12',NULL,'products/20.jpg',2,706.00,1412.00,0.00,0.00,1412.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}','2024-01-25 00:45:18','2024-01-25 00:45:18'),(58,46,'HuberwayCMS\\Ecommerce\\Models\\Product',27,'Smart Watches',NULL,'products/2.jpg',3,40.50,121.50,0.00,0.00,121.50,'{\"sku\":\"SW-105-A0\",\"attributes\":\"(Color: Red, Size: L)\"}','2024-01-25 00:45:18','2024-01-25 00:45:18'),(59,47,'HuberwayCMS\\Ecommerce\\Models\\Product',36,'Smart Watch External (Digital)',NULL,'products/5.jpg',3,783.00,2349.00,0.00,0.00,2349.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}','2024-01-25 00:45:18','2024-01-25 00:45:18'),(60,47,'HuberwayCMS\\Ecommerce\\Models\\Product',68,'NYX Beauty Couton Pallete Makeup 12',NULL,'products/19-1.jpg',2,1035.00,2070.00,0.00,0.00,2070.00,'{\"sku\":\"SW-153-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}','2024-01-25 00:45:18','2024-01-25 00:45:18');
/*!40000 ALTER TABLE `ec_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_invoices`
--

DROP TABLE IF EXISTS `ec_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_tax_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_id` bigint unsigned DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_invoices_code_unique` (`code`),
  KEY `ec_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `ec_invoices_payment_id_index` (`payment_id`),
  KEY `ec_invoices_status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_invoices`
--

LOCK TABLES `ec_invoices` WRITE;
/*!40000 ALTER TABLE `ec_invoices` DISABLE KEYS */;
INSERT INTO `ec_invoices` VALUES (1,'HuberwayCMS\\Ecommerce\\Models\\Order',1,'INV-1','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,3462.00,0.00,0.00,0.00,'1','default',NULL,NULL,3462.00,NULL,1,'completed','2024-01-25 00:45:09','2024-01-18 08:45:09','2024-01-25 00:45:10'),(2,'HuberwayCMS\\Ecommerce\\Models\\Order',2,'INV-2','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,586.00,0.00,0.00,0.00,'1','default',NULL,NULL,586.00,NULL,2,'completed','2024-01-25 00:45:10','2024-01-09 04:45:10','2024-01-25 00:45:10'),(3,'HuberwayCMS\\Ecommerce\\Models\\Order',3,'INV-3','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,2809.00,0.00,0.00,0.00,'1','default',NULL,NULL,2809.00,NULL,3,'pending',NULL,'2024-01-21 20:45:10','2024-01-25 00:45:10'),(4,'HuberwayCMS\\Ecommerce\\Models\\Order',4,'INV-4','Chaz Donnelly','',NULL,'ksmitham@example.net','+16407498133','81814 Jake Walk Apt. 083, East Rashawnville, Washington, NA',NULL,1679.00,0.00,0.00,0.00,'1','default',NULL,NULL,1679.00,NULL,4,'completed','2024-01-25 00:45:10','2024-01-10 00:45:10','2024-01-25 00:45:10'),(5,'HuberwayCMS\\Ecommerce\\Models\\Order',5,'INV-5','Chaz Donnelly','',NULL,'ksmitham@example.net','+16407498133','81814 Jake Walk Apt. 083, East Rashawnville, Washington, NA',NULL,1551.00,0.00,0.00,0.00,'1','default',NULL,NULL,1551.00,NULL,5,'completed','2024-01-25 00:45:10','2024-01-20 12:45:10','2024-01-25 00:45:10'),(6,'HuberwayCMS\\Ecommerce\\Models\\Order',6,'INV-6','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,1365.00,0.00,0.00,0.00,'1','default',NULL,NULL,1365.00,NULL,6,'completed','2024-01-25 00:45:10','2024-01-12 06:45:10','2024-01-25 00:45:10'),(7,'HuberwayCMS\\Ecommerce\\Models\\Order',7,'INV-7','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,1641.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1641.00,NULL,7,'completed','2024-01-25 00:45:11','2024-01-17 22:45:11','2024-01-25 00:45:11'),(8,'HuberwayCMS\\Ecommerce\\Models\\Order',8,'INV-8','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1058.00,0.00,0.00,0.00,'1','default',NULL,NULL,1058.00,NULL,8,'completed','2024-01-25 00:45:11','2024-01-11 16:45:11','2024-01-25 00:45:11'),(9,'HuberwayCMS\\Ecommerce\\Models\\Order',9,'INV-9','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1086.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1086.00,NULL,9,'completed','2024-01-25 00:45:11','2024-01-17 00:45:11','2024-01-25 00:45:11'),(10,'HuberwayCMS\\Ecommerce\\Models\\Order',10,'INV-10','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1172.00,0.00,0.00,0.00,'1','default',NULL,NULL,1172.00,NULL,10,'completed','2024-01-25 00:45:11','2024-01-18 18:45:11','2024-01-25 00:45:11'),(11,'HuberwayCMS\\Ecommerce\\Models\\Order',11,'INV-11','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,591.00,0.00,0.00,0.00,'1','default',NULL,NULL,591.00,NULL,11,'completed','2024-01-25 00:45:11','2024-01-16 06:45:11','2024-01-25 00:45:11'),(12,'HuberwayCMS\\Ecommerce\\Models\\Order',12,'INV-12','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1126.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1126.00,NULL,12,'pending',NULL,'2024-01-18 18:45:12','2024-01-25 00:45:12'),(13,'HuberwayCMS\\Ecommerce\\Models\\Order',13,'INV-13','Chaz Donnelly','',NULL,'ksmitham@example.net','+16407498133','81814 Jake Walk Apt. 083, East Rashawnville, Washington, NA',NULL,40.00,0.00,0.00,0.00,'1','default',NULL,NULL,40.00,NULL,13,'completed','2024-01-25 00:45:12','2024-01-23 20:45:12','2024-01-25 00:45:12'),(14,'HuberwayCMS\\Ecommerce\\Models\\Order',14,'INV-14','Chaz Donnelly','',NULL,'ksmitham@example.net','+16407498133','81814 Jake Walk Apt. 083, East Rashawnville, Washington, NA',NULL,2340.00,0.00,0.00,0.00,'1','default',NULL,NULL,2340.00,NULL,14,'completed','2024-01-25 00:45:12','2024-01-23 20:45:12','2024-01-25 00:45:12'),(15,'HuberwayCMS\\Ecommerce\\Models\\Order',15,'INV-15','Chaz Donnelly','',NULL,'ksmitham@example.net','+16407498133','81814 Jake Walk Apt. 083, East Rashawnville, Washington, NA',NULL,2068.00,0.00,0.00,0.00,'1','default',NULL,NULL,2068.00,NULL,15,'pending',NULL,'2024-01-22 16:45:12','2024-01-25 00:45:12'),(16,'HuberwayCMS\\Ecommerce\\Models\\Order',16,'INV-16','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,20.00,0.00,0.00,0.00,'1','default',NULL,NULL,20.00,NULL,16,'pending',NULL,'2024-01-22 20:45:12','2024-01-25 00:45:12'),(17,'HuberwayCMS\\Ecommerce\\Models\\Order',17,'INV-17','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,3364.00,0.00,0.00,0.00,'1','default',NULL,NULL,3364.00,NULL,17,'completed','2024-01-25 00:45:13','2024-01-23 22:45:13','2024-01-25 00:45:13'),(18,'HuberwayCMS\\Ecommerce\\Models\\Order',18,'INV-18','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,706.00,0.00,0.00,0.00,'1','default',NULL,NULL,706.00,NULL,18,'completed','2024-01-25 00:45:13','2024-01-21 18:45:13','2024-01-25 00:45:13'),(19,'HuberwayCMS\\Ecommerce\\Models\\Order',19,'INV-19','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,843.00,0.00,0.00,0.00,'1','default',NULL,NULL,843.00,NULL,19,'completed','2024-01-25 00:45:13','2024-01-15 00:45:13','2024-01-25 00:45:13'),(20,'HuberwayCMS\\Ecommerce\\Models\\Order',20,'INV-20','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,4029.00,0.00,0.00,0.00,'1','default',NULL,NULL,4029.00,NULL,20,'completed','2024-01-25 00:45:13','2024-01-22 00:45:13','2024-01-25 00:45:13'),(21,'HuberwayCMS\\Ecommerce\\Models\\Order',21,'INV-21','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,1332.50,0.00,0.00,0.00,'1','default',NULL,NULL,1332.50,NULL,21,'completed','2024-01-25 00:45:13','2024-01-22 06:45:13','2024-01-25 00:45:13'),(22,'HuberwayCMS\\Ecommerce\\Models\\Order',22,'INV-22','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,1094.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1094.00,NULL,22,'completed','2024-01-25 00:45:13','2024-01-19 12:45:13','2024-01-25 00:45:13'),(23,'HuberwayCMS\\Ecommerce\\Models\\Order',23,'INV-23','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,80.25,0.00,0.00,0.00,NULL,'',NULL,NULL,80.25,NULL,23,'completed','2024-01-25 00:45:14','2024-01-20 00:45:14','2024-01-25 00:45:14'),(24,'HuberwayCMS\\Ecommerce\\Models\\Order',24,'INV-24','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,1126.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1126.00,NULL,24,'pending',NULL,'2024-01-20 20:45:14','2024-01-25 00:45:14'),(25,'HuberwayCMS\\Ecommerce\\Models\\Order',25,'INV-25','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,2118.00,0.00,0.00,0.00,'1','default',NULL,NULL,2118.00,NULL,25,'completed','2024-01-25 00:45:14','2024-01-23 08:45:14','2024-01-25 00:45:14'),(26,'HuberwayCMS\\Ecommerce\\Models\\Order',26,'INV-26','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,3176.00,0.00,0.00,0.00,'1','default',NULL,NULL,3176.00,NULL,26,'completed','2024-01-25 00:45:14','2024-01-19 18:45:14','2024-01-25 00:45:14'),(27,'HuberwayCMS\\Ecommerce\\Models\\Order',27,'INV-27','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1170.00,0.00,0.00,0.00,'1','default',NULL,NULL,1170.00,NULL,27,'completed','2024-01-25 00:45:14','2024-01-20 08:45:14','2024-01-25 00:45:14'),(28,'HuberwayCMS\\Ecommerce\\Models\\Order',28,'INV-28','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,501.00,0.00,0.00,0.00,'1','default',NULL,NULL,501.00,NULL,28,'completed','2024-01-25 00:45:15','2024-01-18 08:45:15','2024-01-25 00:45:15'),(29,'HuberwayCMS\\Ecommerce\\Models\\Order',29,'INV-29','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,1086.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1086.00,NULL,29,'completed','2024-01-25 00:45:15','2024-01-19 04:45:15','2024-01-25 00:45:15'),(30,'HuberwayCMS\\Ecommerce\\Models\\Order',30,'INV-30','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,1182.00,0.00,0.00,0.00,'1','default',NULL,NULL,1182.00,NULL,30,'completed','2024-01-25 00:45:15','2024-01-22 02:45:15','2024-01-25 00:45:15'),(31,'HuberwayCMS\\Ecommerce\\Models\\Order',31,'INV-31','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1172.00,0.00,0.00,0.00,'1','default',NULL,NULL,1172.00,NULL,31,'pending',NULL,'2024-01-21 12:45:15','2024-01-25 00:45:15'),(32,'HuberwayCMS\\Ecommerce\\Models\\Order',32,'INV-32','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1566.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1566.00,NULL,32,'completed','2024-01-25 00:45:15','2024-01-20 12:45:15','2024-01-25 00:45:15'),(33,'HuberwayCMS\\Ecommerce\\Models\\Order',33,'INV-33','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1692.00,0.00,0.00,0.00,'1','default',NULL,NULL,1692.00,NULL,33,'completed','2024-01-25 00:45:15','2024-01-24 12:45:15','2024-01-25 00:45:15'),(34,'HuberwayCMS\\Ecommerce\\Models\\Order',34,'INV-34','Prof. Orland Schaefer IV','',NULL,'maymie02@example.com','+13026004099','1230 Hauck Union, Padbergfort, Hawaii, IQ',NULL,1126.00,0.00,0.00,0.00,NULL,'',NULL,NULL,1126.00,NULL,34,'completed','2024-01-25 00:45:16','2024-01-23 12:45:16','2024-01-25 00:45:16'),(35,'HuberwayCMS\\Ecommerce\\Models\\Order',35,'INV-35','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,593.50,0.00,0.00,0.00,'1','default',NULL,NULL,593.50,NULL,35,'completed','2024-01-25 00:45:16','2024-01-24 04:45:16','2024-01-25 00:45:16'),(36,'HuberwayCMS\\Ecommerce\\Models\\Order',36,'INV-36','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,2349.00,0.00,0.00,0.00,NULL,'',NULL,NULL,2349.00,NULL,36,'completed','2024-01-25 00:45:16','2024-01-24 04:45:16','2024-01-25 00:45:16'),(37,'HuberwayCMS\\Ecommerce\\Models\\Order',37,'INV-37','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,1104.00,0.00,0.00,0.00,'1','default',NULL,NULL,1104.00,NULL,37,'pending',NULL,'2024-01-22 16:45:16','2024-01-25 00:45:16'),(38,'HuberwayCMS\\Ecommerce\\Models\\Order',38,'INV-38','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,1587.00,0.00,0.00,0.00,'1','default',NULL,NULL,1587.00,NULL,38,'pending',NULL,'2024-01-24 16:45:16','2024-01-25 00:45:16'),(39,'HuberwayCMS\\Ecommerce\\Models\\Order',39,'INV-39','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,1002.00,0.00,0.00,0.00,'1','default',NULL,NULL,1002.00,NULL,39,'completed','2024-01-25 00:45:17','2024-01-22 00:45:17','2024-01-25 00:45:17'),(40,'HuberwayCMS\\Ecommerce\\Models\\Order',40,'INV-40','Prof. Jaunita O\'Connell','',NULL,'pharris@example.org','+17123324423','5030 Shanelle Fort, Alvertaview, Maine, VU',NULL,1097.00,0.00,0.00,0.00,'1','default',NULL,NULL,1097.00,NULL,40,'completed','2024-01-25 00:45:17','2024-01-22 16:45:17','2024-01-25 00:45:17'),(41,'HuberwayCMS\\Ecommerce\\Models\\Order',41,'INV-41','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,20.00,0.00,0.00,0.00,'1','default',NULL,NULL,20.00,NULL,41,'completed','2024-01-25 00:45:17','2024-01-24 18:45:17','2024-01-25 00:45:17'),(42,'HuberwayCMS\\Ecommerce\\Models\\Order',42,'INV-42','Reva Legros','',NULL,'customer@huberway.com','+15073516517','127 Brenda Forest, Port Morris, District of Columbia, MK',NULL,3510.00,0.00,0.00,0.00,'1','default',NULL,NULL,3510.00,NULL,42,'completed','2024-01-25 00:45:17','2024-01-22 12:45:17','2024-01-25 00:45:17'),(43,'HuberwayCMS\\Ecommerce\\Models\\Order',43,'INV-43','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,1659.00,0.00,0.00,0.00,'1','default',NULL,NULL,1659.00,NULL,43,'completed','2024-01-25 00:45:17','2024-01-24 12:45:17','2024-01-25 00:45:17'),(44,'HuberwayCMS\\Ecommerce\\Models\\Order',44,'INV-44','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,1104.00,0.00,0.00,0.00,'1','default',NULL,NULL,1104.00,NULL,44,'pending',NULL,'2024-01-24 12:45:17','2024-01-25 00:45:17'),(45,'HuberwayCMS\\Ecommerce\\Models\\Order',45,'INV-45','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,2540.00,0.00,0.00,0.00,'1','default',NULL,NULL,2540.00,NULL,45,'completed','2024-01-25 00:45:18','2024-01-23 20:45:18','2024-01-25 00:45:18'),(46,'HuberwayCMS\\Ecommerce\\Models\\Order',46,'INV-46','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,121.50,0.00,0.00,0.00,'1','default',NULL,NULL,121.50,NULL,46,'completed','2024-01-25 00:45:18','2024-01-24 16:45:18','2024-01-25 00:45:18'),(47,'HuberwayCMS\\Ecommerce\\Models\\Order',47,'INV-47','Greyson Trantow','',NULL,'bahringer.rocio@example.org','+18438367067','406 Ferry Green, Jaskolskifurt, Indiana, AS',NULL,4419.00,0.00,0.00,0.00,'1','default',NULL,NULL,4419.00,NULL,47,'completed','2024-01-25 00:45:18','2024-01-24 16:45:18','2024-01-25 00:45:18');
/*!40000 ALTER TABLE `ec_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value`
--

DROP TABLE IF EXISTS `ec_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value` (
  `option_id` bigint unsigned NOT NULL COMMENT 'option id',
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `option_value` tinytext COLLATE utf8mb4_unicode_ci COMMENT 'option value',
  `affect_price` double DEFAULT NULL COMMENT 'value of price of this option affect',
  `order` int NOT NULL DEFAULT '9999',
  `affect_type` tinyint NOT NULL DEFAULT '0' COMMENT '0. fixed 1. percent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value`
--

LOCK TABLES `ec_option_value` WRITE;
/*!40000 ALTER TABLE `ec_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_option_value_translations`
--

DROP TABLE IF EXISTS `ec_option_value_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_option_value_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_option_value_id` bigint unsigned NOT NULL,
  `option_value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_option_value_translations`
--

LOCK TABLES `ec_option_value_translations` WRITE;
/*!40000 ALTER TABLE `ec_option_value_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_option_value_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options`
--

DROP TABLE IF EXISTS `ec_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Name of options',
  `option_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'option type',
  `product_id` bigint unsigned NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '9999',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Checked if this option is required',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options`
--

LOCK TABLES `ec_options` WRITE;
/*!40000 ALTER TABLE `ec_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_options_translations`
--

DROP TABLE IF EXISTS `ec_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_options_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_options_translations`
--

LOCK TABLES `ec_options_translations` WRITE;
/*!40000 ALTER TABLE `ec_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_addresses`
--

DROP TABLE IF EXISTS `ec_order_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_addresses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'shipping_address',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_addresses`
--

LOCK TABLES `ec_order_addresses` WRITE;
/*!40000 ALTER TABLE `ec_order_addresses` DISABLE KEYS */;
INSERT INTO `ec_order_addresses` VALUES (1,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',1,'87907','shipping_address'),(2,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',2,'67319','shipping_address'),(3,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',3,'67319','shipping_address'),(4,'Chaz Donnelly','+16407498133','ksmitham@example.net','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',4,'81047','shipping_address'),(5,'Chaz Donnelly','+16407498133','ksmitham@example.net','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',5,'81047','shipping_address'),(6,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',6,'88089-4846','shipping_address'),(7,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',7,'88089-4846','shipping_address'),(8,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',8,'21194','shipping_address'),(9,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',9,'21194','shipping_address'),(10,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',10,'21194','shipping_address'),(11,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',11,'21194','shipping_address'),(12,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',12,'21194','shipping_address'),(13,'Chaz Donnelly','+16407498133','ksmitham@example.net','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',13,'81047','shipping_address'),(14,'Chaz Donnelly','+16407498133','ksmitham@example.net','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',14,'81047','shipping_address'),(15,'Chaz Donnelly','+16407498133','ksmitham@example.net','NA','Washington','East Rashawnville','81814 Jake Walk Apt. 083',15,'81047','shipping_address'),(16,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',16,'88089-4846','shipping_address'),(17,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',17,'88089-4846','shipping_address'),(18,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',18,'88089-4846','shipping_address'),(19,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',19,'87907','shipping_address'),(20,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',20,'87907','shipping_address'),(21,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',21,'87907','shipping_address'),(22,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',22,'87907','shipping_address'),(23,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',23,'87907','shipping_address'),(24,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',24,'87907','shipping_address'),(25,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',25,'87907','shipping_address'),(26,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',26,'21194','shipping_address'),(27,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',27,'21194','shipping_address'),(28,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',28,'21194','shipping_address'),(29,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',29,'88089-4846','shipping_address'),(30,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',30,'88089-4846','shipping_address'),(31,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',31,'21194','shipping_address'),(32,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',32,'21194','shipping_address'),(33,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',33,'21194','shipping_address'),(34,'Prof. Orland Schaefer IV','+13026004099','maymie02@example.com','IQ','Hawaii','Padbergfort','1230 Hauck Union',34,'21194','shipping_address'),(35,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',35,'87907','shipping_address'),(36,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',36,'87907','shipping_address'),(37,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',37,'67319','shipping_address'),(38,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',38,'67319','shipping_address'),(39,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',39,'67319','shipping_address'),(40,'Prof. Jaunita O\'Connell','+17123324423','pharris@example.org','VU','Maine','Alvertaview','5030 Shanelle Fort',40,'67319','shipping_address'),(41,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',41,'88089-4846','shipping_address'),(42,'Reva Legros','+15073516517','customer@huberway.com','MK','District of Columbia','Port Morris','127 Brenda Forest',42,'88089-4846','shipping_address'),(43,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',43,'87907','shipping_address'),(44,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',44,'87907','shipping_address'),(45,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',45,'87907','shipping_address'),(46,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',46,'87907','shipping_address'),(47,'Greyson Trantow','+18438367067','bahringer.rocio@example.org','AS','Indiana','Jaskolskifurt','406 Ferry Green',47,'87907','shipping_address');
/*!40000 ALTER TABLE `ec_order_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_histories`
--

DROP TABLE IF EXISTS `ec_order_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL,
  `extras` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_histories`
--

LOCK TABLES `ec_order_histories` WRITE;
/*!40000 ALTER TABLE `ec_order_histories` DISABLE KEYS */;
INSERT INTO `ec_order_histories` VALUES (1,'create_order_from_seeder','Order is created from the checkout page',NULL,1,NULL,'2024-01-18 08:45:09','2024-01-18 08:45:09'),(2,'confirm_order','Order was verified by %user_name%',0,1,NULL,'2024-01-18 08:45:09','2024-01-18 08:45:09'),(3,'confirm_payment','Payment was confirmed (amount $3,462.00) by %user_name%',0,1,NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09'),(4,'create_shipment','Created shipment for order',0,1,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(5,'create_order_from_seeder','Order is created from the checkout page',NULL,2,NULL,'2024-01-09 04:45:10','2024-01-09 04:45:10'),(6,'confirm_order','Order was verified by %user_name%',0,2,NULL,'2024-01-09 04:45:10','2024-01-09 04:45:10'),(7,'confirm_payment','Payment was confirmed (amount $586.00) by %user_name%',0,2,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(8,'create_shipment','Created shipment for order',0,2,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(9,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,2,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(10,'create_order_from_seeder','Order is created from the checkout page',NULL,3,NULL,'2024-01-21 20:45:10','2024-01-21 20:45:10'),(11,'confirm_order','Order was verified by %user_name%',0,3,NULL,'2024-01-21 20:45:10','2024-01-21 20:45:10'),(12,'create_shipment','Created shipment for order',0,3,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(13,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(14,'create_order_from_seeder','Order is created from the checkout page',NULL,4,NULL,'2024-01-10 00:45:10','2024-01-10 00:45:10'),(15,'confirm_order','Order was verified by %user_name%',0,4,NULL,'2024-01-10 00:45:10','2024-01-10 00:45:10'),(16,'confirm_payment','Payment was confirmed (amount $1,679.00) by %user_name%',0,4,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(17,'create_shipment','Created shipment for order',0,4,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(18,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,4,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(19,'create_order_from_seeder','Order is created from the checkout page',NULL,5,NULL,'2024-01-20 12:45:10','2024-01-20 12:45:10'),(20,'confirm_order','Order was verified by %user_name%',0,5,NULL,'2024-01-20 12:45:10','2024-01-20 12:45:10'),(21,'confirm_payment','Payment was confirmed (amount $1,551.00) by %user_name%',0,5,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(22,'create_shipment','Created shipment for order',0,5,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(23,'create_order_from_seeder','Order is created from the checkout page',NULL,6,NULL,'2024-01-12 06:45:10','2024-01-12 06:45:10'),(24,'confirm_order','Order was verified by %user_name%',0,6,NULL,'2024-01-12 06:45:10','2024-01-12 06:45:10'),(25,'confirm_payment','Payment was confirmed (amount $1,365.00) by %user_name%',0,6,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10'),(26,'create_shipment','Created shipment for order',0,6,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(27,'create_order_from_seeder','Order is created from the checkout page',NULL,7,NULL,'2024-01-17 22:45:11','2024-01-17 22:45:11'),(28,'confirm_order','Order was verified by %user_name%',0,7,NULL,'2024-01-17 22:45:11','2024-01-17 22:45:11'),(29,'confirm_payment','Payment was confirmed (amount $1,641.00) by %user_name%',0,7,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(30,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,7,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(31,'create_order_from_seeder','Order is created from the checkout page',NULL,8,NULL,'2024-01-11 16:45:11','2024-01-11 16:45:11'),(32,'confirm_order','Order was verified by %user_name%',0,8,NULL,'2024-01-11 16:45:11','2024-01-11 16:45:11'),(33,'confirm_payment','Payment was confirmed (amount $1,058.00) by %user_name%',0,8,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(34,'create_shipment','Created shipment for order',0,8,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(35,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(36,'create_order_from_seeder','Order is created from the checkout page',NULL,9,NULL,'2024-01-17 00:45:11','2024-01-17 00:45:11'),(37,'confirm_order','Order was verified by %user_name%',0,9,NULL,'2024-01-17 00:45:11','2024-01-17 00:45:11'),(38,'confirm_payment','Payment was confirmed (amount $1,086.00) by %user_name%',0,9,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(39,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,9,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(40,'create_order_from_seeder','Order is created from the checkout page',NULL,10,NULL,'2024-01-18 18:45:11','2024-01-18 18:45:11'),(41,'confirm_order','Order was verified by %user_name%',0,10,NULL,'2024-01-18 18:45:11','2024-01-18 18:45:11'),(42,'confirm_payment','Payment was confirmed (amount $1,172.00) by %user_name%',0,10,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(43,'create_shipment','Created shipment for order',0,10,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(44,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,10,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(45,'create_order_from_seeder','Order is created from the checkout page',NULL,11,NULL,'2024-01-16 06:45:11','2024-01-16 06:45:11'),(46,'confirm_order','Order was verified by %user_name%',0,11,NULL,'2024-01-16 06:45:11','2024-01-16 06:45:11'),(47,'confirm_payment','Payment was confirmed (amount $591.00) by %user_name%',0,11,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11'),(48,'create_shipment','Created shipment for order',0,11,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(49,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,11,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(50,'create_order_from_seeder','Order is created from the checkout page',NULL,12,NULL,'2024-01-18 18:45:12','2024-01-18 18:45:12'),(51,'confirm_order','Order was verified by %user_name%',0,12,NULL,'2024-01-18 18:45:12','2024-01-18 18:45:12'),(52,'create_order_from_seeder','Order is created from the checkout page',NULL,13,NULL,'2024-01-23 20:45:12','2024-01-23 20:45:12'),(53,'confirm_order','Order was verified by %user_name%',0,13,NULL,'2024-01-23 20:45:12','2024-01-23 20:45:12'),(54,'confirm_payment','Payment was confirmed (amount $40.00) by %user_name%',0,13,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(55,'create_shipment','Created shipment for order',0,13,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(56,'create_order_from_seeder','Order is created from the checkout page',NULL,14,NULL,'2024-01-23 20:45:12','2024-01-23 20:45:12'),(57,'confirm_order','Order was verified by %user_name%',0,14,NULL,'2024-01-23 20:45:12','2024-01-23 20:45:12'),(58,'confirm_payment','Payment was confirmed (amount $2,340.00) by %user_name%',0,14,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(59,'create_shipment','Created shipment for order',0,14,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(60,'create_order_from_seeder','Order is created from the checkout page',NULL,15,NULL,'2024-01-22 16:45:12','2024-01-22 16:45:12'),(61,'confirm_order','Order was verified by %user_name%',0,15,NULL,'2024-01-22 16:45:12','2024-01-22 16:45:12'),(62,'create_shipment','Created shipment for order',0,15,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(63,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,15,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12'),(64,'create_order_from_seeder','Order is created from the checkout page',NULL,16,NULL,'2024-01-22 20:45:12','2024-01-22 20:45:12'),(65,'confirm_order','Order was verified by %user_name%',0,16,NULL,'2024-01-22 20:45:12','2024-01-22 20:45:12'),(66,'create_shipment','Created shipment for order',0,16,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(67,'create_order_from_seeder','Order is created from the checkout page',NULL,17,NULL,'2024-01-23 22:45:13','2024-01-23 22:45:13'),(68,'confirm_order','Order was verified by %user_name%',0,17,NULL,'2024-01-23 22:45:13','2024-01-23 22:45:13'),(69,'confirm_payment','Payment was confirmed (amount $3,364.00) by %user_name%',0,17,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(70,'create_shipment','Created shipment for order',0,17,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(71,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,17,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(72,'create_order_from_seeder','Order is created from the checkout page',NULL,18,NULL,'2024-01-21 18:45:13','2024-01-21 18:45:13'),(73,'confirm_order','Order was verified by %user_name%',0,18,NULL,'2024-01-21 18:45:13','2024-01-21 18:45:13'),(74,'confirm_payment','Payment was confirmed (amount $706.00) by %user_name%',0,18,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(75,'create_shipment','Created shipment for order',0,18,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(76,'create_order_from_seeder','Order is created from the checkout page',NULL,19,NULL,'2024-01-15 00:45:13','2024-01-15 00:45:13'),(77,'confirm_order','Order was verified by %user_name%',0,19,NULL,'2024-01-15 00:45:13','2024-01-15 00:45:13'),(78,'confirm_payment','Payment was confirmed (amount $843.00) by %user_name%',0,19,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(79,'create_shipment','Created shipment for order',0,19,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(80,'create_order_from_seeder','Order is created from the checkout page',NULL,20,NULL,'2024-01-22 00:45:13','2024-01-22 00:45:13'),(81,'confirm_order','Order was verified by %user_name%',0,20,NULL,'2024-01-22 00:45:13','2024-01-22 00:45:13'),(82,'confirm_payment','Payment was confirmed (amount $4,029.00) by %user_name%',0,20,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(83,'create_shipment','Created shipment for order',0,20,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(84,'create_order_from_seeder','Order is created from the checkout page',NULL,21,NULL,'2024-01-22 06:45:13','2024-01-22 06:45:13'),(85,'confirm_order','Order was verified by %user_name%',0,21,NULL,'2024-01-22 06:45:13','2024-01-22 06:45:13'),(86,'confirm_payment','Payment was confirmed (amount $1,332.50) by %user_name%',0,21,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(87,'create_shipment','Created shipment for order',0,21,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(88,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,21,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(89,'create_order_from_seeder','Order is created from the checkout page',NULL,22,NULL,'2024-01-19 12:45:13','2024-01-19 12:45:13'),(90,'confirm_order','Order was verified by %user_name%',0,22,NULL,'2024-01-19 12:45:13','2024-01-19 12:45:13'),(91,'confirm_payment','Payment was confirmed (amount $1,094.00) by %user_name%',0,22,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13'),(92,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,22,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(93,'create_order_from_seeder','Order is created from the checkout page',NULL,23,NULL,'2024-01-20 00:45:14','2024-01-20 00:45:14'),(94,'confirm_order','Order was verified by %user_name%',0,23,NULL,'2024-01-20 00:45:14','2024-01-20 00:45:14'),(95,'confirm_payment','Payment was confirmed (amount $80.25) by %user_name%',0,23,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(96,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,23,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(97,'create_order_from_seeder','Order is created from the checkout page',NULL,24,NULL,'2024-01-20 20:45:14','2024-01-20 20:45:14'),(98,'confirm_order','Order was verified by %user_name%',0,24,NULL,'2024-01-20 20:45:14','2024-01-20 20:45:14'),(99,'create_order_from_seeder','Order is created from the checkout page',NULL,25,NULL,'2024-01-23 08:45:14','2024-01-23 08:45:14'),(100,'confirm_order','Order was verified by %user_name%',0,25,NULL,'2024-01-23 08:45:14','2024-01-23 08:45:14'),(101,'confirm_payment','Payment was confirmed (amount $2,118.00) by %user_name%',0,25,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(102,'create_shipment','Created shipment for order',0,25,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(103,'create_order_from_seeder','Order is created from the checkout page',NULL,26,NULL,'2024-01-19 18:45:14','2024-01-19 18:45:14'),(104,'confirm_order','Order was verified by %user_name%',0,26,NULL,'2024-01-19 18:45:14','2024-01-19 18:45:14'),(105,'confirm_payment','Payment was confirmed (amount $3,176.00) by %user_name%',0,26,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(106,'create_shipment','Created shipment for order',0,26,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(107,'create_order_from_seeder','Order is created from the checkout page',NULL,27,NULL,'2024-01-20 08:45:14','2024-01-20 08:45:14'),(108,'confirm_order','Order was verified by %user_name%',0,27,NULL,'2024-01-20 08:45:14','2024-01-20 08:45:14'),(109,'confirm_payment','Payment was confirmed (amount $1,170.00) by %user_name%',0,27,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14'),(110,'create_shipment','Created shipment for order',0,27,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(111,'create_order_from_seeder','Order is created from the checkout page',NULL,28,NULL,'2024-01-18 08:45:15','2024-01-18 08:45:15'),(112,'confirm_order','Order was verified by %user_name%',0,28,NULL,'2024-01-18 08:45:15','2024-01-18 08:45:15'),(113,'confirm_payment','Payment was confirmed (amount $501.00) by %user_name%',0,28,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(114,'create_shipment','Created shipment for order',0,28,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(115,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,28,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(116,'create_order_from_seeder','Order is created from the checkout page',NULL,29,NULL,'2024-01-19 04:45:15','2024-01-19 04:45:15'),(117,'confirm_order','Order was verified by %user_name%',0,29,NULL,'2024-01-19 04:45:15','2024-01-19 04:45:15'),(118,'confirm_payment','Payment was confirmed (amount $1,086.00) by %user_name%',0,29,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(119,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,29,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(120,'create_order_from_seeder','Order is created from the checkout page',NULL,30,NULL,'2024-01-22 02:45:15','2024-01-22 02:45:15'),(121,'confirm_order','Order was verified by %user_name%',0,30,NULL,'2024-01-22 02:45:15','2024-01-22 02:45:15'),(122,'confirm_payment','Payment was confirmed (amount $1,182.00) by %user_name%',0,30,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(123,'create_shipment','Created shipment for order',0,30,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(124,'create_order_from_seeder','Order is created from the checkout page',NULL,31,NULL,'2024-01-21 12:45:15','2024-01-21 12:45:15'),(125,'confirm_order','Order was verified by %user_name%',0,31,NULL,'2024-01-21 12:45:15','2024-01-21 12:45:15'),(126,'create_shipment','Created shipment for order',0,31,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(127,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,31,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(128,'create_order_from_seeder','Order is created from the checkout page',NULL,32,NULL,'2024-01-20 12:45:15','2024-01-20 12:45:15'),(129,'confirm_order','Order was verified by %user_name%',0,32,NULL,'2024-01-20 12:45:15','2024-01-20 12:45:15'),(130,'confirm_payment','Payment was confirmed (amount $1,566.00) by %user_name%',0,32,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(131,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,32,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(132,'create_order_from_seeder','Order is created from the checkout page',NULL,33,NULL,'2024-01-24 12:45:15','2024-01-24 12:45:15'),(133,'confirm_order','Order was verified by %user_name%',0,33,NULL,'2024-01-24 12:45:15','2024-01-24 12:45:15'),(134,'confirm_payment','Payment was confirmed (amount $1,692.00) by %user_name%',0,33,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15'),(135,'create_shipment','Created shipment for order',0,33,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(136,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,33,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(137,'create_order_from_seeder','Order is created from the checkout page',NULL,34,NULL,'2024-01-23 12:45:16','2024-01-23 12:45:16'),(138,'confirm_order','Order was verified by %user_name%',0,34,NULL,'2024-01-23 12:45:16','2024-01-23 12:45:16'),(139,'confirm_payment','Payment was confirmed (amount $1,126.00) by %user_name%',0,34,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(140,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,34,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(141,'create_order_from_seeder','Order is created from the checkout page',NULL,35,NULL,'2024-01-24 04:45:16','2024-01-24 04:45:16'),(142,'confirm_order','Order was verified by %user_name%',0,35,NULL,'2024-01-24 04:45:16','2024-01-24 04:45:16'),(143,'confirm_payment','Payment was confirmed (amount $593.50) by %user_name%',0,35,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(144,'create_shipment','Created shipment for order',0,35,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(145,'create_order_from_seeder','Order is created from the checkout page',NULL,36,NULL,'2024-01-24 04:45:16','2024-01-24 04:45:16'),(146,'confirm_order','Order was verified by %user_name%',0,36,NULL,'2024-01-24 04:45:16','2024-01-24 04:45:16'),(147,'confirm_payment','Payment was confirmed (amount $2,349.00) by %user_name%',0,36,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(148,'update_status','Changed status of shipping to: . Updated by: %user_name%',0,36,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(149,'create_order_from_seeder','Order is created from the checkout page',NULL,37,NULL,'2024-01-22 16:45:16','2024-01-22 16:45:16'),(150,'confirm_order','Order was verified by %user_name%',0,37,NULL,'2024-01-22 16:45:16','2024-01-22 16:45:16'),(151,'create_shipment','Created shipment for order',0,37,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(152,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,37,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16'),(153,'create_order_from_seeder','Order is created from the checkout page',NULL,38,NULL,'2024-01-24 16:45:16','2024-01-24 16:45:16'),(154,'confirm_order','Order was verified by %user_name%',0,38,NULL,'2024-01-24 16:45:16','2024-01-24 16:45:16'),(155,'create_shipment','Created shipment for order',0,38,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(156,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,38,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(157,'create_order_from_seeder','Order is created from the checkout page',NULL,39,NULL,'2024-01-22 00:45:17','2024-01-22 00:45:17'),(158,'confirm_order','Order was verified by %user_name%',0,39,NULL,'2024-01-22 00:45:17','2024-01-22 00:45:17'),(159,'confirm_payment','Payment was confirmed (amount $1,002.00) by %user_name%',0,39,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(160,'create_shipment','Created shipment for order',0,39,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(161,'create_order_from_seeder','Order is created from the checkout page',NULL,40,NULL,'2024-01-22 16:45:17','2024-01-22 16:45:17'),(162,'confirm_order','Order was verified by %user_name%',0,40,NULL,'2024-01-22 16:45:17','2024-01-22 16:45:17'),(163,'confirm_payment','Payment was confirmed (amount $1,097.00) by %user_name%',0,40,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(164,'create_shipment','Created shipment for order',0,40,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(165,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,40,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(166,'create_order_from_seeder','Order is created from the checkout page',NULL,41,NULL,'2024-01-24 18:45:17','2024-01-24 18:45:17'),(167,'confirm_order','Order was verified by %user_name%',0,41,NULL,'2024-01-24 18:45:17','2024-01-24 18:45:17'),(168,'confirm_payment','Payment was confirmed (amount $20.00) by %user_name%',0,41,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(169,'create_shipment','Created shipment for order',0,41,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(170,'create_order_from_seeder','Order is created from the checkout page',NULL,42,NULL,'2024-01-22 12:45:17','2024-01-22 12:45:17'),(171,'confirm_order','Order was verified by %user_name%',0,42,NULL,'2024-01-22 12:45:17','2024-01-22 12:45:17'),(172,'confirm_payment','Payment was confirmed (amount $3,510.00) by %user_name%',0,42,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(173,'create_shipment','Created shipment for order',0,42,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(174,'create_order_from_seeder','Order is created from the checkout page',NULL,43,NULL,'2024-01-24 12:45:17','2024-01-24 12:45:17'),(175,'confirm_order','Order was verified by %user_name%',0,43,NULL,'2024-01-24 12:45:17','2024-01-24 12:45:17'),(176,'confirm_payment','Payment was confirmed (amount $1,659.00) by %user_name%',0,43,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(177,'create_shipment','Created shipment for order',0,43,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(178,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,43,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17'),(179,'create_order_from_seeder','Order is created from the checkout page',NULL,44,NULL,'2024-01-24 12:45:17','2024-01-24 12:45:17'),(180,'confirm_order','Order was verified by %user_name%',0,44,NULL,'2024-01-24 12:45:17','2024-01-24 12:45:17'),(181,'create_shipment','Created shipment for order',0,44,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(182,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,44,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(183,'create_order_from_seeder','Order is created from the checkout page',NULL,45,NULL,'2024-01-23 20:45:18','2024-01-23 20:45:18'),(184,'confirm_order','Order was verified by %user_name%',0,45,NULL,'2024-01-23 20:45:18','2024-01-23 20:45:18'),(185,'confirm_payment','Payment was confirmed (amount $2,540.00) by %user_name%',0,45,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(186,'create_shipment','Created shipment for order',0,45,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(187,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,45,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(188,'create_order_from_seeder','Order is created from the checkout page',NULL,46,NULL,'2024-01-24 16:45:18','2024-01-24 16:45:18'),(189,'confirm_order','Order was verified by %user_name%',0,46,NULL,'2024-01-24 16:45:18','2024-01-24 16:45:18'),(190,'confirm_payment','Payment was confirmed (amount $121.50) by %user_name%',0,46,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(191,'create_shipment','Created shipment for order',0,46,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(192,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,46,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(193,'create_order_from_seeder','Order is created from the checkout page',NULL,47,NULL,'2024-01-24 16:45:18','2024-01-24 16:45:18'),(194,'confirm_order','Order was verified by %user_name%',0,47,NULL,'2024-01-24 16:45:18','2024-01-24 16:45:18'),(195,'confirm_payment','Payment was confirmed (amount $4,419.00) by %user_name%',0,47,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(196,'create_shipment','Created shipment for order',0,47,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(197,'update_status','Order confirmed by %user_name%',0,2,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18'),(198,'update_status','Order confirmed by %user_name%',0,4,NULL,'2024-01-25 00:45:19','2024-01-25 00:45:19'),(199,'update_status','Order confirmed by %user_name%',0,8,NULL,'2024-01-25 00:45:19','2024-01-25 00:45:19'),(200,'update_status','Order confirmed by %user_name%',0,10,NULL,'2024-01-25 00:45:20','2024-01-25 00:45:20'),(201,'update_status','Order confirmed by %user_name%',0,11,NULL,'2024-01-25 00:45:20','2024-01-25 00:45:20'),(202,'update_status','Order confirmed by %user_name%',0,17,NULL,'2024-01-25 00:45:21','2024-01-25 00:45:21'),(203,'update_status','Order confirmed by %user_name%',0,21,NULL,'2024-01-25 00:45:21','2024-01-25 00:45:21'),(204,'update_status','Order confirmed by %user_name%',0,28,NULL,'2024-01-25 00:45:22','2024-01-25 00:45:22'),(205,'update_status','Order confirmed by %user_name%',0,33,NULL,'2024-01-25 00:45:22','2024-01-25 00:45:22'),(206,'update_status','Order confirmed by %user_name%',0,40,NULL,'2024-01-25 00:45:23','2024-01-25 00:45:23'),(207,'update_status','Order confirmed by %user_name%',0,43,NULL,'2024-01-25 00:45:23','2024-01-25 00:45:23'),(208,'update_status','Order confirmed by %user_name%',0,45,NULL,'2024-01-25 00:45:24','2024-01-25 00:45:24'),(209,'update_status','Order confirmed by %user_name%',0,46,NULL,'2024-01-25 00:45:24','2024-01-25 00:45:24');
/*!40000 ALTER TABLE `ec_order_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_product`
--

DROP TABLE IF EXISTS `ec_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_product` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `qty` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `product_options` text COLLATE utf8mb4_unicode_ci COMMENT 'product option data',
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `restock_quantity` int unsigned DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'physical',
  `times_downloaded` int NOT NULL DEFAULT '0',
  `license_code` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_product`
--

LOCK TABLES `ec_order_product` WRITE;
/*!40000 ALTER TABLE `ec_order_product` DISABLE KEYS */;
INSERT INTO `ec_order_product` VALUES (1,1,2,1170.00,0.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}',NULL,45,'Herschel Leather Duffle Bag In Brown Color','products/10-1.jpg',1194.00,0,'2024-01-25 00:45:09','2024-01-25 00:45:09','physical',0,NULL),(2,1,2,561.00,0.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,78,'Ciate Palemore Lipstick Bold Red Color','products/23-1.jpg',1134.00,0,'2024-01-25 00:45:09','2024-01-25 00:45:09','physical',0,NULL),(3,2,1,586.00,0.00,'{\"sku\":\"SW-197-A0-A1\",\"attributes\":\"(Size: M, Color: Black)\"}',NULL,34,'Red & Black Headphone','products/4-1.jpg',895.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','physical',0,NULL),(4,3,2,563.00,0.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,62,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-1.jpg',1234.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','digital',0,NULL),(5,3,3,561.00,0.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,78,'Ciate Palemore Lipstick Bold Red Color','products/23-1.jpg',1701.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','physical',0,NULL),(6,4,1,553.00,0.00,'{\"sku\":\"SW-140-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,39,'Audio Equipment','products/7.jpg',871.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','physical',0,NULL),(7,4,2,563.00,0.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}',NULL,63,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-2.jpg',1234.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','digital',8,NULL),(8,5,3,517.00,0.00,'{\"sku\":\"SW-173-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,76,'Baxter Care Hair Kit For Bearded Mens','products/22-1.jpg',2688.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','physical',0,NULL),(9,6,3,455.00,0.00,'{\"sku\":\"SW-114-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,38,'Nikon HD camera','products/6.jpg',2322.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','physical',0,NULL),(10,7,3,547.00,0.00,'{\"sku\":\"SW-177-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,42,'Samsung Smart Phone (Digital)','products/9.jpg',1509.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','digital',3,NULL),(11,8,2,529.00,0.00,'{\"sku\":\"SW-109-A0-A2\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,51,'EPSION Plaster Printer','products/12-2.jpg',1386.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','physical',0,NULL),(12,9,2,543.00,0.00,'{\"sku\":\"SW-163-A0-A2\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,55,'Sound Intone I65 Earphone White Version (Digital)','products/13.jpg',1410.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','digital',6,NULL),(13,10,2,586.00,0.00,'{\"sku\":\"SW-197-A0\",\"attributes\":\"(Size: M, Color: Brown)\"}',NULL,33,'Red & Black Headphone','products/4.jpg',1790.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','physical',0,NULL),(14,11,1,591.00,0.00,'{\"sku\":\"SW-169-A0-A1\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,59,'Apple MacBook Air Retina 13.3-Inch Laptop','products/15-1.jpg',714.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','physical',0,NULL),(15,12,2,563.00,0.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}',NULL,63,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-2.jpg',1234.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','digital',5,NULL),(16,13,2,20.00,0.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,30,'Beat Headphone','products/3.jpg',1480.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','physical',0,NULL),(17,14,2,1170.00,0.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,46,'Herschel Leather Duffle Bag In Brown Color','products/10-2.jpg',1194.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','physical',0,NULL),(18,15,3,517.00,0.00,'{\"sku\":\"SW-173-A0\",\"attributes\":\"(Size: L, Color: Brown)\"}',NULL,75,'Baxter Care Hair Kit For Bearded Mens','products/22.jpg',2688.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','physical',0,NULL),(19,15,1,517.00,0.00,'{\"sku\":\"SW-173-A0-A1\",\"attributes\":\"(Color: Green, Size: XL)\"}',NULL,76,'Baxter Care Hair Kit For Bearded Mens','products/22-1.jpg',896.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','physical',0,NULL),(20,16,1,20.00,0.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,30,'Beat Headphone','products/3.jpg',740.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','physical',0,NULL),(21,17,1,1170.00,0.00,'{\"sku\":\"SW-170-A0-A3\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,47,'Herschel Leather Duffle Bag In Brown Color','products/10.jpg',597.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(22,17,2,1097.00,0.00,'{\"sku\":\"SW-120-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}',NULL,65,'Aveeno Moisturizing Body Shower 450ml','products/18-1.jpg',1112.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(23,18,1,706.00,0.00,'{\"sku\":\"SW-193-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,71,'NYX Beauty Couton Pallete Makeup 12','products/20-1.jpg',585.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(24,19,3,20.00,0.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,30,'Beat Headphone','products/3.jpg',2220.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(25,19,1,783.00,0.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,36,'Smart Watch External (Digital)','products/5.jpg',828.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','digital',7,NULL),(26,20,2,1170.00,0.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,46,'Herschel Leather Duffle Bag In Brown Color','products/10-2.jpg',1194.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(27,20,3,563.00,0.00,'{\"sku\":\"SW-200-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}',NULL,63,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-2.jpg',1851.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','digital',1,NULL),(28,21,2,80.25,0.00,'{\"sku\":\"SW-110-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,25,'Dual Camera 20MP (Digital)','products/1.jpg',1280.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','digital',5,NULL),(29,21,2,586.00,0.00,'{\"sku\":\"SW-197-A0-A2\",\"attributes\":\"(Size: L, Color: Brown)\"}',NULL,35,'Red & Black Headphone','products/4-2.jpg',1790.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','physical',0,NULL),(30,22,2,547.00,0.00,'{\"sku\":\"SW-177-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,42,'Samsung Smart Phone (Digital)','products/9.jpg',1006.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','digital',0,NULL),(31,23,1,80.25,0.00,'{\"sku\":\"SW-110-A0-A2\",\"attributes\":\"(Color: Green, Size: L)\"}',NULL,26,'Dual Camera 20MP (Digital)','products/1.jpg',640.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','digital',2,NULL),(32,24,2,563.00,0.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,62,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-1.jpg',1234.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','digital',9,NULL),(33,25,3,706.00,0.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}',NULL,70,'NYX Beauty Couton Pallete Makeup 12','products/20.jpg',1755.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','physical',0,NULL),(34,26,1,529.00,0.00,'{\"sku\":\"SW-109-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,49,'EPSION Plaster Printer','products/12.jpg',693.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','physical',0,NULL),(35,26,1,529.00,0.00,'{\"sku\":\"SW-109-A0-A3\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,52,'EPSION Plaster Printer','products/12-3.jpg',693.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','physical',0,NULL),(36,26,3,706.00,0.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}',NULL,70,'NYX Beauty Couton Pallete Makeup 12','products/20.jpg',1755.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','physical',0,NULL),(37,27,1,1170.00,0.00,'{\"sku\":\"SW-170-A0-A2\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,46,'Herschel Leather Duffle Bag In Brown Color','products/10-2.jpg',597.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','physical',0,NULL),(38,28,1,501.00,0.00,'{\"sku\":\"SW-195-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,60,'Apple MacBook Air Retina 12-Inch Laptop','products/16.jpg',546.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','physical',0,NULL),(39,29,2,543.00,0.00,'{\"sku\":\"SW-163-A0-A2\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,55,'Sound Intone I65 Earphone White Version (Digital)','products/13.jpg',1410.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','digital',5,NULL),(40,30,2,591.00,0.00,'{\"sku\":\"SW-169-A0\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,58,'Apple MacBook Air Retina 13.3-Inch Laptop','products/15.jpg',1428.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','physical',0,NULL),(41,31,2,586.00,0.00,'{\"sku\":\"SW-197-A0-A1\",\"attributes\":\"(Size: M, Color: Black)\"}',NULL,34,'Red & Black Headphone','products/4-1.jpg',1790.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','physical',0,NULL),(42,32,2,783.00,0.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,36,'Smart Watch External (Digital)','products/5.jpg',1656.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','digital',10,NULL),(43,33,3,564.00,0.00,'{\"sku\":\"SW-114-A0\",\"attributes\":\"(Color: Green, Size: M)\"}',NULL,56,'B&O Play Mini Bluetooth Speaker','products/14.jpg',1923.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','physical',0,NULL),(44,34,2,563.00,0.00,'{\"sku\":\"SW-200-A0-A1\",\"attributes\":\"(Color: Blue, Size: XXL)\"}',NULL,62,'Samsung Gear VR Virtual Reality Headset (Digital)','products/17-1.jpg',1234.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','digital',2,NULL),(45,35,1,40.50,0.00,'{\"sku\":\"SW-105-A0\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,27,'Smart Watches','products/2.jpg',599.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','physical',0,NULL),(46,35,1,553.00,0.00,'{\"sku\":\"SW-140-A0\",\"attributes\":\"(Color: Red, Size: XL)\"}',NULL,39,'Audio Equipment','products/7.jpg',871.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','physical',0,NULL),(47,36,3,783.00,0.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,36,'Smart Watch External (Digital)','products/5.jpg',2484.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','digital',0,NULL),(48,37,1,1104.00,0.00,'{\"sku\":\"SW-129-A0\",\"attributes\":\"(Size: S, Color: Black)\"}',NULL,48,'Xbox One Wireless Controller Black Color','products/11.jpg',677.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','physical',0,NULL),(49,38,3,529.00,0.00,'{\"sku\":\"SW-109-A0-A3\",\"attributes\":\"(Color: Black, Size: XL)\"}',NULL,52,'EPSION Plaster Printer','products/12-3.jpg',2079.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','physical',0,NULL),(50,39,2,501.00,0.00,'{\"sku\":\"SW-195-A0\",\"attributes\":\"(Color: Green, Size: S)\"}',NULL,60,'Apple MacBook Air Retina 12-Inch Laptop','products/16.jpg',1092.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(51,40,1,1097.00,0.00,'{\"sku\":\"SW-120-A0\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,64,'Aveeno Moisturizing Body Shower 450ml','products/18.jpg',556.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(52,41,1,20.00,0.00,'{\"sku\":\"SW-123-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,30,'Beat Headphone','products/3.jpg',740.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(53,42,3,1170.00,0.00,'{\"sku\":\"SW-170-A0-A1\",\"attributes\":\"(Size: S, Color: Blue)\"}',NULL,45,'Herschel Leather Duffle Bag In Brown Color','products/10-1.jpg',1791.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(54,43,3,553.00,0.00,'{\"sku\":\"SW-140-A0-A1\",\"attributes\":\"(Size: M, Color: Red)\"}',NULL,40,'Audio Equipment','products/7.jpg',2613.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(55,44,1,1104.00,0.00,'{\"sku\":\"SW-129-A0\",\"attributes\":\"(Size: S, Color: Black)\"}',NULL,48,'Xbox One Wireless Controller Black Color','products/11.jpg',677.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','physical',0,NULL),(56,45,2,564.00,0.00,'{\"sku\":\"SW-114-A0-A1\",\"attributes\":\"(Color: Blue, Size: XL)\"}',NULL,57,'B&O Play Mini Bluetooth Speaker','products/14.jpg',1282.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','physical',0,NULL),(57,45,2,706.00,0.00,'{\"sku\":\"SW-193-A0\",\"attributes\":\"(Size: L, Color: Black)\"}',NULL,70,'NYX Beauty Couton Pallete Makeup 12','products/20.jpg',1170.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','physical',0,NULL),(58,46,3,40.50,0.00,'{\"sku\":\"SW-105-A0\",\"attributes\":\"(Color: Red, Size: L)\"}',NULL,27,'Smart Watches','products/2.jpg',1797.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','physical',0,NULL),(59,47,3,783.00,0.00,'{\"sku\":\"SW-198-A0\",\"attributes\":\"(Color: Blue, Size: M)\"}',NULL,36,'Smart Watch External (Digital)','products/5.jpg',2484.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','digital',10,NULL),(60,47,2,1035.00,0.00,'{\"sku\":\"SW-153-A0-A1\",\"attributes\":\"(Size: S, Color: Brown)\"}',NULL,68,'NYX Beauty Couton Pallete Makeup 12','products/19-1.jpg',1380.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','physical',0,NULL);
/*!40000 ALTER TABLE `ec_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_referrals`
--

DROP TABLE IF EXISTS `ec_order_referrals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_referrals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_page` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landing_params` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fclid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_campaign` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer_url` text COLLATE utf8mb4_unicode_ci,
  `referrer_domain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_referrals_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_referrals`
--

LOCK TABLES `ec_order_referrals` WRITE;
/*!40000 ALTER TABLE `ec_order_referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_referrals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_return_items`
--

DROP TABLE IF EXISTS `ec_order_return_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_return_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_return_id` bigint unsigned NOT NULL COMMENT 'Order return id',
  `order_product_id` bigint unsigned NOT NULL COMMENT 'Order product id',
  `product_id` bigint unsigned NOT NULL COMMENT 'Product id',
  `product_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int NOT NULL COMMENT 'Quantity return',
  `price` decimal(15,2) NOT NULL COMMENT 'Price Product',
  `reason` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `refund_amount` decimal(12,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_return_items`
--

LOCK TABLES `ec_order_return_items` WRITE;
/*!40000 ALTER TABLE `ec_order_return_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_return_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_returns`
--

DROP TABLE IF EXISTS `ec_order_returns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_returns` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` bigint unsigned NOT NULL COMMENT 'Order ID',
  `store_id` bigint unsigned DEFAULT NULL COMMENT 'Store ID',
  `user_id` bigint unsigned NOT NULL COMMENT 'Customer ID',
  `reason` text COLLATE utf8mb4_unicode_ci COMMENT 'Reason return order',
  `order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Order current status',
  `return_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Return status',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_order_returns_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_returns`
--

LOCK TABLES `ec_order_returns` WRITE;
/*!40000 ALTER TABLE `ec_order_returns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_returns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_order_tax_information`
--

DROP TABLE IF EXISTS `ec_order_tax_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_order_tax_information` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `company_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_tax_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_order_tax_information_order_id_index` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_order_tax_information`
--

LOCK TABLES `ec_order_tax_information` WRITE;
/*!40000 ALTER TABLE `ec_order_tax_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_order_tax_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_orders`
--

DROP TABLE IF EXISTS `ec_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `shipping_option` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_method` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `amount` decimal(15,2) NOT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  `shipping_amount` decimal(15,2) DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_code` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(15,2) DEFAULT NULL,
  `sub_total` decimal(15,2) NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `discount_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_finished` tinyint(1) DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `proof_file` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_orders_code_unique` (`code`),
  KEY `ec_orders_user_id_status_created_at_index` (`user_id`,`status`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_orders`
--

LOCK TABLES `ec_orders` WRITE;
/*!40000 ALTER TABLE `ec_orders` DISABLE KEYS */;
INSERT INTO `ec_orders` VALUES (1,'#10000001',5,'1','default','pending',3462.00,0.00,0.00,NULL,NULL,0.00,3462.00,1,NULL,1,NULL,'TDzyj4KzJ7RJb9Smuqem1ZXrEnXPn',1,'2024-01-18 08:45:09','2024-01-25 00:45:09',NULL,2),(2,'#10000002',3,'1','default','completed',586.00,0.00,0.00,NULL,NULL,0.00,586.00,1,NULL,1,'2024-01-25 00:45:18','ZnLevz0UZmcmGmNHvO2K8zDNgCgm5',2,'2024-01-09 04:45:10','2024-01-25 00:45:18',NULL,3),(3,'#10000003',3,'1','default','completed',2809.00,0.00,0.00,NULL,NULL,0.00,2809.00,1,NULL,1,'2024-01-25 00:45:10','cojVo1L4RNUuWQ3cLh0WRRb4Q6Pdo',3,'2024-01-21 20:45:10','2024-01-25 00:45:10',NULL,2),(4,'#10000004',10,'1','default','completed',1679.00,0.00,0.00,NULL,NULL,0.00,1679.00,1,NULL,1,'2024-01-25 00:45:19','mFWNeaqR8ccI1d1E4pr3AbG4nvnJ4',4,'2024-01-10 00:45:10','2024-01-25 00:45:19',NULL,2),(5,'#10000005',10,'1','default','pending',1551.00,0.00,0.00,NULL,NULL,0.00,1551.00,1,NULL,1,NULL,'s2g9U8pSIX0f8z0bWgp5U4IUFcS4K',5,'2024-01-20 12:45:10','2024-01-25 00:45:10',NULL,5),(6,'#10000006',1,'1','default','pending',1365.00,0.00,0.00,NULL,NULL,0.00,1365.00,1,NULL,1,NULL,'7E38qTu5AlLjvuwegVpbxLr40ighY',6,'2024-01-12 06:45:10','2024-01-25 00:45:10',NULL,4),(7,'#10000007',1,NULL,'','completed',1641.00,0.00,0.00,NULL,NULL,0.00,1641.00,1,NULL,1,'2024-01-25 00:45:11','KJc9szrLqWcetZ19YHPdyFyyIoZNa',7,'2024-01-17 22:45:11','2024-01-25 00:45:11',NULL,1),(8,'#10000008',6,'1','default','completed',1058.00,0.00,0.00,NULL,NULL,0.00,1058.00,1,NULL,1,'2024-01-25 00:45:19','T8WbDWk6U2BN3w260Hd20AZLcZAjW',8,'2024-01-11 16:45:11','2024-01-25 00:45:19',NULL,1),(9,'#10000009',6,NULL,'','completed',1086.00,0.00,0.00,NULL,NULL,0.00,1086.00,1,NULL,1,'2024-01-25 00:45:11','mClZL8Zy2mpONHohIOI8jMKvs2LQJ',9,'2024-01-17 00:45:11','2024-01-25 00:45:11',NULL,3),(10,'#10000010',6,'1','default','completed',1172.00,0.00,0.00,NULL,NULL,0.00,1172.00,1,NULL,1,'2024-01-25 00:45:20','UDItrEp6MSFtekOy0iMPItIvYpaIU',10,'2024-01-18 18:45:11','2024-01-25 00:45:20',NULL,3),(11,'#10000011',6,'1','default','completed',591.00,0.00,0.00,NULL,NULL,0.00,591.00,1,NULL,1,'2024-01-25 00:45:20','lQErbdsqunR3WVNBdZfFNn1K0Dxf0',11,'2024-01-16 06:45:11','2024-01-25 00:45:20',NULL,5),(12,'#10000012',6,NULL,'','pending',1126.00,0.00,0.00,NULL,NULL,0.00,1126.00,1,NULL,1,NULL,'gzxxIVkhL5egETdMXOPHDFurHPAkP',12,'2024-01-18 18:45:12','2024-01-25 00:45:12',NULL,2),(13,'#10000013',10,'1','default','pending',40.00,0.00,0.00,NULL,NULL,0.00,40.00,1,NULL,1,NULL,'veFbEdcnZjFX9Jlg97lxhsf1Ybqwg',13,'2024-01-23 20:45:12','2024-01-25 00:45:12',NULL,4),(14,'#10000014',10,'1','default','pending',2340.00,0.00,0.00,NULL,NULL,0.00,2340.00,1,NULL,1,NULL,'oxzohRHREh0vJSAIzYJkulhKEmpvL',14,'2024-01-23 20:45:12','2024-01-25 00:45:12',NULL,2),(15,'#10000015',10,'1','default','completed',2068.00,0.00,0.00,NULL,NULL,0.00,2068.00,1,NULL,1,'2024-01-25 00:45:12','ntr9soAQLtoLfXlH9SXrqRXHKITYb',15,'2024-01-22 16:45:12','2024-01-25 00:45:12',NULL,5),(16,'#10000016',1,'1','default','pending',20.00,0.00,0.00,NULL,NULL,0.00,20.00,1,NULL,1,NULL,'MHA3ZVl5u8DFuqveVsMYhTJ2w8YBE',16,'2024-01-22 20:45:12','2024-01-25 00:45:12',NULL,4),(17,'#10000017',1,'1','default','completed',3364.00,0.00,0.00,NULL,NULL,0.00,3364.00,1,NULL,1,'2024-01-25 00:45:21','tx3e3x4ZKFbxeULiTXu0lCV1gZmqG',17,'2024-01-23 22:45:13','2024-01-25 00:45:21',NULL,2),(18,'#10000018',1,'1','default','pending',706.00,0.00,0.00,NULL,NULL,0.00,706.00,1,NULL,1,NULL,'qSBrOjky3gzmpQ2XmavAG3e4Z1jO6',18,'2024-01-21 18:45:13','2024-01-25 00:45:13',NULL,1),(19,'#10000019',5,'1','default','pending',843.00,0.00,0.00,NULL,NULL,0.00,843.00,1,NULL,1,NULL,'Gh9uDImhx8nRaWWbJ7GqinEh5zLKp',19,'2024-01-15 00:45:13','2024-01-25 00:45:13',NULL,4),(20,'#10000020',5,'1','default','pending',4029.00,0.00,0.00,NULL,NULL,0.00,4029.00,1,NULL,1,NULL,'jhZPxNpklEO7NDj627T0J3UKicpjK',20,'2024-01-22 00:45:13','2024-01-25 00:45:13',NULL,2),(21,'#10000021',5,'1','default','completed',1332.50,0.00,0.00,NULL,NULL,0.00,1332.50,1,NULL,1,'2024-01-25 00:45:21','sXJAqxL9idbyHZgzNI3jEjSEIYC3x',21,'2024-01-22 06:45:13','2024-01-25 00:45:21',NULL,3),(22,'#10000022',5,NULL,'','completed',1094.00,0.00,0.00,NULL,NULL,0.00,1094.00,1,NULL,1,'2024-01-25 00:45:14','cdKquQ6oDfg041YjiZlpYjPrjDixI',22,'2024-01-19 12:45:13','2024-01-25 00:45:14',NULL,1),(23,'#10000023',5,NULL,'','completed',80.25,0.00,0.00,NULL,NULL,0.00,80.25,1,NULL,1,'2024-01-25 00:45:14','xkbpnpaLdgvs0XbGllXCqrBF5kG0N',23,'2024-01-20 00:45:14','2024-01-25 00:45:14',NULL,3),(24,'#10000024',5,NULL,'','pending',1126.00,0.00,0.00,NULL,NULL,0.00,1126.00,1,NULL,1,NULL,'nTg92jdoAN8Cz0DIw4DD7nIBgqSNa',24,'2024-01-20 20:45:14','2024-01-25 00:45:14',NULL,2),(25,'#10000025',5,'1','default','pending',2118.00,0.00,0.00,NULL,NULL,0.00,2118.00,1,NULL,1,NULL,'f1MmdZg6lByqe7X0OI7IdnkFMmlYZ',25,'2024-01-23 08:45:14','2024-01-25 00:45:14',NULL,1),(26,'#10000026',6,'1','default','pending',3176.00,0.00,0.00,NULL,NULL,0.00,3176.00,1,NULL,1,NULL,'rqIRPNjvu8tKtxIeKKxUnPKJzMVH2',26,'2024-01-19 18:45:14','2024-01-25 00:45:14',NULL,1),(27,'#10000027',6,'1','default','pending',1170.00,0.00,0.00,NULL,NULL,0.00,1170.00,1,NULL,1,NULL,'niNGSj2wWQ84zArojPepbrwqRKklw',27,'2024-01-20 08:45:14','2024-01-25 00:45:14',NULL,2),(28,'#10000028',6,'1','default','completed',501.00,0.00,0.00,NULL,NULL,0.00,501.00,1,NULL,1,'2024-01-25 00:45:22','Ja2Kfv4x7Km4NJ96rRHpxKufUhysY',28,'2024-01-18 08:45:15','2024-01-25 00:45:22',NULL,3),(29,'#10000029',1,NULL,'','completed',1086.00,0.00,0.00,NULL,NULL,0.00,1086.00,1,NULL,1,'2024-01-25 00:45:15','Zfm6ZbTwVxTswQ7QlHcx5CLGH7skE',29,'2024-01-19 04:45:15','2024-01-25 00:45:15',NULL,3),(30,'#10000030',1,'1','default','pending',1182.00,0.00,0.00,NULL,NULL,0.00,1182.00,1,NULL,1,NULL,'SY1HZ4Krp42vxFz7KRL7FixdByaOg',30,'2024-01-22 02:45:15','2024-01-25 00:45:15',NULL,5),(31,'#10000031',6,'1','default','completed',1172.00,0.00,0.00,NULL,NULL,0.00,1172.00,1,NULL,1,'2024-01-25 00:45:15','o236lB7X8etbrQZrvMGb99YR1OeJ3',31,'2024-01-21 12:45:15','2024-01-25 00:45:15',NULL,3),(32,'#10000032',6,NULL,'','completed',1566.00,0.00,0.00,NULL,NULL,0.00,1566.00,1,NULL,1,'2024-01-25 00:45:15','Vj1eSNcxZxY9HcJ2HOQQ9tWw0YExN',32,'2024-01-20 12:45:15','2024-01-25 00:45:15',NULL,4),(33,'#10000033',6,'1','default','completed',1692.00,0.00,0.00,NULL,NULL,0.00,1692.00,1,NULL,1,'2024-01-25 00:45:22','8QCXu8WChKtBGZkDc1nDg9m1v19X7',33,'2024-01-24 12:45:15','2024-01-25 00:45:22',NULL,1),(34,'#10000034',6,NULL,'','completed',1126.00,0.00,0.00,NULL,NULL,0.00,1126.00,1,NULL,1,'2024-01-25 00:45:16','D7muPbQaGTV7itt0VWVEmZQSkznFl',34,'2024-01-23 12:45:16','2024-01-25 00:45:16',NULL,2),(35,'#10000035',5,'1','default','pending',593.50,0.00,0.00,NULL,NULL,0.00,593.50,1,NULL,1,NULL,'L0o8B9t777Q7GvPh48zzqnW3b4pAo',35,'2024-01-24 04:45:16','2024-01-25 00:45:16',NULL,2),(36,'#10000036',5,NULL,'','completed',2349.00,0.00,0.00,NULL,NULL,0.00,2349.00,1,NULL,1,'2024-01-25 00:45:16','MVqHTQ4ij6yfVoXssnkuncC5WybLJ',36,'2024-01-24 04:45:16','2024-01-25 00:45:16',NULL,4),(37,'#10000037',3,'1','default','completed',1104.00,0.00,0.00,NULL,NULL,0.00,1104.00,1,NULL,1,'2024-01-25 00:45:16','nAGsjeVb1p4oR26cqevdwwSmJ9VIJ',37,'2024-01-22 16:45:16','2024-01-25 00:45:16',NULL,5),(38,'#10000038',3,'1','default','completed',1587.00,0.00,0.00,NULL,NULL,0.00,1587.00,1,NULL,1,'2024-01-25 00:45:17','PpAcuEbvLqSiQSkIrunMu4QLV97YU',38,'2024-01-24 16:45:16','2024-01-25 00:45:17',NULL,1),(39,'#10000039',3,'1','default','pending',1002.00,0.00,0.00,NULL,NULL,0.00,1002.00,1,NULL,1,NULL,'qVbkd8DmJGTzVeGGqzeiagrJ2bGPM',39,'2024-01-22 00:45:17','2024-01-25 00:45:17',NULL,3),(40,'#10000040',3,'1','default','completed',1097.00,0.00,0.00,NULL,NULL,0.00,1097.00,1,NULL,1,'2024-01-25 00:45:23','sJIWdqFKZ7Ry6lMd4ZSyzWPRXFiQt',40,'2024-01-22 16:45:17','2024-01-25 00:45:23',NULL,2),(41,'#10000041',1,'1','default','pending',20.00,0.00,0.00,NULL,NULL,0.00,20.00,1,NULL,1,NULL,'Do2ABB4jmez6FJynjIXcj7qAimhRy',41,'2024-01-24 18:45:17','2024-01-25 00:45:17',NULL,4),(42,'#10000042',1,'1','default','pending',3510.00,0.00,0.00,NULL,NULL,0.00,3510.00,1,NULL,1,NULL,'Mz38urogCQy2F94UnrRpETjblhA1x',42,'2024-01-22 12:45:17','2024-01-25 00:45:17',NULL,2),(43,'#10000043',5,'1','default','completed',1659.00,0.00,0.00,NULL,NULL,0.00,1659.00,1,NULL,1,'2024-01-25 00:45:23','jACkruq8mJfq1IUqi1O0sr0DHg9Tx',43,'2024-01-24 12:45:17','2024-01-25 00:45:23',NULL,2),(44,'#10000044',5,'1','default','completed',1104.00,0.00,0.00,NULL,NULL,0.00,1104.00,1,NULL,1,'2024-01-25 00:45:18','qdHe26P2Bg2jx8sGhngTnDQVaX9Nq',44,'2024-01-24 12:45:17','2024-01-25 00:45:18',NULL,5),(45,'#10000045',5,'1','default','completed',2540.00,0.00,0.00,NULL,NULL,0.00,2540.00,1,NULL,1,'2024-01-25 00:45:24','R5lAV0IHVWtfpsatcWubfZb4nqqYD',45,'2024-01-23 20:45:18','2024-01-25 00:45:24',NULL,1),(46,'#10000046',5,'1','default','completed',121.50,0.00,0.00,NULL,NULL,0.00,121.50,1,NULL,1,'2024-01-25 00:45:24','UgWag4wVuIAlcG291xmZTisoD9MeE',46,'2024-01-24 16:45:18','2024-01-25 00:45:24',NULL,2),(47,'#10000047',5,'1','default','pending',4419.00,0.00,0.00,NULL,NULL,0.00,4419.00,1,NULL,1,NULL,'rERtSbKjXbUzqYV9QrYpxExuKOUrc',47,'2024-01-24 16:45:18','2024-01-25 00:45:18',NULL,4);
/*!40000 ALTER TABLE `ec_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `display_layout` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'swatch_dropdown',
  `is_searchable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_comparable` tinyint unsigned NOT NULL DEFAULT '1',
  `is_use_in_product_listing` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `use_image_from_product_variation` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets`
--

LOCK TABLES `ec_product_attribute_sets` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets` DISABLE KEYS */;
INSERT INTO `ec_product_attribute_sets` VALUES (1,'Color','color','visual',1,1,1,'published',0,'2024-01-25 00:45:01','2024-01-25 00:45:01',0),(2,'Size','size','text',1,1,1,'published',1,'2024-01-25 00:45:01','2024-01-25 00:45:01',0);
/*!40000 ALTER TABLE `ec_product_attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attribute_sets_translations`
--

DROP TABLE IF EXISTS `ec_product_attribute_sets_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attribute_sets_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attribute_sets_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attribute_sets_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attribute_sets_translations`
--

LOCK TABLES `ec_product_attribute_sets_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attribute_sets_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes`
--

DROP TABLE IF EXISTS `ec_product_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_set_id` bigint unsigned NOT NULL,
  `title` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_set_status_index` (`attribute_set_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes`
--

LOCK TABLES `ec_product_attributes` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes` DISABLE KEYS */;
INSERT INTO `ec_product_attributes` VALUES (1,1,'Green','green','#5FB7D4',NULL,1,1,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(2,1,'Blue','blue','#333333',NULL,0,2,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(3,1,'Red','red','#DA323F',NULL,0,3,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(4,1,'Black','black','#2F366C',NULL,0,4,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(5,1,'Brown','brown','#87554B',NULL,0,5,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(6,2,'S','s',NULL,NULL,1,1,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(7,2,'M','m',NULL,NULL,0,2,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(8,2,'L','l',NULL,NULL,0,3,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(9,2,'XL','xl',NULL,NULL,0,4,'2024-01-25 00:45:01','2024-01-25 00:45:01'),(10,2,'XXL','xxl',NULL,NULL,0,5,'2024-01-25 00:45:01','2024-01-25 00:45:01');
/*!40000 ALTER TABLE `ec_product_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_attributes_translations`
--

DROP TABLE IF EXISTS `ec_product_attributes_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_attributes_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_attributes_id` bigint unsigned NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_attributes_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_attributes_translations`
--

LOCK TABLES `ec_product_attributes_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_attributes_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_attributes_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories`
--

DROP TABLE IF EXISTS `ec_product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_categories_parent_id_status_created_at_index` (`parent_id`,`status`,`created_at`),
  KEY `ec_product_categories_parent_id_status_index` (`parent_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories`
--

LOCK TABLES `ec_product_categories` WRITE;
/*!40000 ALTER TABLE `ec_product_categories` DISABLE KEYS */;
INSERT INTO `ec_product_categories` VALUES (1,'Hot Promotions',0,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(2,'Electronics',0,NULL,'published',1,'product-categories/1.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(3,'Consumer Electronic',2,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(4,'Home Audio & Theaters',3,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(5,'TV & Videos',3,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(6,'Camera, Photos & Videos',3,NULL,'published',2,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(7,'Cellphones & Accessories',3,NULL,'published',3,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(8,'Headphones',3,NULL,'published',4,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(9,'Videos games',3,NULL,'published',5,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(10,'Wireless Speakers',3,NULL,'published',6,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(11,'Office Electronic',3,NULL,'published',7,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(12,'Accessories & Parts',2,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(13,'Digital Cables',12,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(14,'Audio & Video Cables',12,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(15,'Batteries',12,NULL,'published',2,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(16,'Clothing',0,NULL,'published',2,'product-categories/2.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(17,'Computers',0,NULL,'published',3,'product-categories/3.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(18,'Computer & Technologies',17,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(19,'Computer & Tablets',18,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(20,'Laptop',18,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(21,'Monitors',18,NULL,'published',2,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(22,'Computer Components',18,NULL,'published',3,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(23,'Networking',17,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(24,'Drive & Storages',23,NULL,'published',0,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(25,'Gaming Laptop',23,NULL,'published',1,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(26,'Security & Protection',23,NULL,'published',2,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(27,'Accessories',23,NULL,'published',3,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(28,'Home & Kitchen',0,NULL,'published',4,'product-categories/4.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(29,'Health & Beauty',0,NULL,'published',5,'product-categories/5.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(30,'Jewelry & Watch',0,NULL,'published',6,'product-categories/6.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(31,'Technology Toys',0,NULL,'published',7,'product-categories/7.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(32,'Phones',0,NULL,'published',8,'product-categories/8.jpg',1,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(33,'Babies & Moms',0,NULL,'published',9,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(34,'Sport & Outdoor',0,NULL,'published',10,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(35,'Books & Office',0,NULL,'published',11,NULL,0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL,NULL),(36,'Cars & Motorcycles',0,NULL,'published',12,NULL,0,'2024-01-25 00:44:56','2024-01-25 00:44:56',NULL,NULL),(37,'Home Improvements',0,NULL,'published',13,NULL,0,'2024-01-25 00:44:56','2024-01-25 00:44:56',NULL,NULL);
/*!40000 ALTER TABLE `ec_product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categories_translations`
--

DROP TABLE IF EXISTS `ec_product_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_categories_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_product_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categories_translations`
--

LOCK TABLES `ec_product_categories_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_categorizables`
--

DROP TABLE IF EXISTS `ec_product_categorizables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_categorizables` (
  `category_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`,`reference_id`,`reference_type`),
  KEY `ec_product_categorizables_category_id_index` (`category_id`),
  KEY `ec_product_categorizables_reference_id_index` (`reference_id`),
  KEY `ec_product_categorizables_reference_type_index` (`reference_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_categorizables`
--

LOCK TABLES `ec_product_categorizables` WRITE;
/*!40000 ALTER TABLE `ec_product_categorizables` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_categorizables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_category_product`
--

DROP TABLE IF EXISTS `ec_product_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_category_product` (
  `category_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `ec_product_category_product_category_id_index` (`category_id`),
  KEY `ec_product_category_product_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_category_product`
--

LOCK TABLES `ec_product_category_product` WRITE;
/*!40000 ALTER TABLE `ec_product_category_product` DISABLE KEYS */;
INSERT INTO `ec_product_category_product` VALUES (1,6),(2,7),(3,1),(3,23),(4,7),(5,1),(5,2),(5,14),(6,4),(6,17),(6,22),(7,11),(7,13),(8,5),(9,6),(9,10),(9,18),(9,23),(10,14),(10,16),(11,4),(11,16),(11,17),(11,19),(11,20),(12,15),(13,7),(13,14),(13,22),(14,18),(15,3),(15,4),(16,6),(16,21),(17,8),(17,13),(17,15),(18,15),(18,20),(19,16),(20,1),(20,3),(21,23),(22,7),(22,12),(23,2),(23,4),(23,5),(24,18),(24,19),(25,5),(25,6),(25,12),(25,16),(25,21),(26,2),(26,9),(26,10),(27,8),(27,10),(27,21),(28,8),(28,11),(28,20),(29,11),(29,13),(29,21),(29,22),(30,1),(31,2),(32,5),(32,9),(32,11),(32,17),(32,19),(32,23),(33,3),(33,12),(33,14),(33,17),(34,12),(34,13),(34,20),(34,22),(35,9),(36,8),(37,3),(37,19);
/*!40000 ALTER TABLE `ec_product_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collection_products`
--

DROP TABLE IF EXISTS `ec_product_collection_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collection_products` (
  `product_collection_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`product_collection_id`),
  KEY `ec_product_collection_products_product_collection_id_index` (`product_collection_id`),
  KEY `ec_product_collection_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collection_products`
--

LOCK TABLES `ec_product_collection_products` WRITE;
/*!40000 ALTER TABLE `ec_product_collection_products` DISABLE KEYS */;
INSERT INTO `ec_product_collection_products` VALUES (1,5),(1,9),(1,13),(1,16),(1,19),(1,22),(2,1),(2,6),(2,7),(2,8),(2,10),(2,11),(2,12),(2,15),(2,17),(2,18),(2,20),(2,23),(3,2),(3,3),(3,4),(3,14),(3,21);
/*!40000 ALTER TABLE `ec_product_collection_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections`
--

DROP TABLE IF EXISTS `ec_product_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections`
--

LOCK TABLES `ec_product_collections` WRITE;
/*!40000 ALTER TABLE `ec_product_collections` DISABLE KEYS */;
INSERT INTO `ec_product_collections` VALUES (1,'New Arrival','new-arrival',NULL,NULL,'published','2024-01-25 00:44:56','2024-01-25 00:44:56',0),(2,'Best Sellers','best-sellers',NULL,NULL,'published','2024-01-25 00:44:56','2024-01-25 00:44:56',0),(3,'Special Offer','special-offer',NULL,NULL,'published','2024-01-25 00:44:56','2024-01-25 00:44:56',0);
/*!40000 ALTER TABLE `ec_product_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_collections_translations`
--

DROP TABLE IF EXISTS `ec_product_collections_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_collections_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_collections_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_collections_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_collections_translations`
--

LOCK TABLES `ec_product_collections_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_collections_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_collections_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_cross_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_cross_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_cross_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  `is_variant` tinyint(1) NOT NULL DEFAULT '0',
  `price` decimal(15,2) DEFAULT '0.00',
  `price_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `apply_to_all_variations` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_cross_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_cross_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_cross_sale_relations`
--

LOCK TABLES `ec_product_cross_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` DISABLE KEYS */;
INSERT INTO `ec_product_cross_sale_relations` VALUES (1,2,0,0.00,'fixed',1),(1,3,0,0.00,'fixed',1),(1,9,0,0.00,'fixed',1),(1,10,0,0.00,'fixed',1),(1,11,0,0.00,'fixed',1),(1,18,0,0.00,'fixed',1),(2,4,0,0.00,'fixed',1),(2,8,0,0.00,'fixed',1),(2,11,0,0.00,'fixed',1),(2,13,0,0.00,'fixed',1),(2,14,0,0.00,'fixed',1),(3,6,0,0.00,'fixed',1),(3,7,0,0.00,'fixed',1),(3,10,0,0.00,'fixed',1),(3,14,0,0.00,'fixed',1),(3,19,0,0.00,'fixed',1),(4,2,0,0.00,'fixed',1),(4,10,0,0.00,'fixed',1),(4,11,0,0.00,'fixed',1),(4,12,0,0.00,'fixed',1),(4,20,0,0.00,'fixed',1),(5,1,0,0.00,'fixed',1),(5,2,0,0.00,'fixed',1),(5,4,0,0.00,'fixed',1),(5,13,0,0.00,'fixed',1),(5,15,0,0.00,'fixed',1),(5,17,0,0.00,'fixed',1),(6,2,0,0.00,'fixed',1),(6,4,0,0.00,'fixed',1),(6,8,0,0.00,'fixed',1),(6,9,0,0.00,'fixed',1),(6,19,0,0.00,'fixed',1),(6,20,0,0.00,'fixed',1),(7,4,0,0.00,'fixed',1),(7,6,0,0.00,'fixed',1),(7,10,0,0.00,'fixed',1),(7,14,0,0.00,'fixed',1),(7,15,0,0.00,'fixed',1),(7,18,0,0.00,'fixed',1),(8,3,0,0.00,'fixed',1),(8,10,0,0.00,'fixed',1),(8,13,0,0.00,'fixed',1),(8,14,0,0.00,'fixed',1),(8,15,0,0.00,'fixed',1),(8,20,0,0.00,'fixed',1),(9,2,0,0.00,'fixed',1),(9,6,0,0.00,'fixed',1),(9,10,0,0.00,'fixed',1),(9,14,0,0.00,'fixed',1),(9,18,0,0.00,'fixed',1),(9,19,0,0.00,'fixed',1),(10,1,0,0.00,'fixed',1),(10,6,0,0.00,'fixed',1),(10,14,0,0.00,'fixed',1),(10,15,0,0.00,'fixed',1),(10,16,0,0.00,'fixed',1),(10,19,0,0.00,'fixed',1),(10,20,0,0.00,'fixed',1),(11,3,0,0.00,'fixed',1),(11,6,0,0.00,'fixed',1),(11,7,0,0.00,'fixed',1),(11,9,0,0.00,'fixed',1),(11,12,0,0.00,'fixed',1),(11,14,0,0.00,'fixed',1),(12,2,0,0.00,'fixed',1),(12,3,0,0.00,'fixed',1),(12,15,0,0.00,'fixed',1),(12,18,0,0.00,'fixed',1),(12,19,0,0.00,'fixed',1),(13,1,0,0.00,'fixed',1),(13,2,0,0.00,'fixed',1),(13,5,0,0.00,'fixed',1),(13,7,0,0.00,'fixed',1),(13,12,0,0.00,'fixed',1),(13,20,0,0.00,'fixed',1),(14,3,0,0.00,'fixed',1),(14,7,0,0.00,'fixed',1),(14,8,0,0.00,'fixed',1),(14,10,0,0.00,'fixed',1),(14,12,0,0.00,'fixed',1),(14,16,0,0.00,'fixed',1),(15,2,0,0.00,'fixed',1),(15,3,0,0.00,'fixed',1),(15,4,0,0.00,'fixed',1),(15,13,0,0.00,'fixed',1),(15,16,0,0.00,'fixed',1),(16,4,0,0.00,'fixed',1),(16,7,0,0.00,'fixed',1),(16,8,0,0.00,'fixed',1),(16,13,0,0.00,'fixed',1),(16,15,0,0.00,'fixed',1),(17,4,0,0.00,'fixed',1),(17,7,0,0.00,'fixed',1),(17,10,0,0.00,'fixed',1),(17,13,0,0.00,'fixed',1),(17,14,0,0.00,'fixed',1),(17,15,0,0.00,'fixed',1),(18,2,0,0.00,'fixed',1),(18,5,0,0.00,'fixed',1),(18,6,0,0.00,'fixed',1),(18,16,0,0.00,'fixed',1),(18,19,0,0.00,'fixed',1),(19,4,0,0.00,'fixed',1),(19,9,0,0.00,'fixed',1),(19,10,0,0.00,'fixed',1),(19,12,0,0.00,'fixed',1),(19,17,0,0.00,'fixed',1),(19,18,0,0.00,'fixed',1),(20,1,0,0.00,'fixed',1),(20,3,0,0.00,'fixed',1),(20,7,0,0.00,'fixed',1),(20,9,0,0.00,'fixed',1),(20,12,0,0.00,'fixed',1),(21,1,0,0.00,'fixed',1),(21,4,0,0.00,'fixed',1),(21,5,0,0.00,'fixed',1),(21,9,0,0.00,'fixed',1),(21,13,0,0.00,'fixed',1),(21,14,0,0.00,'fixed',1),(22,1,0,0.00,'fixed',1),(22,5,0,0.00,'fixed',1),(22,6,0,0.00,'fixed',1),(22,8,0,0.00,'fixed',1),(22,13,0,0.00,'fixed',1),(22,17,0,0.00,'fixed',1),(23,5,0,0.00,'fixed',1),(23,6,0,0.00,'fixed',1),(23,7,0,0.00,'fixed',1),(23,8,0,0.00,'fixed',1),(23,16,0,0.00,'fixed',1),(23,17,0,0.00,'fixed',1);
/*!40000 ALTER TABLE `ec_product_cross_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_files`
--

DROP TABLE IF EXISTS `ec_product_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `url` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extras` mediumtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ec_product_files_product_id_index` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_files`
--

LOCK TABLES `ec_product_files` WRITE;
/*!40000 ALTER TABLE `ec_product_files` DISABLE KEYS */;
INSERT INTO `ec_product_files` VALUES (1,24,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(2,25,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(3,26,'product-files/1.jpg','{\"filename\":\"1.jpg\",\"url\":\"product-files\\/1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(4,36,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(5,36,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(6,36,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(7,36,'product-files/5-3.jpg','{\"filename\":\"5-3.jpg\",\"url\":\"product-files\\/5-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-3\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(8,37,'product-files/5.jpg','{\"filename\":\"5.jpg\",\"url\":\"product-files\\/5.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(9,37,'product-files/5-1.jpg','{\"filename\":\"5-1.jpg\",\"url\":\"product-files\\/5-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(10,37,'product-files/5-2.jpg','{\"filename\":\"5-2.jpg\",\"url\":\"product-files\\/5-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(11,37,'product-files/5-3.jpg','{\"filename\":\"5-3.jpg\",\"url\":\"product-files\\/5-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"5-3\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(12,42,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(13,42,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(14,42,'product-files/9-2.jpg','{\"filename\":\"9-2.jpg\",\"url\":\"product-files\\/9-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(15,43,'product-files/9.jpg','{\"filename\":\"9.jpg\",\"url\":\"product-files\\/9.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(16,43,'product-files/9-1.jpg','{\"filename\":\"9-1.jpg\",\"url\":\"product-files\\/9-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(17,43,'product-files/9-2.jpg','{\"filename\":\"9-2.jpg\",\"url\":\"product-files\\/9-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"9-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(18,53,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(19,53,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(20,54,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(21,54,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(22,55,'product-files/13.jpg','{\"filename\":\"13.jpg\",\"url\":\"product-files\\/13.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(23,55,'product-files/13-1.jpg','{\"filename\":\"13-1.jpg\",\"url\":\"product-files\\/13-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"13-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(24,61,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(25,61,'product-files/17-1.jpg','{\"filename\":\"17-1.jpg\",\"url\":\"product-files\\/17-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(26,61,'product-files/17-2.jpg','{\"filename\":\"17-2.jpg\",\"url\":\"product-files\\/17-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(27,61,'product-files/17-3.jpg','{\"filename\":\"17-3.jpg\",\"url\":\"product-files\\/17-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-3\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(28,62,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(29,62,'product-files/17-1.jpg','{\"filename\":\"17-1.jpg\",\"url\":\"product-files\\/17-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(30,62,'product-files/17-2.jpg','{\"filename\":\"17-2.jpg\",\"url\":\"product-files\\/17-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(31,62,'product-files/17-3.jpg','{\"filename\":\"17-3.jpg\",\"url\":\"product-files\\/17-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-3\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(32,63,'product-files/17.jpg','{\"filename\":\"17.jpg\",\"url\":\"product-files\\/17.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(33,63,'product-files/17-1.jpg','{\"filename\":\"17-1.jpg\",\"url\":\"product-files\\/17-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(34,63,'product-files/17-2.jpg','{\"filename\":\"17-2.jpg\",\"url\":\"product-files\\/17-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(35,63,'product-files/17-3.jpg','{\"filename\":\"17-3.jpg\",\"url\":\"product-files\\/17-3.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:00\",\"name\":\"17-3\",\"extension\":\"jpg\"}','2024-01-25 00:45:00','2024-01-25 00:45:00'),(36,74,'product-files/21.jpg','{\"filename\":\"21.jpg\",\"url\":\"product-files\\/21.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:01\",\"name\":\"21\",\"extension\":\"jpg\"}','2024-01-25 00:45:01','2024-01-25 00:45:01'),(37,74,'product-files/21-1.jpg','{\"filename\":\"21-1.jpg\",\"url\":\"product-files\\/21-1.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:01\",\"name\":\"21-1\",\"extension\":\"jpg\"}','2024-01-25 00:45:01','2024-01-25 00:45:01'),(38,74,'product-files/21-2.jpg','{\"filename\":\"21-2.jpg\",\"url\":\"product-files\\/21-2.jpg\",\"mime_type\":\"image\\/jpeg\",\"size\":9730,\"modified\":\"2024-01-25 07:45:01\",\"name\":\"21-2\",\"extension\":\"jpg\"}','2024-01-25 00:45:01','2024-01-25 00:45:01');
/*!40000 ALTER TABLE `ec_product_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_label_products`
--

DROP TABLE IF EXISTS `ec_product_label_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_label_products` (
  `product_label_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_label_id`,`product_id`),
  KEY `ec_product_label_products_product_label_id_index` (`product_label_id`),
  KEY `ec_product_label_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_label_products`
--

LOCK TABLES `ec_product_label_products` WRITE;
/*!40000 ALTER TABLE `ec_product_label_products` DISABLE KEYS */;
INSERT INTO `ec_product_label_products` VALUES (2,3),(2,6),(2,9),(2,12),(2,21),(3,15),(3,18);
/*!40000 ALTER TABLE `ec_product_label_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels`
--

DROP TABLE IF EXISTS `ec_product_labels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels`
--

LOCK TABLES `ec_product_labels` WRITE;
/*!40000 ALTER TABLE `ec_product_labels` DISABLE KEYS */;
INSERT INTO `ec_product_labels` VALUES (1,'Hot','#ec2434','published','2024-01-25 00:44:56','2024-01-25 00:44:56'),(2,'New','#00c9a7','published','2024-01-25 00:44:56','2024-01-25 00:44:56'),(3,'Sale','#fe9931','published','2024-01-25 00:44:56','2024-01-25 00:44:56');
/*!40000 ALTER TABLE `ec_product_labels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_labels_translations`
--

DROP TABLE IF EXISTS `ec_product_labels_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_labels_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_labels_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_labels_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_labels_translations`
--

LOCK TABLES `ec_product_labels_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_labels_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_labels_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_related_relations`
--

DROP TABLE IF EXISTS `ec_product_related_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_related_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_related_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_related_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_related_relations`
--

LOCK TABLES `ec_product_related_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_related_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_related_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tag_product`
--

DROP TABLE IF EXISTS `ec_product_tag_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tag_product` (
  `product_id` bigint unsigned NOT NULL,
  `tag_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tag_id`),
  KEY `ec_product_tag_product_product_id_index` (`product_id`),
  KEY `ec_product_tag_product_tag_id_index` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tag_product`
--

LOCK TABLES `ec_product_tag_product` WRITE;
/*!40000 ALTER TABLE `ec_product_tag_product` DISABLE KEYS */;
INSERT INTO `ec_product_tag_product` VALUES (1,1),(1,5),(2,3),(2,4),(2,6),(3,1),(3,6),(4,3),(4,4),(4,6),(5,2),(5,6),(6,1),(6,2),(6,3),(7,1),(7,2),(7,6),(8,2),(8,3),(8,6),(9,1),(9,4),(9,6),(10,2),(10,3),(10,4),(11,2),(11,3),(11,4),(12,1),(12,3),(12,4),(13,5),(13,6),(14,1),(14,4),(14,6),(15,1),(15,3),(15,4),(16,1),(16,4),(17,3),(17,4),(17,6),(18,1),(18,2),(18,5),(19,1),(19,4),(19,5),(20,1),(20,3),(20,4),(21,1),(21,4),(21,6),(22,2),(23,4),(23,5),(23,6);
/*!40000 ALTER TABLE `ec_product_tag_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags`
--

DROP TABLE IF EXISTS `ec_product_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags`
--

LOCK TABLES `ec_product_tags` WRITE;
/*!40000 ALTER TABLE `ec_product_tags` DISABLE KEYS */;
INSERT INTO `ec_product_tags` VALUES (1,'Electronic',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(2,'Mobile',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(3,'Iphone',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(4,'Printer',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(5,'Office',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(6,'IT',NULL,'published','2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `ec_product_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_tags_translations`
--

DROP TABLE IF EXISTS `ec_product_tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_tags_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_product_tags_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`ec_product_tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_tags_translations`
--

LOCK TABLES `ec_product_tags_translations` WRITE;
/*!40000 ALTER TABLE `ec_product_tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_up_sale_relations`
--

DROP TABLE IF EXISTS `ec_product_up_sale_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_up_sale_relations` (
  `from_product_id` bigint unsigned NOT NULL,
  `to_product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`from_product_id`,`to_product_id`),
  KEY `ec_product_up_sale_relations_from_product_id_index` (`from_product_id`),
  KEY `ec_product_up_sale_relations_to_product_id_index` (`to_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_up_sale_relations`
--

LOCK TABLES `ec_product_up_sale_relations` WRITE;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_up_sale_relations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variation_items`
--

DROP TABLE IF EXISTS `ec_product_variation_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variation_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `attribute_id` bigint unsigned NOT NULL,
  `variation_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `attribute_variation_index` (`attribute_id`,`variation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variation_items`
--

LOCK TABLES `ec_product_variation_items` WRITE;
/*!40000 ALTER TABLE `ec_product_variation_items` DISABLE KEYS */;
INSERT INTO `ec_product_variation_items` VALUES (5,1,3),(11,1,6),(37,1,19),(53,1,27),(55,1,28),(65,1,33),(73,1,37),(99,1,50),(105,1,53),(107,1,54),(109,1,55),(13,2,7),(25,2,13),(43,2,22),(45,2,23),(67,2,34),(77,2,39),(81,2,41),(83,2,42),(97,2,49),(7,3,4),(9,3,5),(31,3,16),(33,3,17),(35,3,18),(39,3,20),(47,3,24),(51,3,26),(59,3,30),(63,3,32),(71,3,36),(75,3,38),(87,3,44),(91,3,46),(1,4,1),(15,4,8),(17,4,9),(21,4,11),(29,4,15),(41,4,21),(49,4,25),(57,4,29),(69,4,35),(85,4,43),(93,4,47),(101,4,51),(3,5,2),(19,5,10),(23,5,12),(27,5,14),(61,5,31),(79,5,40),(89,5,45),(95,5,48),(103,5,52),(4,6,2),(16,6,8),(38,6,19),(40,6,20),(44,6,22),(50,6,25),(56,6,28),(62,6,31),(74,6,37),(76,6,38),(84,6,42),(90,6,45),(96,6,48),(18,7,9),(20,7,10),(22,7,11),(26,7,13),(34,7,17),(36,7,18),(46,7,23),(60,7,30),(66,7,33),(100,7,50),(110,7,55),(2,8,1),(6,8,3),(8,8,4),(24,8,12),(64,8,32),(72,8,36),(80,8,40),(86,8,43),(94,8,47),(98,8,49),(104,8,52),(108,8,54),(12,9,6),(14,9,7),(28,9,14),(30,9,15),(32,9,16),(48,9,24),(52,9,26),(54,9,27),(58,9,29),(68,9,34),(70,9,35),(82,9,41),(88,9,44),(92,9,46),(102,9,51),(106,9,53),(10,10,5),(42,10,21),(78,10,39);
/*!40000 ALTER TABLE `ec_product_variation_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_variations`
--

DROP TABLE IF EXISTS `ec_product_variations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_variations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned DEFAULT NULL,
  `configurable_product_id` bigint unsigned NOT NULL,
  `is_default` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_variations_product_id_configurable_product_id_unique` (`product_id`,`configurable_product_id`),
  KEY `configurable_product_index` (`product_id`,`configurable_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_variations`
--

LOCK TABLES `ec_product_variations` WRITE;
/*!40000 ALTER TABLE `ec_product_variations` DISABLE KEYS */;
INSERT INTO `ec_product_variations` VALUES (1,24,1,1),(2,25,1,0),(3,26,1,0),(4,27,2,1),(5,28,2,0),(6,29,3,1),(7,30,3,0),(8,31,3,0),(9,32,3,0),(10,33,4,1),(11,34,4,0),(12,35,4,0),(13,36,5,1),(14,37,5,0),(15,38,6,1),(16,39,7,1),(17,40,7,0),(18,41,8,1),(19,42,9,1),(20,43,9,0),(21,44,10,1),(22,45,10,0),(23,46,10,0),(24,47,10,0),(25,48,11,1),(26,49,12,1),(27,50,12,0),(28,51,12,0),(29,52,12,0),(30,53,13,1),(31,54,13,0),(32,55,13,0),(33,56,14,1),(34,57,14,0),(35,58,15,1),(36,59,15,0),(37,60,16,1),(38,61,17,1),(39,62,17,0),(40,63,17,0),(41,64,18,1),(42,65,18,0),(43,66,18,0),(44,67,19,1),(45,68,19,0),(46,69,19,0),(47,70,20,1),(48,71,20,0),(49,72,20,0),(50,73,20,0),(51,74,21,1),(52,75,22,1),(53,76,22,0),(54,77,23,1),(55,78,23,0);
/*!40000 ALTER TABLE `ec_product_variations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_views`
--

DROP TABLE IF EXISTS `ec_product_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_views` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint unsigned NOT NULL,
  `views` int NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '2024-01-25',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_product_views_product_id_date_unique` (`product_id`,`date`),
  KEY `ec_product_views_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_views`
--

LOCK TABLES `ec_product_views` WRITE;
/*!40000 ALTER TABLE `ec_product_views` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_product_views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_product_with_attribute_set`
--

DROP TABLE IF EXISTS `ec_product_with_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_product_with_attribute_set` (
  `attribute_set_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_product_with_attribute_set`
--

LOCK TABLES `ec_product_with_attribute_set` WRITE;
/*!40000 ALTER TABLE `ec_product_with_attribute_set` DISABLE KEYS */;
INSERT INTO `ec_product_with_attribute_set` VALUES (1,1,0),(2,1,0),(1,2,0),(2,2,0),(1,3,0),(2,3,0),(1,4,0),(2,4,0),(1,5,0),(2,5,0),(1,6,0),(2,6,0),(1,7,0),(2,7,0),(1,8,0),(2,8,0),(1,9,0),(2,9,0),(1,10,0),(2,10,0),(1,11,0),(2,11,0),(1,12,0),(2,12,0),(1,13,0),(2,13,0),(1,14,0),(2,14,0),(1,15,0),(2,15,0),(1,16,0),(2,16,0),(1,17,0),(2,17,0),(1,18,0),(2,18,0),(1,19,0),(2,19,0),(1,20,0),(2,20,0),(1,21,0),(2,21,0),(1,22,0),(2,22,0),(1,23,0),(2,23,0);
/*!40000 ALTER TABLE `ec_product_with_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products`
--

DROP TABLE IF EXISTS `ec_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `images` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int unsigned NOT NULL DEFAULT '0',
  `quantity` int unsigned DEFAULT NULL,
  `allow_checkout_when_out_of_stock` tinyint unsigned NOT NULL DEFAULT '0',
  `with_storehouse_management` tinyint unsigned NOT NULL DEFAULT '0',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `brand_id` bigint unsigned DEFAULT NULL,
  `is_variation` tinyint NOT NULL DEFAULT '0',
  `sale_type` tinyint NOT NULL DEFAULT '0',
  `price` double unsigned DEFAULT NULL,
  `sale_price` double unsigned DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `length` double(8,2) DEFAULT NULL,
  `wide` double(8,2) DEFAULT NULL,
  `height` double(8,2) DEFAULT NULL,
  `weight` double(8,2) DEFAULT NULL,
  `tax_id` bigint unsigned DEFAULT NULL,
  `views` bigint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'in_stock',
  `created_by_id` bigint unsigned DEFAULT '0',
  `created_by_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HuberwayCMS\\ACL\\Models\\User',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'physical',
  `barcode` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cost_per_item` double DEFAULT NULL,
  `generate_license_code` tinyint(1) NOT NULL DEFAULT '0',
  `store_id` bigint unsigned DEFAULT NULL,
  `approved_by` bigint unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ec_products_brand_id_status_is_variation_created_at_index` (`brand_id`,`status`,`is_variation`,`created_at`),
  KEY `sale_type_index` (`sale_type`),
  KEY `start_date_index` (`start_date`),
  KEY `end_date_index` (`end_date`),
  KEY `sale_price_index` (`sale_price`),
  KEY `is_variation_index` (`is_variation`),
  KEY `ec_products_sku_index` (`sku`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products`
--

LOCK TABLES `ec_products` WRITE;
/*!40000 ALTER TABLE `ec_products` DISABLE KEYS */;
INSERT INTO `ec_products` VALUES (1,'Dual Camera 20MP (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/1.jpg\"]','SW-110-A0',0,11,0,1,1,1,0,0,80.25,NULL,NULL,NULL,14.00,11.00,13.00,640.00,NULL,140084,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,3,0),(2,'Smart Watches','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/2.jpg\",\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/2-3.jpg\"]','SW-105-A0',0,16,0,1,1,7,0,0,40.5,NULL,NULL,NULL,10.00,11.00,10.00,599.00,NULL,44156,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(3,'Beat Headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/3.jpg\"]','SW-123-A0',0,15,0,1,1,6,0,0,20,NULL,NULL,NULL,11.00,13.00,13.00,740.00,NULL,51359,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,4,0),(4,'Red &amp; Black Headphone','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/4.jpg\",\"products\\/4-1.jpg\",\"products\\/4-2.jpg\",\"products\\/4-3.jpg\"]','SW-197-A0',0,13,0,1,1,6,0,0,586,515.68,NULL,NULL,19.00,15.00,19.00,895.00,NULL,75812,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,3,0),(5,'Smart Watch External (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/5.jpg\",\"products\\/5-1.jpg\",\"products\\/5-2.jpg\",\"products\\/5-3.jpg\"]','SW-198-A0',0,18,0,1,1,4,0,0,783,NULL,NULL,NULL,19.00,19.00,14.00,828.00,NULL,103518,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,4,0),(6,'Nikon HD camera','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/6.jpg\"]','SW-114-A0',0,16,0,1,1,2,0,0,455,NULL,NULL,NULL,12.00,12.00,17.00,774.00,NULL,86798,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,4,0),(7,'Audio Equipment','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/7.jpg\"]','SW-140-A0',0,15,0,1,1,4,0,0,553,NULL,NULL,NULL,12.00,11.00,19.00,871.00,NULL,125444,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(8,'Smart Televisions','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/8.jpg\",\"products\\/8-1.jpg\",\"products\\/8-2.jpg\",\"products\\/8-3.jpg\"]','SW-161-A0',0,18,0,1,1,3,0,0,1236,914.64,NULL,NULL,14.00,11.00,11.00,869.00,NULL,133265,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(9,'Samsung Smart Phone (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/9.jpg\",\"products\\/9-1.jpg\",\"products\\/9-2.jpg\"]','SW-177-A0',0,11,0,1,1,2,0,0,547,NULL,NULL,NULL,15.00,20.00,10.00,503.00,NULL,20130,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,1,0),(10,'Herschel Leather Duffle Bag In Brown Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/10.jpg\",\"products\\/10-1.jpg\",\"products\\/10-2.jpg\"]','SW-170-A0',0,12,0,1,0,7,0,0,1170,NULL,NULL,NULL,10.00,10.00,10.00,597.00,NULL,119983,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(11,'Xbox One Wireless Controller Black Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/11.jpg\",\"products\\/11-1.jpg\",\"products\\/11-2.jpg\",\"products\\/11-3.jpg\"]','SW-129-A0',0,14,0,1,0,7,0,0,1104,NULL,NULL,NULL,12.00,12.00,20.00,677.00,NULL,169997,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,5,0),(12,'EPSION Plaster Printer','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/12.jpg\",\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/12-3.jpg\"]','SW-109-A0',0,17,0,1,0,1,0,0,529,423.2,NULL,NULL,19.00,12.00,17.00,693.00,NULL,24187,'2024-01-25 00:44:59','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,1,0),(13,'Sound Intone I65 Earphone White Version (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/13.jpg\",\"products\\/13-1.jpg\"]','SW-163-A0',0,12,0,1,0,2,0,0,543,NULL,NULL,NULL,12.00,14.00,18.00,705.00,NULL,109991,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,3,0),(14,'B&amp;O Play Mini Bluetooth Speaker','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/14.jpg\"]','SW-114-A0',0,16,0,1,0,6,0,0,564,NULL,NULL,NULL,14.00,12.00,18.00,641.00,NULL,117555,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,1,0),(15,'Apple MacBook Air Retina 13.3-Inch Laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/15.jpg\",\"products\\/15-1.jpg\"]','SW-169-A0',0,12,0,1,0,4,0,0,591,NULL,NULL,NULL,19.00,15.00,14.00,714.00,NULL,25488,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,5,0),(16,'Apple MacBook Air Retina 12-Inch Laptop','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/16.jpg\"]','SW-195-A0',0,17,0,1,0,4,0,0,501,385.77,NULL,NULL,18.00,18.00,14.00,546.00,NULL,139209,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,3,0),(17,'Samsung Gear VR Virtual Reality Headset (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/17.jpg\",\"products\\/17-1.jpg\",\"products\\/17-2.jpg\",\"products\\/17-3.jpg\"]','SW-200-A0',0,20,0,1,0,1,0,0,563,NULL,NULL,NULL,15.00,10.00,19.00,617.00,NULL,195114,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,2,0),(18,'Aveeno Moisturizing Body Shower 450ml','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/18.jpg\",\"products\\/18-1.jpg\",\"products\\/18-2.jpg\",\"products\\/18-3.jpg\"]','SW-120-A0',0,20,0,1,0,3,0,0,1097,NULL,NULL,NULL,13.00,17.00,12.00,556.00,NULL,86216,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(19,'NYX Beauty Couton Pallete Makeup 12','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/19.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\",\"products\\/19-3.jpg\"]','SW-153-A0',0,19,0,1,0,5,0,0,1035,NULL,NULL,NULL,19.00,12.00,17.00,690.00,NULL,46238,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,4,0),(20,'NYX Beauty Couton Pallete Makeup 12','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/20.jpg\",\"products\\/20-1.jpg\",\"products\\/20-2.jpg\",\"products\\/20-3.jpg\"]','SW-193-A0',0,15,0,1,0,4,0,0,706,564.8,NULL,NULL,14.00,16.00,20.00,585.00,NULL,168097,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,1,0),(21,'MVMTH Classical Leather Watch In Black (Digital)','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/21.jpg\",\"products\\/21-1.jpg\",\"products\\/21-2.jpg\"]','SW-154-A0',0,15,0,1,0,3,0,0,903,NULL,NULL,NULL,20.00,12.00,18.00,530.00,NULL,25076,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,4,0),(22,'Baxter Care Hair Kit For Bearded Mens','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/22.jpg\",\"products\\/22-1.jpg\",\"products\\/22-2.jpg\",\"products\\/22-3.jpg\"]','SW-173-A0',0,20,0,1,0,3,0,0,517,NULL,NULL,NULL,20.00,16.00,16.00,896.00,NULL,184807,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,5,0),(23,'Ciate Palemore Lipstick Bold Red Color','<ul><li> Unrestrained and portable active stereo speaker</li>\n            <li> Free from the confines of wires and chords</li>\n            <li> 20 hours of portable capabilities</li>\n            <li> Double-ended Coil Cord with 3.5mm Stereo Plugs Included</li>\n            <li> 3/4″ Dome Tweeters: 2X and 4″ Woofer: 1X</li></ul>','<p>Short Hooded Coat features a straight body, large pockets with button flaps, ventilation air holes, and a string detail along the hemline. The style is completed with a drawstring hood, featuring Rains’ signature built-in cap. Made from waterproof, matte PU, this lightweight unisex rain jacket is an ode to nostalgia through its classic silhouette and utilitarian design details.</p>\n                                <p>- Casual unisex fit</p>\n\n                                <p>- 64% polyester, 36% polyurethane</p>\n\n                                <p>- Water column pressure: 4000 mm</p>\n\n                                <p>- Model is 187cm tall and wearing a size S / M</p>\n\n                                <p>- Unisex fit</p>\n\n                                <p>- Drawstring hood with built-in cap</p>\n\n                                <p>- Front placket with snap buttons</p>\n\n                                <p>- Ventilation under armpit</p>\n\n                                <p>- Adjustable cuffs</p>\n\n                                <p>- Double welted front pockets</p>\n\n                                <p>- Adjustable elastic string at hempen</p>\n\n                                <p>- Ultrasonically welded seams</p>\n\n                                <p>This is a unisex item, please check our clothing &amp; footwear sizing guide for specific Rains jacket sizing information. RAINS comes from the rainy nation of Denmark at the edge of the European continent, close to the ocean and with prevailing westerly winds; all factors that contribute to an average of 121 rain days each year. Arising from these rainy weather conditions comes the attitude that a quick rain shower may be beautiful, as well as moody- but first and foremost requires the right outfit. Rains focus on the whole experience of going outside on rainy days, issuing an invitation to explore even in the most mercurial weather.</p>','published','[\"products\\/23.jpg\",\"products\\/23-1.jpg\",\"products\\/23-2.jpg\",\"products\\/23-3.jpg\"]','SW-170-A0',0,16,0,1,0,1,0,0,561,NULL,NULL,NULL,19.00,19.00,20.00,567.00,NULL,108431,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,2,0),(24,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-110-A0',0,11,0,1,0,1,1,0,80.25,NULL,NULL,NULL,14.00,11.00,13.00,640.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(25,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-110-A0-A1',0,11,0,1,0,1,1,0,80.25,NULL,NULL,NULL,14.00,11.00,13.00,640.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(26,'Dual Camera 20MP (Digital)',NULL,NULL,'published','[\"products\\/1.jpg\"]','SW-110-A0-A2',0,11,0,1,0,1,1,0,80.25,NULL,NULL,NULL,14.00,11.00,13.00,640.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(27,'Smart Watches',NULL,NULL,'published','[\"products\\/2.jpg\"]','SW-105-A0',0,16,0,1,0,7,1,0,40.5,NULL,NULL,NULL,10.00,11.00,10.00,599.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(28,'Smart Watches',NULL,NULL,'published','[\"products\\/2-1.jpg\"]','SW-105-A0-A1',0,16,0,1,0,7,1,0,40.5,NULL,NULL,NULL,10.00,11.00,10.00,599.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(29,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-123-A0',0,15,0,1,0,6,1,0,20,NULL,NULL,NULL,11.00,13.00,13.00,740.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(30,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-123-A0-A1',0,15,0,1,0,6,1,0,20,NULL,NULL,NULL,11.00,13.00,13.00,740.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(31,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-123-A0-A2',0,15,0,1,0,6,1,0,20,NULL,NULL,NULL,11.00,13.00,13.00,740.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(32,'Beat Headphone',NULL,NULL,'published','[\"products\\/3.jpg\"]','SW-123-A0-A3',0,15,0,1,0,6,1,0,20,NULL,NULL,NULL,11.00,13.00,13.00,740.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(33,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/4.jpg\"]','SW-197-A0',0,13,0,1,0,6,1,0,586,515.68,NULL,NULL,19.00,15.00,19.00,895.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(34,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/4-1.jpg\"]','SW-197-A0-A1',0,13,0,1,0,6,1,0,586,492.24,NULL,NULL,19.00,15.00,19.00,895.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(35,'Red & Black Headphone',NULL,NULL,'published','[\"products\\/4-2.jpg\"]','SW-197-A0-A2',0,13,0,1,0,6,1,0,586,509.82,NULL,NULL,19.00,15.00,19.00,895.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(36,'Smart Watch External (Digital)',NULL,NULL,'published','[\"products\\/5.jpg\"]','SW-198-A0',0,18,0,1,0,4,1,0,783,NULL,NULL,NULL,19.00,19.00,14.00,828.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(37,'Smart Watch External (Digital)',NULL,NULL,'published','[\"products\\/5-1.jpg\"]','SW-198-A0-A1',0,18,0,1,0,4,1,0,783,NULL,NULL,NULL,19.00,19.00,14.00,828.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(38,'Nikon HD camera',NULL,NULL,'published','[\"products\\/6.jpg\"]','SW-114-A0',0,16,0,1,0,2,1,0,455,NULL,NULL,NULL,12.00,12.00,17.00,774.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(39,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-140-A0',0,15,0,1,0,4,1,0,553,NULL,NULL,NULL,12.00,11.00,19.00,871.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(40,'Audio Equipment',NULL,NULL,'published','[\"products\\/7.jpg\"]','SW-140-A0-A1',0,15,0,1,0,4,1,0,553,NULL,NULL,NULL,12.00,11.00,19.00,871.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(41,'Smart Televisions',NULL,NULL,'published','[\"products\\/8.jpg\"]','SW-161-A0',0,18,0,1,0,3,1,0,1236,914.64,NULL,NULL,14.00,11.00,11.00,869.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(42,'Samsung Smart Phone (Digital)',NULL,NULL,'published','[\"products\\/9.jpg\"]','SW-177-A0',0,11,0,1,0,2,1,0,547,NULL,NULL,NULL,15.00,20.00,10.00,503.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(43,'Samsung Smart Phone (Digital)',NULL,NULL,'published','[\"products\\/9-1.jpg\"]','SW-177-A0-A1',0,11,0,1,0,2,1,0,547,NULL,NULL,NULL,15.00,20.00,10.00,503.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(44,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10.jpg\"]','SW-170-A0',0,12,0,1,0,7,1,0,1170,NULL,NULL,NULL,10.00,10.00,10.00,597.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(45,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10-1.jpg\"]','SW-170-A0-A1',0,12,0,1,0,7,1,0,1170,NULL,NULL,NULL,10.00,10.00,10.00,597.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(46,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10-2.jpg\"]','SW-170-A0-A2',0,12,0,1,0,7,1,0,1170,NULL,NULL,NULL,10.00,10.00,10.00,597.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(47,'Herschel Leather Duffle Bag In Brown Color',NULL,NULL,'published','[\"products\\/10.jpg\"]','SW-170-A0-A3',0,12,0,1,0,7,1,0,1170,NULL,NULL,NULL,10.00,10.00,10.00,597.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(48,'Xbox One Wireless Controller Black Color',NULL,NULL,'published','[\"products\\/11.jpg\"]','SW-129-A0',0,14,0,1,0,7,1,0,1104,NULL,NULL,NULL,12.00,12.00,20.00,677.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(49,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12.jpg\"]','SW-109-A0',0,17,0,1,0,1,1,0,529,423.2,NULL,NULL,19.00,12.00,17.00,693.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(50,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12-1.jpg\"]','SW-109-A0-A1',0,17,0,1,0,1,1,0,529,454.94,NULL,NULL,19.00,12.00,17.00,693.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(51,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12-2.jpg\"]','SW-109-A0-A2',0,17,0,1,0,1,1,0,529,402.04,NULL,NULL,19.00,12.00,17.00,693.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(52,'EPSION Plaster Printer',NULL,NULL,'published','[\"products\\/12-3.jpg\"]','SW-109-A0-A3',0,17,0,1,0,1,1,0,529,380.88,NULL,NULL,19.00,12.00,17.00,693.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(53,'Sound Intone I65 Earphone White Version (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','SW-163-A0',0,12,0,1,0,2,1,0,543,NULL,NULL,NULL,12.00,14.00,18.00,705.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(54,'Sound Intone I65 Earphone White Version (Digital)',NULL,NULL,'published','[\"products\\/13-1.jpg\"]','SW-163-A0-A1',0,12,0,1,0,2,1,0,543,NULL,NULL,NULL,12.00,14.00,18.00,705.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(55,'Sound Intone I65 Earphone White Version (Digital)',NULL,NULL,'published','[\"products\\/13.jpg\"]','SW-163-A0-A2',0,12,0,1,0,2,1,0,543,NULL,NULL,NULL,12.00,14.00,18.00,705.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(56,'B&O Play Mini Bluetooth Speaker',NULL,NULL,'published','[\"products\\/14.jpg\"]','SW-114-A0',0,16,0,1,0,6,1,0,564,NULL,NULL,NULL,14.00,12.00,18.00,641.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(57,'B&O Play Mini Bluetooth Speaker',NULL,NULL,'published','[\"products\\/14.jpg\"]','SW-114-A0-A1',0,16,0,1,0,6,1,0,564,NULL,NULL,NULL,14.00,12.00,18.00,641.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(58,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL,'published','[\"products\\/15.jpg\"]','SW-169-A0',0,12,0,1,0,4,1,0,591,NULL,NULL,NULL,19.00,15.00,14.00,714.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(59,'Apple MacBook Air Retina 13.3-Inch Laptop',NULL,NULL,'published','[\"products\\/15-1.jpg\"]','SW-169-A0-A1',0,12,0,1,0,4,1,0,591,NULL,NULL,NULL,19.00,15.00,14.00,714.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(60,'Apple MacBook Air Retina 12-Inch Laptop',NULL,NULL,'published','[\"products\\/16.jpg\"]','SW-195-A0',0,17,0,1,0,4,1,0,501,385.77,NULL,NULL,18.00,18.00,14.00,546.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(61,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,NULL,'published','[\"products\\/17.jpg\"]','SW-200-A0',0,20,0,1,0,1,1,0,563,NULL,NULL,NULL,15.00,10.00,19.00,617.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(62,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,NULL,'published','[\"products\\/17-1.jpg\"]','SW-200-A0-A1',0,20,0,1,0,1,1,0,563,NULL,NULL,NULL,15.00,10.00,19.00,617.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(63,'Samsung Gear VR Virtual Reality Headset (Digital)',NULL,NULL,'published','[\"products\\/17-2.jpg\"]','SW-200-A0-A2',0,20,0,1,0,1,1,0,563,NULL,NULL,NULL,15.00,10.00,19.00,617.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(64,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18.jpg\"]','SW-120-A0',0,20,0,1,0,3,1,0,1097,NULL,NULL,NULL,13.00,17.00,12.00,556.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(65,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18-1.jpg\"]','SW-120-A0-A1',0,20,0,1,0,3,1,0,1097,NULL,NULL,NULL,13.00,17.00,12.00,556.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(66,'Aveeno Moisturizing Body Shower 450ml',NULL,NULL,'published','[\"products\\/18-2.jpg\"]','SW-120-A0-A2',0,20,0,1,0,3,1,0,1097,NULL,NULL,NULL,13.00,17.00,12.00,556.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(67,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19.jpg\"]','SW-153-A0',0,19,0,1,0,5,1,0,1035,NULL,NULL,NULL,19.00,12.00,17.00,690.00,NULL,0,'2024-01-25 00:45:00','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(68,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19-1.jpg\"]','SW-153-A0-A1',0,19,0,1,0,5,1,0,1035,NULL,NULL,NULL,19.00,12.00,17.00,690.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(69,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/19-2.jpg\"]','SW-153-A0-A2',0,19,0,1,0,5,1,0,1035,NULL,NULL,NULL,19.00,12.00,17.00,690.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(70,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20.jpg\"]','SW-193-A0',0,15,0,1,0,4,1,0,706,564.8,NULL,NULL,14.00,16.00,20.00,585.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(71,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20-1.jpg\"]','SW-193-A0-A1',0,15,0,1,0,4,1,0,706,515.38,NULL,NULL,14.00,16.00,20.00,585.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(72,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20-2.jpg\"]','SW-193-A0-A2',0,15,0,1,0,4,1,0,706,515.38,NULL,NULL,14.00,16.00,20.00,585.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(73,'NYX Beauty Couton Pallete Makeup 12',NULL,NULL,'published','[\"products\\/20-3.jpg\"]','SW-193-A0-A3',0,15,0,1,0,4,1,0,706,600.1,NULL,NULL,14.00,16.00,20.00,585.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(74,'MVMTH Classical Leather Watch In Black (Digital)',NULL,NULL,'published','[\"products\\/21.jpg\"]','SW-154-A0',0,15,0,1,0,3,1,0,903,NULL,NULL,NULL,20.00,12.00,18.00,530.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'digital',NULL,NULL,0,NULL,0),(75,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22.jpg\"]','SW-173-A0',0,20,0,1,0,3,1,0,517,NULL,NULL,NULL,20.00,16.00,16.00,896.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(76,'Baxter Care Hair Kit For Bearded Mens',NULL,NULL,'published','[\"products\\/22-1.jpg\"]','SW-173-A0-A1',0,20,0,1,0,3,1,0,517,NULL,NULL,NULL,20.00,16.00,16.00,896.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(77,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL,'published','[\"products\\/23.jpg\"]','SW-170-A0',0,16,0,1,0,1,1,0,561,NULL,NULL,NULL,19.00,19.00,20.00,567.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0),(78,'Ciate Palemore Lipstick Bold Red Color',NULL,NULL,'published','[\"products\\/23-1.jpg\"]','SW-170-A0-A1',0,16,0,1,0,1,1,0,561,NULL,NULL,NULL,19.00,19.00,20.00,567.00,NULL,0,'2024-01-25 00:45:01','2024-01-25 00:45:09','in_stock',0,'HuberwayCMS\\ACL\\Models\\User',NULL,'physical',NULL,NULL,0,NULL,0);
/*!40000 ALTER TABLE `ec_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_products_translations`
--

DROP TABLE IF EXISTS `ec_products_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_products_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ec_products_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `content` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`ec_products_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_products_translations`
--

LOCK TABLES `ec_products_translations` WRITE;
/*!40000 ALTER TABLE `ec_products_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_products_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_review_replies`
--

DROP TABLE IF EXISTS `ec_review_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_review_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `review_id` bigint unsigned NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_review_replies_review_id_user_id_unique` (`review_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_review_replies`
--

LOCK TABLES `ec_review_replies` WRITE;
/*!40000 ALTER TABLE `ec_review_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_review_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_reviews`
--

DROP TABLE IF EXISTS `ec_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `star` double(8,2) NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ec_reviews_product_id_customer_id_unique` (`product_id`,`customer_id`),
  KEY `ec_reviews_product_id_customer_id_status_created_at_index` (`product_id`,`customer_id`,`status`,`created_at`),
  KEY `review_relation_index` (`product_id`,`customer_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_reviews`
--

LOCK TABLES `ec_reviews` WRITE;
/*!40000 ALTER TABLE `ec_reviews` DISABLE KEYS */;
INSERT INTO `ec_reviews` VALUES (1,2,9,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-2.jpg\",\"products\\/20-1.jpg\"]'),(2,10,8,5.00,'Good app, good backup service and support. Good documentation.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-2.jpg\",\"products\\/23-1.jpg\"]'),(3,3,19,1.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5.jpg\",\"products\\/10-1.jpg\"]'),(4,6,16,5.00,'Best ecommerce CMS online store!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-1.jpg\",\"products\\/22-2.jpg\",\"products\\/23-1.jpg\"]'),(5,5,6,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-3.jpg\",\"products\\/22-2.jpg\"]'),(6,1,20,3.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\",\"products\\/11-1.jpg\",\"products\\/11-3.jpg\",\"products\\/23-1.jpg\"]'),(7,10,21,1.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/18-2.jpg\",\"products\\/22-3.jpg\"]'),(8,9,1,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\"]'),(9,3,2,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17.jpg\",\"products\\/22.jpg\"]'),(10,1,12,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/6.jpg\",\"products\\/8.jpg\",\"products\\/11-3.jpg\"]'),(11,1,23,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/16.jpg\",\"products\\/17-2.jpg\",\"products\\/19-1.jpg\"]'),(12,8,23,4.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5.jpg\",\"products\\/12-1.jpg\"]'),(13,7,2,4.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/5-2.jpg\",\"products\\/18-2.jpg\"]'),(14,2,20,1.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\"]'),(16,3,15,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/20.jpg\",\"products\\/22-3.jpg\"]'),(17,2,18,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\"]'),(18,5,7,2.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-1.jpg\",\"products\\/17.jpg\",\"products\\/22-3.jpg\"]'),(19,7,7,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\",\"products\\/14.jpg\",\"products\\/22-3.jpg\"]'),(20,4,21,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/20-3.jpg\"]'),(21,3,13,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15.jpg\",\"products\\/23.jpg\"]'),(22,4,23,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/8-3.jpg\",\"products\\/21.jpg\"]'),(23,2,16,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\",\"products\\/20.jpg\"]'),(24,3,11,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-2.jpg\",\"products\\/21-2.jpg\"]'),(25,4,8,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-2.jpg\",\"products\\/17-3.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\"]'),(26,3,21,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10.jpg\"]'),(27,8,14,3.00,'Best ecommerce CMS online store!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-3.jpg\"]'),(28,10,3,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/12-1.jpg\",\"products\\/13-1.jpg\",\"products\\/19.jpg\"]'),(30,10,10,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-1.jpg\",\"products\\/18.jpg\"]'),(31,3,17,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-2.jpg\",\"products\\/23-3.jpg\",\"products\\/23.jpg\"]'),(32,9,20,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-3.jpg\",\"products\\/20-2.jpg\"]'),(34,2,22,4.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/4-3.jpg\",\"products\\/10-2.jpg\",\"products\\/23-3.jpg\"]'),(35,2,8,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-3.jpg\",\"products\\/12-1.jpg\"]'),(36,8,15,1.00,'Good app, good backup service and support. Good documentation.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\",\"products\\/12.jpg\"]'),(37,1,4,4.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17.jpg\",\"products\\/20-3.jpg\",\"products\\/22-2.jpg\"]'),(38,7,9,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-3.jpg\",\"products\\/23-1.jpg\"]'),(39,3,6,3.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/14.jpg\"]'),(40,3,16,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/18-1.jpg\",\"products\\/20-1.jpg\"]'),(41,1,18,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-2.jpg\",\"products\\/11.jpg\",\"products\\/15-1.jpg\"]'),(42,10,23,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15-1.jpg\",\"products\\/19-3.jpg\"]'),(44,4,1,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/5-1.jpg\",\"products\\/18.jpg\"]'),(45,3,7,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/14.jpg\",\"products\\/17.jpg\"]'),(46,7,17,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2-3.jpg\",\"products\\/17.jpg\",\"products\\/20.jpg\"]'),(47,1,13,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\"]'),(48,5,17,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/16.jpg\",\"products\\/21.jpg\"]'),(49,5,20,3.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/15-1.jpg\"]'),(51,2,21,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\",\"products\\/17-2.jpg\"]'),(52,5,15,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-3.jpg\"]'),(54,6,12,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/17.jpg\"]'),(57,3,12,4.00,'Good app, good backup service and support. Good documentation.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\"]'),(58,7,21,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-1.jpg\",\"products\\/18-2.jpg\"]'),(61,3,8,2.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11.jpg\"]'),(62,9,12,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/20.jpg\"]'),(63,1,17,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-3.jpg\"]'),(64,7,15,3.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-2.jpg\",\"products\\/5.jpg\"]'),(65,8,8,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12.jpg\"]'),(66,2,1,4.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the HuberwayCMS team was really fast & helpful. You guys are awesome!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-1.jpg\"]'),(67,3,14,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\",\"products\\/18.jpg\",\"products\\/22-3.jpg\"]'),(68,8,5,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-1.jpg\"]'),(69,6,14,3.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8.jpg\",\"products\\/10-1.jpg\",\"products\\/23-3.jpg\"]'),(70,1,9,1.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-3.jpg\"]'),(71,7,10,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the HuberwayCMS team was really fast & helpful. You guys are awesome!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2-3.jpg\",\"products\\/8-1.jpg\",\"products\\/18-2.jpg\"]'),(72,10,9,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15.jpg\"]'),(73,2,2,3.00,'Best ecommerce CMS online store!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-3.jpg\",\"products\\/23-2.jpg\"]'),(74,6,11,3.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19.jpg\",\"products\\/21.jpg\"]'),(75,9,19,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/19-3.jpg\",\"products\\/21.jpg\",\"products\\/23.jpg\"]'),(77,7,19,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\",\"products\\/23-2.jpg\"]'),(79,9,17,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15-1.jpg\",\"products\\/19-2.jpg\"]'),(81,10,16,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-1.jpg\"]'),(82,8,13,1.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/5.jpg\"]'),(83,4,9,3.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-3.jpg\",\"products\\/14.jpg\",\"products\\/20-2.jpg\"]'),(84,8,21,2.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/6.jpg\",\"products\\/12-3.jpg\",\"products\\/22-1.jpg\"]'),(85,3,3,1.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\"]'),(86,9,8,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\",\"products\\/18-3.jpg\",\"products\\/23-2.jpg\"]'),(87,8,22,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8.jpg\",\"products\\/19-1.jpg\"]'),(88,7,4,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/21.jpg\"]'),(90,5,8,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-1.jpg\",\"products\\/22-1.jpg\"]'),(92,5,14,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5.jpg\",\"products\\/9-1.jpg\",\"products\\/13.jpg\",\"products\\/20-3.jpg\"]'),(93,4,14,5.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/4-1.jpg\",\"products\\/6.jpg\",\"products\\/23-1.jpg\"]'),(94,5,13,4.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/21-2.jpg\",\"products\\/23-2.jpg\"]'),(97,6,13,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8.jpg\",\"products\\/18-3.jpg\",\"products\\/23-2.jpg\"]'),(99,8,11,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/6.jpg\",\"products\\/10.jpg\",\"products\\/13.jpg\"]'),(100,1,21,2.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the HuberwayCMS team was really fast & helpful. You guys are awesome!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-1.jpg\",\"products\\/22-2.jpg\"]'),(101,9,6,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\",\"products\\/11-3.jpg\",\"products\\/21-2.jpg\",\"products\\/22.jpg\"]'),(103,9,14,2.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/22-1.jpg\"]'),(105,6,8,2.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-2.jpg\"]'),(107,9,23,3.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/11.jpg\",\"products\\/17-3.jpg\"]'),(109,9,2,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\",\"products\\/10-2.jpg\",\"products\\/17.jpg\"]'),(110,4,6,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17-1.jpg\"]'),(111,2,17,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/9.jpg\",\"products\\/19-1.jpg\",\"products\\/23-1.jpg\"]'),(113,10,17,5.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/4.jpg\",\"products\\/18-1.jpg\",\"products\\/20-2.jpg\"]'),(114,5,3,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/13.jpg\",\"products\\/21.jpg\"]'),(115,8,10,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/9.jpg\",\"products\\/22-3.jpg\"]'),(120,8,6,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-3.jpg\"]'),(122,10,5,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\",\"products\\/15.jpg\",\"products\\/19.jpg\"]'),(123,1,6,1.00,'The best ecommerce CMS! Excellent coding! best support service! Thank you so much..... I really like your hard work.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-3.jpg\"]'),(124,3,4,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2-1.jpg\",\"products\\/4.jpg\"]'),(125,1,19,4.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10.jpg\"]'),(126,3,9,2.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-1.jpg\",\"products\\/16.jpg\",\"products\\/22-1.jpg\"]'),(127,9,4,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\"]'),(130,1,14,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/23-1.jpg\"]'),(131,6,7,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/8-1.jpg\",\"products\\/13.jpg\",\"products\\/20.jpg\"]'),(133,1,11,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/13.jpg\",\"products\\/20.jpg\"]'),(134,7,5,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/19-3.jpg\"]'),(136,6,23,2.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-3.jpg\",\"products\\/13.jpg\",\"products\\/20-2.jpg\"]'),(138,4,16,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/15.jpg\",\"products\\/22-2.jpg\",\"products\\/23-2.jpg\"]'),(139,10,13,5.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/14.jpg\"]'),(140,6,18,2.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/12-1.jpg\",\"products\\/13-1.jpg\",\"products\\/13.jpg\"]'),(141,9,11,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17.jpg\",\"products\\/23-2.jpg\"]'),(144,6,15,1.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/2.jpg\",\"products\\/3.jpg\"]'),(148,2,14,2.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18.jpg\"]'),(151,8,16,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\"]'),(152,1,1,4.00,'Those guys now what they are doing, the release such a good product that it\'s a pleasure to work with ! Even when I was stuck on the project, I created a ticket and the next day it was replied by the team. GOOD JOB guys. I love working with them :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/5.jpg\",\"products\\/15-1.jpg\",\"products\\/21-1.jpg\"]'),(153,6,2,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-3.jpg\",\"products\\/9-1.jpg\",\"products\\/18-3.jpg\",\"products\\/23-2.jpg\"]'),(158,5,16,5.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-2.jpg\",\"products\\/11-3.jpg\",\"products\\/13-1.jpg\",\"products\\/20.jpg\"]'),(159,10,19,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\",\"products\\/8-3.jpg\"]'),(162,4,20,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\",\"products\\/8-3.jpg\",\"products\\/21.jpg\",\"products\\/23.jpg\"]'),(163,2,13,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/6.jpg\",\"products\\/8-2.jpg\",\"products\\/8.jpg\",\"products\\/19-1.jpg\"]'),(168,2,11,3.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-3.jpg\"]'),(169,7,3,3.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\"]'),(170,7,20,3.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/10-2.jpg\",\"products\\/23.jpg\"]'),(172,10,15,1.00,'Good app, good backup service and support. Good documentation.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18.jpg\"]'),(173,10,18,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the HuberwayCMS team was really fast & helpful. You guys are awesome!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/7.jpg\"]'),(175,3,23,5.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/7.jpg\",\"products\\/12-1.jpg\",\"products\\/19-3.jpg\"]'),(177,7,13,5.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17-2.jpg\",\"products\\/22-1.jpg\"]'),(182,6,20,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2.jpg\",\"products\\/8.jpg\",\"products\\/12-3.jpg\"]'),(183,1,5,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-3.jpg\",\"products\\/13-1.jpg\",\"products\\/23-3.jpg\"]'),(184,7,12,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11.jpg\",\"products\\/20-3.jpg\"]'),(185,8,17,2.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\",\"products\\/7.jpg\",\"products\\/10-2.jpg\",\"products\\/20-1.jpg\"]'),(187,9,15,5.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/13-1.jpg\",\"products\\/15-1.jpg\"]'),(194,10,11,5.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/18.jpg\"]'),(196,7,18,2.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/7.jpg\",\"products\\/19-1.jpg\",\"products\\/19-2.jpg\"]'),(198,9,21,2.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/21-2.jpg\"]'),(200,7,14,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\",\"products\\/20-2.jpg\",\"products\\/21-2.jpg\",\"products\\/22-1.jpg\"]'),(202,1,16,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/23.jpg\"]'),(203,9,13,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-1.jpg\",\"products\\/21-2.jpg\"]'),(204,9,22,5.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\"]'),(206,3,18,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/18-1.jpg\",\"products\\/19-2.jpg\",\"products\\/22-3.jpg\"]'),(212,10,14,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/13.jpg\"]'),(214,2,15,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\"]'),(219,5,22,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8.jpg\",\"products\\/12.jpg\",\"products\\/18-2.jpg\",\"products\\/20.jpg\"]'),(221,4,17,4.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/8-2.jpg\",\"products\\/11.jpg\",\"products\\/21.jpg\"]'),(222,6,4,5.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-1.jpg\",\"products\\/10.jpg\",\"products\\/20-3.jpg\"]'),(223,7,22,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\"]'),(225,6,21,1.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/14.jpg\",\"products\\/19-2.jpg\",\"products\\/23-1.jpg\"]'),(226,1,22,5.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12.jpg\",\"products\\/13-1.jpg\",\"products\\/18-3.jpg\"]'),(227,6,17,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/23.jpg\"]'),(229,8,19,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/3.jpg\",\"products\\/19.jpg\",\"products\\/21-1.jpg\"]'),(230,5,19,2.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-3.jpg\"]'),(233,5,11,3.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/23-2.jpg\"]'),(234,1,2,2.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/5-3.jpg\"]'),(235,5,12,4.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/10-2.jpg\",\"products\\/15-1.jpg\",\"products\\/19-1.jpg\"]'),(242,7,1,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-2.jpg\",\"products\\/11-2.jpg\",\"products\\/20.jpg\",\"products\\/22.jpg\"]'),(243,6,22,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\",\"products\\/8-3.jpg\",\"products\\/20-2.jpg\",\"products\\/20.jpg\"]'),(244,4,18,5.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/19-1.jpg\"]'),(256,2,12,5.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/13-1.jpg\",\"products\\/17.jpg\",\"products\\/23-1.jpg\"]'),(258,3,1,4.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-3.jpg\"]'),(261,4,19,1.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/21-2.jpg\"]'),(264,10,4,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\"]'),(269,4,7,3.00,'This web app is really good in design, code quality & features. Besides, the customer support provided by the HuberwayCMS team was really fast & helpful. You guys are awesome!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/6.jpg\",\"products\\/12-1.jpg\",\"products\\/12-2.jpg\",\"products\\/13-1.jpg\"]'),(271,6,5,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/23-3.jpg\"]'),(276,7,6,5.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/10.jpg\",\"products\\/13.jpg\",\"products\\/17-3.jpg\"]'),(277,2,10,5.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/22-1.jpg\",\"products\\/22-3.jpg\",\"products\\/23-3.jpg\"]'),(278,9,16,5.00,'Solution is too robust for our purpose so we didn\'t use it at the end. But I appreciate customer support during initial configuration.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15-1.jpg\"]'),(284,1,7,3.00,'Cool template. Excellent code quality. The support responds very quickly, which is very rare on themeforest and codecanyon.net, I buy a lot of templates, and everyone will have a response from technical support for two or three days. Thanks to tech support. I recommend to buy.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\",\"products\\/11-1.jpg\",\"products\\/18.jpg\"]'),(285,5,2,2.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\"]'),(289,4,5,2.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\",\"products\\/11-1.jpg\",\"products\\/15-1.jpg\",\"products\\/20-1.jpg\"]'),(298,8,12,3.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12.jpg\",\"products\\/17-2.jpg\"]'),(301,4,2,5.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\",\"products\\/17-3.jpg\"]'),(304,8,9,4.00,'For me the best eCommerce script on Envato at this moment: modern, clean code, a lot of great features. The customer support is great too: I always get an answer within hours!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/8.jpg\"]'),(322,6,10,3.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-1.jpg\",\"products\\/19-1.jpg\",\"products\\/20-3.jpg\"]'),(325,8,7,2.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5.jpg\",\"products\\/21.jpg\"]'),(329,6,6,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/9-2.jpg\",\"products\\/12-2.jpg\",\"products\\/22-3.jpg\"]'),(333,10,20,4.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\"]'),(339,4,12,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\"]'),(344,3,10,3.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/12-2.jpg\"]'),(347,4,11,3.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/6.jpg\",\"products\\/18.jpg\",\"products\\/20-2.jpg\"]'),(348,8,4,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\",\"products\\/9.jpg\",\"products\\/10-1.jpg\",\"products\\/17-2.jpg\"]'),(351,10,6,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11-2.jpg\",\"products\\/14.jpg\",\"products\\/17.jpg\",\"products\\/22-3.jpg\"]'),(354,10,22,2.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-1.jpg\",\"products\\/16.jpg\"]'),(356,8,20,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-3.jpg\"]'),(374,3,20,2.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-3.jpg\"]'),(380,5,18,1.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/18-2.jpg\"]'),(382,2,4,5.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/20-1.jpg\",\"products\\/20-3.jpg\"]'),(384,4,10,4.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-1.jpg\",\"products\\/2-2.jpg\",\"products\\/17-2.jpg\",\"products\\/20-1.jpg\"]'),(390,9,7,1.00,'The script is the best of its class, fast, easy to implement and work with , and the most important thing is the great support team , Recommend with no doubt.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10.jpg\"]'),(393,6,19,1.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\",\"products\\/16.jpg\",\"products\\/21-2.jpg\"]'),(394,10,7,2.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19-1.jpg\"]'),(399,5,5,2.00,'Best ecommerce CMS online store!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5.jpg\"]'),(401,1,8,1.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/10-2.jpg\",\"products\\/23-2.jpg\"]'),(409,7,23,4.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/3.jpg\",\"products\\/8-1.jpg\",\"products\\/9-2.jpg\",\"products\\/22-2.jpg\"]'),(411,9,5,5.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\",\"products\\/15-1.jpg\"]'),(427,10,2,2.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\",\"products\\/18-2.jpg\"]'),(447,7,11,3.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-2.jpg\"]'),(449,6,9,3.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/21.jpg\",\"products\\/22.jpg\"]'),(450,9,18,2.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-3.jpg\",\"products\\/16.jpg\"]'),(462,3,5,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/11.jpg\",\"products\\/12.jpg\",\"products\\/20-2.jpg\"]'),(481,4,4,2.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/19-2.jpg\"]'),(494,9,9,2.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-2.jpg\",\"products\\/4-2.jpg\",\"products\\/14.jpg\",\"products\\/23-2.jpg\"]'),(512,1,10,5.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\",\"products\\/7.jpg\",\"products\\/22-2.jpg\"]'),(518,6,1,4.00,'Great system, great support, good job HuberwayCMS. I\'m looking forward to more great functional plugins.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/12.jpg\"]'),(523,5,10,2.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-3.jpg\",\"products\\/20-1.jpg\"]'),(534,5,21,3.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8.jpg\",\"products\\/23.jpg\"]'),(547,9,3,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-2.jpg\",\"products\\/16.jpg\",\"products\\/17-2.jpg\",\"products\\/23-2.jpg\"]'),(573,4,13,5.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\",\"products\\/11-3.jpg\",\"products\\/20.jpg\"]'),(588,2,5,2.00,'Clean & perfect source code','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-1.jpg\",\"products\\/17-2.jpg\",\"products\\/19-3.jpg\",\"products\\/20-3.jpg\"]'),(590,5,1,2.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/17-2.jpg\",\"products\\/19.jpg\"]'),(605,8,2,5.00,'It\'s not my first experience here on Codecanyon and I can honestly tell you all that HuberwayCMS puts a LOT of effort into the support. They answer so fast, they helped me tons of times. REALLY by far THE BEST EXPERIENCE on Codecanyon. Those guys at HuberwayCMS are so good that they deserve 5 stars. I recommend them, I trust them and I can\'t wait to see what they will sell in a near future. Thank you HuberwayCMS :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/11.jpg\",\"products\\/17.jpg\",\"products\\/21.jpg\",\"products\\/23.jpg\"]'),(608,2,23,5.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4.jpg\",\"products\\/5.jpg\",\"products\\/9-1.jpg\"]'),(612,5,9,3.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/5.jpg\",\"products\\/20.jpg\"]'),(615,7,8,5.00,'Great E-commerce system. And much more : Wonderful Customer Support.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/19.jpg\",\"products\\/23.jpg\"]'),(620,8,3,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/3.jpg\",\"products\\/11-2.jpg\"]'),(636,9,10,2.00,'The best store template! Excellent coding! Very good support! Thank you so much for all the help, I really appreciated.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/10-2.jpg\"]'),(652,8,1,3.00,'This script is well coded and is super fast. The support is pretty quick. Very patient and helpful team. I strongly recommend it and they deserve more than 5 stars.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-2.jpg\",\"products\\/10-1.jpg\",\"products\\/14.jpg\",\"products\\/21.jpg\"]'),(659,2,3,5.00,'These guys are amazing! Responses immediately, amazing support and help... I immediately feel at ease after Purchasing..','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/5-1.jpg\"]'),(681,7,16,3.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2.jpg\",\"products\\/20-3.jpg\"]'),(702,5,4,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-2.jpg\"]'),(732,4,22,3.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/12-2.jpg\",\"products\\/21-1.jpg\",\"products\\/22-3.jpg\"]'),(750,6,3,5.00,'Very enthusiastic support! Excellent code is written. It\'s a true pleasure working with.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/4-3.jpg\",\"products\\/10-1.jpg\",\"products\\/19-2.jpg\",\"products\\/23-1.jpg\"]'),(768,10,12,5.00,'Ok good product. I have some issues in customizations. But its not correct to blame the developer. The product is good. Good luck for your business.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/1.jpg\",\"products\\/2-2.jpg\",\"products\\/12-1.jpg\",\"products\\/20-3.jpg\"]'),(776,4,15,4.00,'Perfect +++++++++ i love it really also i get to fast ticket answers... Thanks Lot HUBERWAY Teams','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9-1.jpg\",\"products\\/16.jpg\"]'),(799,2,7,4.00,'As a developer I reviewed this script. This is really awesome ecommerce script. I have convinced when I noticed that it\'s built on fully WordPress concept.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/8-1.jpg\",\"products\\/11-1.jpg\",\"products\\/18-2.jpg\",\"products\\/22.jpg\"]'),(834,2,19,5.00,'Amazing code, amazing support. Overall, im really confident in HuberwayCMS and im happy I made the right choice! Thank you so much guys for coding this masterpiece','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\",\"products\\/7.jpg\",\"products\\/12.jpg\",\"products\\/18-1.jpg\"]'),(853,2,6,3.00,'Second or third time that I buy a HuberwayCMS product, happy with the products and support. You guys do a good job :)','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/15.jpg\",\"products\\/18-3.jpg\",\"products\\/20-2.jpg\",\"products\\/22-2.jpg\"]'),(859,8,18,5.00,'We have received brilliant service support and will be expanding the features with the developer. Nice product!','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/11-3.jpg\"]'),(880,3,22,4.00,'Customer Support are grade (A*), however the code is a way too over engineered for it\'s purpose.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2-3.jpg\",\"products\\/10-2.jpg\"]'),(897,5,23,2.00,'The code is good, in general, if you like it, can you give it 5 stars?','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/2.jpg\",\"products\\/8-1.jpg\",\"products\\/12-1.jpg\"]'),(976,10,1,3.00,'I Love this Script. I also found how to add other fees. Now I just wait the BIG update for the Marketplace with the Bulk Import. Just do not forget to make it to be Multi-language for us the HuberwayCMS Fans.','published','2024-01-25 00:45:04','2024-01-25 00:45:04','[\"products\\/9.jpg\",\"products\\/17.jpg\",\"products\\/19.jpg\"]');
/*!40000 ALTER TABLE `ec_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipment_histories`
--

DROP TABLE IF EXISTS `ec_shipment_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipment_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `shipment_id` bigint unsigned NOT NULL,
  `order_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HuberwayCMS\\ACL\\Models\\User',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipment_histories`
--

LOCK TABLES `ec_shipment_histories` WRITE;
/*!40000 ALTER TABLE `ec_shipment_histories` DISABLE KEYS */;
INSERT INTO `ec_shipment_histories` VALUES (1,'create_from_order','Shipping was created from order %order_id%',0,1,1,'2024-01-18 08:45:09','2024-01-18 08:45:09','HuberwayCMS\\ACL\\Models\\User'),(2,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,1,1,'2024-01-23 08:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(3,'create_from_order','Shipping was created from order %order_id%',0,2,2,'2024-01-09 04:45:10','2024-01-09 04:45:10','HuberwayCMS\\ACL\\Models\\User'),(4,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,2,2,'2024-01-23 10:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(5,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,2,2,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(6,'create_from_order','Shipping was created from order %order_id%',0,3,3,'2024-01-21 20:45:10','2024-01-21 20:45:10','HuberwayCMS\\ACL\\Models\\User'),(7,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,3,3,'2024-01-23 10:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(8,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,3,3,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(9,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,3,3,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(10,'create_from_order','Shipping was created from order %order_id%',0,4,4,'2024-01-10 00:45:10','2024-01-10 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(11,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,4,4,'2024-01-23 12:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(12,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,4,4,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(13,'create_from_order','Shipping was created from order %order_id%',0,5,5,'2024-01-20 12:45:10','2024-01-20 12:45:10','HuberwayCMS\\ACL\\Models\\User'),(14,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,5,5,'2024-01-23 12:45:10','2024-01-25 00:45:10','HuberwayCMS\\ACL\\Models\\User'),(15,'create_from_order','Shipping was created from order %order_id%',0,6,6,'2024-01-12 06:45:10','2024-01-12 06:45:10','HuberwayCMS\\ACL\\Models\\User'),(16,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,6,6,'2024-01-23 14:45:11','2024-01-25 00:45:11','HuberwayCMS\\ACL\\Models\\User'),(17,'create_from_order','Shipping was created from order %order_id%',0,7,8,'2024-01-11 16:45:11','2024-01-11 16:45:11','HuberwayCMS\\ACL\\Models\\User'),(18,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,7,8,'2024-01-23 16:45:11','2024-01-25 00:45:11','HuberwayCMS\\ACL\\Models\\User'),(19,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,7,8,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\ACL\\Models\\User'),(20,'create_from_order','Shipping was created from order %order_id%',0,8,10,'2024-01-18 18:45:11','2024-01-18 18:45:11','HuberwayCMS\\ACL\\Models\\User'),(21,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,8,10,'2024-01-23 18:45:11','2024-01-25 00:45:11','HuberwayCMS\\ACL\\Models\\User'),(22,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,8,10,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\ACL\\Models\\User'),(23,'create_from_order','Shipping was created from order %order_id%',0,9,11,'2024-01-16 06:45:11','2024-01-16 06:45:11','HuberwayCMS\\ACL\\Models\\User'),(24,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,9,11,'2024-01-23 18:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(25,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,9,11,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(26,'create_from_order','Shipping was created from order %order_id%',0,10,13,'2024-01-23 20:45:12','2024-01-23 20:45:12','HuberwayCMS\\ACL\\Models\\User'),(27,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,10,13,'2024-01-23 20:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(28,'create_from_order','Shipping was created from order %order_id%',0,11,14,'2024-01-23 20:45:12','2024-01-23 20:45:12','HuberwayCMS\\ACL\\Models\\User'),(29,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,11,14,'2024-01-23 20:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(30,'create_from_order','Shipping was created from order %order_id%',0,12,15,'2024-01-22 16:45:12','2024-01-22 16:45:12','HuberwayCMS\\ACL\\Models\\User'),(31,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,12,15,'2024-01-23 20:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(32,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,12,15,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\ACL\\Models\\User'),(33,'create_from_order','Shipping was created from order %order_id%',0,13,16,'2024-01-22 20:45:12','2024-01-22 20:45:12','HuberwayCMS\\ACL\\Models\\User'),(34,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,13,16,'2024-01-23 22:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(35,'create_from_order','Shipping was created from order %order_id%',0,14,17,'2024-01-23 22:45:13','2024-01-23 22:45:13','HuberwayCMS\\ACL\\Models\\User'),(36,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,14,17,'2024-01-23 22:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(37,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,14,17,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(38,'create_from_order','Shipping was created from order %order_id%',0,15,18,'2024-01-21 18:45:13','2024-01-21 18:45:13','HuberwayCMS\\ACL\\Models\\User'),(39,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,15,18,'2024-01-23 22:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(40,'create_from_order','Shipping was created from order %order_id%',0,16,19,'2024-01-15 00:45:13','2024-01-15 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(41,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,16,19,'2024-01-24 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(42,'create_from_order','Shipping was created from order %order_id%',0,17,20,'2024-01-22 00:45:13','2024-01-22 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(43,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,17,20,'2024-01-24 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(44,'create_from_order','Shipping was created from order %order_id%',0,18,21,'2024-01-22 06:45:13','2024-01-22 06:45:13','HuberwayCMS\\ACL\\Models\\User'),(45,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,18,21,'2024-01-24 02:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(46,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,18,21,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\ACL\\Models\\User'),(47,'create_from_order','Shipping was created from order %order_id%',0,19,25,'2024-01-23 08:45:14','2024-01-23 08:45:14','HuberwayCMS\\ACL\\Models\\User'),(48,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,19,25,'2024-01-24 04:45:14','2024-01-25 00:45:14','HuberwayCMS\\ACL\\Models\\User'),(49,'create_from_order','Shipping was created from order %order_id%',0,20,26,'2024-01-19 18:45:14','2024-01-19 18:45:14','HuberwayCMS\\ACL\\Models\\User'),(50,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,20,26,'2024-01-24 06:45:14','2024-01-25 00:45:14','HuberwayCMS\\ACL\\Models\\User'),(51,'create_from_order','Shipping was created from order %order_id%',0,21,27,'2024-01-20 08:45:14','2024-01-20 08:45:14','HuberwayCMS\\ACL\\Models\\User'),(52,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,21,27,'2024-01-24 08:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(53,'create_from_order','Shipping was created from order %order_id%',0,22,28,'2024-01-18 08:45:15','2024-01-18 08:45:15','HuberwayCMS\\ACL\\Models\\User'),(54,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,22,28,'2024-01-24 08:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(55,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,22,28,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(56,'create_from_order','Shipping was created from order %order_id%',0,23,30,'2024-01-22 02:45:15','2024-01-22 02:45:15','HuberwayCMS\\ACL\\Models\\User'),(57,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,23,30,'2024-01-24 10:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(58,'create_from_order','Shipping was created from order %order_id%',0,24,31,'2024-01-21 12:45:15','2024-01-21 12:45:15','HuberwayCMS\\ACL\\Models\\User'),(59,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,24,31,'2024-01-24 12:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(60,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,24,31,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(61,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,24,31,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\ACL\\Models\\User'),(62,'create_from_order','Shipping was created from order %order_id%',0,25,33,'2024-01-24 12:45:15','2024-01-24 12:45:15','HuberwayCMS\\ACL\\Models\\User'),(63,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,25,33,'2024-01-24 12:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(64,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,25,33,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(65,'create_from_order','Shipping was created from order %order_id%',0,26,35,'2024-01-24 04:45:16','2024-01-24 04:45:16','HuberwayCMS\\ACL\\Models\\User'),(66,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,26,35,'2024-01-24 14:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(67,'create_from_order','Shipping was created from order %order_id%',0,27,37,'2024-01-22 16:45:16','2024-01-22 16:45:16','HuberwayCMS\\ACL\\Models\\User'),(68,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,27,37,'2024-01-24 16:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(69,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,27,37,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(70,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,27,37,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\ACL\\Models\\User'),(71,'create_from_order','Shipping was created from order %order_id%',0,28,38,'2024-01-24 16:45:16','2024-01-24 16:45:16','HuberwayCMS\\ACL\\Models\\User'),(72,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,28,38,'2024-01-24 16:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(73,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,28,38,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(74,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,28,38,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(75,'create_from_order','Shipping was created from order %order_id%',0,29,39,'2024-01-22 00:45:17','2024-01-22 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(76,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,29,39,'2024-01-24 16:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(77,'create_from_order','Shipping was created from order %order_id%',0,30,40,'2024-01-22 16:45:17','2024-01-22 16:45:17','HuberwayCMS\\ACL\\Models\\User'),(78,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,30,40,'2024-01-24 16:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(79,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,30,40,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(80,'create_from_order','Shipping was created from order %order_id%',0,31,41,'2024-01-24 18:45:17','2024-01-24 18:45:17','HuberwayCMS\\ACL\\Models\\User'),(81,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,31,41,'2024-01-24 18:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(82,'create_from_order','Shipping was created from order %order_id%',0,32,42,'2024-01-22 12:45:17','2024-01-22 12:45:17','HuberwayCMS\\ACL\\Models\\User'),(83,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,32,42,'2024-01-24 18:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(84,'create_from_order','Shipping was created from order %order_id%',0,33,43,'2024-01-24 12:45:17','2024-01-24 12:45:17','HuberwayCMS\\ACL\\Models\\User'),(85,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,33,43,'2024-01-24 20:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(86,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,33,43,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\ACL\\Models\\User'),(87,'create_from_order','Shipping was created from order %order_id%',0,34,44,'2024-01-24 12:45:17','2024-01-24 12:45:17','HuberwayCMS\\ACL\\Models\\User'),(88,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,34,44,'2024-01-24 20:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(89,'update_cod_status','Updated COD status to Completed . Updated by: %user_name%',0,34,44,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(90,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,34,44,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(91,'create_from_order','Shipping was created from order %order_id%',0,35,45,'2024-01-23 20:45:18','2024-01-23 20:45:18','HuberwayCMS\\ACL\\Models\\User'),(92,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,35,45,'2024-01-24 20:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(93,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,35,45,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(94,'create_from_order','Shipping was created from order %order_id%',0,36,46,'2024-01-24 16:45:18','2024-01-24 16:45:18','HuberwayCMS\\ACL\\Models\\User'),(95,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,36,46,'2024-01-24 22:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(96,'update_status','Changed status of shipping to: Delivered. Updated by: %user_name%',0,36,46,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User'),(97,'create_from_order','Shipping was created from order %order_id%',0,37,47,'2024-01-24 16:45:18','2024-01-24 16:45:18','HuberwayCMS\\ACL\\Models\\User'),(98,'update_status','Changed status of shipping to: Approved. Updated by: %user_name%',0,37,47,'2024-01-24 22:45:18','2024-01-25 00:45:18','HuberwayCMS\\ACL\\Models\\User');
/*!40000 ALTER TABLE `ec_shipment_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipments`
--

DROP TABLE IF EXISTS `ec_shipments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `weight` double(8,2) DEFAULT '0.00',
  `shipment_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rate_id` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cod_amount` decimal(15,2) DEFAULT '0.00',
  `cod_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `cross_checking_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `price` decimal(15,2) DEFAULT '0.00',
  `store_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tracking_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tracking_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estimate_date_shipped` datetime DEFAULT NULL,
  `date_shipped` datetime DEFAULT NULL,
  `label_url` text COLLATE utf8mb4_unicode_ci,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipments`
--

LOCK TABLES `ec_shipments` WRITE;
/*!40000 ALTER TABLE `ec_shipments` DISABLE KEYS */;
INSERT INTO `ec_shipments` VALUES (1,1,NULL,2328.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','JJD008513667','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:10',NULL,NULL,NULL),(2,2,NULL,895.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','JJD0064963281','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:10','2024-01-25 07:45:10',NULL,NULL),(3,3,NULL,2935.00,NULL,NULL,'','delivered',2809.00,'completed','pending',0.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','JJD0019735106','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 07:45:10','2024-01-25 07:45:10',NULL,NULL),(4,4,NULL,2105.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','JJD0066476474','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:10','2024-01-25 07:45:10',NULL,NULL),(5,5,NULL,2688.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:10','2024-01-25 00:45:10','JJD0082844532','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-30 07:45:10',NULL,NULL,NULL),(6,6,NULL,2322.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','JJD0081851899','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:11',NULL,NULL,NULL),(7,8,NULL,1386.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','JJD0043189881','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-28 07:45:11','2024-01-25 07:45:11',NULL,NULL),(8,10,NULL,1790.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:11','2024-01-25 00:45:11','JJD0077456881','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 07:45:11','2024-01-25 07:45:11',NULL,NULL),(9,11,NULL,714.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','JJD0032123345','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:12','2024-01-25 07:45:12',NULL,NULL),(10,13,NULL,1480.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','JJD0010922610','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-31 07:45:12',NULL,NULL,NULL),(11,14,NULL,1194.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','JJD0055668049','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 07:45:12',NULL,NULL,NULL),(12,15,NULL,3584.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:12','2024-01-25 00:45:12','JJD0071271795','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-29 07:45:12','2024-01-25 07:45:12',NULL,NULL),(13,16,NULL,740.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0042941490','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-28 07:45:13',NULL,NULL,NULL),(14,17,NULL,1709.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0039445890','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-30 07:45:13','2024-01-25 07:45:13',NULL,NULL),(15,18,NULL,585.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0041899038','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-26 07:45:13',NULL,NULL,NULL),(16,19,NULL,3048.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0055020779','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-29 07:45:13',NULL,NULL,NULL),(17,20,NULL,3045.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0064257112','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-30 07:45:13',NULL,NULL,NULL),(18,21,NULL,3070.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:13','2024-01-25 00:45:13','JJD0074063096','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-26 07:45:13','2024-01-25 07:45:13',NULL,NULL),(19,25,NULL,1755.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','JJD0090684415','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-26 07:45:14',NULL,NULL,NULL),(20,26,NULL,3141.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:14','2024-01-25 00:45:14','JJD0037098603','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-26 07:45:14',NULL,NULL,NULL),(21,27,NULL,597.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','JJD0062109930','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-31 07:45:15',NULL,NULL,NULL),(22,28,NULL,546.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','JJD0012772090','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 07:45:15','2024-01-25 07:45:15',NULL,NULL),(23,30,NULL,1428.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','JJD0040139065','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:15',NULL,NULL,NULL),(24,31,NULL,1790.00,NULL,NULL,'','delivered',1172.00,'completed','pending',0.00,0,'2024-01-25 00:45:15','2024-01-25 00:45:15','JJD0094913050','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-26 07:45:15','2024-01-25 07:45:15',NULL,NULL),(25,33,NULL,1923.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','JJD0098286524','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:16','2024-01-25 07:45:16',NULL,NULL),(26,35,NULL,1470.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','JJD0043076169','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 07:45:16',NULL,NULL,NULL),(27,37,NULL,677.00,NULL,NULL,'','delivered',1104.00,'completed','pending',0.00,0,'2024-01-25 00:45:16','2024-01-25 00:45:16','JJD0039717835','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-04 07:45:16','2024-01-25 07:45:16',NULL,NULL),(28,38,NULL,2079.00,NULL,NULL,'','delivered',1587.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0015946311','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:17','2024-01-25 07:45:17',NULL,NULL),(29,39,NULL,1092.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0019935631','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-28 07:45:17',NULL,NULL,NULL),(30,40,NULL,556.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0036056883','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:17','2024-01-25 07:45:17',NULL,NULL),(31,41,NULL,740.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0080966075','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:17',NULL,NULL,NULL),(32,42,NULL,1791.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0059194204','FastShipping','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-28 07:45:17',NULL,NULL,NULL),(33,43,NULL,2613.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:17','2024-01-25 00:45:17','JJD0050626585','AliExpress','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:17','2024-01-25 07:45:17',NULL,NULL),(34,44,NULL,677.00,NULL,NULL,'','delivered',1104.00,'completed','pending',0.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','JJD0083223625','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:18','2024-01-25 07:45:18',NULL,NULL),(35,45,NULL,2452.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','JJD0036782484','GHN','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-01-27 07:45:18','2024-01-25 07:45:18',NULL,NULL),(36,46,NULL,1797.00,NULL,NULL,'','delivered',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','JJD0030678675','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-02 07:45:18','2024-01-25 07:45:18',NULL,NULL),(37,47,NULL,3864.00,NULL,NULL,'','approved',0.00,'completed','pending',0.00,0,'2024-01-25 00:45:18','2024-01-25 00:45:18','JJD0099776107','DHL','https://mydhl.express.dhl/us/en/tracking.html#/track-by-reference','2024-02-03 07:45:18',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ec_shipments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping`
--

DROP TABLE IF EXISTS `ec_shipping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping`
--

LOCK TABLES `ec_shipping` WRITE;
/*!40000 ALTER TABLE `ec_shipping` DISABLE KEYS */;
INSERT INTO `ec_shipping` VALUES (1,'All',NULL,'2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `ec_shipping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rule_items`
--

DROP TABLE IF EXISTS `ec_shipping_rule_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rule_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shipping_rule_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_price` decimal(15,2) DEFAULT '0.00',
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rule_items`
--

LOCK TABLES `ec_shipping_rule_items` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rule_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_shipping_rule_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_shipping_rules`
--

DROP TABLE IF EXISTS `ec_shipping_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_shipping_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_id` bigint unsigned NOT NULL,
  `type` varchar(24) COLLATE utf8mb4_unicode_ci DEFAULT 'based_on_price',
  `from` decimal(15,2) DEFAULT '0.00',
  `to` decimal(15,2) DEFAULT '0.00',
  `price` decimal(15,2) DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_shipping_rules`
--

LOCK TABLES `ec_shipping_rules` WRITE;
/*!40000 ALTER TABLE `ec_shipping_rules` DISABLE KEYS */;
INSERT INTO `ec_shipping_rules` VALUES (1,'Free delivery',1,'based_on_price',0.00,NULL,0.00,'2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `ec_shipping_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_store_locators`
--

DROP TABLE IF EXISTS `ec_store_locators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_store_locators` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_primary` tinyint(1) DEFAULT '0',
  `is_shipping_location` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_store_locators`
--

LOCK TABLES `ec_store_locators` WRITE;
/*!40000 ALTER TABLE `ec_store_locators` DISABLE KEYS */;
INSERT INTO `ec_store_locators` VALUES (1,'HuberwayTheme','sales@huberway.com','1800979769','502 New Street','AU','Brighton VIC','Brighton VIC',1,1,'2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `ec_store_locators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_products`
--

DROP TABLE IF EXISTS `ec_tax_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_products` (
  `tax_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`tax_id`),
  KEY `ec_tax_products_tax_id_index` (`tax_id`),
  KEY `ec_tax_products_product_id_index` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_products`
--

LOCK TABLES `ec_tax_products` WRITE;
/*!40000 ALTER TABLE `ec_tax_products` DISABLE KEYS */;
INSERT INTO `ec_tax_products` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(1,19),(1,20),(1,21),(1,22),(1,23);
/*!40000 ALTER TABLE `ec_tax_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_tax_rules`
--

DROP TABLE IF EXISTS `ec_tax_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_tax_rules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tax_id` bigint unsigned NOT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_tax_rules`
--

LOCK TABLES `ec_tax_rules` WRITE;
/*!40000 ALTER TABLE `ec_tax_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_tax_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_taxes`
--

DROP TABLE IF EXISTS `ec_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_taxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `percentage` double(8,6) DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_taxes`
--

LOCK TABLES `ec_taxes` WRITE;
/*!40000 ALTER TABLE `ec_taxes` DISABLE KEYS */;
INSERT INTO `ec_taxes` VALUES (1,'VAT',10.000000,1,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(2,'None',0.000000,2,'published','2024-01-25 00:45:04','2024-01-25 00:45:04'),(3,'Import Tax',15.000000,3,'published','2024-01-25 00:45:04','2024-01-25 00:45:04');
/*!40000 ALTER TABLE `ec_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ec_wish_lists`
--

DROP TABLE IF EXISTS `ec_wish_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ec_wish_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlist_relation_index` (`product_id`,`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ec_wish_lists`
--

LOCK TABLES `ec_wish_lists` WRITE;
/*!40000 ALTER TABLE `ec_wish_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ec_wish_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
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
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'SHIPPING',0,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(2,'PAYMENT',1,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(3,'ORDER &amp; RETURNS',2,'published','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'What Shipping Methods Are Available?','Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.',1,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,'Do You Ship Internationally?','Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.',1,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,'How Long Will It Take To Get My Package?','Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.',1,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,'What Payment Methods Are Accepted?','Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.',2,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(5,'Is Buying On-Line Safe?','Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.',2,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(6,'How do I place an Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level. Raw denim polaroid paleo farm-to-table, put a bird on it lo-fi tattooed Wes Anderson Pinterest letterpress. Fingerstache McSweeney’s pour-over, letterpress Schlitz photo booth master cleanse bespoke hashtag chillwave gentrify.',3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(7,'How Can I Cancel Or Change My Order?','Plaid letterpress leggings craft beer meh ethical Pinterest. Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth.',3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(8,'Do I need an account to place an order?','Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY. Cray ugh 3 wolf moon fap, fashion axe irony butcher cornhole typewriter chambray VHS banjo street art.',3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(9,'How Do I Track My Order?','Keytar cray slow-carb, Godard banh mi salvia pour-over. Slow-carb @Odd Future seitan normcore. Master cleanse American Apparel gentrify flexitarian beard slow-carb next level.',3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(10,'How Can I Return a Product?','Kale chips Truffaut Williamsburg, hashtag fixie Pinterest raw denim c hambray drinking vinegar Carles street art Bushwick gastropub. Wolf Tumblr paleo church-key. Plaid food truck Echo Park YOLO bitters hella, direct trade Thundercats leggings quinoa before they sold out. You probably haven’t heard of them wayfarers authentic umami drinking vinegar Pinterest Cosby sweater, fingerstache fap High Life.',3,'published','2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','a097f1d74ae89c064300a6f913afddb4',1,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSlider'),(2,'en_US','17d0ba1704e3b985ef67bd4f57e4fa23',1,'HuberwayCMS\\Menu\\Models\\MenuLocation'),(3,'en_US','350807d6815ed25e8e54b3990bbf4306',1,'HuberwayCMS\\Menu\\Models\\Menu'),(4,'en_US','d0c81ca68ff88ab5248688dd2a329fe9',2,'HuberwayCMS\\Menu\\Models\\Menu'),(5,'en_US','ef989b47b8da8631b08ce30bf8a8812d',3,'HuberwayCMS\\Menu\\Models\\Menu'),(6,'en_US','df32eb07b7e6047d7cb85d288b7e0e95',4,'HuberwayCMS\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'1','1',1,'image/jpeg',1592,'brands/1.jpg','[]','2024-01-25 00:44:54','2024-01-25 00:44:54',NULL),(2,0,'2','2',1,'image/jpeg',1592,'brands/2.jpg','[]','2024-01-25 00:44:54','2024-01-25 00:44:54',NULL),(3,0,'3','3',1,'image/jpeg',1592,'brands/3.jpg','[]','2024-01-25 00:44:54','2024-01-25 00:44:54',NULL),(4,0,'4','4',1,'image/jpeg',1592,'brands/4.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(5,0,'5','5',1,'image/jpeg',1592,'brands/5.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(6,0,'6','6',1,'image/jpeg',1592,'brands/6.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(7,0,'7','7',1,'image/jpeg',1592,'brands/7.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(8,0,'1','1',2,'image/jpeg',9730,'product-categories/1.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(9,0,'2','2',2,'image/jpeg',9730,'product-categories/2.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(10,0,'3','3',2,'image/jpeg',9730,'product-categories/3.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(11,0,'4','4',2,'image/jpeg',9730,'product-categories/4.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(12,0,'5','5',2,'image/jpeg',9730,'product-categories/5.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(13,0,'6','6',2,'image/jpeg',9730,'product-categories/6.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(14,0,'7','7',2,'image/jpeg',9730,'product-categories/7.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(15,0,'8','8',2,'image/jpeg',9730,'product-categories/8.jpg','[]','2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(16,0,'1','1',3,'image/jpeg',9730,'products/1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(17,0,'10-1','10-1',3,'image/jpeg',9730,'products/10-1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(18,0,'10-2','10-2',3,'image/jpeg',9730,'products/10-2.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(19,0,'10','10',3,'image/jpeg',9730,'products/10.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(20,0,'11-1','11-1',3,'image/jpeg',9730,'products/11-1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(21,0,'11-2','11-2',3,'image/jpeg',9730,'products/11-2.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(22,0,'11-3','11-3',3,'image/jpeg',9730,'products/11-3.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(23,0,'11','11',3,'image/jpeg',9730,'products/11.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(24,0,'12-1','12-1',3,'image/jpeg',9730,'products/12-1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(25,0,'12-2','12-2',3,'image/jpeg',9730,'products/12-2.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(26,0,'12-3','12-3',3,'image/jpeg',9730,'products/12-3.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(27,0,'12','12',3,'image/jpeg',9730,'products/12.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(28,0,'13-1','13-1',3,'image/jpeg',9730,'products/13-1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(29,0,'13','13',3,'image/jpeg',9730,'products/13.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(30,0,'14','14',3,'image/jpeg',9730,'products/14.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(31,0,'15-1','15-1',3,'image/jpeg',9730,'products/15-1.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(32,0,'15','15',3,'image/jpeg',9730,'products/15.jpg','[]','2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(33,0,'16','16',3,'image/jpeg',9730,'products/16.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(34,0,'17-1','17-1',3,'image/jpeg',9730,'products/17-1.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(35,0,'17-2','17-2',3,'image/jpeg',9730,'products/17-2.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(36,0,'17-3','17-3',3,'image/jpeg',9730,'products/17-3.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(37,0,'17','17',3,'image/jpeg',9730,'products/17.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(38,0,'18-1','18-1',3,'image/jpeg',9730,'products/18-1.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(39,0,'18-2','18-2',3,'image/jpeg',9730,'products/18-2.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(40,0,'18-3','18-3',3,'image/jpeg',9730,'products/18-3.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(41,0,'18','18',3,'image/jpeg',9730,'products/18.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(42,0,'19-1','19-1',3,'image/jpeg',9730,'products/19-1.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(43,0,'19-2','19-2',3,'image/jpeg',9730,'products/19-2.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(44,0,'19-3','19-3',3,'image/jpeg',9730,'products/19-3.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(45,0,'19','19',3,'image/jpeg',9730,'products/19.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(46,0,'2-1','2-1',3,'image/jpeg',9730,'products/2-1.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(47,0,'2-2','2-2',3,'image/jpeg',9730,'products/2-2.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(48,0,'2-3','2-3',3,'image/jpeg',9730,'products/2-3.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(49,0,'2','2',3,'image/jpeg',9730,'products/2.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(50,0,'20-1','20-1',3,'image/jpeg',9730,'products/20-1.jpg','[]','2024-01-25 00:44:57','2024-01-25 00:44:57',NULL),(51,0,'20-2','20-2',3,'image/jpeg',9730,'products/20-2.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(52,0,'20-3','20-3',3,'image/jpeg',9730,'products/20-3.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(53,0,'20','20',3,'image/jpeg',9730,'products/20.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(54,0,'21-1','21-1',3,'image/jpeg',9730,'products/21-1.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(55,0,'21-2','21-2',3,'image/jpeg',9730,'products/21-2.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(56,0,'21','21',3,'image/jpeg',9730,'products/21.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(57,0,'22-1','22-1',3,'image/jpeg',9730,'products/22-1.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(58,0,'22-2','22-2',3,'image/jpeg',9730,'products/22-2.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(59,0,'22-3','22-3',3,'image/jpeg',9730,'products/22-3.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(60,0,'22','22',3,'image/jpeg',9730,'products/22.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(61,0,'23-1','23-1',3,'image/jpeg',9730,'products/23-1.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(62,0,'23-2','23-2',3,'image/jpeg',9730,'products/23-2.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(63,0,'23-3','23-3',3,'image/jpeg',9730,'products/23-3.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(64,0,'23','23',3,'image/jpeg',9730,'products/23.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(65,0,'3','3',3,'image/jpeg',9730,'products/3.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(66,0,'4-1','4-1',3,'image/jpeg',9730,'products/4-1.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(67,0,'4-2','4-2',3,'image/jpeg',9730,'products/4-2.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(68,0,'4-3','4-3',3,'image/jpeg',9730,'products/4-3.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(69,0,'4','4',3,'image/jpeg',9730,'products/4.jpg','[]','2024-01-25 00:44:58','2024-01-25 00:44:58',NULL),(70,0,'5-1','5-1',3,'image/jpeg',9730,'products/5-1.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(71,0,'5-2','5-2',3,'image/jpeg',9730,'products/5-2.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(72,0,'5-3','5-3',3,'image/jpeg',9730,'products/5-3.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(73,0,'5','5',3,'image/jpeg',9730,'products/5.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(74,0,'6','6',3,'image/jpeg',9730,'products/6.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(75,0,'7','7',3,'image/jpeg',9730,'products/7.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(76,0,'8-1','8-1',3,'image/jpeg',9730,'products/8-1.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(77,0,'8-2','8-2',3,'image/jpeg',9730,'products/8-2.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(78,0,'8-3','8-3',3,'image/jpeg',9730,'products/8-3.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(79,0,'8','8',3,'image/jpeg',9730,'products/8.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(80,0,'9-1','9-1',3,'image/jpeg',9730,'products/9-1.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(81,0,'9-2','9-2',3,'image/jpeg',9730,'products/9-2.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(82,0,'9','9',3,'image/jpeg',9730,'products/9.jpg','[]','2024-01-25 00:44:59','2024-01-25 00:44:59',NULL),(83,0,'1','1',4,'image/jpeg',9730,'customers/1.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(84,0,'10','10',4,'image/jpeg',9730,'customers/10.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(85,0,'2','2',4,'image/jpeg',9730,'customers/2.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(86,0,'3','3',4,'image/jpeg',9730,'customers/3.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(87,0,'4','4',4,'image/jpeg',9730,'customers/4.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(88,0,'5','5',4,'image/jpeg',9730,'customers/5.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(89,0,'6','6',4,'image/jpeg',9730,'customers/6.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(90,0,'7','7',4,'image/jpeg',9730,'customers/7.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(91,0,'8','8',4,'image/jpeg',9730,'customers/8.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(92,0,'9','9',4,'image/jpeg',9730,'customers/9.jpg','[]','2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(93,0,'1','1',5,'image/jpeg',9730,'news/1.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(94,0,'10','10',5,'image/jpeg',9730,'news/10.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(95,0,'11','11',5,'image/jpeg',9730,'news/11.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(96,0,'2','2',5,'image/jpeg',9730,'news/2.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(97,0,'3','3',5,'image/jpeg',9730,'news/3.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(98,0,'4','4',5,'image/jpeg',9730,'news/4.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(99,0,'5','5',5,'image/jpeg',9730,'news/5.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(100,0,'6','6',5,'image/jpeg',9730,'news/6.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(101,0,'7','7',5,'image/jpeg',9730,'news/7.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(102,0,'8','8',5,'image/jpeg',9730,'news/8.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(103,0,'9','9',5,'image/jpeg',9730,'news/9.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(104,0,'1-lg','1-lg',6,'image/jpeg',8795,'sliders/1-lg.jpg','[]','2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(105,0,'1-md','1-md',6,'image/jpeg',8795,'sliders/1-md.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(106,0,'1-sm','1-sm',6,'image/jpeg',8795,'sliders/1-sm.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(107,0,'2-lg','2-lg',6,'image/jpeg',8795,'sliders/2-lg.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(108,0,'2-md','2-md',6,'image/jpeg',8795,'sliders/2-md.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(109,0,'2-sm','2-sm',6,'image/jpeg',8795,'sliders/2-sm.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(110,0,'3-lg','3-lg',6,'image/jpeg',8795,'sliders/3-lg.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(111,0,'3-md','3-md',6,'image/jpeg',8795,'sliders/3-md.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(112,0,'3-sm','3-sm',6,'image/jpeg',8795,'sliders/3-sm.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(113,0,'1','1',7,'image/jpeg',3592,'promotion/1.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(114,0,'2','2',7,'image/jpeg',3592,'promotion/2.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(115,0,'3','3',7,'image/jpeg',5370,'promotion/3.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(116,0,'4','4',7,'image/jpeg',5370,'promotion/4.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(117,0,'5','5',7,'image/jpeg',5370,'promotion/5.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(118,0,'6','6',7,'image/jpeg',5370,'promotion/6.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(119,0,'7','7',7,'image/jpeg',5370,'promotion/7.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(120,0,'8','8',7,'image/jpeg',5370,'promotion/8.jpg','[]','2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(121,0,'9','9',7,'image/jpeg',5370,'promotion/9.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(122,0,'app','app',8,'image/png',8634,'general/app.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(123,0,'coming-soon','coming-soon',8,'image/jpeg',19900,'general/coming-soon.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(124,0,'favicon','favicon',8,'image/png',1925,'general/icona-huberway-colore.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(125,0,'logo-huberway-colore','logo-huberway-colore',8,'image/png',784,'general/logo-huberway-colore.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(126,0,'logo-huberway-white','logo-huberway-white',8,'image/png',783,'general/logo-huberway-white.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(127,0,'logo','logo',8,'image/png',793,'general/logo-huberway-colore.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(128,0,'newsletter','newsletter',8,'image/jpeg',9745,'general/newsletter.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(129,0,'payment-method-1','payment-method-1',8,'image/jpeg',813,'general/payment-method-1.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(130,0,'payment-method-2','payment-method-2',8,'image/jpeg',878,'general/payment-method-2.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(131,0,'payment-method-3','payment-method-3',8,'image/jpeg',816,'general/payment-method-3.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(132,0,'payment-method-4','payment-method-4',8,'image/jpeg',638,'general/payment-method-4.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(133,0,'payment-method-5','payment-method-5',8,'image/jpeg',659,'general/payment-method-5.jpg','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(134,0,'1','1',9,'image/png',3482,'stores/1.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(135,0,'10','10',9,'image/png',1675,'stores/10.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(136,0,'11','11',9,'image/png',1857,'stores/11.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(137,0,'12','12',9,'image/png',2046,'stores/12.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(138,0,'13','13',9,'image/png',1597,'stores/13.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(139,0,'14','14',9,'image/png',1649,'stores/14.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(140,0,'15','15',9,'image/png',2120,'stores/15.png','[]','2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(141,0,'16','16',9,'image/png',2556,'stores/16.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(142,0,'17','17',9,'image/png',2631,'stores/17.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(143,0,'2','2',9,'image/png',3369,'stores/2.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(144,0,'3','3',9,'image/png',3044,'stores/3.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(145,0,'4','4',9,'image/png',3096,'stores/4.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(146,0,'5','5',9,'image/png',3607,'stores/5.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(147,0,'6','6',9,'image/png',3778,'stores/6.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(148,0,'7','7',9,'image/png',1566,'stores/7.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(149,0,'8','8',9,'image/png',1773,'stores/8.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL),(150,0,'9','9',9,'image/png',1671,'stores/9.png','[]','2024-01-25 00:45:08','2024-01-25 00:45:08',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'brands',NULL,'brands',0,'2024-01-25 00:44:54','2024-01-25 00:44:54',NULL),(2,0,'product-categories',NULL,'product-categories',0,'2024-01-25 00:44:55','2024-01-25 00:44:55',NULL),(3,0,'products',NULL,'products',0,'2024-01-25 00:44:56','2024-01-25 00:44:56',NULL),(4,0,'customers',NULL,'customers',0,'2024-01-25 00:45:01','2024-01-25 00:45:01',NULL),(5,0,'news',NULL,'news',0,'2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(6,0,'sliders',NULL,'sliders',0,'2024-01-25 00:45:05','2024-01-25 00:45:05',NULL),(7,0,'promotion',NULL,'promotion',0,'2024-01-25 00:45:06','2024-01-25 00:45:06',NULL),(8,0,'general',NULL,'general',0,'2024-01-25 00:45:07','2024-01-25 00:45:07',NULL),(9,0,'stores',NULL,'stores',0,'2024-01-25 00:45:07','2024-01-25 00:45:07',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,'/',NULL,0,'Home',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,1,0,NULL,NULL,'#',NULL,0,'Pages',NULL,'_self',1,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,1,2,2,'HuberwayCMS\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,1,2,3,'HuberwayCMS\\Page\\Models\\Page','/terms-of-use',NULL,0,'Terms Of Use',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(5,1,2,4,'HuberwayCMS\\Page\\Models\\Page','/terms-conditions',NULL,0,'Terms & Conditions',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(6,1,2,5,'HuberwayCMS\\Page\\Models\\Page','/refund-policy',NULL,0,'Refund Policy',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(7,1,2,12,'HuberwayCMS\\Page\\Models\\Page','/coming-soon',NULL,0,'Coming soon',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(8,1,0,NULL,NULL,'/products',NULL,0,'Shop',NULL,'_self',1,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(9,1,8,NULL,NULL,'/products',NULL,0,'All products',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(10,1,8,15,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','/product-categories/batteries',NULL,0,'Products Of Category',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(11,1,8,NULL,NULL,'/products/beat-headphone',NULL,0,'Product Single',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(12,1,0,NULL,NULL,'/stores',NULL,0,'Stores',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(13,1,0,6,'HuberwayCMS\\Page\\Models\\Page','/blog',NULL,0,'Blog',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(14,1,0,7,'HuberwayCMS\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(15,1,0,8,'HuberwayCMS\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(16,2,0,3,'HuberwayCMS\\Page\\Models\\Page','/terms-of-use',NULL,0,'Terms Of Use',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(17,2,0,4,'HuberwayCMS\\Page\\Models\\Page','/terms-conditions',NULL,0,'Terms & Conditions',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(18,2,0,5,'HuberwayCMS\\Page\\Models\\Page','/refund-policy',NULL,0,'Refund Policy',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(19,2,0,7,'HuberwayCMS\\Page\\Models\\Page','/faqs',NULL,0,'FAQs',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(20,2,0,NULL,NULL,'/nothing',NULL,0,'404 Page',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(21,3,0,2,'HuberwayCMS\\Page\\Models\\Page','/about-us',NULL,0,'About us',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(22,3,0,10,'HuberwayCMS\\Page\\Models\\Page','/affiliate',NULL,0,'Affiliate',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(23,3,0,11,'HuberwayCMS\\Page\\Models\\Page','/career',NULL,0,'Career',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(24,3,0,8,'HuberwayCMS\\Page\\Models\\Page','/contact',NULL,0,'Contact us',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(25,4,0,6,'HuberwayCMS\\Page\\Models\\Page','/blog',NULL,0,'Our blog',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(26,4,0,NULL,NULL,'/cart',NULL,0,'Cart',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(27,4,0,NULL,NULL,'/customer/overview',NULL,0,'My account',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07'),(28,4,0,NULL,NULL,'/products',NULL,0,'Shop',NULL,'_self',0,'2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,'Quick links','quick-links','published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,'Company','company','published','2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,'Business','business','published','2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'icon','[\"icon-star\"]',1,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(2,'icon','[\"icon-laundry\"]',2,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(3,'icon','[\"icon-shirt\"]',16,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(4,'icon','[\"icon-desktop\"]',17,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(5,'icon','[\"icon-lampshade\"]',28,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(6,'icon','[\"icon-heart-pulse\"]',29,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(7,'icon','[\"icon-diamond2\"]',30,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(8,'icon','[\"icon-desktop\"]',31,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(9,'icon','[\"icon-smartphone\"]',32,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(10,'icon','[\"icon-baby-bottle\"]',33,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(11,'icon','[\"icon-baseball\"]',34,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(12,'icon','[\"icon-book2\"]',35,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:55','2024-01-25 00:44:55'),(13,'icon','[\"icon-car-siren\"]',36,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:56','2024-01-25 00:44:56'),(14,'icon','[\"icon-wrench\"]',37,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','2024-01-25 00:44:56','2024-01-25 00:44:56'),(15,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',1,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(16,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',2,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(17,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',3,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(18,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',4,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(19,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',5,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(20,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',6,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(21,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',7,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(22,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',8,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(23,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',9,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(24,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',10,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(25,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',11,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:44:59','2024-01-25 00:44:59'),(26,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',12,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(27,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',13,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(28,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',14,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(29,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',15,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(30,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',16,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(31,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',17,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(32,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',18,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(33,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',19,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(34,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',20,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(35,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',21,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(36,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',22,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(37,'faq_schema_config','[[[{\"key\":\"question\",\"value\":\"What Shipping Methods Are Available?\"},{\"key\":\"answer\",\"value\":\"Ex Portland Pitchfork irure mustache. Eutra fap before they sold out literally. Aliquip ugh bicycle rights actually mlkshk, seitan squid craft beer tempor.\"}],[{\"key\":\"question\",\"value\":\"Do You Ship Internationally?\"},{\"key\":\"answer\",\"value\":\"Hoodie tote bag mixtape tofu. Typewriter jean shorts wolf quinoa, messenger bag organic freegan cray.\"}],[{\"key\":\"question\",\"value\":\"How Long Will It Take To Get My Package?\"},{\"key\":\"answer\",\"value\":\"Swag slow-carb quinoa VHS typewriter pork belly brunch, paleo single-origin coffee Wes Anderson. Flexitarian Pitchfork forage, literally paleo fap pour-over. Wes Anderson Pinterest YOLO fanny pack meggings, deep v XOXO chambray sustainable slow-carb raw denim church-key fap chillwave Etsy. +1 typewriter kitsch, American Apparel tofu Banksy Vice.\"}],[{\"key\":\"question\",\"value\":\"What Payment Methods Are Accepted?\"},{\"key\":\"answer\",\"value\":\"Fashion axe DIY jean shorts, swag kale chips meh polaroid kogi butcher Wes Anderson chambray next level semiotics gentrify yr. Voluptate photo booth fugiat Vice. Austin sed Williamsburg, ea labore raw denim voluptate cred proident mixtape excepteur mustache. Twee chia photo booth readymade food truck, hoodie roof party swag keytar PBR DIY.\"}],[{\"key\":\"question\",\"value\":\"Is Buying On-Line Safe?\"},{\"key\":\"answer\",\"value\":\"Art party authentic freegan semiotics jean shorts chia cred. Neutra Austin roof party Brooklyn, synth Thundercats swag 8-bit photo booth. Plaid letterpress leggings craft beer meh ethical Pinterest.\"}]]]',23,'HuberwayCMS\\Ecommerce\\Models\\Product','2024-01-25 00:45:00','2024-01-25 00:45:00'),(38,'tablet_image','[\"sliders\\/1-md.jpg\"]',1,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06'),(39,'mobile_image','[\"sliders\\/1-sm.jpg\"]',1,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06'),(40,'tablet_image','[\"sliders\\/2-md.jpg\"]',2,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06'),(41,'mobile_image','[\"sliders\\/2-sm.jpg\"]',2,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06'),(42,'tablet_image','[\"sliders\\/3-md.jpg\"]',3,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06'),(43,'mobile_image','[\"sliders\\/3-sm.jpg\"]',3,'HuberwayCMS\\SimpleSlider\\Models\\SimpleSliderItem','2024-01-25 00:45:06','2024-01-25 00:45:06');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2021_08_02_084121_fix_old_shortcode',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_08_21_090810_make_page_content_nullable',1),(30,'2023_09_14_021936_update_index_for_slugs_table',1),(31,'2023_12_06_100448_change_random_hash_for_media',1),(32,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(33,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(34,'2020_11_18_150916_ads_create_ads_table',2),(35,'2021_12_02_035301_add_ads_translations_table',2),(36,'2023_04_17_062645_add_open_in_new_tab',2),(37,'2023_11_07_023805_add_tablet_mobile_image',2),(38,'2015_06_29_025744_create_audit_history',3),(39,'2023_11_14_033417_change_request_column_in_table_audit_histories',3),(40,'2015_06_18_033822_create_blog_table',4),(41,'2021_02_16_092633_remove_default_value_for_author_type',4),(42,'2021_12_03_030600_create_blog_translations',4),(43,'2022_04_19_113923_add_index_to_table_posts',4),(44,'2023_08_29_074620_make_column_author_id_nullable',4),(45,'2016_06_17_091537_create_contacts_table',5),(46,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',5),(47,'2020_03_05_041139_create_ecommerce_tables',6),(48,'2021_01_01_044147_ecommerce_create_flash_sale_table',6),(49,'2021_01_17_082713_add_column_is_featured_to_product_collections_table',6),(50,'2021_01_18_024333_add_zip_code_into_table_customer_addresses',6),(51,'2021_02_18_073505_update_table_ec_reviews',6),(52,'2021_03_10_024419_add_column_confirmed_at_to_table_ec_customers',6),(53,'2021_03_10_025153_change_column_tax_amount',6),(54,'2021_03_20_033103_add_column_availability_to_table_ec_products',6),(55,'2021_04_28_074008_ecommerce_create_product_label_table',6),(56,'2021_05_31_173037_ecommerce_create_ec_products_translations',6),(57,'2021_08_17_105016_remove_column_currency_id_in_some_tables',6),(58,'2021_08_30_142128_add_images_column_to_ec_reviews_table',6),(59,'2021_10_04_030050_add_column_created_by_to_table_ec_products',6),(60,'2021_10_05_122616_add_status_column_to_ec_customers_table',6),(61,'2021_11_03_025806_nullable_phone_number_in_ec_customer_addresses',6),(62,'2021_11_23_071403_correct_languages_for_product_variations',6),(63,'2021_11_28_031808_add_product_tags_translations',6),(64,'2021_12_01_031123_add_featured_image_to_ec_products',6),(65,'2022_01_01_033107_update_table_ec_shipments',6),(66,'2022_02_16_042457_improve_product_attribute_sets',6),(67,'2022_03_22_075758_correct_product_name',6),(68,'2022_04_19_113334_add_index_to_ec_products',6),(69,'2022_04_28_144405_remove_unused_table',6),(70,'2022_05_05_115015_create_ec_customer_recently_viewed_products_table',6),(71,'2022_05_18_143720_add_index_to_table_ec_product_categories',6),(72,'2022_06_16_095633_add_index_to_some_tables',6),(73,'2022_06_30_035148_create_order_referrals_table',6),(74,'2022_07_24_153815_add_completed_at_to_ec_orders_table',6),(75,'2022_08_14_032836_create_ec_order_returns_table',6),(76,'2022_08_14_033554_create_ec_order_return_items_table',6),(77,'2022_08_15_040324_add_billing_address',6),(78,'2022_08_30_091114_support_digital_products_table',6),(79,'2022_09_13_095744_create_options_table',6),(80,'2022_09_13_104347_create_option_value_table',6),(81,'2022_10_05_163518_alter_table_ec_order_product',6),(82,'2022_10_12_041517_create_invoices_table',6),(83,'2022_10_12_142226_update_orders_table',6),(84,'2022_10_13_024916_update_table_order_returns',6),(85,'2022_10_21_030830_update_columns_in_ec_shipments_table',6),(86,'2022_10_28_021046_update_columns_in_ec_shipments_table',6),(87,'2022_11_16_034522_update_type_column_in_ec_shipping_rules_table',6),(88,'2022_11_19_041643_add_ec_tax_product_table',6),(89,'2022_12_12_063830_update_tax_defadult_in_ec_tax_products_table',6),(90,'2022_12_17_041532_fix_address_in_order_invoice',6),(91,'2022_12_26_070329_create_ec_product_views_table',6),(92,'2023_01_04_033051_fix_product_categories',6),(93,'2023_01_09_050400_add_ec_global_options_translations_table',6),(94,'2023_01_10_093754_add_missing_option_value_id',6),(95,'2023_01_17_082713_add_column_barcode_and_cost_per_item_to_product_table',6),(96,'2023_01_26_021854_add_ec_customer_used_coupons_table',6),(97,'2023_02_08_015900_update_options_column_in_ec_order_product_table',6),(98,'2023_02_27_095752_remove_duplicate_reviews',6),(99,'2023_03_20_115757_add_user_type_column_to_ec_shipment_histories_table',6),(100,'2023_04_21_082427_create_ec_product_categorizables_table',6),(101,'2023_05_03_011331_add_missing_column_price_into_invoice_items_table',6),(102,'2023_05_17_025812_fix_invoice_issue',6),(103,'2023_05_26_073140_move_option_make_phone_field_optional_at_checkout_page_to_mandatory_fields',6),(104,'2023_05_27_144611_fix_exchange_rate_setting',6),(105,'2023_06_22_084331_add_generate_license_code_to_ec_products_table',6),(106,'2023_06_30_042512_create_ec_order_tax_information_table',6),(107,'2023_07_14_022724_remove_column_id_from_ec_product_collection_products',6),(108,'2023_08_09_012940_remove_column_status_in_ec_product_attributes',6),(109,'2023_08_15_064505_create_ec_tax_rules_table',6),(110,'2023_08_21_021819_make_column_address_in_ec_customer_addresses_nullable',6),(111,'2023_08_22_094114_drop_unique_for_barcode',6),(112,'2023_08_30_031811_add_apply_via_url_column_to_ec_discounts_table',6),(113,'2023_09_07_094312_add_index_to_product_sku_and_translations',6),(114,'2023_09_19_024955_create_discount_product_categories_table',6),(115,'2023_10_17_070728_add_icon_and_icon_image_to_product_categories_table',6),(116,'2023_11_22_154643_add_unique_in_table_ec_products_variations',6),(117,'2023_11_27_032313_add_price_columns_to_ec_product_cross_sale_relations_table',6),(118,'2023_12_06_023945_add_display_on_checkout_column_to_ec_discounts_table',6),(119,'2023_12_25_040604_ec_create_review_replies_table',6),(120,'2023_12_26_090340_add_private_notes_column_to_ec_customers_table',6),(121,'2024_01_16_070706_fix_translation_tables',6),(122,'2024_01_23_075227_add_proof_file_to_ec_orders_table',6),(123,'2018_07_09_221238_create_faq_table',7),(124,'2021_12_03_082134_create_faq_translations',7),(125,'2023_11_17_063408_add_description_column_to_faq_categories_table',7),(126,'2016_10_03_032336_create_languages_table',8),(127,'2023_09_14_022423_add_index_for_language_table',8),(128,'2021_10_25_021023_fix-priority-load-for-language-advanced',9),(129,'2021_12_03_075608_create_page_translations',9),(130,'2023_07_06_011444_create_slug_translations_table',9),(131,'2019_11_18_061011_create_country_table',10),(132,'2021_12_03_084118_create_location_translations',10),(133,'2021_12_03_094518_migrate_old_location_data',10),(134,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',10),(135,'2022_01_16_085908_improve_plugin_location',10),(136,'2022_08_04_052122_delete_location_backup_tables',10),(137,'2023_04_23_061847_increase_state_translations_abbreviation_column',10),(138,'2023_07_26_041451_add_more_columns_to_location_table',10),(139,'2023_07_27_041451_add_more_columns_to_location_translation_table',10),(140,'2023_08_15_073307_drop_unique_in_states_cities_translations',10),(141,'2023_10_21_065016_make_state_id_in_table_cities_nullable',10),(142,'2021_07_06_030002_create_marketplace_table',11),(143,'2021_09_04_150137_add_vendor_verified_at_to_ec_customers_table',11),(144,'2021_10_04_033903_add_column_approved_by_into_table_ec_products',11),(145,'2021_10_06_124943_add_transaction_id_column_to_mp_customer_withdrawals_table',11),(146,'2021_10_10_054216_add_columns_to_mp_customer_revenues_table',11),(147,'2021_12_06_031304_update_table_mp_customer_revenues',11),(148,'2022_10_19_152916_add_columns_to_mp_stores_table',11),(149,'2022_10_20_062849_create_mp_category_sale_commissions_table',11),(150,'2022_11_02_071413_add_more_info_for_store',11),(151,'2022_11_02_080444_add_tax_info',11),(152,'2023_02_01_062030_add_store_translations',11),(153,'2023_02_13_032133_update_fee_column_mp_customer_revenues_table',11),(154,'2023_02_17_023648_fix_store_prefix',11),(155,'2017_10_24_154832_create_newsletter_table',12),(156,'2017_05_18_080441_create_payment_tables',13),(157,'2021_03_27_144913_add_customer_type_into_table_payments',13),(158,'2021_05_24_034720_make_column_currency_nullable',13),(159,'2021_08_09_161302_add_metadata_column_to_payments_table',13),(160,'2021_10_19_020859_update_metadata_field',13),(161,'2022_06_28_151901_activate_paypal_stripe_plugin',13),(162,'2022_07_07_153354_update_charge_id_in_table_payments',13),(163,'2017_07_11_140018_create_simple_slider_table',14),(164,'2016_10_07_193005_create_translations_table',15),(165,'2023_12_12_105220_drop_translations_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_category_sale_commissions`
--

DROP TABLE IF EXISTS `mp_category_sale_commissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_category_sale_commissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` bigint unsigned NOT NULL,
  `commission_percentage` decimal(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mp_category_sale_commissions_product_category_id_unique` (`product_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_category_sale_commissions`
--

LOCK TABLES `mp_category_sale_commissions` WRITE;
/*!40000 ALTER TABLE `mp_category_sale_commissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_category_sale_commissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_revenues`
--

DROP TABLE IF EXISTS `mp_customer_revenues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_revenues` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `sub_amount` decimal(15,2) DEFAULT '0.00',
  `fee` decimal(15,2) DEFAULT '0.00',
  `amount` decimal(15,2) DEFAULT '0.00',
  `current_balance` decimal(15,2) DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_revenues`
--

LOCK TABLES `mp_customer_revenues` WRITE;
/*!40000 ALTER TABLE `mp_customer_revenues` DISABLE KEYS */;
INSERT INTO `mp_customer_revenues` VALUES (1,7,2,586.00,0.00,586.00,0.00,'USD',NULL,'2024-01-23 00:45:18','2024-01-23 00:45:18',0,'add-amount'),(2,4,4,1679.00,0.00,1679.00,0.00,'USD',NULL,'2024-01-23 18:45:19','2024-01-23 18:45:19',0,'add-amount'),(3,2,8,1058.00,0.00,1058.00,0.00,'USD',NULL,'2024-01-21 06:45:19','2024-01-21 06:45:19',0,'add-amount'),(4,7,10,1172.00,0.00,1172.00,586.00,'USD',NULL,'2024-01-24 02:45:20','2024-01-24 02:45:20',0,'add-amount'),(5,9,11,591.00,0.00,591.00,0.00,'USD',NULL,'2024-01-24 00:45:20','2024-01-24 00:45:20',0,'add-amount'),(6,4,17,3364.00,0.00,3364.00,1679.00,'USD',NULL,'2024-01-23 12:45:21','2024-01-23 12:45:21',0,'add-amount'),(7,7,21,1332.50,0.00,1332.50,1758.00,'USD',NULL,'2024-01-14 00:45:21','2024-01-14 00:45:21',0,'add-amount'),(8,7,28,501.00,0.00,501.00,3090.50,'USD',NULL,'2024-01-15 08:45:22','2024-01-15 08:45:22',0,'add-amount'),(9,2,33,1692.00,0.00,1692.00,1058.00,'USD',NULL,'2024-01-19 08:45:22','2024-01-19 08:45:22',0,'add-amount'),(10,4,40,1097.00,0.00,1097.00,5043.00,'USD',NULL,'2023-12-25 06:45:23','2023-12-25 06:45:23',0,'add-amount'),(11,4,43,1659.00,0.00,1659.00,6140.00,'USD',NULL,'2024-01-03 00:45:23','2024-01-03 00:45:23',0,'add-amount'),(12,2,45,2540.00,0.00,2540.00,2750.00,'USD',NULL,'2024-01-13 12:45:24','2024-01-13 12:45:24',0,'add-amount'),(13,4,46,121.50,0.00,121.50,7799.00,'USD',NULL,'2024-01-09 08:45:24','2024-01-09 08:45:24',0,'add-amount');
/*!40000 ALTER TABLE `mp_customer_revenues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_customer_withdrawals`
--

DROP TABLE IF EXISTS `mp_customer_withdrawals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_customer_withdrawals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned DEFAULT NULL,
  `fee` decimal(15,2) unsigned DEFAULT '0.00',
  `amount` decimal(15,2) unsigned DEFAULT '0.00',
  `current_balance` decimal(15,2) unsigned DEFAULT '0.00',
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `images` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `transaction_id` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_customer_withdrawals`
--

LOCK TABLES `mp_customer_withdrawals` WRITE;
/*!40000 ALTER TABLE `mp_customer_withdrawals` DISABLE KEYS */;
INSERT INTO `mp_customer_withdrawals` VALUES (1,2,0.00,67.00,5290.00,'USD','','{\"name\":\"Prof. Sylvia Huel Jr.\",\"number\":\"+19167789762\",\"full_name\":\"Elliot Cormier\",\"description\":\"Mrs. Myrna Dare DVM\"}',NULL,0,'pending',NULL,'2024-01-25 00:45:25','2024-01-25 00:45:25',NULL),(2,2,0.00,972.00,5223.00,'USD','','{\"name\":\"Prof. Sylvia Huel Jr.\",\"number\":\"+19167789762\",\"full_name\":\"Elliot Cormier\",\"description\":\"Mrs. Myrna Dare DVM\"}',NULL,0,'processing',NULL,'2024-01-25 00:45:25','2024-01-25 00:45:25',NULL),(3,2,0.00,822.00,4251.00,'USD','','{\"name\":\"Prof. Sylvia Huel Jr.\",\"number\":\"+19167789762\",\"full_name\":\"Elliot Cormier\",\"description\":\"Mrs. Myrna Dare DVM\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:26','2024-01-25 00:45:26',NULL),(4,2,0.00,559.00,3429.00,'USD','','{\"name\":\"Prof. Sylvia Huel Jr.\",\"number\":\"+19167789762\",\"full_name\":\"Elliot Cormier\",\"description\":\"Mrs. Myrna Dare DVM\"}',NULL,0,'pending',NULL,'2024-01-25 00:45:26','2024-01-25 00:45:26',NULL),(5,4,0.00,1946.00,7920.50,'USD','','{\"name\":\"Dr. Leopoldo Kreiger\",\"number\":\"+12342374551\",\"full_name\":\"Marjorie McGlynn\",\"description\":\"Stefanie Goyette\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:27','2024-01-25 00:45:27',NULL),(6,4,0.00,756.00,5974.50,'USD','','{\"name\":\"Dr. Leopoldo Kreiger\",\"number\":\"+12342374551\",\"full_name\":\"Marjorie McGlynn\",\"description\":\"Stefanie Goyette\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:27','2024-01-25 00:45:27',NULL),(7,4,0.00,373.00,5218.50,'USD','','{\"name\":\"Dr. Leopoldo Kreiger\",\"number\":\"+12342374551\",\"full_name\":\"Marjorie McGlynn\",\"description\":\"Stefanie Goyette\"}',NULL,0,'processing',NULL,'2024-01-25 00:45:28','2024-01-25 00:45:28',NULL),(8,4,0.00,393.00,4845.50,'USD','','{\"name\":\"Dr. Leopoldo Kreiger\",\"number\":\"+12342374551\",\"full_name\":\"Marjorie McGlynn\",\"description\":\"Stefanie Goyette\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:28','2024-01-25 00:45:28',NULL),(9,7,0.00,1043.00,3591.50,'USD','','{\"name\":\"Prof. Natasha Hauck DVM\",\"number\":\"+19346157799\",\"full_name\":\"Rasheed Smith\",\"description\":\"Cole O\'Conner\"}',NULL,0,'processing',NULL,'2024-01-25 00:45:29','2024-01-25 00:45:29',NULL),(10,7,0.00,80.00,2548.50,'USD','','{\"name\":\"Prof. Natasha Hauck DVM\",\"number\":\"+19346157799\",\"full_name\":\"Rasheed Smith\",\"description\":\"Cole O\'Conner\"}',NULL,0,'pending',NULL,'2024-01-25 00:45:29','2024-01-25 00:45:29',NULL),(11,7,0.00,504.00,2468.50,'USD','','{\"name\":\"Prof. Natasha Hauck DVM\",\"number\":\"+19346157799\",\"full_name\":\"Rasheed Smith\",\"description\":\"Cole O\'Conner\"}',NULL,0,'pending',NULL,'2024-01-25 00:45:30','2024-01-25 00:45:30',NULL),(12,8,0.00,1.00,0.00,'USD','','{\"name\":\"Prof. Cristina Hermann\",\"number\":\"+13254551366\",\"full_name\":\"Kennedi Metz\",\"description\":\"Dianna Torp\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:30','2024-01-25 00:45:30',NULL),(13,9,0.00,177.00,591.00,'USD','','{\"name\":\"Prof. Berry Grant PhD\",\"number\":\"+14237329162\",\"full_name\":\"Ms. Jewel Block\",\"description\":\"Mrs. Fatima Rau II\"}',NULL,0,'completed',NULL,'2024-01-25 00:45:31','2024-01-25 00:45:31',NULL),(14,9,0.00,92.00,414.00,'USD','','{\"name\":\"Prof. Berry Grant PhD\",\"number\":\"+14237329162\",\"full_name\":\"Ms. Jewel Block\",\"description\":\"Mrs. Fatima Rau II\"}',NULL,0,'processing',NULL,'2024-01-25 00:45:31','2024-01-25 00:45:31',NULL);
/*!40000 ALTER TABLE `mp_customer_withdrawals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores`
--

DROP TABLE IF EXISTS `mp_stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` bigint unsigned DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `vendor_verified_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `zip_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores`
--

LOCK TABLES `mp_stores` WRITE;
/*!40000 ALTER TABLE `mp_stores` DISABLE KEYS */;
INSERT INTO `mp_stores` VALUES (1,'GoPro','alfredo24@example.net','+17403078943','1683 Emerson Wall','EG','Nevada','Jordiport',2,'stores/1.png','Dolore minima velit labore.','Culpa blanditiis ratione voluptate. Sit dignissimos voluptatem non totam. Perferendis laboriosam ut mollitia iste.','published',NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09',NULL,NULL),(2,'Global Office','cleveland42@example.org','+18604324176','753 Morar Radial Apt. 384','ID','Maryland','East Lorenahaven',4,'stores/2.png','Et harum tempore necessitatibus non.','Fugiat modi itaque et ad. Illo est nostrum qui beatae omnis eos est.','published',NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09',NULL,NULL),(3,'Young Shop','aabernathy@example.com','+13854468293','62498 Schneider Turnpike','LU','North Carolina','Trentonmouth',7,'stores/3.png','Ut magnam dolorum maxime.','Sapiente eum corrupti molestiae. Aut nihil et eius repellat qui mollitia ratione. Odio et illum voluptatem incidunt quas nihil.','published',NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09',NULL,NULL),(4,'Global Store','elockman@example.com','+13467151291','20783 Kari Forks Apt. 701','RS','Maine','Lake Kaia',8,'stores/4.png','Repellat similique sed et voluptate.','Et officiis officia deleniti illum consequuntur assumenda. Rerum tempore rerum et delectus quaerat. Omnis sint consequuntur iusto ullam velit.','published',NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09',NULL,NULL),(5,'Robert’s Store','lennie13@example.net','+19476084411','128 Mckenzie Wells Apt. 726','AX','Utah','Sethhaven',9,'stores/5.png','Ducimus ab ut officiis aut rerum.','Enim aut dignissimos velit doloribus voluptatem molestiae rerum enim. Nulla placeat nam qui repellat. Velit minima culpa quos.','published',NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09',NULL,NULL);
/*!40000 ALTER TABLE `mp_stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_stores_translations`
--

DROP TABLE IF EXISTS `mp_stores_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_stores_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mp_stores_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`mp_stores_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_stores_translations`
--

LOCK TABLES `mp_stores_translations` WRITE;
/*!40000 ALTER TABLE `mp_stores_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mp_stores_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mp_vendor_info`
--

DROP TABLE IF EXISTS `mp_vendor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mp_vendor_info` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` bigint unsigned NOT NULL DEFAULT '0',
  `balance` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_fee` decimal(15,2) NOT NULL DEFAULT '0.00',
  `total_revenue` decimal(15,2) NOT NULL DEFAULT '0.00',
  `signature` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_info` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payout_payment_method` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT 'bank_transfer',
  `tax_info` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mp_vendor_info`
--

LOCK TABLES `mp_vendor_info` WRITE;
/*!40000 ALTER TABLE `mp_vendor_info` DISABLE KEYS */;
INSERT INTO `mp_vendor_info` VALUES (1,2,2870.00,0.00,5290.00,'$2y$12$hgXHbCGwSokK2MKylxj6Zu3VhYegtvcpRTJHeJj3I64ehXiwSi7nq','{\"name\":\"Prof. Sylvia Huel Jr.\",\"number\":\"+19167789762\",\"full_name\":\"Elliot Cormier\",\"description\":\"Mrs. Myrna Dare DVM\"}','2024-01-25 00:45:08','2024-01-25 00:45:27','bank_transfer',NULL),(2,4,4452.50,0.00,7920.50,'$2y$12$iQD0doBZSgPxwtc7TdTHpeLz1ZGqs/Beb1vyokN.HM9Xk0UsM8h2O','{\"name\":\"Dr. Leopoldo Kreiger\",\"number\":\"+12342374551\",\"full_name\":\"Marjorie McGlynn\",\"description\":\"Stefanie Goyette\"}','2024-01-25 00:45:08','2024-01-25 00:45:29','bank_transfer',NULL),(3,7,1964.50,0.00,3591.50,'$2y$12$kIHqWo/b7QgUMjNLiik8..QZw1RBUvi3rHdeU21072qCDvWL9SvlG','{\"name\":\"Prof. Natasha Hauck DVM\",\"number\":\"+19346157799\",\"full_name\":\"Rasheed Smith\",\"description\":\"Cole O\'Conner\"}','2024-01-25 00:45:09','2024-01-25 00:45:30','bank_transfer',NULL),(4,8,-1.00,0.00,0.00,'$2y$12$DHU3xYmtCE2Yiwc1lRD55e8G4z2.1aV/iR7PDkfWNWMnvCctCisau','{\"name\":\"Prof. Cristina Hermann\",\"number\":\"+13254551366\",\"full_name\":\"Kennedi Metz\",\"description\":\"Dianna Torp\"}','2024-01-25 00:45:09','2024-01-25 00:45:31','bank_transfer',NULL),(5,9,322.00,0.00,591.00,'$2y$12$jdcSgbb9sAIu7l.D.IxixesSxZQrwK.0JTWh/TawN.kyp2xp4PtwG','{\"name\":\"Prof. Berry Grant PhD\",\"number\":\"+14237329162\",\"full_name\":\"Ms. Jewel Block\",\"description\":\"Mrs. Fatima Rau II\"}','2024-01-25 00:45:09','2024-01-25 00:45:32','bank_transfer',NULL);
/*!40000 ALTER TABLE `mp_vendor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home','<div>[simple-slider key=\"home-slider\" ads_1=\"VC2C8Q1UGCBG\" ads_2=\"NBDWRXTSVZ8N\"][/simple-slider]</div><div>[site-features icon1=\"icon-rocket\" title1=\"Free Delivery\" subtitle1=\"For all orders over $99\" icon2=\"icon-sync\" title2=\"90 Days Return\" subtitle2=\"If goods have problems\" icon3=\"icon-credit-card\" title3=\"Secure Payment\" subtitle3=\"100% secure payment\" icon4=\"icon-bubbles\" title4=\"24/7 Support\" subtitle4=\"Dedicated support\" icon5=\"icon-gift\" title5=\"Gift Service\" subtitle5=\"Support gift service\"][/site-features]</div><div>[flash-sale title=\"Deal of the day\" flash_sale_id=\"1\"][/flash-sale]</div><div>[featured-product-categories title=\"Top Categories\"][/featured-product-categories]</div><div>[theme-ads key_1=\"IZ6WU8KUALYD\" key_2=\"ILSFJVYFGCPZ\" key_3=\"ZDOZUZZIU7FT\"][/theme-ads]</div><div>[featured-products title=\"Featured products\"][/featured-products]</div><div>[theme-ads key_1=\"Q9YDUIC9HSWS\" key_2=\"IZ6WU8KUALYE\"][/theme-ads]</div><div>[product-collections title=\"Exclusive Products\"][/product-collections]</div><div>[product-category-products category_id=\"18\"][/product-category-products]</div><div>[download-app title=\"Download HuberwayTheme App Now!\" subtitle=\"Shopping fastly and easily more with our app. Get a link to download the app on your phone.\" screenshot=\"general/app.png\" android_app_url=\"https://www.appstore.com\" ios_app_url=\"https://play.google.com/store\"][/download-app]</div><div>[product-category-products category_id=\"23\"][/product-category-products]</div><div>[newsletter-form title=\"Join Our Newsletter Now\" subtitle=\"Subscribe to get information about products and coupons\"][/newsletter-form]</div>',1,NULL,'homepage',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(2,'About us','<p>And the Gryphon hastily. \'Go on with the bones and the game was going to remark myself.\' \'Have you guessed the riddle yet?\' the Hatter were having tea at it: a Dormouse was sitting next to no toys to play croquet with the dream of Wonderland of long ago: and how she would catch a bad cold if she did not like to see you again, you dear old thing!\' said the young lady to see if she meant to take out of breath, and till the puppy\'s bark sounded quite faint in the back. At last the Mouse.</p><p>Rabbit was no label this time she had succeeded in bringing herself down to them, they were playing the Queen was to twist it up into a pig, and she grew no larger: still it was good manners for her to carry it further. So she tucked her arm affectionately into Alice\'s, and they all cheered. Alice thought the whole court was a paper label, with the tea,\' the Hatter said, tossing his head contemptuously. \'I dare say you\'re wondering why I don\'t remember where.\' \'Well, it must make me larger, it.</p><p>Off with his nose, you know?\' \'It\'s the stupidest tea-party I ever was at in all directions, \'just like a tunnel for some way, and nothing seems to suit them!\' \'I haven\'t opened it yet,\' said the Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, and added \'It isn\'t directed at all,\' said Alice: \'I don\'t know what to say.</p><p>I\'m NOT a serpent, I tell you!\' said Alice. \'And be quick about it,\' said Alice loudly. \'The idea of the Nile On every golden scale! \'How cheerfully he seems to grin, How neatly spread his claws, And welcome little fishes in With gently smiling jaws!\' \'I\'m sure those are not the smallest idea how confusing it is to give the prizes?\' quite a new idea to Alice, she went on again: \'Twenty-four hours, I THINK; or is it I can\'t understand it myself to begin with,\' said the Gryphon, and the sounds.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(3,'Terms Of Use','<p>Do come back with the Queen, and Alice, were in custody and under sentence of execution.\' \'What for?\' said the Gryphon, and all would change to dull reality--the grass would be a comfort, one way--never to be otherwise than what you mean,\' the March Hare. \'Yes, please do!\' pleaded Alice. \'And where HAVE my shoulders got to? And oh, I wish you wouldn\'t squeeze so.\' said the Rabbit\'s voice along--\'Catch him, you by the time when she caught it, and on both sides of it; then Alice, thinking it was.</p><p>Queen said to herself how this same little sister of hers that you have of putting things!\' \'It\'s a mineral, I THINK,\' said Alice. \'And where HAVE my shoulders got to? And oh, my poor hands, how is it twelve? I--\' \'Oh, don\'t bother ME,\' said Alice indignantly, and she jumped up on to the porpoise, \"Keep back, please: we don\'t want to be?\' it asked. \'Oh, I\'m not myself, you see.\' \'I don\'t think they play at all like the Mock Turtle sighed deeply, and drew the back of one flapper across his.</p><p>Magpie began wrapping itself up very carefully, remarking, \'I really must be growing small again.\' She got up this morning? I almost wish I hadn\'t drunk quite so much!\' Alas! it was out of its mouth and began to cry again. \'You ought to be a comfort, one way--never to be found: all she could even make out who was passing at the top of his head. But at any rate: go and get ready to ask help of any that do,\' Alice hastily replied; \'at least--at least I know THAT well enough; don\'t be.</p><p>Alice could see it again, but it is.\' \'Then you should say what you would have this cat removed!\' The Queen had ordered. They very soon came to the end of half those long words, and, what\'s more, I don\'t take this young lady to see it trot away quietly into the garden door. Poor Alice! It was opened by another footman in livery came running out of the busy farm-yard--while the lowing of the bottle was NOT marked \'poison,\' it is I hate cats and dogs.\' It was the White Rabbit, who was trembling.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(4,'Terms &amp; Conditions','<p>I hate cats and dogs.\' It was high time you were or might have been changed in the direction it pointed to, without trying to explain the mistake it had no pictures or conversations in it, \'and what is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must be on the ground near the looking-glass. There was no label this time she saw in my life!\' Just as she heard a little feeble, squeaking voice, (\'That\'s Bill,\' thought Alice,) \'Well, I can\'t understand it myself to begin at.</p><p>CHORUS. (In which the March Hare and the constant heavy sobbing of the Mock Turtle, and to her that she was losing her temper. \'Are you content now?\' said the Queen had never had to be no doubt that it led into a chrysalis--you will some day, you know--and then after that savage Queen: so she went on without attending to her; \'but those serpents! There\'s no pleasing them!\' Alice was thoroughly puzzled. \'Does the boots and shoes!\' she repeated in a soothing tone: \'don\'t be angry about it. And.</p><p>Hatter asked triumphantly. Alice did not seem to have it explained,\' said the Hatter was out of a sea of green leaves that lay far below her. \'What CAN all that stuff,\' the Mock Turtle replied in a moment: she looked down at her as she spoke. \'I must go and take it away!\' There was a little while, however, she again heard a little way forwards each time and a Dodo, a Lory and an old Crab took the hookah out of sight before the end of the bread-and-butter. Just at this corner--No, tie \'em.</p><p>CHAPTER IV. The Rabbit started violently, dropped the white kid gloves in one hand and a sad tale!\' said the Queen, \'and he shall tell you just now what the name of the water, and seemed not to be seen--everything seemed to be patted on the trumpet, and called out, \'First witness!\' The first question of course was, how to set about it; if I\'m Mabel, I\'ll stay down here! It\'ll be no use their putting their heads down and cried. \'Come, there\'s half my plan done now! How puzzling all these.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(5,'Refund Policy','<p>See how eagerly the lobsters to the other side. The further off from England the nearer is to France-- Then turn not pale, beloved snail, but come and join the dance? Will you, won\'t you, won\'t you, will you join the dance. Would not, could not, could not tell whether they were all crowded together at one and then nodded. \'It\'s no business there, at any rate: go and take it away!\' There was nothing so VERY wide, but she stopped hastily, for the moment she appeared; but she did not like to be.</p><p>Queen\'s voice in the court!\' and the moment they saw her, they hurried back to the Gryphon. \'We can do without lobsters, you know. Please, Ma\'am, is this New Zealand or Australia?\' (and she tried the effect of lying down with wonder at the stick, running a very curious sensation, which puzzled her too much, so she set to work very diligently to write out a new kind of sob, \'I\'ve tried every way, and the sound of a muchness\"--did you ever saw. How she longed to change the subject. \'Go on with.</p><p>Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mock Turtle angrily: \'really you are painting those roses?\' Five and Seven said nothing, but looked at it uneasily, shaking it every now and then, \'we went to him,\' said Alice desperately: \'he\'s perfectly idiotic!\' And she thought it would,\' said the Queen, \'and he shall tell you his history,\' As they walked off together. Alice was not a moment to be two people! Why, there\'s hardly room for this, and she did not venture to say \'Drink me,\'.</p><p>Alice had never been so much about a whiting to a farmer, you know, as we were. My notion was that it was good practice to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it was a general chorus of voices asked. \'Why, SHE, of course,\' he said to herself, (not in a thick wood. \'The first thing she heard a little worried. \'Just about as she swam about, trying to box her own mind (as well as she added, \'and the moral of THAT is--\"Take care of themselves.\"\' \'How fond she is of finding morals in things!\'.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(6,'Blog','<p>---</p>',1,NULL,'blog-sidebar',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(7,'FAQs','<div>[faq title=\"Frequently Asked Questions\"][/faq]</div>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(8,'Contact','<div>[google-map]502 New Street, Brighton VIC, Australia[/google-map]</div><div>[contact-info-boxes title=\"Contact Us For Any Questions\"][/contact-info-boxes]</div><div>[contact-form][/contact-form]</div>',1,NULL,'full-width',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(9,'Cookie Policy','<h3>EU Cookie Consent</h3><p>To use this Website we are using Cookies and collecting some Data. To be compliant with the EU GDPR we give you to choose if you allow us to use certain Cookies and to collect some Data.</p><h4>Essential Data</h4><p>The Essential Data is needed to run the Site you are visiting technically. You can not deactivate them.</p><p>- Session Cookie: PHP uses a Cookie to identify user sessions. Without this Cookie the Website is not working.</p><p>- XSRF-Token Cookie: Laravel automatically generates a CSRF \"token\" for each active user session managed by the application. This token is used to verify that the authenticated user is the one actually making the requests to the application.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(10,'Affiliate','<p>Alice called out to be seen--everything seemed to be lost: away went Alice like the wind, and the Queen\'s hedgehog just now, only it ran away when it saw Alice. It looked good-natured, she thought: still it was good manners for her neck kept getting entangled among the leaves, which she concluded that it was all dark overhead; before her was another puzzling question; and as for the moment she quite forgot how to get in?\' asked Alice again, in a low trembling voice, \'Let us get to twenty at.</p><p>Rabbit noticed Alice, as the whole pack rose up into the darkness as hard as it is.\' \'Then you may SIT down,\' the King said to herself. (Alice had no idea what a dear little puppy it was!\' said Alice, always ready to sink into the jury-box, or they would die. \'The trial cannot proceed,\' said the Caterpillar. \'Well, perhaps not,\' said Alice to herself, \'I wonder what they\'ll do next! As for pulling me out of its mouth and began talking again. \'Dinah\'ll miss me very much of it altogether; but.</p><p>Quadrille, that she was nine feet high, and her eyes to see if she were looking up into a conversation. Alice replied, rather shyly, \'I--I hardly know, sir, just at present--at least I mean what I say--that\'s the same thing,\' said the Dormouse: \'not in that poky little house, and have next to no toys to play croquet with the Queen said to live. \'I\'ve seen hatters before,\' she said to herself, \'if one only knew the name of the busy farm-yard--while the lowing of the guinea-pigs cheered, and was.</p><p>Longitude I\'ve got to the Dormouse, and repeated her question. \'Why did they live on?\' said Alice, in a great hurry to change the subject,\' the March Hare. \'It was the first to speak. \'What size do you want to go and get ready for your interesting story,\' but she had put the hookah into its face to see you again, you dear old thing!\' said the Cat, \'a dog\'s not mad. You grant that?\' \'I suppose so,\' said Alice. \'Oh, don\'t bother ME,\' said the Hatter, it woke up again as quickly as she leant.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(11,'Career','<p>I used--and I don\'t want YOU with us!\"\' \'They were learning to draw, you know--\' \'What did they draw the treacle from?\' \'You can draw water out of sight; and an old conger-eel, that used to know. Let me see: four times six is thirteen, and four times seven is--oh dear! I wish you were never even spoke to Time!\' \'Perhaps not,\' Alice replied eagerly, for she had read about them in books, and she felt that she let the jury--\' \'If any one left alive!\' She was moving them about as it was a real.</p><p>Alice. \'That\'s very important,\' the King said, with a pair of gloves and the Queen, \'Really, my dear, I think?\' \'I had NOT!\' cried the Gryphon. \'The reason is,\' said the Caterpillar. This was quite tired and out of the doors of the Mock Turtle repeated thoughtfully. \'I should like to be an advantage,\' said Alice, \'and if it had some kind of sob, \'I\'ve tried the effect of lying down with wonder at the thought that SOMEBODY ought to be seen--everything seemed to have changed since her swim in.</p><p>I can reach the key; and if I shall never get to twenty at that rate! However, the Multiplication Table doesn\'t signify: let\'s try Geography. London is the capital of Paris, and Paris is the capital of Rome, and Rome--no, THAT\'S all wrong, I\'m certain! I must sugar my hair.\" As a duck with its legs hanging down, but generally, just as I\'d taken the highest tree in front of them, and then the puppy jumped into the earth. At last the Gryphon in an offended tone, \'was, that the hedgehog to, and.</p><p>And she tried the effect of lying down with her head!\' about once in a minute. Alice began to tremble. Alice looked round, eager to see if she had tired herself out with his head!\' she said, \'for her hair goes in such confusion that she hardly knew what she did, she picked up a little different. But if I\'m Mabel, I\'ll stay down here with me! There are no mice in the wood, \'is to grow to my jaw, Has lasted the rest of the Gryphon, and the baby--the fire-irons came first; then followed a shower.</p>',1,NULL,'default',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06'),(12,'Coming soon','<p>Condimentum ipsum a adipiscing hac dolor set consectetur urna commodo elit parturient <br/>molestie ut nisl partu convallier ullamcorpe.</p><div>[coming-soon time=\"2025-01-25 07:45:06\" image=\"general/coming-soon.jpg\"][/coming-soon]</div>',1,NULL,'coming-soon',NULL,'published','2024-01-25 00:45:06','2024-01-25 00:45:06');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'USD',0,'EPR8VFQSAD','razorpay',NULL,3462.00,1,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:09','2024-01-25 00:45:09','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(2,'USD',0,'RMY8TFOHOB','sslcommerz',NULL,586.00,2,'completed','confirm',3,NULL,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(3,'USD',0,'82ZUD6GG2S','cod',NULL,2809.00,3,'pending','confirm',3,NULL,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(4,'USD',0,'ORS4GUXQKB','mollie',NULL,1679.00,4,'completed','confirm',10,NULL,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(5,'USD',0,'TMX4PJISJZ','paypal',NULL,1551.00,5,'completed','confirm',10,NULL,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(6,'USD',0,'HGPKQFWY8N','mollie',NULL,1365.00,6,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:10','2024-01-25 00:45:10','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(7,'USD',0,'CGLLMZNVOD','mollie',NULL,1641.00,7,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(8,'USD',0,'36GBOWXL5A','mollie',NULL,1058.00,8,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(9,'USD',0,'3JQI3IRHDQ','stripe',NULL,1086.00,9,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(10,'USD',0,'LUASF0LFE3','mollie',NULL,1172.00,10,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(11,'USD',0,'SXUA6LWJOW','sslcommerz',NULL,591.00,11,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:11','2024-01-25 00:45:11','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(12,'USD',0,'KI3TXKYFZ4','cod',NULL,1126.00,12,'pending','confirm',6,NULL,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(13,'USD',0,'ER4IPJS0QD','razorpay',NULL,40.00,13,'completed','confirm',10,NULL,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(14,'USD',0,'I1JB59ZVQO','sslcommerz',NULL,2340.00,14,'completed','confirm',10,NULL,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(15,'USD',0,'YF90OGXHHP','bank_transfer',NULL,2068.00,15,'pending','confirm',10,NULL,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(16,'USD',0,'FCUWQM5C2N','bank_transfer',NULL,20.00,16,'pending','confirm',1,NULL,NULL,'2024-01-25 00:45:12','2024-01-25 00:45:12','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(17,'USD',0,'IFEOLBPNF0','sslcommerz',NULL,3364.00,17,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(18,'USD',0,'DNAQVRVAT5','stripe',NULL,706.00,18,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(19,'USD',0,'AUC8RIZUFA','stripe',NULL,843.00,19,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(20,'USD',0,'3MT9PGIKCA','stripe',NULL,4029.00,20,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(21,'USD',0,'PD7UPBXU14','stripe',NULL,1332.50,21,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(22,'USD',0,'ZC2EGDFR2D','razorpay',NULL,1094.00,22,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:13','2024-01-25 00:45:13','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(23,'USD',0,'ICCOPBSDQX','paystack',NULL,80.25,23,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(24,'USD',0,'AIZWLEVYAO','cod',NULL,1126.00,24,'pending','confirm',5,NULL,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(25,'USD',0,'BF5KOBOAWI','paypal',NULL,2118.00,25,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(26,'USD',0,'GIKOKBJLOF','sslcommerz',NULL,3176.00,26,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(27,'USD',0,'WCRHMGCBRE','stripe',NULL,1170.00,27,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:14','2024-01-25 00:45:14','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(28,'USD',0,'3EN0NJZE9K','razorpay',NULL,501.00,28,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(29,'USD',0,'OPTC8RSOB6','paypal',NULL,1086.00,29,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(30,'USD',0,'JPSLJ4XI1G','stripe',NULL,1182.00,30,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(31,'USD',0,'VHHO5O5DM3','cod',NULL,1172.00,31,'pending','confirm',6,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(32,'USD',0,'I9IVTFXOZQ','mollie',NULL,1566.00,32,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(33,'USD',0,'TW8QJVASTG','paypal',NULL,1692.00,33,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:15','2024-01-25 00:45:15','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(34,'USD',0,'RK2J5RL7CI','sslcommerz',NULL,1126.00,34,'completed','confirm',6,NULL,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(35,'USD',0,'JRZ7DRK0FU','mollie',NULL,593.50,35,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(36,'USD',0,'AFQRLFOGQ0','paystack',NULL,2349.00,36,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(37,'USD',0,'L3KXOWJY6D','cod',NULL,1104.00,37,'pending','confirm',3,NULL,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(38,'USD',0,'Q8Q0RPLACV','cod',NULL,1587.00,38,'pending','confirm',3,NULL,NULL,'2024-01-25 00:45:16','2024-01-25 00:45:16','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(39,'USD',0,'XX8ZLMNHFU','mollie',NULL,1002.00,39,'completed','confirm',3,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(40,'USD',0,'FGFESQVFKV','paypal',NULL,1097.00,40,'completed','confirm',3,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(41,'USD',0,'EARM2CXK5G','razorpay',NULL,20.00,41,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(42,'USD',0,'61B7PYKMCO','paypal',NULL,3510.00,42,'completed','confirm',1,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(43,'USD',0,'AEJUMQ2AP0','sslcommerz',NULL,1659.00,43,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(44,'USD',0,'1VIPB1V0J4','cod',NULL,1104.00,44,'pending','confirm',5,NULL,NULL,'2024-01-25 00:45:17','2024-01-25 00:45:17','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(45,'USD',0,'D70BI01AHC','stripe',NULL,2540.00,45,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(46,'USD',0,'2ZVELBJLOB','stripe',NULL,121.50,46,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL),(47,'USD',0,'GNFAAJCWMK','stripe',NULL,4419.00,47,'completed','confirm',5,NULL,NULL,'2024-01-25 00:45:18','2024-01-25 00:45:18','HuberwayCMS\\Ecommerce\\Models\\Customer',NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
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
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (1,1),(4,1),(2,2),(4,2),(1,3),(4,3),(2,4),(4,4),(2,5),(4,5),(2,6),(4,6),(2,7),(3,7),(2,8),(4,8),(1,9),(4,9),(1,10),(3,10),(2,11),(3,11);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2),(1,3),(2,3),(3,3),(4,3),(5,3),(1,4),(2,4),(3,4),(4,4),(5,4),(1,5),(2,5),(3,5),(4,5),(5,5),(1,6),(2,6),(3,6),(4,6),(5,6),(1,7),(2,7),(3,7),(4,7),(5,7),(1,8),(2,8),(3,8),(4,8),(5,8),(1,9),(2,9),(3,9),(4,9),(5,9),(1,10),(2,10),(3,10),(4,10),(5,10),(1,11),(2,11),(3,11),(4,11),(5,11);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HuberwayCMS\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'4 Expert Tips On How To Choose The Right Men’s Wallet','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/1.jpg',472,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(2,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/2.jpg',1801,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(3,'The Top 2020 Handbag Trends to Know','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/3.jpg',251,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(4,'How to Match the Color of Your Handbag With an Outfit','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/4.jpg',1655,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(5,'How to Care for Leather Bags','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/5.jpg',873,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(6,'We\'re Crushing Hard on Summer\'s 10 Biggest Bag Trends','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/6.jpg',1270,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(7,'Essential Qualities of Highly Successful Music','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/7.jpg',842,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(8,'9 Things I Love About Shaving My Head','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/8.jpg',2265,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(9,'Why Teamwork Really Makes The Dream Work','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/9.jpg',125,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(10,'The World Caters to Average People','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',1,'news/10.jpg',299,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05'),(11,'The litigants on the screen are not actors','You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.','<p>I have seen many people underestimating the power of their wallets. To them, they are just a functional item they use to carry. As a result, they often end up with the wallets which are not really suitable for them.</p>\n\n<p>You should pay more attention when you choose your wallets. There are a lot of them on the market with the different designs and styles. When you choose carefully, you would be able to buy a wallet that is catered to your needs. Not to mention that it will help to enhance your style significantly.</p>\n\n<p style=\"text-align:center\"><img alt=\"f4\" src=\"/storage/news/1.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<p><strong><em>For all of the reason above, here are 7 expert tips to help you pick up the right men&rsquo;s wallet for you:</em></strong></p>\n\n<h4><strong>Number 1: Choose A Neat Wallet</strong></h4>\n\n<p>The wallet is an essential accessory that you should go simple. Simplicity is the best in this case. A simple and neat wallet with the plain color and even&nbsp;<strong>minimalist style</strong>&nbsp;is versatile. It can be used for both formal and casual events. In addition, that wallet will go well with most of the clothes in your wardrobe.</p>\n\n<p>Keep in mind that a wallet will tell other people about your personality and your fashion sense as much as other clothes you put on. Hence, don&rsquo;t go cheesy on your wallet or else people will think that you have a funny and particular style.</p>\n\n<p style=\"text-align:center\"><img alt=\"f5\" src=\"/storage/news/2.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n<hr />\n<h4><strong>Number 2: Choose The Right Size For Your Wallet</strong></h4>\n\n<p>You should avoid having an over-sized wallet. Don&rsquo;t think that you need to buy a big wallet because you have a lot to carry with you. In addition, a fat wallet is very ugly. It will make it harder for you to slide the wallet into your trousers&rsquo; pocket. In addition, it will create a bulge and ruin your look.</p>\n\n<p>Before you go on to buy a new wallet, clean out your wallet and place all of the items from your wallet on a table. Throw away things that you would never need any more such as the old bills or the expired gift cards. Remember to check your wallet on a frequent basis to get rid of all of the old stuff that you don&rsquo;t need anymore.</p>\n\n<p style=\"text-align:center\"><img alt=\"f1\" src=\"/storage/news/3.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 3: Don&rsquo;t Limit Your Options Of Materials</strong></h4>\n\n<p>The types and designs of wallets are not the only things that you should consider when you go out searching for your best wallet. You have more than 1 option of material rather than leather to choose from as well.</p>\n\n<p>You can experiment with other available options such as cotton, polyester and canvas. They all have their own pros and cons. As a result, they will be suitable for different needs and requirements. You should think about them all in order to choose the material which you would like the most.</p>\n\n<p style=\"text-align:center\"><img alt=\"f6\" height=\"375\" src=\"/storage/news/4.jpg\" /></p>\n\n<p><br />\n&nbsp;</p>\n\n<hr />\n<h4><strong>Number 4: Consider A Wallet As A Long Term Investment</strong></h4>\n\n<p>Your wallet is indeed an investment that you should consider spending a decent amount of time and effort on it. Another factor that you need to consider is how much you want to spend on your wallet. The price ranges of wallets on the market vary a great deal. You can find a wallet which is as cheap as about 5 to 7 dollars. On the other hand, you should expect to pay around 250 to 300 dollars for a high-quality wallet.</p>\n\n<p>In case you need a wallet to use for a long time, it is a good idea that you should invest a decent amount of money on a wallet. A high quality wallet from a reputational brand with the premium quality such as cowhide leather will last for a long time. In addition, it is an accessory to show off your fashion sense and your social status.</p>\n\n<p style=\"text-align:center\"><img alt=\"f2\" height=\"400\" src=\"/storage/news/5.jpg\" /></p>\n\n<p>&nbsp;</p>\n','published',2,'HuberwayCMS\\ACL\\Models\\User',0,'news/11.jpg',1246,NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"ads.index\":true,\"ads.create\":true,\"ads.edit\":true,\"ads.destroy\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugins.ecommerce\":true,\"ecommerce.settings\":true,\"ecommerce.report.index\":true,\"products.index\":true,\"products.create\":true,\"products.edit\":true,\"products.destroy\":true,\"products.duplicate\":true,\"product-categories.index\":true,\"product-categories.create\":true,\"product-categories.edit\":true,\"product-categories.destroy\":true,\"product-tag.index\":true,\"product-tag.create\":true,\"product-tag.edit\":true,\"product-tag.destroy\":true,\"brands.index\":true,\"brands.create\":true,\"brands.edit\":true,\"brands.destroy\":true,\"product-collections.index\":true,\"product-collections.create\":true,\"product-collections.edit\":true,\"product-collections.destroy\":true,\"product-attribute-sets.index\":true,\"product-attribute-sets.create\":true,\"product-attribute-sets.edit\":true,\"product-attribute-sets.destroy\":true,\"product-attributes.index\":true,\"product-attributes.create\":true,\"product-attributes.edit\":true,\"product-attributes.destroy\":true,\"tax.index\":true,\"tax.create\":true,\"tax.edit\":true,\"tax.destroy\":true,\"reviews.index\":true,\"reviews.create\":true,\"reviews.destroy\":true,\"reviews.publish\":true,\"reviews.reply\":true,\"shipping_methods.index\":true,\"ecommerce.shipping-rule-items.index\":true,\"ecommerce.shipping-rule-items.create\":true,\"ecommerce.shipping-rule-items.edit\":true,\"ecommerce.shipping-rule-items.destroy\":true,\"ecommerce.shipping-rule-items.bulk-import\":true,\"ecommerce.shipments.index\":true,\"ecommerce.shipments.create\":true,\"ecommerce.shipments.edit\":true,\"ecommerce.shipments.destroy\":true,\"orders.index\":true,\"orders.create\":true,\"orders.edit\":true,\"orders.destroy\":true,\"discounts.index\":true,\"discounts.create\":true,\"discounts.edit\":true,\"discounts.destroy\":true,\"customers.index\":true,\"customers.create\":true,\"customers.edit\":true,\"customers.destroy\":true,\"flash-sale.index\":true,\"flash-sale.create\":true,\"flash-sale.edit\":true,\"flash-sale.destroy\":true,\"product-label.index\":true,\"product-label.create\":true,\"product-label.edit\":true,\"product-label.destroy\":true,\"ecommerce.import.products.index\":true,\"ecommerce.export.products.index\":true,\"order_returns.index\":true,\"order_returns.edit\":true,\"order_returns.destroy\":true,\"global-option.index\":true,\"global-option.create\":true,\"global-option.edit\":true,\"global-option.destroy\":true,\"ecommerce.invoice.index\":true,\"ecommerce.invoice.edit\":true,\"ecommerce.invoice.destroy\":true,\"ecommerce.invoice-template.index\":true,\"ecommerce.settings.general\":true,\"ecommerce.settings.currencies\":true,\"ecommerce.settings.products\":true,\"ecommerce.settings.product-search\":true,\"ecommerce.settings.digital-products\":true,\"ecommerce.settings.store-locators\":true,\"ecommerce.settings.invoices\":true,\"ecommerce.settings.product-reviews\":true,\"ecommerce.settings.customers\":true,\"ecommerce.settings.shopping\":true,\"ecommerce.settings.taxes\":true,\"ecommerce.settings.shipping\":true,\"ecommerce.settings.tracking\":true,\"ecommerce.settings.standard-and-format\":true,\"ecommerce.settings.checkout\":true,\"ecommerce.settings.return\":true,\"ecommerce.settings.flash-sale\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"marketplace.index\":true,\"marketplace.store.index\":true,\"marketplace.store.create\":true,\"marketplace.store.edit\":true,\"marketplace.store.destroy\":true,\"marketplace.store.view\":true,\"marketplace.store.revenue.create\":true,\"marketplace.withdrawal.index\":true,\"marketplace.withdrawal.edit\":true,\"marketplace.withdrawal.destroy\":true,\"marketplace.vendors.index\":true,\"marketplace.unverified-vendors.index\":true,\"marketplace.unverified-vendors.edit\":true,\"marketplace.settings\":true,\"marketplace.reports\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"simple-slider.index\":true,\"simple-slider.create\":true,\"simple-slider.edit\":true,\"simple-slider.destroy\":true,\"simple-slider-item.index\":true,\"simple-slider-item.create\":true,\"simple-slider-item.edit\":true,\"simple-slider-item.destroy\":true,\"simple-slider.settings\":true,\"social-login.settings\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,2,2,'2024-01-25 00:45:05','2024-01-25 00:45:05');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-01-25 00:45:07'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"ads\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"ecommerce\",\"faq\",\"location\",\"marketplace\",\"newsletter\",\"payment\",\"paypal\",\"paypal-payout\",\"paystack\",\"razorpay\",\"shippo\",\"simple-slider\",\"social-login\",\"sslcommerz\",\"stripe\",\"translation\"]',NULL,'2024-01-25 00:45:07'),(8,'language_hide_default','1',NULL,'2024-01-25 00:45:07'),(9,'language_switcher_display','dropdown',NULL,'2024-01-25 00:45:07'),(10,'language_display','all',NULL,'2024-01-25 00:45:07'),(11,'language_hide_languages','[]',NULL,'2024-01-25 00:45:07'),(12,'simple_slider_using_assets','0',NULL,NULL),(13,'media_random_hash','a870c44f169273bc999562586b536734',NULL,'2024-01-25 00:45:07'),(14,'payment_cod_status','1',NULL,'2024-01-25 00:45:07'),(15,'payment_bank_transfer_status','1',NULL,'2024-01-25 00:45:07'),(16,'theme','huberwaytheme',NULL,'2024-01-25 00:45:07'),(17,'show_admin_bar','1',NULL,'2024-01-25 00:45:07'),(18,'admin_favicon','general/icona-huberway-colore.png',NULL,'2024-01-25 00:45:07'),(19,'admin_logo','general/logo-huberway-white.png',NULL,'2024-01-25 00:45:07'),(20,'permalink-huberwaycms-blog-models-post','blog',NULL,'2024-01-25 00:45:07'),(21,'permalink-huberwaycms-blog-models-category','blog',NULL,'2024-01-25 00:45:07'),(22,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,'2024-01-25 00:45:07'),(23,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,'2024-01-25 00:45:07'),(24,'payment_stripe_payment_type','stripe_checkout',NULL,'2024-01-25 00:45:07'),(25,'plugins_ecommerce_customer_new_order_status','0',NULL,'2024-01-25 00:45:07'),(26,'plugins_ecommerce_admin_new_order_status','0',NULL,'2024-01-25 00:45:07'),(27,'ecommerce_is_enabled_support_digital_products','1',NULL,'2024-01-25 00:45:07'),(28,'ecommerce_load_countries_states_cities_from_location_plugin','0',NULL,'2024-01-25 00:45:07'),(29,'payment_bank_transfer_display_bank_info_at_the_checkout_success_page','1',NULL,'2024-01-25 00:45:07'),(30,'ecommerce_product_sku_format','MF-2443-[%S]',NULL,'2024-01-25 00:45:07'),(31,'ecommerce_store_name','HuberwayTheme',NULL,NULL),(32,'ecommerce_store_phone','1800979769',NULL,NULL),(33,'ecommerce_store_address','502 New Street',NULL,NULL),(34,'ecommerce_store_state','Brighton VIC',NULL,NULL),(35,'ecommerce_store_city','Brighton VIC',NULL,NULL),(36,'ecommerce_store_country','AU',NULL,NULL),(37,'theme-huberwaytheme-site_title','HuberwayCMS - HuberwayCMS - Laravel Based',NULL,NULL),(38,'theme-huberwaytheme-seo_description','HuberwayCMS is a clean & modern HuberwayCMS - Laravel Based for multipurpose online stores. With design clean and trendy, HuberwayCMS will make your online store look more impressive and attractive to viewers.',NULL,NULL),(39,'theme-huberwaytheme-copyright','© 2024 HuberwayCMS. All Rights Reserved.',NULL,NULL),(40,'theme-huberwaytheme-favicon','general/icona-huberway-colore.png',NULL,NULL),(41,'theme-huberwaytheme-logo','general/logo-huberway-colore.png',NULL,NULL),(42,'theme-huberwaytheme-welcome_message','Welcome to HuberwayCMS Online Shopping Store!',NULL,NULL),(43,'theme-huberwaytheme-address','502 New Street, Brighton VIC, Australia',NULL,NULL),(44,'theme-huberwaytheme-hotline','1800 97 97 69',NULL,NULL),(45,'theme-huberwaytheme-email','contact@huberwaytheme.co',NULL,NULL),(46,'theme-huberwaytheme-newsletter_image','general/newsletter.jpg',NULL,NULL),(47,'theme-huberwaytheme-homepage_id','1',NULL,NULL),(48,'theme-huberwaytheme-blog_page_id','6',NULL,NULL),(49,'theme-huberwaytheme-cookie_consent_message','Your experience on this site will be improved by allowing cookies ',NULL,NULL),(50,'theme-huberwaytheme-cookie_consent_learn_more_url','/cookie-policy',NULL,NULL),(51,'theme-huberwaytheme-cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(52,'theme-huberwaytheme-number_of_products_per_page','42',NULL,NULL),(53,'theme-huberwaytheme-product_feature_1_title','Shipping worldwide',NULL,NULL),(54,'theme-huberwaytheme-product_feature_1_icon','icon-network',NULL,NULL),(55,'theme-huberwaytheme-product_feature_2_title','Free 7-day return if eligible, so easy',NULL,NULL),(56,'theme-huberwaytheme-product_feature_2_icon','icon-3d-rotate',NULL,NULL),(57,'theme-huberwaytheme-product_feature_3_title','Supplier give bills for this product.',NULL,NULL),(58,'theme-huberwaytheme-product_feature_3_icon','icon-receipt',NULL,NULL),(59,'theme-huberwaytheme-product_feature_4_title','Pay online or when receiving goods',NULL,NULL),(60,'theme-huberwaytheme-product_feature_4_icon','icon-credit-card',NULL,NULL),(61,'theme-huberwaytheme-contact_info_box_1_title','Contact Directly',NULL,NULL),(62,'theme-huberwaytheme-contact_info_box_1_subtitle','contact@huberwaytheme.com',NULL,NULL),(63,'theme-huberwaytheme-contact_info_box_1_details','(+004) 912-3548-07',NULL,NULL),(64,'theme-huberwaytheme-contact_info_box_2_title','Headquarters',NULL,NULL),(65,'theme-huberwaytheme-contact_info_box_2_subtitle','17 Queen St, South bank, Melbourne 10560, Australia',NULL,NULL),(66,'theme-huberwaytheme-contact_info_box_2_details','',NULL,NULL),(67,'theme-huberwaytheme-contact_info_box_3_title','Work With Us',NULL,NULL),(68,'theme-huberwaytheme-contact_info_box_3_subtitle','Send your CV to our email:',NULL,NULL),(69,'theme-huberwaytheme-contact_info_box_3_details','career@huberwaytheme.com',NULL,NULL),(70,'theme-huberwaytheme-contact_info_box_4_title','Customer Service',NULL,NULL),(71,'theme-huberwaytheme-contact_info_box_4_subtitle','customercare@huberwaytheme.com',NULL,NULL),(72,'theme-huberwaytheme-contact_info_box_4_details','(800) 843-2446',NULL,NULL),(73,'theme-huberwaytheme-contact_info_box_5_title','Media Relations',NULL,NULL),(74,'theme-huberwaytheme-contact_info_box_5_subtitle','media@huberwaytheme.com',NULL,NULL),(75,'theme-huberwaytheme-contact_info_box_5_details','(801) 947-3564',NULL,NULL),(76,'theme-huberwaytheme-contact_info_box_6_title','Vendor Support',NULL,NULL),(77,'theme-huberwaytheme-contact_info_box_6_subtitle','vendorsupport@huberwaytheme.com',NULL,NULL),(78,'theme-huberwaytheme-contact_info_box_6_details','(801) 947-3100',NULL,NULL),(79,'theme-huberwaytheme-number_of_cross_sale_product','7',NULL,NULL),(80,'theme-huberwaytheme-logo_in_the_checkout_page','general/logo-huberway-colore.png',NULL,NULL),(81,'theme-huberwaytheme-logo_in_invoices','general/logo-huberway-colore.png',NULL,NULL),(82,'theme-huberwaytheme-logo_vendor_dashboard','general/logo-huberway-colore.png',NULL,NULL),(83,'theme-huberwaytheme-primary_font','Work Sans',NULL,NULL),(84,'theme-huberwaytheme-payment_methods','[\"general\\/payment-method-1.jpg\",\"general\\/payment-method-2.jpg\",\"general\\/payment-method-3.jpg\",\"general\\/payment-method-4.jpg\",\"general\\/payment-method-5.jpg\"]',NULL,NULL),(85,'theme-huberwaytheme-social-name-1','Facebook',NULL,NULL),(86,'theme-huberwaytheme-social-url-1','https://www.facebook.com/',NULL,NULL),(87,'theme-huberwaytheme-social-icon-1','fab fa-facebook',NULL,NULL),(88,'theme-huberwaytheme-social-color-1','#3b5999',NULL,NULL),(89,'theme-huberwaytheme-social-name-2','Twitter',NULL,NULL),(90,'theme-huberwaytheme-social-url-2','https://www.twitter.com/',NULL,NULL),(91,'theme-huberwaytheme-social-icon-2','fab fa-twitter',NULL,NULL),(92,'theme-huberwaytheme-social-color-2','#55ACF9',NULL,NULL),(93,'theme-huberwaytheme-social-name-3','Instagram',NULL,NULL),(94,'theme-huberwaytheme-social-url-3','https://www.instagram.com/',NULL,NULL),(95,'theme-huberwaytheme-social-icon-3','fab fa-instagram',NULL,NULL),(96,'theme-huberwaytheme-social-color-3','#E1306C',NULL,NULL),(97,'theme-huberwaytheme-social-name-4','Youtube',NULL,NULL),(98,'theme-huberwaytheme-social-url-4','https://www.youtube.com/',NULL,NULL),(99,'theme-huberwaytheme-social-icon-4','fab fa-youtube',NULL,NULL),(100,'theme-huberwaytheme-social-color-4','#FF0000',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_slider_items`
--

DROP TABLE IF EXISTS `simple_slider_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_slider_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `simple_slider_id` bigint unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `order` int unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_slider_items`
--

LOCK TABLES `simple_slider_items` WRITE;
/*!40000 ALTER TABLE `simple_slider_items` DISABLE KEYS */;
INSERT INTO `simple_slider_items` VALUES (1,1,'Slider 1','sliders/1-lg.jpg','/products',NULL,1,'2024-01-25 00:45:06','2024-01-25 00:45:06'),(2,1,'Slider 2','sliders/2-lg.jpg','/products',NULL,2,'2024-01-25 00:45:06','2024-01-25 00:45:06'),(3,1,'Slider 3','sliders/3-lg.jpg','/products',NULL,3,'2024-01-25 00:45:06','2024-01-25 00:45:06');
/*!40000 ALTER TABLE `simple_slider_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_sliders`
--

DROP TABLE IF EXISTS `simple_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `simple_sliders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_sliders`
--

LOCK TABLES `simple_sliders` WRITE;
/*!40000 ALTER TABLE `simple_sliders` DISABLE KEYS */;
INSERT INTO `simple_sliders` VALUES (1,'Home slider','home-slider','The main slider on homepage','published','2024-01-25 00:45:06','2024-01-25 00:45:06');
/*!40000 ALTER TABLE `simple_sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'fashion-live',1,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(2,'hand-crafted',2,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(3,'mestonix',3,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(4,'sunshine',4,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(5,'pure',5,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(6,'anfold',6,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(7,'automotive',7,'HuberwayCMS\\Ecommerce\\Models\\Brand','brands','2024-01-25 00:44:55','2024-01-25 00:44:55'),(8,'hot-promotions',1,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(9,'electronics',2,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(10,'consumer-electronic',3,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(11,'home-audio-theaters',4,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(12,'tv-videos',5,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(13,'camera-photos-videos',6,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(14,'cellphones-accessories',7,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(15,'headphones',8,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(16,'videos-games',9,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(17,'wireless-speakers',10,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(18,'office-electronic',11,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(19,'accessories-parts',12,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(20,'digital-cables',13,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(21,'audio-video-cables',14,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(22,'batteries',15,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(23,'clothing',16,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(24,'computers',17,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(25,'computer-technologies',18,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(26,'computer-tablets',19,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(27,'laptop',20,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(28,'monitors',21,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(29,'computer-components',22,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(30,'networking',23,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(31,'drive-storages',24,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(32,'gaming-laptop',25,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(33,'security-protection',26,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(34,'accessories',27,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(35,'home-kitchen',28,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(36,'health-beauty',29,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(37,'jewelry-watch',30,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(38,'technology-toys',31,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(39,'phones',32,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(40,'babies-moms',33,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(41,'sport-outdoor',34,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(42,'books-office',35,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:55','2024-01-25 00:44:55'),(43,'cars-motorcycles',36,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:56','2024-01-25 00:44:56'),(44,'home-improvements',37,'HuberwayCMS\\Ecommerce\\Models\\ProductCategory','product-categories','2024-01-25 00:44:56','2024-01-25 00:44:56'),(45,'dual-camera-20mp-digital',1,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:45:32'),(46,'smart-watches',2,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(47,'beat-headphone',3,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(48,'red-black-headphone',4,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(49,'smart-watch-external-digital',5,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:45:32'),(50,'nikon-hd-camera',6,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(51,'audio-equipment',7,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(52,'smart-televisions',8,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(53,'samsung-smart-phone-digital',9,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:45:32'),(54,'herschel-leather-duffle-bag-in-brown-color',10,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(55,'xbox-one-wireless-controller-black-color',11,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(56,'epsion-plaster-printer',12,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:44:59','2024-01-25 00:44:59'),(57,'sound-intone-i65-earphone-white-version-digital',13,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:32'),(58,'bo-play-mini-bluetooth-speaker',14,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(59,'apple-macbook-air-retina-133-inch-laptop',15,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(60,'apple-macbook-air-retina-12-inch-laptop',16,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(61,'samsung-gear-vr-virtual-reality-headset-digital',17,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:32'),(62,'aveeno-moisturizing-body-shower-450ml',18,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(63,'nyx-beauty-couton-pallete-makeup-12',19,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(64,'nyx-beauty-couton-pallete-makeup-12',20,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(65,'mvmth-classical-leather-watch-in-black-digital',21,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:32'),(66,'baxter-care-hair-kit-for-bearded-mens',22,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(67,'ciate-palemore-lipstick-bold-red-color',23,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:00','2024-01-25 00:45:00'),(68,'electronic',1,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(69,'mobile',2,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(70,'iphone',3,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(71,'printer',4,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(72,'office',5,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(73,'it',6,'HuberwayCMS\\Ecommerce\\Models\\ProductTag','product-tags','2024-01-25 00:45:04','2024-01-25 00:45:04'),(74,'ecommerce',1,'HuberwayCMS\\Blog\\Models\\Category','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(75,'fashion',2,'HuberwayCMS\\Blog\\Models\\Category','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(76,'electronic',3,'HuberwayCMS\\Blog\\Models\\Category','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(77,'commercial',4,'HuberwayCMS\\Blog\\Models\\Category','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(78,'general',1,'HuberwayCMS\\Blog\\Models\\Tag','tag','2024-01-25 00:45:05','2024-01-25 00:45:05'),(79,'design',2,'HuberwayCMS\\Blog\\Models\\Tag','tag','2024-01-25 00:45:05','2024-01-25 00:45:05'),(80,'fashion',3,'HuberwayCMS\\Blog\\Models\\Tag','tag','2024-01-25 00:45:05','2024-01-25 00:45:05'),(81,'branding',4,'HuberwayCMS\\Blog\\Models\\Tag','tag','2024-01-25 00:45:05','2024-01-25 00:45:05'),(82,'modern',5,'HuberwayCMS\\Blog\\Models\\Tag','tag','2024-01-25 00:45:05','2024-01-25 00:45:05'),(83,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',1,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(84,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',2,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(85,'the-top-2020-handbag-trends-to-know',3,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(86,'how-to-match-the-color-of-your-handbag-with-an-outfit',4,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(87,'how-to-care-for-leather-bags',5,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(88,'were-crushing-hard-on-summers-10-biggest-bag-trends',6,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(89,'essential-qualities-of-highly-successful-music',7,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(90,'9-things-i-love-about-shaving-my-head',8,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(91,'why-teamwork-really-makes-the-dream-work',9,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(92,'the-world-caters-to-average-people',10,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(93,'the-litigants-on-the-screen-are-not-actors',11,'HuberwayCMS\\Blog\\Models\\Post','blog','2024-01-25 00:45:05','2024-01-25 00:45:07'),(94,'home',1,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(95,'about-us',2,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(96,'terms-of-use',3,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(97,'terms-conditions',4,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(98,'refund-policy',5,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(99,'blog',6,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(100,'faqs',7,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(101,'contact',8,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(102,'cookie-policy',9,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(103,'affiliate',10,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(104,'career',11,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(105,'coming-soon',12,'HuberwayCMS\\Page\\Models\\Page','','2024-01-25 00:45:06','2024-01-25 00:45:06'),(106,'gopro',1,'HuberwayCMS\\Marketplace\\Models\\Store','stores','2024-01-25 00:45:09','2024-01-25 00:45:09'),(107,'global-office',2,'HuberwayCMS\\Marketplace\\Models\\Store','stores','2024-01-25 00:45:09','2024-01-25 00:45:09'),(108,'young-shop',3,'HuberwayCMS\\Marketplace\\Models\\Store','stores','2024-01-25 00:45:09','2024-01-25 00:45:09'),(109,'global-store',4,'HuberwayCMS\\Marketplace\\Models\\Store','stores','2024-01-25 00:45:09','2024-01-25 00:45:09'),(110,'roberts-store',5,'HuberwayCMS\\Marketplace\\Models\\Store','stores','2024-01-25 00:45:09','2024-01-25 00:45:09'),(111,'dual-camera-20mp-digital',24,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(112,'dual-camera-20mp-digital',25,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(113,'dual-camera-20mp-digital',26,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(114,'smart-watches',27,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(115,'smart-watches',28,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(116,'beat-headphone',29,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(117,'beat-headphone',30,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(118,'beat-headphone',31,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(119,'beat-headphone',32,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(120,'red-black-headphone',33,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(121,'red-black-headphone',34,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(122,'red-black-headphone',35,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(123,'smart-watch-external-digital',36,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(124,'smart-watch-external-digital',37,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(125,'nikon-hd-camera',38,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(126,'audio-equipment',39,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(127,'audio-equipment',40,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(128,'smart-televisions',41,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(129,'samsung-smart-phone-digital',42,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(130,'samsung-smart-phone-digital',43,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(131,'herschel-leather-duffle-bag-in-brown-color',44,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(132,'herschel-leather-duffle-bag-in-brown-color',45,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(133,'herschel-leather-duffle-bag-in-brown-color',46,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(134,'herschel-leather-duffle-bag-in-brown-color',47,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(135,'xbox-one-wireless-controller-black-color',48,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(136,'epsion-plaster-printer',49,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(137,'epsion-plaster-printer',50,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(138,'epsion-plaster-printer',51,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(139,'epsion-plaster-printer',52,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(140,'sound-intone-i65-earphone-white-version-digital',53,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(141,'sound-intone-i65-earphone-white-version-digital',54,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(142,'sound-intone-i65-earphone-white-version-digital',55,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(143,'bo-play-mini-bluetooth-speaker',56,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(144,'bo-play-mini-bluetooth-speaker',57,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(145,'apple-macbook-air-retina-133-inch-laptop',58,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(146,'apple-macbook-air-retina-133-inch-laptop',59,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(147,'apple-macbook-air-retina-12-inch-laptop',60,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(148,'samsung-gear-vr-virtual-reality-headset-digital',61,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(149,'samsung-gear-vr-virtual-reality-headset-digital',62,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(150,'samsung-gear-vr-virtual-reality-headset-digital',63,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(151,'aveeno-moisturizing-body-shower-450ml',64,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(152,'aveeno-moisturizing-body-shower-450ml',65,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(153,'aveeno-moisturizing-body-shower-450ml',66,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(154,'nyx-beauty-couton-pallete-makeup-12',67,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(155,'nyx-beauty-couton-pallete-makeup-12',68,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(156,'nyx-beauty-couton-pallete-makeup-12',69,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(157,'nyx-beauty-couton-pallete-makeup-12',70,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(158,'nyx-beauty-couton-pallete-makeup-12',71,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(159,'nyx-beauty-couton-pallete-makeup-12',72,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(160,'nyx-beauty-couton-pallete-makeup-12',73,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(161,'mvmth-classical-leather-watch-in-black-digital',74,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(162,'baxter-care-hair-kit-for-bearded-mens',75,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(163,'baxter-care-hair-kit-for-bearded-mens',76,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(164,'ciate-palemore-lipstick-bold-red-color',77,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32'),(165,'ciate-palemore-lipstick-bold-red-color',78,'HuberwayCMS\\Ecommerce\\Models\\Product','products','2024-01-25 00:45:32','2024-01-25 00:45:32');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'HuberwayCMS\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'General',1,'HuberwayCMS\\ACL\\Models\\User','','published','2024-01-25 00:45:05','2024-01-25 00:45:05'),(2,'Design',1,'HuberwayCMS\\ACL\\Models\\User','','published','2024-01-25 00:45:05','2024-01-25 00:45:05'),(3,'Fashion',1,'HuberwayCMS\\ACL\\Models\\User','','published','2024-01-25 00:45:05','2024-01-25 00:45:05'),(4,'Branding',1,'HuberwayCMS\\ACL\\Models\\User','','published','2024-01-25 00:45:05','2024-01-25 00:45:05'),(5,'Modern',1,'HuberwayCMS\\ACL\\Models\\User','','published','2024-01-25 00:45:05','2024-01-25 00:45:05');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'tkshlerin@tromp.com',NULL,'$2y$12$EVUGqGBxCFSiM8eFo0C8runCx8nWRTSdUZCCW4uD9I4F0Kt9Sp3ki',NULL,'2024-01-25 00:45:04','2024-01-25 00:45:04','Morgan','Hartmann','huberwaycms',NULL,1,1,NULL,NULL),(2,'mallory04@mitchell.info',NULL,'$2y$12$sIyZ5LnXxUb3L1tKeCPew.S8wrazLwp1aPshZisvh7nVKC5pK9A3S',NULL,'2024-01-25 00:45:05','2024-01-25 00:45:05','Floyd','Barrows','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'CustomMenuWidget','footer_sidebar','huberwaytheme',1,'{\"id\":\"CustomMenuWidget\",\"name\":\"Quick links\",\"menu_id\":\"quick-links\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(2,'CustomMenuWidget','footer_sidebar','huberwaytheme',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(3,'CustomMenuWidget','footer_sidebar','huberwaytheme',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Business\",\"menu_id\":\"business\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(4,'BlogSearchWidget','primary_sidebar','huberwaytheme',1,'{\"id\":\"BlogSearchWidget\",\"name\":\"Search\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(5,'BlogCategoriesWidget','primary_sidebar','huberwaytheme',2,'{\"id\":\"BlogCategoriesWidget\",\"name\":\"Categories\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(6,'RecentPostsWidget','primary_sidebar','huberwaytheme',3,'{\"id\":\"RecentPostsWidget\",\"name\":\"Recent Posts\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(7,'TagsWidget','primary_sidebar','huberwaytheme',4,'{\"id\":\"TagsWidget\",\"name\":\"Popular Tags\"}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(8,'ProductCategoriesWidget','bottom_footer_sidebar','huberwaytheme',1,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Consumer Electric\",\"categories\":[18,2,3,4,5,6,7]}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(9,'ProductCategoriesWidget','bottom_footer_sidebar','huberwaytheme',2,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Clothing & Apparel\",\"categories\":[8,9,10,11,12]}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(10,'ProductCategoriesWidget','bottom_footer_sidebar','huberwaytheme',3,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Home, Garden & Kitchen\",\"categories\":[13,14,15,16,17]}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(11,'ProductCategoriesWidget','bottom_footer_sidebar','huberwaytheme',4,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Health & Beauty\",\"categories\":[20,21,22,23,24]}','2024-01-25 00:45:07','2024-01-25 00:45:07'),(12,'ProductCategoriesWidget','bottom_footer_sidebar','huberwaytheme',5,'{\"id\":\"ProductCategoriesWidget\",\"name\":\"Computer & Technologies\",\"categories\":[25,26,27,28,29,19]}','2024-01-25 00:45:07','2024-01-25 00:45:07');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-25 14:45:34
