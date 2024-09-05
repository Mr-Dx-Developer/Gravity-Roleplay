
CREATE TABLE IF NOT EXISTS `gang_respect` (
  `gang_id` varchar(50) NOT NULL,
  `respect` int(11) NOT NULL DEFAULT 0,
  `tiendas` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`gang_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT IGNORE INTO `gang_respect` (`gang_id`, `respect`, `tiendas`) VALUES
	('ballas', 84, 3),
	('families', 21, 1),
	('NOASIGNED', 0, 0);
