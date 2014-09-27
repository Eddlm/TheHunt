/*-----------------------The Hunt Configuration File--------------------------
This configuration file allows to add custom weapons to the game.
Be sure to configure all the fields or the gamemode won't work properly.

List of HL2 entities: https://developer.valvesoftware.com/wiki/List_of_HL2_entities
To know the classname of an item/weapon: http://i.imgur.com/OkNNLe3.jpg an paste it here.
You can spawn NPCs, Entities or Weapons. DO NOT USE "PROP_PHYSICS" OR ANYTHING SIMILAR OR IT WILL EXPLODE.
----------------------------------------------------------------------------*/

/*--------------------WEAPON SETUP---------------------
Here you must configure your custom weapons so the game reacts apropiately.
-------------------------------------------------------*/

RebelsGiveAmmo = { "Pistol", "SMG1", "SMG1_Grenade", "AR2", "Buckshot", "Grenade", "XBowBolt"}
-- Don't add anything to this. Is what kind of ammo the NPC rebels will give you. You can prevent them for giving X type of ammo if you delete it from this table, but you can't add new values here. It will explode.

STARTING_LOADOUT ={"weapon_slam","weapon_crossbow","weapon_frag","weapon_physcannon","weapon_shotgun"}
-- If the custom loadout is enabled, you will spawn with this weapons.

MEDIUMWEAPONS = { "weapon_crossbow","weapon_frag","weapon_pistol","weapon_physcannon","weapon_smg1","weapon_slam","item_healthvial","weapon_shotgun"}
-- Weapons the gamemode will spawn around. 

SILENTKILLREWARD = { "item_healthvial","weapon_slam"}
--Items that a combine could spawn if silent-killed. Its useful to put addon weapons there, as it's the only way to refill them with ammo at this time.

/*--------------Stealth (lighting)----------------------------
This section covers the light-based stealth value of the weapons.
It will be harder to hide in the shadows while holding bright weapons.

If a weapon has bright parts (The crossbow, for example), add it to TOO_BRIGHT_WEAPONS.
If a weapon lacks any bright item (the crowbar or grenade, for example), add it to DARK_WEAPONS.
If a weapon is not dark nor too bright (shotgun or the AR2 for example), don't add it to any table.

Too bright weapons add +1 luminosity and +1 for not being dark.
Not dark weapons add +1 luminosity.
Dark weapons don't add luminosity.
--------------------------------------------------*/

TOO_BRIGHT_WEAPONS = { "weapon_crossbow", "weapon_physcannon", "weapon_rpg", "weapon_medkit"}
-- Weapons that make you more visible. It's harder to hide while carrying this weapon.

DARK_WEAPONS = { "weapon_frag", "weapon_crowbar","weapon_357","weapon_slam" }
-- Weapons that don't have any bright items on them. It's easier to hide while carrying this weapon.

/*--------------Stealth (sounds)----------------------------
This section covers the sound-based stealth balue of the weapons. The Combine will come if you use a loud weapon.

If a weapon makes a loud noise when used (Left Click) (gunshots are a good example), do not add it to any table.
If a weapon makes little noise when used (Left Click) (silenced gunshots are a good example), add it to SILENCED_WEAPONS. If the weapon has multiple nodes (loud, silenced) don't add it, it already works.
If a weapon doesn't make noise when used (Left Click), add it to SILENT_WEAPONS.
If a weapon has a loud secondary fire (Right click), add it to the SECONDARY_FIRE_WEAPONS.
The gamemode doesn't check for USE or RELOAD actions for now. These are always silent.
--------------------------------------------------------------*/
SILENCED_WEAPONS = {"weapon_crossbow", "pspak_mp9", "stalker_vintorez", "weapon_nomad","weapon_doom3_plasmagun","m9k_svu"}
-- Using them will attract nearby combine. Don't add multimode weapons there, only the ones who are "silenced" all the time.

SILENT_WEAPONS = { "weapon_frag", "weapon_crowbar","weapon_slam",
-- DOOM SWEPS support
"weapon_doom3_fists","weapon_doom3_fists",
-- M90 Suppport
"m9k_damascus","m9k_fists","m9k_m61_frag","m9k_harpoon","m9k_ied_detonator","m9k_knife","m9k_machete","m9k_nerve_gas","m9k_nitro","m9k_orbital_strike","m9k_proxy_mine","m9k_sticky_grenade","m9k_suicide_bomb",
-- Serious Sam Support
"weapon_ss_knife",
-- FA:S support
"fas2_ifak","fas2_machete","kf_knife_fas","fas2_dv2",
-- Mad Cow's Weapons Support
"weapon_mad_tmp","weapon_mad_c4","weapon_mad_charge","weapon_mad_flash","weapon_mad_grenade","weapon_mad_crossbow","weapon_mad_incendiary","weapon_mad_knife","weapon_mad_smoke","weapon_mad_magnade"} 
-- Using them wont atract anyone.

SECONDARY_FIRE_WEAPONS = { "weapon_ar2", "weapon_shotgun"}
-- Weapons that have a loud secondary fire.


ONLY_PICKUP_ONCE = { "weapon_physcannon" }
-- The game will prevent people from picking up this weapons if they already have them. Useful for weapons with infinite uses, preventing the player from picking up a weapon he doesn't need to, leaving the weapon for others.
