/*
*/
use tel;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `namepy` varchar(10) NOT NULL,
  `depid` int(10) NOT NULL,
  `job` varchar(30) NOT NULL,
  `hometel` varchar(30) DEFAULT '',
  `officetel` varchar(30) DEFAULT '',
  `celtel` varchar(30) DEFAULT '',
  `memo` tinytext,
  PRIMARY KEY (`id`),
  KEY `depid` (`depid`) USING BTREE,
  KEY `hometel` (`hometel`) USING BTREE,
  KEY `officetel` (`officetel`) USING BTREE,
  KEY `celtel` (`celtel`) USING BTREE,
  KEY `namepy` (`namepy`) USING BTREE,
  FULLTEXT KEY `name` (`name`),
  FULLTEXT KEY `job` (`job`)
) ENGINE=MyISAM AUTO_INCREMENT=630 DEFAULT CHARSET=utf8;
