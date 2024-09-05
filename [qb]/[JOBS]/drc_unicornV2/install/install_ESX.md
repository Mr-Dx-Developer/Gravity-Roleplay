ESX INSTALL QUIDE

If u use ox_inventory please open install_OX.md and close this file!
1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory
    Vanilla MLO

ITEMS 

2. Add Item to your server
    Use this insert in your database or use esx_items.sql!

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


3. Add Images to your inventory
    if your are using esx_inventory then 
    esx_inventoryhud > html > images
    Paste images from folder images to esx_inventoryhud > html > images

4. add ensure drc_unicorn into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new unicorn script from DRC SCRIPTS!
