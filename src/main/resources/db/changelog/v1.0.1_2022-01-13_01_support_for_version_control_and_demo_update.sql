--liquibase formatted sql

--changeset jinghua.zhan:15
--labels: add table
--tag: 1.0.1

DROP TABLE IF EXISTS `cell_commit`;
CREATE TABLE `cell_commit` (
  `id` int(11) unsigned NOT NULL,
  `notebook_id` int(11) NOT NULL,
  `content` text,
  `commit_id` varchar(64) NOT NULL,
  `last_job_id` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_commit` (`notebook_id`,`commit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `demo_info`;
CREATE TABLE `demo_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(15) DEFAULT NULL,
  `commit_id` varchar(40) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_entity` (`entity_id`,`entity_type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `node_commit`;
CREATE TABLE `node_commit` (
  `id` int(11) unsigned NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `content` text,
  `commit_id` varchar(64) NOT NULL,
  `user` varchar(255) NOT NULL,
  `position` varchar(255) DEFAULT NULL,
  `input` text,
  `output` text,
  `type` varchar(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_commit` (`workflow_id`,`commit_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `notebook_commit`;
CREATE TABLE `notebook_commit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `notebook_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `commit_id` varchar(64) NOT NULL,
  `cell_list` longtext,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_commit` (`notebook_id`,`commit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `workflow_commit`;
CREATE TABLE `workflow_commit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `commit_id` varchar(64) NOT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_commit` (`workflow_id`,`commit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--comment: add support for version control and demo update
