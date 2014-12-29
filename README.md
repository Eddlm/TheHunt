TheHunt
=======

This gamemode is about a hunt, in which you are the prey.

On each map, multiple NPCs will come in squads and will try to find the players. If one player is found, more combine will go to that place, while the ones who spotted the player will try to kill him.

The overall idea is to kill all the Combine without being seen by them.

Workshop version: http://steamcommunity.com/sharedfiles/filedetails/?id=292275126

HOW TO INSTALL
==============
Click https://github.com/Eddlm/TheHunt to get the latest version. You can go https://github.com/Eddlm/TheHunt/archive/master.zip for a direct download.

Open that zip and you will see two folders, "gamemodes" and "maps". Copy them on \Where You Have Steam Installed\Steam\SteamApps\common\GarrysMod\garrysmod. If Windows asks you about overwrigint, you're doing it right. Click yes.

You've installed the gamemode. Start Garry's Mod and change the Gamemode to The Hunt. The background should change.

Select a map. If you select multiple players, some options will appear below. Configure them and load the map.

Done.

HOW TO INSTALL CUSTOM WEAPONS/ITEMS
==============
First, make sure your server/game has the weapons installed and you can use them.
Then, go to this file https://github.com/Eddlm/TheHunt/blob/master/gamemodes/thehunt/gamemode/config.lua
and fill the tables with the new weapons/items.


Main features:
--------------

###The Enemy:###
_Supported:_
Currently Manhacks, Rollermines, Metropolices, Ceiling Cameras/Turrets, Floor Turrets, Soldiers, Snipers, Elite Soldiers, Shotgunners, Combine Helicopters and Combine Gunships are implemented and working, but more NPCs will be added in the future.

__*Note:*__
Each map features multiple enemy squads that will spread on the map and patrol almost every corner, including aerial enemis if the map allows it. Each map features at least five squads, every one of them with a special setup. Also, lots of items and static NPCs are present, and always spawn on randomized places.


__HUD:__
  + Players have a special indicator on their huds that helps them know if they are spotted by someone or not.
  + A special function takes care of giving a realistic chase system: You need to be out of their sight at least ten seconds before they give up. This is configurable.

###Play the way you want:###
  + The gamemode is intended to be played with stealth, but you can perfectly play it like a normal shooter.
  + __Alert system:__ There's multiple ways to alert the Combine. They will be alerted if they hear shots, explosions, if one of them spots a player, if one of them dies, etc. Depending of the situation, only a few will come, or a bunch of them.
  + Singleplayer and Multiplayer modes are both supported, which means you aren't dependant of other people when you want to play it. The gamemode will work well with one or a bunch of people, but beware, it isn't developed with lot's of players in mind. Try to keep the treshold at 5 players, not much more, or the game would start being too easy.
  + Optional challenges, like special rooms full of weapons and other items, but guarded by ceiling turret/cameras, which you will need to disable finding their Control Panels. You can try to access the room gun-in-hand, too (see: grenades).

More features I don't remember now.
