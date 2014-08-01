/*-----------------------The Hunt Configuration File--------------------------
Edit these values to customize the gameplay experience.
Note that the default configuration it's intended for a well balanced gameplay.

Remember that certain settings (like the AUTOSTART feature) only allow two values, 1 for enabled, 0 for disabled.
----------------------------------------------------------------------------*/

-- Editable in real time: you can change the variable values running lua_run VARIABLE = VALUE on the Console (for example, lua_run MAXHELP = 2). The change will be only applied to the current map. If you wish to change the variable for the next maps, change it on this config file.

TIME_BETWEEN_WAVES = 5 -- When a wave is defeated, the game will wait this time before it starts spawning more combine. Default: 5
MINENEMIES = 4 -- If the combine number is below this, the wave is defeated. Default: 4
MAXHELP = 4 -- How many combine are able to help the one who spotted you? Default: 4
PLAYERSCALEDAMAGE = 3 -- Anytime a player takes damage, it will be multiplied by this value. You can use decimal values, like 0.2. Default: 3
NPCSCALEDAMAGE = 3 -- Anytime a NPC takes damage, it will be multiplied by this value.  You can use decimal values, like 0.2. Default: 3
FRIENDLYFIRE = 0 -- If 0, players can't damage other players. And combine can't damage other combine! If 1, players and combine will take damage from their friends. Default: 0
LostPlayerTimeout = 10 -- How many seconds have to pass before a combine gives up on chasing you? Default: 10
WEAPONOFFSET = 0 -- Number of Players + this value = number of weapons that will ve available at any time on the map. Default: 0 (one weapon per player)
AUTOREPEAT = 1 -- Does the game start again automatically when you survive the five waves? 1=yes, 0=no.
RPGMAX = 1 -- How many RPGs should spawn on helicopter-boss maps?
MAXGUNSHOTINVESTIGATE = 4 -- Maximun number of combine who will come to investigate a gunshot. Default: 4
KILL_UNUSED_WEAPONS = 0 -- If 1, it will remove any weapon left alone more than one minute, so it can respawn on a new place. Useful if you can't find weapons easily.  1=yes, 0=no.

-- NOT editable in real time: These variables can only be changed via this config file.
AUTOSTART = 1 -- does the game start automatically when you load the map? if not, you'll need to run firstwave on the console to start the combine raid.  1=yes, 0=no.

HALOS = 1 -- Should outlines be drawn around important entities? If 1, players will see Players outlined in green, enemies outlined in red, and dangerous items outlined in yellow.  1=yes, 0=no.
HEALTHELP = 40 -- While a player's health is below this, nearby Healthchargers will be outlined in blue. Requires the HALOS setting set to 1.
LIGHT_BASED_STEALTH_SYSTEM = 1 -- If enabled, you can hide in the shadows from enemies.





/*--------------------WEAPON SETUP---------------------
Here you must configure your custom weapons so the game reacts apropiately.
-------------------------------------------------------*/

CRATEITEMS = { "weapon_shotgun", "weapon_357", "weapon_frag", "weapon_slam", "item_healthkit", "item_ammo_smg1_grenade", "item_healthvial","npc_headcrab_black","npc_rollermine","item_dynamic_resupply" }
--Normal crates can spawn these items.

GOODCRATEITEMS = { "item_dynamic_resupply","weapon_frag", "weapon_slam","item_healthkit", "item_ammo_smg1_grenade","item_box_buckshot","item_ammo_smg1_large","item_ammo_crossbow","item_ammo_ar2_large","item_ammo_ar2_altfire"}
--Ammo crates can spawn these items.


MEDIUMWEAPONS = { "weapon_shotgun", "weapon_pistol", "weapon_frag", "weapon_slam", "weapon_crossbow", "weapon_physcannon", "weapon_smg1" }
-- Weapons the gamemode will spawn around. 

/*--------------Stealth----------------------------
This section covers the stealth value of the weapons. If a weapon has bright parts (The crossbow, for example), add it to TOO_BRIGHT_WEAPONS. If a weapon lacks any bright item (Crowbar,Grenade), add it to DARK_WEAPONS.

If a weapon is not dark nor too bright (has some lights but not too many lights), do not add it to any table.
Too bright weapons add +1 luminosity.
Dark weapons do not add luminosity.
Not dark weapons add +1 luminosity.
--------------------------------------------------*/
TOO_BRIGHT_WEAPONS = { "weapon_crossbow", "weapon_physcannon", "weapon_rpg", "weapon_medkit" }
-- Weapons that make you more visible. It's harder to hide while carrying this weapon.

DARK_WEAPONS = { "weapon_frag", "weapon_crowbar" }
-- Weapons that don't have any bright items on them. It's easier to hide while carrying this weapon.


SILENT_WEAPONS = { "weapon_frag", "weapon_crossbow", "weapon_crowbar", "suppressed_pistol", "suppressed_smg1" }
-- Any weapon that's not included on this table will be considered a loud weapon and it's gunshots will attrack combine.

SECONDARY_FIRE_WEAPONS = { "weapon_ar2", }
-- Weapons that have a loud secondary fire.
