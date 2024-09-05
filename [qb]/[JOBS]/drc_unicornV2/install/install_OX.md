OX INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory
	Vanilla MLO

2. Add Images to your inventory
	ox_inventory > web > build > images
	Paste images from folder images to ox_inventory > web > build > img

3. Add Items to your inventory
	ox_inventory > data> items.lua

	['pina_colada'] = {
		label = 'Pina colada',
		weight = 175,
		stack = true,
		close = true,
	},
	['blue_lagoon'] = {
		label = 'Blue Lagoon',
		weight = 175,
		stack = true,
		close = true,
	},
	['caipirinha'] = {
		label = 'Caipirinha',
		weight = 175,
		stack = true,
		close = true,
	},
	['mint'] = {
		label = 'Mint',
		weight = 10,
		stack = true,
		close = true
	},
	['mai_tai'] = {
		label = 'Mai Tai',
		weight = 175,
		stack = true,
		close = true,
	},
	['san_francisco'] = {
		label = 'San Francisco',
		weight = 175,
		stack = true,
		close = true,
	},
	['mojito'] = {
		label = 'Mojito',
		weight = 175,
		stack = true,
		close = true
	},
	['bar_beans'] = {
		label = 'Beans in bowl',
		weight = 175,
		stack = true,
		close = true,
	},

	['bar_nuts'] = {
		label = 'Nuts in bowl',
		weight = 175,
		stack = true,
		close = true,
	},
	['bar_bowl'] = {
		label = 'Bowl',
		weight = 10,
		stack = true,
		close = true,
	},
	['bar_bowl_dirty'] = {
		label = 'Dirty bowl',
		weight = 10,
		stack = true,
		close = true,
	},
	['beans'] = {
		label = 'Beans',
		weight = 10,
		stack = true,
		close = true,
	},
	['nuts'] = {
		label = 'Nuts',
		weight = 10,
		stack = true,
		close = true,
	},

	['ice'] = {
		label = 'Ice',
		weight = 10,
		stack = true,
		close = true,
	},
	['coco_milk'] = {
		label = 'Coco Milk',
		weight = 100,
		stack = true,
		close = true,
	},
	['lemon'] = {
		label = 'Lemon',
		weight = 10,
		stack = true,
		close = true,
	},
	['lime'] = {
		label = 'Lime',
		weight = 10,
		stack = true,
		close = true,
	},
	['glass_tall'] = {
		label = 'Glass Tall',
		weight = 50,
		stack = true,
		close = false,
		consume = 0
	},
	['glass_tall_dirty'] = {
		label = 'Dirty Tall Glass',
		weight = 50,
		stack = true,
		close = false,
		consume = 0
	},
	['rhum'] = {
		label = 'Rhum',
		description = 'Bagga rum - Original Dark',
		weight = 500,
		stack = true,
		close = true,
	},
	['vodka'] = {
		label = 'Vodka',
		description = 'Nogo vodka - 100%',
		weight = 500,
		stack = true,
		close = true
	},
	['sugar'] = {
		label = 'Sugar',
		weight = 5,
		stack = true,
		close = false
	},
	['juice'] = {
		label = 'Juice',
		weight = 50,
		stack = true,
		close = false
	},


4. add ensure drc_unicorn into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new unicorn script from DRC SCRIPTS!

-- ESX JOB

1. insert into database

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
	('unicorn',0,'recruit','Recruit',120,'{}','{}'),
	('unicorn',1,'novice','Novice',240,'{}','{}'),
	('unicorn',2,'experienced','Experienced',360,'{}','{}'),
	('unicorn',3,'advanced',"Advanced",480,'{}','{}'),
	('unicorn',4,'manager',"Manager",480,'{}','{}'),
	('unicorn',5,'boss','Boss',500,'{}','{}')
;