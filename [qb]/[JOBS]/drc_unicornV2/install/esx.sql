INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('pina_colada', 'Pina colada', 1, 0, 1),
('blue_lagoon', 'Blue Lagoon', 1, 0, 1),
('caipirinha', 'Caipirinha', 1, 0, 1),
('mint', 'Mint', 1, 0, 1),
('mai_tai', 'Mai Tai', 1, 0, 1),
('san_francisco', 'San Francisco', 1, 0, 1),
('bar_beans', 'Beans in bowl', 1, 0, 1),
('bar_nuts', 'Nuts in bowl', 1, 0, 1),
('bar_bowl', 'Bowl', 1, 0, 1),
('bar_bowl_dirty', 'Dirty bowl', 1, 0, 1),
('beans', 'Beans', 1, 0, 1),
('nuts', 'Nuts', 1, 0, 1),
('ice', 'Ice', 1, 0, 1),
('coco_milk', 'Coco Milk', 1, 0, 1),
('lemon', 'Lemon', 1, 0, 1),
('lime', 'Lime', 1, 0, 1),
('glass_tall', 'Glass Tall', 1, 0, 1),
('glass_tall_dirty', 'Dirty Tall Glass', 1, 0, 1),
('rhum', 'Rhum', 1, 0, 1),
('vodka', 'Vodka', 1, 0, 1),
('sugar', 'Sugar', 1, 0, 1),
('juice', 'Juice', 1, 0, 1),
('mojito', 'Mojito', 1, 0, 1);

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_unicorn', 'unicorn', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_unicorn', 'unicorn', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_unicorn', 'unicorn', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('unicorn', 'unicorn')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('unicorn',0,'recrue','Recrue',12,'{}','{}'),
	('unicorn',1,'novice','Novice',24,'{}','{}'),
	('unicorn',2,'experimente','Experimente',36,'{}','{}'),
	('unicorn',3,'chief',"Chef d\'équipe",48,'{}','{}'),
	('unicorn',4,'boss','Patron',0,'{}','{}')
;