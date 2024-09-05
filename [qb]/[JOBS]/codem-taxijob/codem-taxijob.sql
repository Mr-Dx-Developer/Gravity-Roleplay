

CREATE TABLE IF NOT EXISTS `codem_taxijob` (
  `identifier` longtext DEFAULT NULL,
  `avatar` longtext DEFAULT NULL,
  `name` longtext DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `dailymissions` longtext DEFAULT NULL,
  `totalEarnings` int(11) DEFAULT NULL,
  `completedJobs` int(11) DEFAULT NULL,
  `history` longtext DEFAULT NULL,
  `vipCooldown` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

