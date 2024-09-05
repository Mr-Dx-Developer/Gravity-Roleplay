
--██╗░░░░░██████╗░░██████╗  ░██████╗░█████╗░██████╗░██╗██████╗░████████╗
--██║░░░░░╚════██╗██╔════╝  ██╔════╝██╔══██╗██╔══██╗██║██╔══██╗╚══██╔══╝
--██║░░░░░░░███╔═╝╚█████╗░  ╚█████╗░██║░░╚═╝██████╔╝██║██████╔╝░░░██║░░░
--██║░░░░░██╔══╝░░░╚═══██╗  ░╚═══██╗██║░░██╗██╔══██╗██║██╔═══╝░░░░██║░░░
--███████╗███████╗██████╔╝  ██████╔╝╚█████╔╝██║░░██║██║██║░░░░░░░░██║░░░
--╚══════╝╚══════╝╚═════╝░  ╚═════╝░░╚════╝░╚═╝░░╚═╝╚═╝╚═╝░░░░░░░░╚═╝░░░
------------------------------------------------------------------------
--Thank you Thank you for purchasing this script
-- If you encounter any problems or would like to contact us
-- Our Discord : https://discord.gg/l2s
-- © LTWOS Store || [Dev Team]
-- Dev By : iFaisal#2552 - Mazen#7777 | L2S TEAM DEV

-<1> Put l2s-hotel inside resource 

-<2> Start the script

-<3> download l2s-password script :  
https://www.mediafire.com/file_premium/8e4n285poeiwhek/l2s-password.zip/file

-<4> Put l2s-password script inside resource and start it

-<5> Change Events and exports from shared/sh_config.lua


-<6> Add this item on qb-core/shared/items.lua
	["hotel_card"] = {["name"] = "hotel_card",["label"] = "Room Access",["weight"] = 5000,["type"] = "item",["image"] = "hotel_card.png",["unique"] = true,["useable"] = true,["shouldClose"] = true,["combinable"] = nil,["description"] = "Hotel Room Access"},

-<7> Go To qb-inventory/html/images and add item image to file (take the image from this script imgs file) 

-<8> Go To qb-inventory/html/js/app.js and item info in FormatItemInfo function explan : https://prnt.sc/GWsOODmoZ6UI
   } else if (itemData.name == "hotel_card") {
        $(".item-info-title").html('<p>Room Access</p>')
        $(".item-info-description").html('<p><strong>Room Number: </strong><span>' + itemData.info.roomnumber + '</span></p><strong>Expires: </strong><span>' + itemData.info.date + '</span></p>');


-<9> download the map from anywhare or pay it map name : Von Crastenburg Hotel + Lobby



- <important> Hello, if the stash  and the outfits do not work with you, all you have to do is make sure that the script is installed correctly first, and secondly, use the script elevator by eye [target inside elevator buttons ( qb-target or your in config)], and do not use the elevator in the map shown in the picture 

https://media.discordapp.net/attachments/1028319943713890385/1126753393445179522/image.png?width=666&height=598