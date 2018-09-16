CREATE TABLE `administrators` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(128) NOT NULL,
  `login_name` varchar(128) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_uniq` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `public_fg` tinyint(1) NOT NULL,
  `closed_fg` tinyint(1) NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `reservations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned NOT NULL,
  `sheet_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `reserved_at` datetime(6) NOT NULL,
  `canceled_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_id_and_sheet_id_idx` (`event_id`,`sheet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=191847 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `sheets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(128) NOT NULL,
  `num` int(10) unsigned NOT NULL,
  `price` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank_num_uniq` (`rank`,`num`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(128) NOT NULL,
  `login_name` varchar(128) NOT NULL,
  `pass_hash` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name_uniq` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5017 DEFAULT CHARSET=utf8mb4;
