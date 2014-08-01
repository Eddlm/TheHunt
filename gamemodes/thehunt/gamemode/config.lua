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
AUTOREPEAT = 0 -- Does the game start again automatically when you survive the five waves? 1=yes, 0=no.
RPGMAX = 1 -- How many RPGs should spawn on helicopter-boss maps?
MAXGUNSHOTINVESTIGATE = 4 -- Maximun number of combine who will come to investigate a gunshot. Default: 4
KILL_UNUSED_WEAPONS = 0 -- If 1, it will remove any weapon left alone more than one minute, so it can respawn on a new place. Useful if you can't find weapons easily.  1=yes, 0=no.

-- NOT editable in real time: These variables can only be changed via this config file.
AUTOSTART = 1 -- does the game start automatically when you load the map? if not, you'll need to run firstwave on the console to start the combine raid.  1=yes, 0=no.

HALOS = 1 -- Should outlines be drawn around important entities? If 1, players will see Players outlined in green, enemies outlined in red, and dangerous items outlined in yellow.  1=yes, 0=no.
HEALTHELP = 40 -- While a player's health is below this, nearby Healthchargers will be outlined in blue. Requires the HALOS setting set to 1.
LIGHT_BASED_STEALTH_SYSTEM = 1 -- If enabled, you can hide in the shadows from enemies.

MEDIUMWEAPONS = {
"weapon_shotgun", "weapon_pistol", "weapon_frag", "weapon_slam", "weapon_crossbow", "weapon_physcannon", "weapon_smg1"
}
-- ^ Change this list to any weapons of your choice and the game will spawn them on the maps.

/*

CreateConVar("PLAYERSCALEDAMAGE", "3", {FCVAR_NOTIFY}, "Multiplier to the damage dealt to the player. Default: 3")

if GetConVar("AUTOSTART") then AUTOSTART = GetConVarNumber("AUTOSTART")
else
AUTOSTART = 1
CreateConVar( "AUTOSTART", ""..AUTOSTART.."", { FCVAR_REPLICATED, FCVAR_ARCHIVE, FCVAR_NOTIFY } )
end
*/
