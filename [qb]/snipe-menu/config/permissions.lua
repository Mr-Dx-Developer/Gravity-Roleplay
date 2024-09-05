
--[[
    All the roles here can access the admin menu
    Only the GOD can set the panels for the other roles
    There are 3 options
    1. God -> can access all the commands
    
    IMPORTANT: DO NOT REMOVE GOD ROLE, IF YOU DO SO, YOU WILL NOT BE ABLE TO ACCESS THE ADMIN MENU AT ALL

    If you have a new role, you can add it here and select to give either God, Admin or Moderator or any of the custom perms you want

    eg. ["new_role"] = "God",
    eg. ["dev"] = "Admin",
]]--
Config.GodRoles = {
    ["god"] = "God", -- This is the biggest role (DO NOT REMOVE THIS ROLE)
    ["admin"] = "Admin", -- This is just a custom role
    ["mod"] = "Moderator", -- This is just a custom role
    -- ["new_role1"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role2"] = "Test", -- if you want to add more roles just add them here
    -- ["new_role3"] = "Test",
    -- if you want to add more roles just add them here
    -- ["NEW_ROLE_HERE"] = "God",
    -- ["NEW_ROLE_HERE"] = "Admin",
    -- ["NEW_ROLE_HERE"] = "Moderator",
}

-- Original Permissions table for information on all possible available options
Config.Permissions = {
    ["discord:811436286006657025"] = "god", -- dx
    ["discord:770558357014183976"] = "god",   -- Muradhasan
    ["discord:777552373560115211"] = "god",   -- habib
  --  ["discord:1268965871775383702"] = "god",   -- SyroX
    ["discord:914556948442128504"] = "god",   -- : bishalroy#0
    ["discord:849340844178669628"] = "god",   --  lord8byte#0

    ["discord:839029240028201020"] = "god",   --  Bug x

     ["discord:731739994091159572"] = "god",   --  Bug x
  
  
  --  ["YJR13040"] = "admin",   --- tutulahmed  --- discord:721696179754238004
  --  ["MUP67229"] = "admin",   --- sketch_01   --- discord:1012310576975843380
  --  ["DJH35594"] = "admin",   --- ayan_ahmed_naim   --- discord:1064398406061150329 
  --  ["SBB68358"] = "admin",   --- anirban   --- discord:727766435203514470 


    
 --   ["steam:1234"] = "god",
 --   ["124584938326312"] = "god", -- discord roles (copy the role id and paste it here) (If you want to use the discord roles, you need to add the bot token and server id in sv_perms.lua at the top)
 --   ["XY123456"] = "god", -- citizenid for qbcore
 --   ["char1:12334"] = "god", -- charid for ESX

    -- ["license:6d3b6254a50416697dcaa91878e2eb03d9112302"] = {"mod", "admin"}, -- the role god, admin or mod should be the key from Config.GodRoles which means the values that are added in square brackets.
    -- ["license:1234"] = "admin",
    -- ["license:1234"] = "mod",
    -- ["license:1234"] = "new_role1",
    -- ["license:1234"] = "new_role2",
    -- ["license:1234"] = "new_role3",
}

