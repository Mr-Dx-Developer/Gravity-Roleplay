
CREATE TABLE IF NOT EXISTS `codem_newbank` (
  `identifier` char(50) DEFAULT NULL,
  `profiledata` longtext DEFAULT NULL,
  `spenddata` longtext DEFAULT NULL,
  `cryptodata` longtext DEFAULT NULL,
  `loandata` longtext DEFAULT NULL,
  `savingdata` longtext DEFAULT NULL,
  `notificationdata` longtext DEFAULT NULL,
  `mostsenddata` longtext DEFAULT NULL,
  `spendigsdata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

CREATE TABLE IF NOT EXISTS `codem_newbank_society` (
  `jobname` char(50) DEFAULT NULL,
  `playersdata` longtext DEFAULT NULL,
  `spenddata` longtext DEFAULT NULL,
  `notificationdata` longtext DEFAULT NULL,
  `contributiondata` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- alter table players add iban colomn
-- QBCORE 
ALTER TABLE `players` ADD `iban` char(50) DEFAULT NULL;

-- ESX
ALTER TABLE `users` ADD `iban` char(50) DEFAULT NULL;



