-- MySQL dump 10.13  Distrib 5.5.24, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: q2a
-- ------------------------------------------------------
-- Server version	5.5.24-0ubuntu0.12.04.1

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
-- Table structure for table `qa_blobs`
--

DROP TABLE IF EXISTS `qa_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_blobs` (
  `blobid` bigint(20) unsigned NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `content` mediumblob NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`blobid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_blobs`
--

LOCK TABLES `qa_blobs` WRITE;
/*!40000 ALTER TABLE `qa_blobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cache`
--

DROP TABLE IF EXISTS `qa_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cache` (
  `type` char(8) CHARACTER SET ascii NOT NULL,
  `cacheid` bigint(20) unsigned NOT NULL DEFAULT '0',
  `content` mediumblob NOT NULL,
  `created` datetime NOT NULL,
  `lastread` datetime NOT NULL,
  PRIMARY KEY (`type`,`cacheid`),
  KEY `lastread` (`lastread`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cache`
--

LOCK TABLES `qa_cache` WRITE;
/*!40000 ALTER TABLE `qa_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categories`
--

DROP TABLE IF EXISTS `qa_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categories` (
  `categoryid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` int(10) unsigned DEFAULT NULL,
  `title` varchar(80) NOT NULL,
  `tags` varchar(200) NOT NULL,
  `content` varchar(800) NOT NULL DEFAULT '',
  `qcount` int(10) unsigned NOT NULL DEFAULT '0',
  `position` smallint(5) unsigned NOT NULL,
  `backpath` varchar(804) NOT NULL DEFAULT '',
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY `parentid` (`parentid`,`tags`),
  UNIQUE KEY `parentid_2` (`parentid`,`position`),
  KEY `backpath` (`backpath`(200))
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categories`
--

LOCK TABLES `qa_categories` WRITE;
/*!40000 ALTER TABLE `qa_categories` DISABLE KEYS */;
INSERT INTO `qa_categories` VALUES (1,NULL,'Module 1 - Getting started with Rails','module-1','',2,2,'module-1'),(2,1,'1. Zero to app in 5 steps','lesson-1','',1,1,'lesson-1/module-1'),(3,1,'2. Rails directory structure','lesson-2','',0,2,'lesson-2/module-1'),(4,1,'3. Say hello through Rails','lesson-3','',1,3,'lesson-3/module-1'),(5,1,'4. Pages using controller','lesson-4','',0,4,'lesson-4/module-1'),(6,1,'5. Visualizing Rails flow','lesson-5','',0,5,'lesson-5/module-1'),(7,NULL,'Module 2. Starting with to-do list app','module-2','',7,3,'module-2'),(8,7,'1. Designing to-do list app','lesson-1','',0,1,'lesson-1/module-2'),(9,7,'2. Todos from controller','lesson-2','',2,2,'lesson-2/module-2'),(10,7,'3. Model to store/fetch todos','lesson-3','',3,3,'lesson-3/module-2'),(11,7,'4. Learning to delete last todo','lesson-4','',0,4,'lesson-4/module-2'),(12,7,'5. Add Twitter Bootstrap CSS','lesson-5','',2,5,'lesson-5/module-2'),(13,NULL,'Module 3. Add, delete, mark & unmark todos','module-3','',1,4,'module-3'),(14,13,'1. Add todo from the view','lesson-1','',1,1,'lesson-1/module-3'),(15,13,'2. Adding todo through form_for','lesson-2','',0,2,'lesson-2/module-3'),(16,13,'3. Mark todo complete','lesson-3','',0,3,'lesson-3/module-3'),(17,13,'4. Edit & delete todo','lesson-4','',0,4,'lesson-4/module-3'),(18,13,'5. Ajaxifying operations','lesson-5','',0,5,'lesson-5/module-3'),(19,NULL,'Others','others','Any question that does not belong to a Module/Lesson goes here.',8,1,'others');
/*!40000 ALTER TABLE `qa_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_categorymetas`
--

DROP TABLE IF EXISTS `qa_categorymetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_categorymetas` (
  `categoryid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`categoryid`,`title`),
  CONSTRAINT `qa_categorymetas_ibfk_1` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_categorymetas`
--

LOCK TABLES `qa_categorymetas` WRITE;
/*!40000 ALTER TABLE `qa_categorymetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_categorymetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_contentwords`
--

DROP TABLE IF EXISTS `qa_contentwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_contentwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `count` tinyint(3) unsigned NOT NULL,
  `type` enum('Q','A','C','NOTE') NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_contentwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_contentwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_contentwords`
--

LOCK TABLES `qa_contentwords` WRITE;
/*!40000 ALTER TABLE `qa_contentwords` DISABLE KEYS */;
INSERT INTO `qa_contentwords` VALUES (18,78,1,'Q',18),(18,79,1,'Q',18),(18,80,1,'Q',18),(18,81,1,'Q',18),(18,82,1,'Q',18),(18,83,1,'Q',18),(18,55,1,'Q',18),(19,84,1,'A',18),(19,85,2,'A',18),(19,2,1,'A',18),(19,86,1,'A',18),(19,87,3,'A',18),(19,88,1,'A',18),(19,34,1,'A',18),(19,89,1,'A',18),(19,90,2,'A',18),(19,76,2,'A',18),(19,91,2,'A',18),(19,92,1,'A',18),(19,93,1,'A',18),(19,94,1,'A',18),(19,66,2,'A',18),(19,95,1,'A',18),(19,96,1,'A',18),(20,72,2,'Q',20),(20,103,1,'Q',20),(20,66,2,'Q',20),(20,104,2,'Q',20),(20,67,1,'Q',20),(20,105,1,'Q',20),(20,106,1,'Q',20),(20,107,1,'Q',20),(20,83,1,'Q',20),(20,101,1,'Q',20),(20,108,1,'Q',20),(20,87,1,'Q',20),(20,109,1,'Q',20),(20,110,2,'Q',20),(20,111,2,'Q',20),(20,112,2,'Q',20),(20,80,1,'Q',20),(20,113,1,'Q',20),(20,114,1,'Q',20),(20,115,1,'Q',20),(20,116,1,'Q',20),(20,117,1,'Q',20),(20,118,1,'Q',20),(20,119,1,'Q',20),(20,120,1,'Q',20),(20,121,1,'Q',20),(20,92,1,'Q',20),(20,122,1,'Q',20),(21,123,1,'A',20),(21,66,1,'A',20),(21,117,1,'A',20),(21,2,1,'A',20),(21,124,1,'A',20),(21,56,1,'A',20),(21,31,1,'A',20),(21,49,1,'A',20),(21,98,1,'A',20),(21,101,1,'A',20),(21,99,1,'A',20),(21,100,1,'A',20);
/*!40000 ALTER TABLE `qa_contentwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_cookies`
--

DROP TABLE IF EXISTS `qa_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_cookies` (
  `cookieid` bigint(20) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `createip` int(10) unsigned NOT NULL,
  `written` datetime DEFAULT NULL,
  `writeip` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`cookieid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_cookies`
--

LOCK TABLES `qa_cookies` WRITE;
/*!40000 ALTER TABLE `qa_cookies` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_cookies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_iplimits`
--

DROP TABLE IF EXISTS `qa_iplimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_iplimits` (
  `ip` int(10) unsigned NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `ip` (`ip`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_iplimits`
--

LOCK TABLES `qa_iplimits` WRITE;
/*!40000 ALTER TABLE `qa_iplimits` DISABLE KEYS */;
INSERT INTO `qa_iplimits` VALUES (18270747,'Q',379382,1),(45364265,'V',379471,2),(1336750736,'Q',379457,1),(2130706433,'A',379304,3),(2130706433,'Q',379304,7),(3574718987,'Q',379453,1),(3680225586,'A',379470,1);
/*!40000 ALTER TABLE `qa_iplimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_options`
--

DROP TABLE IF EXISTS `qa_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_options` (
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_options`
--

LOCK TABLES `qa_options` WRITE;
/*!40000 ALTER TABLE `qa_options` DISABLE KEYS */;
INSERT INTO `qa_options` VALUES ('allow_close_questions','1'),('allow_multi_answers','1'),('allow_no_category',''),('allow_no_sub_category',''),('allow_self_answer','1'),('avatar_q_list_size','0'),('avatar_q_page_a_size','40'),('avatar_q_page_q_size','50'),('avatar_users_size','30'),('block_bad_words',''),('block_ips_write',''),('cache_acount','2'),('cache_ccount','0'),('cache_qcount','2'),('cache_tagcount','0'),('cache_unaqcount','0'),('cache_unselqcount','1'),('cache_unupaqcount','1'),('cache_userpointscount','4'),('captcha_module','reCAPTCHA'),('captcha_on_anon_post','1'),('captcha_on_feedback','1'),('captcha_on_unconfirmed','0'),('columns_users','2'),('comment_on_as','1'),('comment_on_qs','0'),('confirm_user_emails','1'),('custom_answer',''),('custom_ask',''),('custom_comment',''),('custom_footer',''),('custom_header',''),('custom_home_content',''),('custom_home_heading',''),('custom_in_head',''),('custom_sidepanel',''),('db_version','47'),('do_ask_check_qs','0'),('do_close_on_select','0'),('do_complete_tags','1'),('do_count_q_views','1'),('do_example_tags','1'),('editor_for_as','Markdown Editor'),('editor_for_cs',''),('editor_for_qs','Markdown Editor'),('email_privacy','Privacy: Your email address will not be shared or sold to third parties.'),('event_logger_to_database',''),('event_logger_to_files',''),('extra_field_active','0'),('extra_field_display','0'),('extra_field_label',''),('extra_field_prompt',''),('feedback_email','devs@codelearn.org'),('feedback_enabled','1'),('feed_for_hot',''),('feed_for_qa','1'),('feed_for_questions','1'),('feed_for_unanswered','1'),('feed_full_text','1'),('feed_number_items','50'),('feed_per_category','1'),('flagging_hide_after','5'),('flagging_of_posts','1'),('follow_on_as','1'),('from_email','pocha@codelearn.org'),('home_description',''),('hot_weight_answers','100'),('hot_weight_a_age','100'),('hot_weight_q_age','100'),('hot_weight_views','100'),('hot_weight_votes','100'),('links_in_new_window',''),('logo_height',''),('logo_show',''),('logo_url',''),('logo_width',''),('markdown_editor_css',''),('markdown_highlightjs',''),('match_ask_check_qs','3'),('max_len_q_title','120'),('max_num_q_tags','5'),('max_rate_ip_as','50'),('max_rate_ip_cs','40'),('max_rate_ip_qs','20'),('max_rate_ip_votes','600'),('max_rate_user_as','25'),('max_rate_user_cs','20'),('max_rate_user_qs','10'),('max_rate_user_votes','300'),('max_store_user_updates','50'),('min_len_a_content','12'),('min_len_c_content','12'),('min_len_q_content','0'),('min_len_q_title','12'),('min_num_q_tags','0'),('moderate_anon_post',''),('moderate_by_points',''),('moderate_unconfirmed',''),('mouseover_content_on',''),('nav_activity','0'),('nav_ask','1'),('nav_categories','1'),('nav_home',''),('nav_hot','0'),('nav_qa_is_home','0'),('nav_questions','1'),('nav_tags','1'),('nav_unanswered','0'),('nav_users','1'),('neat_urls','1'),('notify_admin_q_post','1'),('notify_users_default','1'),('pages_prev_next','3'),('page_size_activity','20'),('page_size_ask_check_qs','5'),('page_size_ask_tags','5'),('page_size_home','20'),('page_size_hot_qs','20'),('page_size_qs','20'),('page_size_q_as','10'),('page_size_search','10'),('page_size_una_qs','20'),('page_size_users','20'),('page_size_user_posts','20'),('permit_anon_view_ips','70'),('permit_close_q','70'),('permit_delete_hidden','40'),('permit_edit_a','100'),('permit_edit_q','70'),('permit_flag','110'),('permit_hide_show','70'),('permit_moderate','100'),('permit_post_a','150'),('permit_post_c','150'),('permit_post_q','150'),('permit_retag_cat','70'),('permit_select_a','100'),('permit_view_q_page','150'),('permit_vote_a','120'),('permit_vote_down','120'),('permit_vote_q','120'),('points_a_selected','30'),('points_a_voted_max_gain','20'),('points_a_voted_max_loss','5'),('points_base','100'),('points_multiple','10'),('points_per_a_voted',''),('points_per_a_voted_down','2'),('points_per_a_voted_up','2'),('points_per_q_voted',''),('points_per_q_voted_down','1'),('points_per_q_voted_up','1'),('points_post_a','4'),('points_post_q','2'),('points_q_voted_max_gain','10'),('points_q_voted_max_loss','3'),('points_select_a','3'),('points_to_titles',''),('points_vote_down_a','1'),('points_vote_down_q','1'),('points_vote_on_a',''),('points_vote_on_q',''),('points_vote_up_a','1'),('points_vote_up_q','1'),('q_urls_remove_accents',''),('q_urls_title_length','50'),('recaptcha_public_key',''),('search_module',''),('show_a_c_links','1'),('show_a_form_immediate','if_no_as'),('show_custom_answer','0'),('show_custom_ask','0'),('show_custom_comment','0'),('show_custom_footer',''),('show_custom_header',''),('show_custom_home',''),('show_custom_in_head',''),('show_custom_sidebar','1'),('show_custom_sidepanel',''),('show_c_reply_buttons','1'),('show_fewer_cs_count','5'),('show_fewer_cs_from','10'),('show_full_date_days','7'),('show_home_description',''),('show_notice_visitor',''),('show_selected_first','1'),('show_url_links','1'),('show_user_points','1'),('show_user_titles','1'),('show_view_counts',''),('show_when_created','1'),('site_language',''),('site_maintenance','0'),('site_theme','Snow'),('site_theme_mobile','Snow'),('site_title','Codelearn Forum ( beta )'),('site_url','http://www.codelearn.org/qa/'),('smtp_active','1'),('smtp_address','email-smtp.us-east-1.amazonaws.com'),('smtp_authenticate','1'),('smtp_password','ApNdhFQHEbzZvfC4unmW6ceIWP2rz9OLMG4VWaWzqkhe'),('smtp_port','587'),('smtp_secure','tls'),('smtp_username','AKIAJZHIRPXOWZQFLOGQ'),('sort_answers_by','created'),('tags_or_categories','c'),('tag_separator_comma',''),('votes_separated',''),('voting_on_as','1'),('voting_on_qs','1'),('voting_on_q_page_only',''),('wysiwyg_editor_upload_images','');
/*!40000 ALTER TABLE `qa_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_pages`
--

DROP TABLE IF EXISTS `qa_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_pages` (
  `pageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL,
  `nav` char(1) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `flags` tinyint(3) unsigned NOT NULL,
  `permit` tinyint(3) unsigned DEFAULT NULL,
  `tags` varchar(200) NOT NULL,
  `heading` varchar(800) DEFAULT NULL,
  `content` mediumtext,
  PRIMARY KEY (`pageid`),
  UNIQUE KEY `tags` (`tags`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_pages`
--

LOCK TABLES `qa_pages` WRITE;
/*!40000 ALTER TABLE `qa_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_postmetas`
--

DROP TABLE IF EXISTS `qa_postmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_postmetas` (
  `postid` int(10) unsigned NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`postid`,`title`),
  CONSTRAINT `qa_postmetas_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_postmetas`
--

LOCK TABLES `qa_postmetas` WRITE;
/*!40000 ALTER TABLE `qa_postmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_postmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posts`
--

DROP TABLE IF EXISTS `qa_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posts` (
  `postid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('Q','A','C','Q_HIDDEN','A_HIDDEN','C_HIDDEN','Q_QUEUED','A_QUEUED','C_QUEUED','NOTE') NOT NULL,
  `parentid` int(10) unsigned DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `catidpath1` int(10) unsigned DEFAULT NULL,
  `catidpath2` int(10) unsigned DEFAULT NULL,
  `catidpath3` int(10) unsigned DEFAULT NULL,
  `acount` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amaxvote` smallint(5) unsigned NOT NULL DEFAULT '0',
  `selchildid` int(10) unsigned DEFAULT NULL,
  `closedbyid` int(10) unsigned DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `cookieid` bigint(20) unsigned DEFAULT NULL,
  `createip` int(10) unsigned DEFAULT NULL,
  `lastuserid` int(11) DEFAULT NULL,
  `lastip` int(10) unsigned DEFAULT NULL,
  `upvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `downvotes` smallint(5) unsigned NOT NULL DEFAULT '0',
  `netvotes` smallint(6) NOT NULL DEFAULT '0',
  `lastviewip` int(10) unsigned DEFAULT NULL,
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `hotness` float DEFAULT NULL,
  `flagcount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `format` varchar(20) CHARACTER SET ascii NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `title` varchar(800) DEFAULT NULL,
  `content` varchar(8000) DEFAULT NULL,
  `tags` varchar(800) DEFAULT NULL,
  `notify` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `type` (`type`,`created`),
  KEY `type_2` (`type`,`acount`,`created`),
  KEY `type_4` (`type`,`netvotes`,`created`),
  KEY `type_5` (`type`,`views`,`created`),
  KEY `type_6` (`type`,`hotness`),
  KEY `type_7` (`type`,`amaxvote`,`created`),
  KEY `parentid` (`parentid`,`type`),
  KEY `userid` (`userid`,`type`,`created`),
  KEY `selchildid` (`selchildid`,`type`,`created`),
  KEY `closedbyid` (`closedbyid`),
  KEY `catidpath1` (`catidpath1`,`type`,`created`),
  KEY `catidpath2` (`catidpath2`,`type`,`created`),
  KEY `catidpath3` (`catidpath3`,`type`,`created`),
  KEY `categoryid` (`categoryid`,`type`,`created`),
  KEY `createip` (`createip`,`created`),
  KEY `updated` (`updated`,`type`),
  KEY `flagcount` (`flagcount`,`created`,`type`),
  KEY `catidpath1_2` (`catidpath1`,`updated`,`type`),
  KEY `catidpath2_2` (`catidpath2`,`updated`,`type`),
  KEY `catidpath3_2` (`catidpath3`,`updated`,`type`),
  KEY `categoryid_2` (`categoryid`,`updated`,`type`),
  KEY `lastuserid` (`lastuserid`,`updated`,`type`),
  KEY `lastip` (`lastip`,`updated`,`type`),
  CONSTRAINT `qa_posts_ibfk_2` FOREIGN KEY (`parentid`) REFERENCES `qa_posts` (`postid`),
  CONSTRAINT `qa_posts_ibfk_3` FOREIGN KEY (`categoryid`) REFERENCES `qa_categories` (`categoryid`) ON DELETE SET NULL,
  CONSTRAINT `qa_posts_ibfk_4` FOREIGN KEY (`closedbyid`) REFERENCES `qa_posts` (`postid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posts`
--

LOCK TABLES `qa_posts` WRITE;
/*!40000 ALTER TABLE `qa_posts` DISABLE KEYS */;
INSERT INTO `qa_posts` VALUES (17,'Q_HIDDEN',NULL,19,19,19,NULL,0,0,NULL,NULL,1,NULL,18270747,1,18270747,0,0,0,18270747,1,20694700000,0,'markdown','2013-04-12 14:06:07','2013-04-12 14:07:15','H','testing question posting','sample content','','@'),(18,'Q',NULL,9,7,9,NULL,1,1,19,NULL,3239,NULL,3574718987,1,3680225586,0,0,0,45364265,6,20763900000,0,'markdown','2013-04-15 13:09:24','2013-04-15 13:14:14','E','The code below doesn\'t work - that means I didn\'t get the list of items','    <h1>Shared Todo App</h1>\n    <p>All your todos here</p>\n    <ul>\n      <% @todo_array.each do |t| %>\n        <li> <%= puts t %> </li>    \n      <% end %>  \n    </ul>','','@'),(19,'A',18,9,7,9,NULL,0,0,NULL,NULL,1,NULL,3680225586,1,3680211046,1,0,1,NULL,0,NULL,0,'markdown','2013-04-15 13:17:51','2013-04-15 13:54:49','S',NULL,'  \n     puts t\n\nis used in Ruby to show value of variable t .\n\nIn Rails views \n\n    <%= t %>\n\noutputs the value of variable in the HTML generated.',NULL,'@'),(20,'Q',NULL,12,7,12,NULL,1,0,NULL,NULL,3239,NULL,1336750736,3239,1336750736,0,0,0,3574718987,3,20770500000,0,'markdown','2013-04-15 17:29:19','2013-04-15 17:32:41','E','the code  - Try render :layout => :application, :index in the index action - doesn\'t work.','I got the error below, when I reload the page /todos/index\n\n SyntaxError in TodosController#index\n\n/home/user_3239/shared_todo_app/app/controllers/todos_controller.rb:4: syntax error, unexpected \'\\n\', expecting tASSOC\n\nRails.root: /home/user_3239/shared_todo_app','','@'),(21,'A',20,12,7,12,NULL,0,0,NULL,NULL,1,NULL,3680225586,NULL,NULL,0,0,0,NULL,0,NULL,0,'markdown','2013-04-16 06:32:29',NULL,NULL,NULL,'Guess the syntax is wrong. It should be \n\n      render :index, :layout => :application',NULL,'@'),(22,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,1373,NULL,NULL,NULL,NULL,15,0,15,NULL,0,NULL,0,'markdown','2012-12-05 05:20:42',NULL,NULL,'Console doesn\'t load on Chrome either !!','Console doesn\'t load on Chrome either, I have tried reseting but it\'s of no use !!',NULL,'@'),(23,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,1212,NULL,NULL,NULL,NULL,6,0,6,NULL,0,NULL,0,'markdown','2012-11-11 05:20:42',NULL,NULL,'Solutions with code for tasks','Your tasks & exercise are not providing answers to the code',NULL,'@'),(24,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,1177,NULL,NULL,NULL,NULL,4,0,4,NULL,0,NULL,0,'markdown','2012-12-05 05:20:42',NULL,NULL,'Ctrl-S','In the code editor, Ctrl-S should work to save the file... or some keyboard shortcut. It is just too much work to save the file by clicking on the button.',NULL,'@'),(25,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,2826,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2013-03-09 05:20:42',NULL,NULL,'Moving to the terminal tab should give focus to the terminal','When I move from the files tab to the terminal tab I obviously want to write a command (otherwise why would I want to go to the terminal?). So it\'d be nice if, when I switch to the terminal tab, the terminal itself got the focus directly, instead of my needing to click on it first.',NULL,'@'),(26,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,2616,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2013-02-06 05:20:42',NULL,NULL,'Error in code example in first tutorial.',' There is an extra line in the description of what to uncomment near the middle of the first tutorial.\n\nThe example code reads:\n.\n.\ngroup :assets do\ngem \'sass-rails\', \'~> 3.2.3\'\ngem \'coffee-rails\', \'~> 3.2.1\'\n\n# See https://github.com/sstephenson/execjs#readme for more supported runtimes\n# gem \'therubyracer\', :platforms => :ruby\ngem \'libv8\'\ngem \'execjs\'\n\ngem \'uglifier\', \'>= 1.0.3\'\nend\n.\n.\n\nthe line: gem \'execjs\'\nshould not be present.\n\nIt throws up errors if included when running bundle install.',NULL,'@'),(27,'Q',NULL,10,7,10,NULL,0,0,NULL,NULL,2254,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2013-04-09 05:20:42',NULL,NULL,'Incorrect destroy command','rails destroy Todo doesn\'t work',NULL,'@'),(28,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,2936,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2013-03-01 05:20:42',NULL,NULL,'Showing how to use git along with the modules','I am new to Rails and Web Dev. This site has been amazing at getting me started with Rails. It was frustrating trying to install Rails. It would be nice if someone could add to the tutorial on how to use git along with the modules.',NULL,'@'),(29,'Q',NULL,19,19,19,NULL,0,0,NULL,NULL,1161,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2012-11-04 05:20:42',NULL,NULL,'Feedback of what is completed','I think once the user has completed something meaning phase one or course , there after there should like a summary of what you have completed. I would prefer it under my profile so i can refer back to what i completed. ',NULL,'@'),(30,'Q',NULL,4,1,4,NULL,0,0,NULL,NULL,3190,NULL,NULL,NULL,NULL,1,0,1,2130706433,1,20687100000,0,'markdown','2013-04-11 05:20:42',NULL,NULL,'too strict tests','First, webpages as a convention should all be lower case. You are teaching the user to create a webpage same to the extent of copying (wrongly) the case in the file name HelloWorld.html. I created a page helloworld.html that produced the following result:\n\nyour_site app - HelloWorld.html page - Checking for <title>Hello</title> in the body somewhere\nFailure/Error: visit \'/HelloWorld.html\'\nActionController::RoutingError:\nNo route matches [GET] \'/HelloWorld.html\'',NULL,'@'),(31,'Q',NULL,14,13,14,NULL,0,0,NULL,NULL,1132,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2012-11-05 05:20:42',NULL,NULL,'Example code causing error','The form_tag(...) code causes the following error:\n\nundefined method `stringify_keys`\n\nThe is because a string, rather than a hash is being passed to form_tag. The code should look like the following:\n\n<%= form_tag(\"/todos/add\", :method => \"post\") do %>',NULL,'@'),(32,'Q',NULL,2,1,2,NULL,0,0,NULL,NULL,731,NULL,NULL,NULL,NULL,1,0,1,2130706433,1,16539900000,0,'markdown','2012-08-14 05:20:42',NULL,NULL,'Execjs runtime unavailable','\nHey, I saw this was an issue for some other people as well (apparently because of dots in email addresses) but my \"rails new rails_app1\" would not run the bundle install (I did that myself) and then when I attempted to run \"rails server\" it won\'t run and I get this error:\n\n/usr/local/rvm/gems/ruby-1.9.3-p194/gems/execjs-1.4.0/lib/execjs/runtimes.rb:51:in `autodetect\': Could not find a JavaScript\nruntime. See https://github.com/sstephenson/execjs for a list of available runtimes. (ExecJS::RuntimeUnavailable)\n\nI saw that you marked it as fixed but I\'m still experiencing the issue :/',NULL,'@'),(33,'Q',NULL,10,7,10,NULL,0,0,NULL,NULL,2120,NULL,NULL,NULL,NULL,1,0,1,NULL,0,NULL,0,'markdown','2013-01-24 05:20:42',NULL,NULL,'Making sure Todo.create works - is not required','line that is supposed to be added was already there',NULL,'@'),(34,'Q',NULL,10,7,10,NULL,0,0,NULL,NULL,2120,NULL,NULL,NULL,NULL,1,0,1,2130706433,1,20237800000,0,'markdown','2013-03-16 05:20:42',NULL,NULL,'database migration doesn\'t work?','when I do \'rails generate model Todo todo_item:string\' I get\n\nuser_2826@codelearn:~$ rails generate model Todo todo_item:string\nUsage:\nrails new APP_PATH [options]\n\nOptions:\n-r, [--ruby=PATH] # Path to the Ruby binary of your choice\n# Default: /usr/local/rvm/rubies/ruby-1.9.3-p194/bin/ruby\n-b, [--builder=BUILDER] # Path to a application builder (can be a filesystem path or\nURL)\n-m, [--template=TEMPLATE] # Path to an application template (can be a filesystem path o\nr URL)\n[--skip-gemfile] # Don\'t create a Gemfile\n[--skip-bundle] # Don\'t run bundle install\n-G, [--skip-git] # Skip Git ignores and keeps\n-O, [--skip-active-record] # Skip Active Record files\n-S, [--skip-sprockets] # Skip Sprockets files\n-d, [--database=DATABASE] # Preconfigure for selected database (options: mysql/oracle/p\nostgresql/sqlite3/frontbase/ibm_db/sqlserver/jdbcmysql/jdbcsqlite3/jdbcpostgresql/jdbc)\n# Default: sqlite3\n-j, [--javascript=JAVASCRIPT] # Preconfigure for selected JavaScript library\n# Default: jquery\n-J, [--skip-javascript] # Skip JavaScript files\n[--dev] # Setup the application with Gemfile pointing to your Rails c\nheckout\n[--edge] # Setup the application with Gemfile pointing to Rails reposi\ntory\n-T, [--skip-test-unit] # Skip Test::Unit files\n[--old-style-hash] # Force using old style hash (:foo => \'bar\') on Ruby >= 1.9 ',NULL,'@');
/*!40000 ALTER TABLE `qa_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_posttags`
--

DROP TABLE IF EXISTS `qa_posttags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_posttags` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  `postcreated` datetime NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`,`postcreated`),
  CONSTRAINT `qa_posttags_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_posttags_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_posttags`
--

LOCK TABLES `qa_posttags` WRITE;
/*!40000 ALTER TABLE `qa_posttags` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_posttags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_sharedevents`
--

DROP TABLE IF EXISTS `qa_sharedevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_sharedevents` (
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `entitytype` (`entitytype`,`entityid`,`updated`),
  KEY `questionid` (`questionid`,`entitytype`,`entityid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_sharedevents`
--

LOCK TABLES `qa_sharedevents` WRITE;
/*!40000 ALTER TABLE `qa_sharedevents` DISABLE KEYS */;
INSERT INTO `qa_sharedevents` VALUES ('Q',1,1,1,NULL,2,'2013-04-08 23:34:03'),('C',1,1,1,NULL,2,'2013-04-08 23:34:03'),('C',2,1,1,NULL,2,'2013-04-08 23:34:03'),('Q',2,2,2,NULL,2,'2013-04-09 10:09:50'),('C',7,2,2,NULL,2,'2013-04-09 10:09:50'),('C',8,2,2,NULL,2,'2013-04-09 10:09:50'),('Q',3,3,3,NULL,2,'2013-04-09 12:25:28'),('C',1,3,3,NULL,2,'2013-04-09 12:25:28'),('C',3,3,3,NULL,2,'2013-04-09 12:25:28'),('Q',4,4,4,NULL,2,'2013-04-09 12:47:51'),('C',7,4,4,NULL,2,'2013-04-09 12:47:51'),('C',8,4,4,NULL,2,'2013-04-09 12:47:51'),('Q',5,5,5,NULL,2,'2013-04-09 13:05:59'),('C',1,5,5,NULL,2,'2013-04-09 13:05:59'),('C',4,5,5,NULL,2,'2013-04-09 13:05:59'),('Q',6,6,6,NULL,2,'2013-04-09 13:21:00'),('C',1,6,6,NULL,2,'2013-04-09 13:21:00'),('C',2,6,6,NULL,2,'2013-04-09 13:21:00'),('Q',7,7,7,NULL,2,'2013-04-09 13:36:26'),('C',13,7,7,NULL,2,'2013-04-09 13:36:26'),('C',14,7,7,NULL,2,'2013-04-09 13:36:26'),('Q',7,7,8,NULL,2,'2013-04-09 13:38:26'),('Q',7,7,9,NULL,2,'2013-04-09 13:39:50'),('Q',7,7,10,NULL,2,'2013-04-09 13:41:12'),('Q',11,11,11,NULL,2,'2013-04-09 13:41:26'),('C',13,11,11,NULL,2,'2013-04-09 13:41:26'),('C',14,11,11,NULL,2,'2013-04-09 13:41:26'),('Q',13,13,13,NULL,2,'2013-04-09 13:42:44'),('C',13,13,13,NULL,2,'2013-04-09 13:42:44'),('C',14,13,13,NULL,2,'2013-04-09 13:42:44'),('Q',14,14,14,NULL,2,'2013-04-09 13:44:37'),('C',13,14,14,NULL,2,'2013-04-09 13:44:37'),('C',14,14,14,NULL,2,'2013-04-09 13:44:37'),('Q',15,15,15,NULL,2,'2013-04-09 13:48:55'),('C',13,15,15,NULL,2,'2013-04-09 13:48:55'),('C',14,15,15,NULL,2,'2013-04-09 13:48:55'),('Q',16,16,16,NULL,2,'2013-04-09 13:56:22'),('C',1,16,16,NULL,2,'2013-04-09 13:56:22'),('C',4,16,16,NULL,2,'2013-04-09 13:56:22'),('Q',17,17,17,NULL,1,'2013-04-12 14:06:08'),('C',19,17,17,NULL,1,'2013-04-12 14:06:08'),('Q',18,18,18,NULL,3239,'2013-04-15 13:09:25'),('C',7,18,18,NULL,3239,'2013-04-15 13:09:25'),('C',9,18,18,NULL,3239,'2013-04-15 13:09:25'),('Q',18,18,18,'E',1,'2013-04-15 13:14:14'),('Q',18,18,19,NULL,1,'2013-04-15 13:17:51'),('Q',18,18,19,'S',1,'2013-04-15 13:54:49'),('Q',20,20,20,NULL,3239,'2013-04-15 17:29:20'),('C',7,20,20,NULL,3239,'2013-04-15 17:29:20'),('C',12,20,20,NULL,3239,'2013-04-15 17:29:20'),('Q',20,20,20,'E',3239,'2013-04-15 17:32:41'),('Q',20,20,21,NULL,1,'2013-04-16 06:32:30');
/*!40000 ALTER TABLE `qa_sharedevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagmetas`
--

DROP TABLE IF EXISTS `qa_tagmetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagmetas` (
  `tag` varchar(80) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`tag`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagmetas`
--

LOCK TABLES `qa_tagmetas` WRITE;
/*!40000 ALTER TABLE `qa_tagmetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagmetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_tagwords`
--

DROP TABLE IF EXISTS `qa_tagwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_tagwords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_tagwords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_tagwords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_tagwords`
--

LOCK TABLES `qa_tagwords` WRITE;
/*!40000 ALTER TABLE `qa_tagwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_tagwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_titlewords`
--

DROP TABLE IF EXISTS `qa_titlewords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_titlewords` (
  `postid` int(10) unsigned NOT NULL,
  `wordid` int(10) unsigned NOT NULL,
  KEY `postid` (`postid`),
  KEY `wordid` (`wordid`),
  CONSTRAINT `qa_titlewords_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE,
  CONSTRAINT `qa_titlewords_ibfk_2` FOREIGN KEY (`wordid`) REFERENCES `qa_words` (`wordid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_titlewords`
--

LOCK TABLES `qa_titlewords` WRITE;
/*!40000 ALTER TABLE `qa_titlewords` DISABLE KEYS */;
INSERT INTO `qa_titlewords` VALUES (18,66),(18,15),(18,67),(18,68),(18,69),(18,70),(18,71),(18,72),(18,73),(18,74),(18,75),(18,76),(18,77),(20,66),(20,15),(20,97),(20,98),(20,99),(20,100),(20,101),(20,87),(20,102),(20,68),(20,69);
/*!40000 ALTER TABLE `qa_titlewords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userevents`
--

DROP TABLE IF EXISTS `qa_userevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userevents` (
  `userid` int(11) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `questionid` int(10) unsigned NOT NULL,
  `lastpostid` int(10) unsigned NOT NULL,
  `updatetype` char(1) CHARACTER SET ascii DEFAULT NULL,
  `lastuserid` int(11) DEFAULT NULL,
  `updated` datetime NOT NULL,
  KEY `userid` (`userid`,`updated`),
  KEY `questionid` (`questionid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userevents`
--

LOCK TABLES `qa_userevents` WRITE;
/*!40000 ALTER TABLE `qa_userevents` DISABLE KEYS */;
INSERT INTO `qa_userevents` VALUES (3239,'-',0,18,18,'E',1,'2013-04-15 13:14:14'),(3239,'-',0,18,19,NULL,1,'2013-04-15 13:17:51'),(3239,'-',0,20,21,NULL,1,'2013-04-16 06:32:30');
/*!40000 ALTER TABLE `qa_userevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userfavorites`
--

DROP TABLE IF EXISTS `qa_userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userfavorites` (
  `userid` int(11) NOT NULL,
  `entitytype` char(1) CHARACTER SET ascii NOT NULL,
  `entityid` int(10) unsigned NOT NULL,
  `nouserevents` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`userid`,`entitytype`,`entityid`),
  KEY `userid` (`userid`,`nouserevents`),
  KEY `entitytype` (`entitytype`,`entityid`,`nouserevents`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userfavorites`
--

LOCK TABLES `qa_userfavorites` WRITE;
/*!40000 ALTER TABLE `qa_userfavorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_userfavorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userlimits`
--

DROP TABLE IF EXISTS `qa_userlimits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userlimits` (
  `userid` int(11) NOT NULL,
  `action` char(1) CHARACTER SET ascii NOT NULL,
  `period` int(10) unsigned NOT NULL,
  `count` smallint(5) unsigned NOT NULL,
  UNIQUE KEY `userid` (`userid`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userlimits`
--

LOCK TABLES `qa_userlimits` WRITE;
/*!40000 ALTER TABLE `qa_userlimits` DISABLE KEYS */;
INSERT INTO `qa_userlimits` VALUES (1,'A',379470,1),(1,'Q',379382,1),(2,'A',379304,3),(2,'Q',379304,7),(3239,'Q',379457,1),(3240,'V',379471,2);
/*!40000 ALTER TABLE `qa_userlimits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usermetas`
--

DROP TABLE IF EXISTS `qa_usermetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usermetas` (
  `userid` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `content` varchar(8000) NOT NULL,
  PRIMARY KEY (`userid`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usermetas`
--

LOCK TABLES `qa_usermetas` WRITE;
/*!40000 ALTER TABLE `qa_usermetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usermetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_usernotices`
--

DROP TABLE IF EXISTS `qa_usernotices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_usernotices` (
  `noticeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `content` varchar(8000) NOT NULL,
  `format` varchar(20) CHARACTER SET ascii NOT NULL,
  `tags` varchar(200) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`noticeid`),
  KEY `userid` (`userid`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_usernotices`
--

LOCK TABLES `qa_usernotices` WRITE;
/*!40000 ALTER TABLE `qa_usernotices` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_usernotices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_userpoints`
--

DROP TABLE IF EXISTS `qa_userpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_userpoints` (
  `userid` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `qposts` mediumint(9) NOT NULL DEFAULT '0',
  `aposts` mediumint(9) NOT NULL DEFAULT '0',
  `cposts` mediumint(9) NOT NULL DEFAULT '0',
  `aselects` mediumint(9) NOT NULL DEFAULT '0',
  `aselecteds` mediumint(9) NOT NULL DEFAULT '0',
  `qupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qdownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `aupvotes` mediumint(9) NOT NULL DEFAULT '0',
  `adownvotes` mediumint(9) NOT NULL DEFAULT '0',
  `qvoteds` int(11) NOT NULL DEFAULT '0',
  `avoteds` int(11) NOT NULL DEFAULT '0',
  `upvoteds` int(11) NOT NULL DEFAULT '0',
  `downvoteds` int(11) NOT NULL DEFAULT '0',
  `bonus` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`),
  KEY `points` (`points`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_userpoints`
--

LOCK TABLES `qa_userpoints` WRITE;
/*!40000 ALTER TABLE `qa_userpoints` DISABLE KEYS */;
INSERT INTO `qa_userpoints` VALUES (1,500,0,2,0,0,1,0,0,0,0,0,2,1,0,0),(2,480,13,3,0,0,0,0,0,0,0,0,0,0,0,0),(3239,170,2,0,0,1,0,0,0,0,0,0,0,0,0,0),(3240,110,0,0,0,0,0,0,0,1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `qa_userpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_uservotes`
--

DROP TABLE IF EXISTS `qa_uservotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_uservotes` (
  `postid` int(10) unsigned NOT NULL,
  `userid` int(11) NOT NULL,
  `vote` tinyint(4) NOT NULL,
  `flag` tinyint(4) NOT NULL,
  UNIQUE KEY `userid` (`userid`,`postid`),
  KEY `postid` (`postid`),
  CONSTRAINT `qa_uservotes_ibfk_1` FOREIGN KEY (`postid`) REFERENCES `qa_posts` (`postid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_uservotes`
--

LOCK TABLES `qa_uservotes` WRITE;
/*!40000 ALTER TABLE `qa_uservotes` DISABLE KEYS */;
INSERT INTO `qa_uservotes` VALUES (19,3240,1,0);
/*!40000 ALTER TABLE `qa_uservotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_widgets`
--

DROP TABLE IF EXISTS `qa_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_widgets` (
  `widgetid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `place` char(2) CHARACTER SET ascii NOT NULL,
  `position` smallint(5) unsigned NOT NULL,
  `tags` varchar(800) CHARACTER SET ascii NOT NULL,
  `title` varchar(80) NOT NULL,
  PRIMARY KEY (`widgetid`),
  UNIQUE KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_widgets`
--

LOCK TABLES `qa_widgets` WRITE;
/*!40000 ALTER TABLE `qa_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_words`
--

DROP TABLE IF EXISTS `qa_words`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qa_words` (
  `wordid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `word` varchar(80) NOT NULL,
  `titlecount` int(10) unsigned NOT NULL DEFAULT '0',
  `contentcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagwordcount` int(10) unsigned NOT NULL DEFAULT '0',
  `tagcount` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`wordid`),
  KEY `word` (`word`),
  KEY `tagcount` (`tagcount`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_words`
--

LOCK TABLES `qa_words` WRITE;
/*!40000 ALTER TABLE `qa_words` DISABLE KEYS */;
INSERT INTO `qa_words` VALUES (1,'this',3,6,0,0),(2,'is',1,2,0,0),(3,'sample',2,0,0,0),(4,'question',0,3,0,0),(5,'content',0,0,0,0),(6,'title',1,0,0,0),(7,'given',1,0,0,0),(8,'one',4,0,0,0),(9,'more',3,0,0,0),(10,'my',0,1,0,0),(11,'name',0,1,0,0),(12,'ashish',0,1,0,0),(13,'sharma',0,1,0,0),(14,'enter',0,1,0,0),(15,'code',2,1,0,0),(16,'ye',0,1,0,0),(17,'comes',1,1,0,0),(18,'as',0,1,0,0),(19,'nice',0,1,0,0),(20,'m1',1,0,0,0),(21,'l2',1,0,0,0),(22,'empty',0,1,0,0),(23,'def',0,1,0,0),(24,'pocha',0,1,0,0),(25,'var',0,1,0,0),(26,'a',1,1,0,0),(27,'2',0,1,0,0),(28,'1',0,1,0,0),(29,'hola',0,1,0,0),(30,'questions',1,0,0,0),(31,'should',1,1,0,0),(32,'send',1,2,0,0),(33,'email',3,3,0,0),(34,'to',1,1,0,0),(35,'devs@codelearn',0,1,0,0),(36,'org',0,1,0,0),(37,'testing',0,0,0,0),(38,'hope',1,0,0,0),(39,'goes',2,0,0,0),(40,'now',1,0,0,0),(41,'go',0,1,0,0),(42,'another',2,1,0,0),(43,'test',1,1,0,0),(44,'q',0,1,0,0),(45,'answer',0,2,0,0),(46,'ok',1,1,0,0),(47,'shuld',0,1,0,0),(48,'not',0,1,0,0),(49,'be',0,1,0,0),(50,'duplicate',0,1,0,0),(51,'askign',1,0,0,0),(52,'new',2,0,0,0),(53,'time',3,0,0,0),(54,'trying',2,0,0,0),(55,'here',1,1,0,0),(56,'it',2,1,0,0),(57,'taking',1,0,0,0),(58,'lets',1,0,0,0),(59,'see',1,0,0,0),(60,'if',1,0,0,0),(61,'amazon',1,0,0,0),(62,'emails',1,0,0,0),(63,'working',1,0,0,0),(64,'last',1,0,0,0),(65,'posting',0,0,0,0),(66,'the',2,3,0,0),(67,'below',1,1,0,0),(68,'doesnt',2,0,0,0),(69,'work',2,0,0,0),(70,'that',1,0,0,0),(71,'means',1,0,0,0),(72,'i',1,1,0,0),(73,'didnt',1,0,0,0),(74,'get',1,0,0,0),(75,'list',1,0,0,0),(76,'of',1,1,0,0),(77,'items',1,0,0,0),(78,'shared',0,1,0,0),(79,'todo',0,1,0,0),(80,'app',0,2,0,0),(81,'all',0,1,0,0),(82,'your',0,1,0,0),(83,'todos',0,2,0,0),(84,'puts',0,1,0,0),(85,'t',0,1,0,0),(86,'used',0,1,0,0),(87,'in',1,2,0,0),(88,'ruby',0,1,0,0),(89,'show',0,1,0,0),(90,'value',0,1,0,0),(91,'variable',0,1,0,0),(92,'rails',0,2,0,0),(93,'views',0,1,0,0),(94,'outputs',0,1,0,0),(95,'html',0,1,0,0),(96,'generated',0,1,0,0),(97,'try',1,0,0,0),(98,'render',1,1,0,0),(99,'layout',1,1,0,0),(100,'application',1,1,0,0),(101,'index',1,2,0,0),(102,'action',1,0,0,0),(103,'got',0,1,0,0),(104,'error',0,1,0,0),(105,'when',0,1,0,0),(106,'reload',0,1,0,0),(107,'page',0,1,0,0),(108,'syntaxerror',0,1,0,0),(109,'todoscontroller#index',0,1,0,0),(110,'home',0,1,0,0),(111,'user_3239',0,1,0,0),(112,'shared_todo_app',0,1,0,0),(113,'controllers',0,1,0,0),(114,'todos_controller',0,1,0,0),(115,'rb',0,1,0,0),(116,'4',0,1,0,0),(117,'syntax',0,2,0,0),(118,'unexpected',0,1,0,0),(119,'n',0,1,0,0),(120,'expecting',0,1,0,0),(121,'tassoc',0,1,0,0),(122,'root',0,1,0,0),(123,'guess',0,1,0,0),(124,'wrong',0,1,0,0);
/*!40000 ALTER TABLE `qa_words` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-16 15:20:13
