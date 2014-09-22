AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "config.lua" )
include( "shared.lua" )
include( "config.lua" )
util.AddNetworkString( "Spotted" )
util.AddNetworkString( "Hidden" )
util.AddNetworkString( "light_below_limit" )
util.AddNetworkString( "light_above_limit" )
util.AddNetworkString( "Visible" )
util.AddNetworkString( "NotVisible" )
util.AddNetworkString( "PlayerKillNotice" )
util.AddNetworkString( "Scoreboard" )

util.PrecacheModel("models/Combine_Soldier.mdl")
util.PrecacheModel("models/Combine_Super_Soldier.mdl")
util.PrecacheModel("models/Police.mdl")


/*             notes


NPC:SetKeyValue( "model", "models/elite_synth/elite_synth.mdl" )
NPC:SetSkin(1)

Get info from an entity typing this on the console while facing at it
lua_run print("Entity: ") print(player.GetByID(1):GetEyeTrace().Entity) print("Position: ") print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print("Angles: ") print(player.GetByID(1):GetEyeTrace().Entity:GetAngles())

lua_run print("Model: ") print(player.GetByID(1):GetEyeTrace().Entity:GetModel())
*/


net.Receive( "light_above_limit", function( length, client )
net.Start( "Visible" )
net.Send(client)
client:SetNoTarget(false)
end )

net.Receive( "light_below_limit", function( length, client )
local hidden=1

for k, v in pairs(ents.FindInSphere(client:GetPos(),256)) do
if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_helicopter" then
if v:Health() > 0 then
if v:GetEnemy(client) then
hidden=0
client:PrintMessage(HUD_PRINTTALK, ""..v:GetName().." saw you hide.")
end
end
end
end
if hidden==1 then client:SetNoTarget(true)
client.spotted =  0
net.Start( "Hidden" )
net.Send(client)
net.Start( "NotVisible" )
net.Send(client)
end
end)

  
function util.QuickTrace( origin, dir, filter )

	local trace = {}
 
	trace.start = origin
	trace.endpos = origin + dir
	trace.filter = filter

	return util.TraceLine( trace )
end



function GM:Initialize()
RunConsoleCommand( "g_ragdoll_maxcount", "6")
RunConsoleCommand( "r_shadowdist", "200") 
RunConsoleCommand( "r_shadowcolor", ('20 20 20')) 
RunConsoleCommand( "sk_helicopter_health", "1500") 
RunConsoleCommand( "g_helicopter_chargetime", "2") 
RunConsoleCommand( "sk_helicopter_burstcount", "12") 
RunConsoleCommand( "sk_helicopter_firingcone", "20") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
RunConsoleCommand( "air_density", "0")
RunConsoleCommand( "ai_norebuildgraph", "1")   

EnemiesRemainining = 0
combinen = 0
CombineAssisting = 0
ManuallySpawnedEntity = 0
HeliAangered = 0
CAN_HEAR_BREAK = 1
team_silent_kills=0
team_deaths =0
team_kills =0
COMBINE_KILLED = 0
CAN_HEAR_BREAK = 1

end

-- WHAT-MAP-ARE-THEY-PLAYING CHECK v
if file.Exists( "gamemodes/thehunt/gamemode/maps/"..game.GetMap()..".lua", "GAME" ) then
include("/maps/"..game.GetMap()..".lua")
win = 1
print("[The Hunt]: map configuration file found ("..game.GetMap()..")")
else
print("[The Hunt]: map not found")
win = 0
include("/maps/nomap.lua")

end
-- WHAT-MAP-ARE-THEY-PLAYING CHECK ^

-- VARIABLES USED BY THE GAME v
-- Don't touch them. They are edited in-game.
VariedPos = Vector(math.random(-100,100),math.random(-100,100),0)

-- VARIABLES USED BY THE GAME ^

-- UTILITY COMMANDS v
concommand.Add( "h_addonweapons", function(player, command, arguments )
print("[The Hunt]: Your game has all these weapons installed")
for k,v in pairs( weapons.GetList() ) do 
print( v.ClassName )
end 
print("")
end)

concommand.Add( "h_dropweapon", function(ply, command, arguments )
ManualWeaponDrop(ply)
end )



concommand.Add( "h_revealcombinespawnpoints", function(player, command, arguments )
table.foreach(combinespawnzones, function(key,value)
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(value)
sprite:SetColor( Color( 0,255,255 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end)

end )

concommand.Add( "h_revealplayerspawnpoints", function(player, command, arguments )
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(v:GetPos())
sprite:SetColor( Color( 0, 255, 0 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end
end)

end )


concommand.Add( "h_fixtimers", function(ply)

print("[The Hunt]: Rebooting: Item Respawn System")
timer.Create( "Item Respawn System", 10, 1, ItemRespawnSystem )

print("[The Hunt]: Rebooting: CombineIdleSpeech")
timer.Create( "CombineIdleSpeech", math.random(5,15), 0, CombineIdleSpeech ) 

print("[The Hunt]: Rebooting: CicloUnSegundo")
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 

print("[The Hunt]: Rebooting: coverzones")
timer.Create( "coverzones", 10, 1, coverzones )

print("[The Hunt]: Rebooting: wavefinishedchecker")
timer.Create( "wavefinishedchecker", 5, 1, wavefinishedchecker)

table.foreach(player.GetAll(), function(key,value)
value.canspawn = 1

end)

print("")
print("[The Hunt]: Plz report the bug to the Facepunch Thread, the autor itself or the workshop page.")
end)
concommand.Add( "h_restartgame", function(ply)
autofirstwave()
end)
concommand.Add( "Spotted", function(ply)
if ply:IsAdmin() then
net.Start( "Spotted" )
net.Send(player.GetByID(1))
end
end )

concommand.Add( "h_respawnweapons", function(ply)
table.foreach(MEDIUMWEAPONS, function(key,value)

for k,v in pairs(ents.FindByClass(value)) do 
	local canrespawn = 1
		for k, player in pairs(ents.FindInSphere(v:GetPos(),20)) do
			if player:IsPlayer() then
			canrespawn = 0
			print("[The Hunt]: Player has "..v:GetClass()..", wont remove")
			end
		end
	if canrespawn == 1 then
	print("[The Hunt]: player not found near "..v:GetClass()..", will remove")
	v:Remove()
	end
end

end)
end )


concommand.Add( "clnotarget", function(ply)
if ply:IsAdmin() then

ply:SetNoTarget(1)
end
end )

concommand.Add( "cltarget", function(ply)
if ply:IsAdmin() then
ply:SetNoTarget(0)
end
end )

concommand.Add( "h_version", function(ply)
ply:PrintMessage(HUD_PRINTTALK, "The Hunt version: v1.0. Date: 28/08/2014")
ply:PrintMessage(HUD_PRINTTALK, "Last changes: Added various maps. Tweaked various map-things.")
ply:PrintMessage(HUD_PRINTTALK, "Running the GitHub version.")
end )


concommand.Add( "LaunchCanister", function(ply)
if ply:IsAdmin() then
SpawnCanister(ply:GetPos())
end

end)

concommand.Add( "LaunchMortar", function(ply)
if ply:IsAdmin() then
LaunchMortarRound(ply)
end
end)

function LaunchMortarRound(ply)	// Find where the player is aiming.
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

	local targetTrace = util.QuickTrace( ply:GetShootPos(), ply:GetUp(), ply )
	
	// If we hit the sky/walls/ceilings, don't bother.
	if ( targetTrace.HitSky ) then return end
	
	// Trace up to find the sky.
	local skyTrace = util.TraceLine( { start = targetTrace.HitPos, endpos = targetTrace.HitPos + Vector( 0, 0, 16383 ), filter = ply, mask = MASK_NPCWORLDSTATIC } )
	if ( !skyTrace.HitSky ) then return end
	// Prevents rare crash when mortar is below the target.
	if ( skyTrace.HitPos.z <= targetTrace.HitPos.z ) then return end
	
	
	// Create the mortar.
	local mortar = ents.Create( "func_tankmortar" )	
		mortar:SetPos( skyTrace.HitPos )
		mortar:SetAngles( Angle( 90, 0, 0 ) )
		mortar:SetKeyValue( "iMagnitude", 90000) // Damage.
		mortar:SetKeyValue( "firedelay", "1" ) // Time before hitting.
		mortar:SetKeyValue( "warningtime", "1" ) // Time to play incoming sound before hitting.
		mortar:SetKeyValue( "incomingsound", "Weapon_Mortar.Incomming" ) // Incoming sound.
	mortar:Spawn()
	
	// Create the target.
	local target = ents.Create( "info_target" )
		target:SetPos( targetTrace.HitPos )
		target:SetName( tostring( target ) )
	target:Spawn()
	mortar:DeleteOnRemove( target )
	
	// Fire.
	mortar:Fire( "SetTargetEntity", target:GetName(), 0 )
	mortar:Fire( "Activate", "", 0 )
	mortar:Fire( "FireAtWill", "", 0 )
	mortar:Fire( "Deactivate", "", 2 )
	mortar:Fire( "kill", "", 1 )
	
end

concommand.Add( "SpawnAPC", function(ply)
if ply:IsAdmin() then
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")
local RocketLauncher = ents.Create( "monster_apc" )
RocketLauncher:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,40))
RocketLauncher:Spawn()
end
end)

concommand.Add( "SpawnRocketLauncher", function(ply)
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

if ply:IsAdmin() then

local creating = ents.Create( "path_corner" )
creating:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,500))
creating:SetName("ddd")
creating:Spawn()

local RocketLauncher = ents.Create( "npc_launcher" )
RocketLauncher:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,100))
RocketLauncher:SetKeyValue( "spawnflags", "65536" )

RocketLauncher:SetKeyValue( "PathCornerName", "PATHLEL" )
RocketLauncher:SetKeyValue( "MissileModel", "models/Weapons/W_missile.mdl" )
--RocketLauncher:SetKeyValue( "StartOn", 1)
RocketLauncher:SetKeyValue( "LaunchSmoke ", 1 )
RocketLauncher:SetKeyValue( "SmokeTrail", 1 )
--RocketLauncher:SetKeyValue( "LaunchSound", "weapons/rpg/rocket1.wav" )
RocketLauncher:SetKeyValue( "LaunchDelay", 1 )
RocketLauncher:SetKeyValue( "LaunchSpeed ", 100 )
RocketLauncher:SetKeyValue( "PathCornerName", "ddd" )
RocketLauncher:SetKeyValue( "HomingSpeed", 800 )
RocketLauncher:SetKeyValue( "HomingStrength", 100 )
RocketLauncher:SetKeyValue( "HomingDelay", 1)
RocketLauncher:SetKeyValue( "HomingRampUp", 3 )
RocketLauncher:SetKeyValue( "HomingDuration", 5 )
RocketLauncher:SetKeyValue( "Gravity", 1 )
RocketLauncher:SetKeyValue( "MinRange", 1 )
RocketLauncher:SetKeyValue( "MaxRange", 100 )
RocketLauncher:SetKeyValue( "SpinMagnitude", 100 )
RocketLauncher:SetKeyValue( "SpinSpeed", 100 )
RocketLauncher:SetKeyValue( "Damage", 1 )
RocketLauncher:SetKeyValue( "DamageRadius", 100 )
RocketLauncher:Fire("SetEnemyEntity",ply,0)
RocketLauncher:Spawn()
--RocketLauncher:Activate()
print("[The Hunt]: RocketLauncher spawned")


RocketLauncher:Fire("TurnOn","",0)
--timer.Simple( 1, function()
RocketLauncher:Fire("FireOnce","",5)

RocketLauncher:Fire("FireOnce","",1)
print("[The Hunt]: RocketLauncher activated")

 --end )
 end
end )



concommand.Add( "Hidden", function(ply)
if ply:IsAdmin() then

net.Start( "Hidden" )
net.Send(player.GetByID(1))
end
end )

concommand.Add( "NearbyEntities", function(ply)
NearbyEntities()
end )



concommand.Add( "KillCombine", function(ply)
if ply:IsAdmin() then
KillCombine()
print("[The Hunt]: All the combine soldiers killed.")
end
end)


concommand.Add( "h_revealpatrolzones", function(ply)
if ply:IsAdmin() then
table.foreach(zonescovered, function(key,value)
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(value)
sprite:SetColor( Color( 255, 0, 0 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end)
print("[The Hunt]: Combine Covered Zones Hithlighted.")
end
end)


concommand.Add( "h_revealweaponspawns", function(ply)
if ply:IsAdmin() then

table.foreach(ITEMPLACES, function(key,value)
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(value)
sprite:SetColor( Color( 247,255,3 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end)
print("[The Hunt]: Weapon Spawn Zones Hithlighted.")
end
end)


concommand.Add( "h_revealhelipath", function(ply)
if ply:IsAdmin() then

for k, v in pairs(ents.FindByClass("path_track")) do 
sprite = ents.Create( "env_sprite" )
sprite:SetPos(v:GetPos())
sprite:SetColor( Color( 255,0,230 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 2 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
print("[The Hunt]: Heli Path Hithlighted.")
end
end
end)

concommand.Add( "spawncombinetripmine", function(ply)
if ply:IsAdmin() then
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

SpawnItem("combine_tripmine_beam", ply:GetEyeTraceNoCursor().HitPos+Vector(0,0,20), Angle(math.random(-180,180),math.random(-180,180),0))
end
end)



concommand.Add( "revealtargets", function(ply)
if ply:IsAdmin() then
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

for k, v in pairs(ents.FindByClass("info_target")) do 
sprite = ents.Create( "env_sprite" )
sprite:SetPos(v:GetPos())
sprite:SetColor( Color( 0, 255, 255 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 2 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end
end
end)



concommand.Add( "seesettings", function(ply)
print("[The Hunt]: Here you go")

print("[The Hunt]: h_autostart: "..GetConVarNumber("h_autostart").."")
print("[The Hunt]: h_minenemies: "..GetConVarNumber("h_minenemies").."")
print("[The Hunt]: h_maxhelp: "..GetConVarNumber("h_maxhelp").."")
print("[The Hunt]: h_npcscaledamage: "..GetConVarNumber("h_npcscaledamage").."")
print("[The Hunt]: h_playerscaledamage: "..GetConVarNumber("h_playerscaledamage").."")
print("[The Hunt]: h_lostplayertimeout: "..GetConVarNumber("h_lostplayertimeout").."")
print("[The Hunt]: h_weaponoffset: "..GetConVarNumber("h_weaponoffset").."")
print("[The Hunt]: h_rpgmax: "..GetConVarNumber("h_rpgmax").."")
print("[The Hunt]: h_maxgunshotinvestigate: "..GetConVarNumber("h_maxgunshotinvestigate").."")
print("[The Hunt]: h_max_team_deaths: "..GetConVarNumber("h_max_team_deaths").."")
print("[The Hunt]: h_punish_deaths_timer: "..GetConVarNumber("h_punish_deaths_timer").."")
print("[The Hunt]: h_time_between_waves: "..GetConVarNumber("h_time_between_waves").."")
print("[The Hunt]: Weapons that The Hunt spawns: ")
PrintTable(MEDIUMWEAPONS)
end)

concommand.Add( "helpme", function(ply)
print("[The Hunt]: Useful Commands")
print("[The Hunt]: firstwave: starts the firstwave")
print("[The Hunt]: h_fixtimers: use it if any feature stops working")
print("[The Hunt]: infinitewave: starts the infinite wave system")
print("[The Hunt]: h_version: Info about the current The Hunt version.")

print("")
print("[The Hunt]: Facepunch thread: http://facepunch.com/showthread.php?t=1394695")
print("[The Hunt]: GitHub download: https://github.com/Eddlm/TheHunt <- This version is updated regularly and fully customizable.")
print("[The Hunt]: Workshop download: http://steamcommunity.com/sharedfiles/filedetails/?id=292275126")
print("[The Hunt]: Make sure to check these links to read help about how to play this gamemode, and what this gamemode an do.")
print("")

end )
concommand.Add( "hidezones", function(ply)
if ply:IsAdmin() then
hidezones()
print("[The Hunt]: All sprites removed.")
end
end)

concommand.Add( "assplode", function(ply)
if ply:IsAdmin() then
ent = ents.Create( "env_explosion" )
ent:SetPos(ply:GetEyeTraceNoCursor().HitPos)
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "100" )
print("[The Hunt]: assploded")
ent:Fire("Explode",0,0)
end
end )

concommand.Add( "assplodeinv", function(ply)
if ply:IsAdmin() then
ent = ents.Create( "env_physexplosion" )
ent:SetPos(ply:GetEyeTraceNoCursor().HitPos)
ent:SetKeyValue( "spawnflags", 1 )
ent:SetKeyValue("radius", 300)
ent:SetKeyValue( "magnitude", 100 )
ent:Spawn()
print("[The Hunt]: assploded inv")
ent:Fire("Explode",0,0)
end
end )

concommand.Add( "beam", function(ply)
if ply:IsAdmin() then
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

local laser = ents.Create( "env_beam" )
	laser:SetPos( ply:GetEyeTraceNoCursor().HitPos)
	laser:SetKeyValue( "StrikeTime", "0.2" )
	laser:SetKeyValue( "spawnflags", "5" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )
	laser:SetKeyValue( "TextureScroll", "1" )
	laser:SetKeyValue( "Damage", "20" )
	--laser:SetKeyValue( "renderfx", "6" )
	laser:SetKeyValue( "NoiseAmplitude", ""..math.random(5,2) )
	laser:SetKeyValue( "BoltWidth", "1" )
	laser:SetKeyValue( "TouchType", "0" )
--	laser:SetKeyValue( "LightningStart",  )
--	laser:SetKeyValue( "LightningEnd",  )
	laser:SetKeyValue("Radius", "1000")
	laser:SetKeyValue("life", "0.5")
	laser:Spawn()
	laser:Activate()
	end
end )
concommand.Add( "SpawnMetropolice", function(ply)
if ply:IsAdmin() then
SpawnMetropolice( ply:GetEyeTraceNoCursor().HitPos )
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnMetropoliceStunstick", function(ply)
if ply:IsAdmin() then
SpawnMetropoliceStunstick( ply:GetEyeTraceNoCursor().HitPos )
print("[The Hunt]: Spawned.")
end
end )


concommand.Add( "SpawnFastZombie", function(ply)
if ply:IsAdmin() then
SpawnFastZombie( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnRebel", function(ply)
if ply:IsAdmin() then
SpawnRebel( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnRollermine", function(ply)
if ply:IsAdmin() then
SpawnRollermine( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "spawnSNPC", function(ply)
if ply:IsAdmin() then
spawnSNPC( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("[The Hunt]: Spawned. LOL")
end
end )
concommand.Add( "SpawnCombineElite1", function(ply)
if ply:IsAdmin() then
SpawnCombineElite1( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnCombineElite2", function(ply)
if ply:IsAdmin() then
SpawnCombineElite2( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnTurret", function(ply)
if ply:IsAdmin() then
SpawnTurret( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,5), ply:EyeAngles())
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnCombineS1", function(ply)
if ply:IsAdmin() then
SpawnCombineS1( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnCombineS2", function(ply)
if ply:IsAdmin() then
SpawnCombineS2( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )
concommand.Add( "SpawnScanner", function(ply)
if ply:IsAdmin() then
SpawnScanner( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )

concommand.Add( "SpawnCombineSFlashlight", function(ply)
print("[The Hunt]: Experimental shit I didn't implemented yet. If it explodes, is your fault.")

if ply:IsAdmin() then
SpawnCombineSFlashlight( ply:GetEyeTraceNoCursor().HitPos)
print("[The Hunt]: Spawned.")
end
end )



concommand.Add( "firstwave", function(ply)
if ply:IsAdmin() then

Wave = 1
timer.Create( "firstwave", 1, CombineFirstWave, firstwave )
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )	
end
end)

concommand.Add( "secondwave", function(ply)
if ply:IsAdmin() then
Wave = 2
timer.Create( "secondwave", 1, CombineSecondWave, secondwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )	
end
end )
concommand.Add( "thirdwave", function(ply)
if ply:IsAdmin() then

Wave = 3
timer.Create( "thirdwave", 1, CombineThirdWave, thirdwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )	
end
end )
concommand.Add( "fourthwave", function(ply)
if ply:IsAdmin() then

Wave = 4
timer.Create( "fourthwave", 1, CombineFourthWave, fourthwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )	
end
end )
concommand.Add( "fifthwave", function(ply)
if ply:IsAdmin() then

Wave = 5
timer.Create( "fifthwave", 1, CombineFifthWave, fifthwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )	
end
end )

concommand.Add( "infinitewave", function()
Wave = 6
infinitewavehandler()
end )

-- UTILITY COMMANDS ^


-- UTILITY FUNCTIONS v (called by the commands or by game hooks)



function NUMPLAYERS()
PLAYERSINMAP=0
for k, v in pairs(ents.FindByClass("player")) do
PLAYERSINMAP=PLAYERSINMAP+1
end
end



function OverwatchAmbientOne()
		table.Random(player.GetAll()):EmitSound(table.Random(OverwatchAmbientSoundsOne), 100, 100)
end

function GM:PlayerDeathThink(ply)
if PLAYERSINMAP>1 then
if ply:KeyPressed(IN_ATTACK2) then
ply:UnSpectate()
ply:Spectate(4)
ply:SetMoveType(10)
ply:SpectateEntity(table.Random(player.GetAll()))
end
else
if ply:KeyPressed(IN_ATTACK2) then
ply:UnSpectate()
ply:Spectate(6)
ply:SetMoveType(10)
end
end
if ply:KeyPressed(IN_ATTACK) then
if ply.canspawn == 1 then
ply:UnSpectate()
ply:Spawn()
end
end
end

function GM:DoPlayerDeath( ply, attacker, dmginfo )
timer.Simple(1, npcforget)
ply:CreateRagdoll()
ply:AddDeaths(1)
NUMPLAYERS()
ply.canspawn = 0
ply.lifes=ply.lifes-1
ply.deaths=ply.deaths+1
team_deaths=team_deaths+1

if attacker:IsNPC() then
attacker:EmitSound(table.Random(CombineKillSounds), 100, 100)
end

-- One npc_sniper can only kill one player, then, it won't shoot players anymore. So I remove it and respawn another when he kills a player.
if attacker:GetClass() == "npc_sniper" then
local pos = attacker:GetPos()
local ang = attacker:GetAngles()
attacker:Remove()
SpawnItem("npc_sniper", pos, ang)
end


table.foreach( ply:GetWeapons(), function(key,value)
	if key > 1 then
		if value:Clip1() then
			if value:Clip1() == 0 then
				value:Remove()
				else
				ply:DropWeapon(value)
			end
		end
	end
end)



timer.Simple(1, function()
if attacker:IsNPC() then
ply:Spectate(5)
ply:SetMoveType(10)
ply:SpectateEntity(attacker)
end
if PLAYERSINMAP > 1 then
if ply.lifes == 0  then
ply:PrintMessage(HUD_PRINTTALK, "You have no lifes left, so you have to wait until the round ends.")
ply:PrintMessage(HUD_PRINTTALK, "While you wait, think on a better strategy for the next time.")
/*
	timer.Simple(GetConVarNumber("h_punish_deaths_timer"), function()
	ply.canspawn = 1
	ply.lifes = GetConVarNumber("h_player_lifes")
	ply:PrintMessage(HUD_PRINTTALK, "You can spawn now.")
	end)
*/
else
ply:PrintMessage(HUD_PRINTTALK, "You have "..ply.lifes.." lifes left.")
ply.canspawn = 1
end
else
ply.canspawn = 1
end

end)
end

function NearbyEntities()
print("[The Hunt]: Entities found:")
for k, v in pairs(ents.FindInSphere(player.GetByID(1):GetPos(),256)) do
print(""..v:GetClass()..", "..v:GetName().."")
 end
 print("[The Hunt]: End of entities")
end


function KillCombine()
for k, v in pairs(ents.FindByClass("npc_combine_s")) do
v:Remove()
COMBINE_KILLED = COMBINE_KILLED+1

end
 for k, v in pairs(ents.FindByClass("npc_metropolice")) do
v:Remove()
COMBINE_KILLED = COMBINE_KILLED+1

end
end

function autofirstwave()
timer.Create( "firstwave", 1, CombineFirstWave, firstwave )
WAVESPAWN = 1
Wave = 1
combinen = 0
CAN_HEAR_BREAK = 1
team_silent_kills=0
team_deaths =0
team_kills =0
COMBINE_KILLED = 0
cansilentkillreward = 1
timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )		
end
function PlayerDefeat()
PrintMessage(HUD_PRINTTALK, "All players are dead!")
timer.Simple( 20, autofirstwave)
game.CleanUpMap()
timer.Simple( 2, MapSetup)
end
function wavefinishedchecker()
if PLAYERSINMAP > 1 then
	local players_defeated = 1
	table.foreach(player.GetAll(), function(key,value)
	if value:Alive() then players_defeated = 0 end
	end)
	if players_defeated == 1  then 
	PlayerDefeat()
	CanCheck = 0
	end
end
timer.Create( "wavefinishedchecker", 10, 1, wavefinishedchecker)
EnemiesRemainining=0
local BossHeliAlive=0
table.foreach(MainEnemies, function(key,enemy)
for k, npc in pairs(ents.FindByClass(enemy)) do
EnemiesRemainining=EnemiesRemainining+1
end
end)

-- if EnemiesRemainining > = GetConVarNumber("h_minenemies") then CanCheck = 1 end
			for k, v in pairs(ents.FindByClass("npc_helicopter")) do
			if v.boss == 1 and v:Health() > 5 then BossHeliAlive = 1 end
			end
			for k, v in pairs(ents.FindByClass("npc_combinegunship")) do
			if v.boss == 1 and v:Health() > 5 then BossHeliAlive = 1 end
			end
if BossHeliAlive == 0 or BossHeliAlive == nil then
if CanCheck == 1 then 
	if EnemiesRemainining < GetConVarNumber("h_minenemies") then
	if GetConVarNumber("h_hardcore") == 0 then
	table.foreach(player.GetAll(), function(key,value)
	value.canspawn = 1
	value.lifes=GetConVarNumber("h_player_lifes")
	if !value:Alive() then value:PrintMessage(HUD_PRINTTALK, "You can spawn now.") end end)
	end
	if COMBINE_KILLED > GetConVarNumber("h_combine_killed_to_win") then
	
	local yeah = table.Random(player.GetAll())
	if table.Random(player.GetAll()).sex == "male" then table.Random(player.GetAll()):EmitSound(table.Random(malewin), 100, 100) else
	table.Random(player.GetAll()):EmitSound(table.Random(femalewin), 100, 100)
	end
	
	PrintMessage(HUD_PRINTTALK, "[Overwatch]: Attention: Mission failure. More than "..GetConVarNumber("h_combine_killed_to_win").." ground units have been lost.")
	PrintMessage(HUD_PRINTTALK, "[Overwatch]: Remaining units, cease aggression and return.")
	timer.Simple(13, function() PrintMessage(HUD_PRINTTALK, "[Eddlm]: Congratulations, you won! You prevented the combine raid. Here's the statistics:") end)
	timer.Simple(16, function()	TeamStats() end)
--	timer.Simple(20+(PLAYERSINMAP*10), EndgameStatistics)
-- timer.Simple(33+(PLAYERSINMAP*10), function() PrintMessage(HUD_PRINTTALK, "[Eddlm]: Now that you played, you can submit your suggestions to Facepunch, The Hunt Workshop page, or contact myself. I'm always willing to improve this gamemode.") end)
	CanCheck = 0
	else
	waveend()
	CanCheck = 0
	end
	end
end
end
end


function TestStats()
local total_silent_kills = 20
local total_player_killed = 10
local total_combine_killed = 100

local numplayers = 10
local playerfrags = 100
local playersilentfrags = 20
local playerdeaths = 1
local killpercent = ((playerfrags+playersilentfrags)/total_combine_killed)*100
local deathpercent = (playerdeaths/total_player_killed)*100

local teamscore = (total_combine_killed+(total_silent_kills*3))-(total_player_killed*(2*numplayers))
local player_points = ((playerfrags+(playersilentfrags*3)-playerdeaths*2))

PrintMessage(HUD_PRINTTALK, "With "..numplayers.." members, this team killed "..total_combine_killed.." combine and died "..total_player_killed.." times.")
PrintMessage(HUD_PRINTTALK, "Team score: "..teamscore.."")

for k,player in pairs( player.GetAll() ) do
if playerdeaths == 0 then bonus = 50 end

PrintMessage(HUD_PRINTTALK, "Edd stats:")
PrintMessage(HUD_PRINTTALK, "Edd killed "..playerfrags+playersilentfrags.." Combine. ("..killpercent.."% of the team kills).")
if playerdeaths == 0 then
PrintMessage(HUD_PRINTTALK, "Edd survived the entire game!")
else
PrintMessage(HUD_PRINTTALK, "Edd was killed "..playerdeaths.." times ("..deathpercent.."% of the team deaths).")
end
PrintMessage(HUD_PRINTTALK, "Edd score: "..player_points.." points.")
if (playersilentfrags/playerfrags)*100 > 50 then
PrintMessage(HUD_PRINTTALK, "Special mention: Silent kills ("..math.Round(((playersilentfrags/playerfrags)*100)) .."%)")
end
 --PrintMessage(HUD_PRINTTALK, "Eficiency "..(((playerfrags/(total_combine_killed/numplayers)*100) + (100 - (((playerdeaths/total_player_killed) * 100)))) /2).."")
 --(((playerfrags/(total_combine_killed/numplayers)*100) + (100 - (((playerdeaths/total_player_killed) * 100)))) /2)

end

end


function TeamStats()
teamscore = (team_kills+(team_silent_kills*3))-(team_deaths*(2*PLAYERSINMAP))

PrintMessage(HUD_PRINTTALK, "With "..PLAYERSINMAP.." members, this team killed "..team_kills+team_silent_kills.." combine and died "..team_deaths.." times.")
PrintMessage(HUD_PRINTTALK, "Team score: "..teamscore.."")

local MostKills = 0 
local BestPlayer
local MostDeaths = 0
local WorstPlayer
local MostSilentKills = 0
local MostSilentPlayer
for k,v in pairs( player.GetAll() ) do  
	local Frags = v:Frags()       // Getting a player's frags
	if Frags > MostKills then     // If it's higher then the current MostKills then
		MostKills = Frags     // Make it the new MostKills
		BestPlayer = v:Name() // And make the player the new BestPlayer
	end
end
for k,v in pairs( player.GetAll() ) do  
	local Deaths = v.deaths      // Getting a player's frags
	if Deaths > MostDeaths then     // If it's higher then the current MostKills then
		MostDeaths = Deaths     // Make it the new MostKills
		WorstPlayer = v:Name() // And make the player the new BestPlayer
	end
end
for k,v in pairs( player.GetAll() ) do
	local SilentKills = v.SilentKills     // Getting a player's frags
	if SilentKills > MostSilentKills then     // If it's higher then the current MostKills then
		MostSilentKills = SilentKills     // Make it the new MostKills
		MostSilentPlayer = v:Name() // And make the player the new BestPlayer
	end
end


if MostKills != 0 then
	PrintMessage(HUD_PRINTTALK, "" .. BestPlayer .. " has the most kills with " .. tostring(MostKills) .. " combine defeated!") 
else PrintMessage(HUD_PRINTTALK, "Noone killed anything for now.") 
end
if MostSilentKills != 0 then 
	PrintMessage(HUD_PRINTTALK, ""..MostSilentPlayer.." has the most silent kills, "..tostring(MostSilentKills)..".")
else PrintMessage(HUD_PRINTTALK, "Not a single silent kill for now.") 
end

if MostDeaths != 0 then
	PrintMessage(HUD_PRINTTALK, "" .. WorstPlayer .. " has died the most,  " .. tostring(MostDeaths) .. " times.") 
else PrintMessage(HUD_PRINTTALK, "None of the rebels has been killed in this game! Congratulations!") 
end

timer.Simple(6, function() PrintMessage(HUD_PRINTTALK, "You can check the scoreboard by typing !score.") end)
end


function PlayerStats(ply)
for k,ply in pairs( player.GetAll() ) do  

local killpercent = ((ply.Kills+ply.SilentKills)/(team_kills+team_silent_kills))*100
local deathpercent = (ply.deaths/team_deaths)*100
local ply_points = ((ply.Kills+(ply.SilentKills*3)-ply.deaths*2))

ply:PrintMessage(HUD_PRINTTALK, "You killed "..ply.Kills+ply.SilentKills.." Combine. ("..math.Round(killpercent).."% of the team kills).")
if ply.deaths == 0 then
ply:PrintMessage(HUD_PRINTTALK, "You survived the entire game!")
else
ply:PrintMessage(HUD_PRINTTALK, "You were killed "..ply.deaths.." times ("..math.Round(deathpercent).."% of the team deaths).")
end
ply:PrintMessage(HUD_PRINTTALK, "Your score: "..ply_points.." points.")
if (ply.SilentKills/(ply.Kills+ply.SilentKills))*100 > 50 and(ply.SilentKills > 0 and ply.Kills > 0) then
ply:PrintMessage(HUD_PRINTTALK, "Special mention: Silent kills ("..math.Round(((ply.SilentKills/(ply.Kills+ply.SilentKills))*100)) .."%)")
end
end
end

function EndgameStatistics()
local MostKills = 0 
local BestPlayer
local MostDeaths = 0
local WorstPlayer
local MostSilentKills = 0
local MostSilentPlayer
for k,v in pairs( player.GetAll() ) do  
	local Frags = v:Frags()       // Getting a player's frags
	if Frags > MostKills then     // If it's higher then the current MostKills then
		MostKills = Frags     // Make it the new MostKills
		BestPlayer = v:Name() // And make the player the new BestPlayer
	end
end
for k,v in pairs( player.GetAll() ) do  
	local Deaths = v.deaths      // Getting a player's frags
	if Deaths > MostDeaths then     // If it's higher then the current MostKills then
		MostDeaths = Deaths     // Make it the new MostKills
		WorstPlayer = v:Name() // And make the player the new BestPlayer
	end
end
for k,v in pairs( player.GetAll() ) do
	local SilentKills = v.SilentKills     // Getting a player's frags
	if  SilentKills > MostSilentKills then     // If it's higher then the current MostKills then
		MostSilentKills = SilentKills     // Make it the new MostKills
		MostSilentPlayer = v:Name() // And make the player the new BestPlayer
	end
end


if MostKills != 0 then
	PrintMessage(HUD_PRINTTALK, "" .. BestPlayer .. " has the most kills with " .. tostring(MostKills) .. " combine defeated!") 
else PrintMessage(HUD_PRINTTALK, "Noone killed anything for now.") 
end
if MostSilentKills != 0 then 
	PrintMessage(HUD_PRINTTALK, ""..MostSilentPlayer.." has the most silent kills, "..tostring(MostSilentKills)..".")
else PrintMessage(HUD_PRINTTALK, "Not a single silent kill for now.") 
end

if MostDeaths != 0 then
	PrintMessage(HUD_PRINTTALK, "" .. WorstPlayer .. " has died the most,  " .. tostring(MostDeaths) .. " times.") 
else PrintMessage(HUD_PRINTTALK, "None of the rebels has been killed in this game! Congratulations!") 
end

end
 
 /*
  ((((Team kills/Player kills) /Players)*100) + 100 - (((Player deaths/Team deaths) * 100)) /2 = Eficiency%)
 (((((COMBINE_KILLED/player:Frags)/PLAYERSINMAP)*100) + 100 - (((team_deaths/player:Deaths) * 100)) /2 = Eficiency%))
 */
function waveend()
WAVESPAWN = 1

OverwatchAmbientOne()
		if Wave < 5 then
			PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..Wave.." proven unable to contain hostiles.")
		end
		
	timer.Simple(GetConVarNumber("h_time_between_waves"), function()
		timer.Simple( 30, function() CanCheck = 1 print("[The Hunt]: Can check is 1, wave can be defeated now.") end )
		timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )		
		if Wave == 1 then timer.Create( "secondwave", 1, CombineSecondWave, secondwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 2 then timer.Create( "thirdwave", 1, CombineThirdWave, thirdwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 3 then timer.Create( "fourthwave", 1, CombineFourthWave, fourthwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 4 then timer.Create( "fifthwave", 1, CombineFifthWave, fifthwave )  
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
	end)
		if Wave == 5 or Wave == 6 then 
				infinitewavehandler()

		end
		end
		
function infinitewavehandler()

WAVESPAWN = 1
CanCheck = 0
Wave=6
if INFINITE_ACHIEVED == 1 then
PrintMessage(HUD_PRINTTALK, "[Overwatch]: "..table.Random(OVERWATCH_TAUNTS).."")
end

if INFINITE_ACHIEVED == 0 then
INFINITE_ACHIEVED = 1
PrintMessage(HUD_PRINTTALK, "[Overwatch]: Dude you fucked up.")
end


	timer.Create( "launchanisters", 3, 5, function()
	SpawnCanisterWave(table.Random(player.GetAll()):GetPos())
	end	) 
	timer.Simple(20, function()
	timer.Simple( CUSTOMWAVESPAWN, function() WAVESPAWN = 0 print("[The Hunt]: wavespawn is now 0") end )		
	timer.Create( "infinitewave", 2, CombineInfiniteWave, infinitewave )
	timer.Simple(20, function() CanCheck = 1 end)
	end)
	
end


function CreateHeliPath(pos)
creating = ents.Create( "path_track" )
creating:SetPos( pos )
creating:Spawn()
end

function hidezones()
	for k, v in pairs(ents.FindByName("ZoneReveal") ) do
	v:Remove()
	end
end
function SpawnHeliA( pos,type,IsBoss,GunOnAtSpawn )
RunConsoleCommand( "sk_helicopter_health", "1500")
RunConsoleCommand( "g_helicopter_chargetime", "2") 
RunConsoleCommand( "sk_helicopter_burstcount", "12") 
RunConsoleCommand( "sk_helicopter_firingcone", "20") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
timer.Simple( 3, helipath ) 
HeliA = ents.Create( ""..type.."" )
-- HeliA:SetKeyValue( "target", "2" )
HeliA:SetKeyValue( "targetname", "Heli" )
--HeliA:SetKeyValue( "ignoreunseenenemies", 1 )
HeliA:SetKeyValue( "spawnflags", "262144" )
HeliA:SetKeyValue( "patrolspeed", "500" )
HeliA:SetKeyValue("squadname", "heliaforce")
HeliA:SetPos( pos )
HeliA.boss = IsBoss
if type == "npc_combinegunship" then
RunConsoleCommand( "sk_gunship_health_increments", 8) 
HeliA:Fire("SetPenetrationDepth ","24",0)
HeliA:Fire("BlindfireOn","",0)
end
HeliA:SetCustomCollisionCheck(true)
HeliA:Spawn()
HeliA:Activate()
HeliA:Fire("activate","",0)
-- HeliA:Fire("missileon","",0)
if type == "npc_helicopter" then
if GunOnAtSpawn == 1 then
HeliA:Fire("gunon","",1)
else
HeliA:Fire("gunoff","",0)
end
HeliA.spotlight = ents.Create( "point_spotlight" )
HeliA.spotlight:SetPos(HeliA:GetPos()+(HeliA:GetForward()*150+Vector(0,0,-50)))
HeliA.spotlight:SetAngles(HeliA.spotlight:GetAngles()+Angle(30,0,0))
HeliA.spotlight:SetParent(HeliA)
HeliA.spotlight:SetKeyValue( "spawnflags", "1" )
HeliA.spotlight:SetKeyValue( "SpotlightWidth", "50" )
HeliA.spotlight:SetKeyValue( "SpotlightLength", "200" )
HeliA.spotlight:SetKeyValue("rendercolor", "100 200 200")
--NPCSpotlight:SetColor(0,0,0,255)
HeliA.spotlight:Spawn()
HeliA.spotlight:Activate()
local HeliCanSpotlight = 1
local CanSpotlight = 0
for k, v in pairs(ents.FindByClass("npc_helicopter")) do
CanSpotlight = CanSpotlight+1
end

if CanSpotlight > 1 then HeliCanSpotlight = 0 end
if HeliCanSpotlight == 1 && type == "npc_helicopter" then
HeliA.light = ents.Create("env_projectedtexture");
HeliA.light:SetPos(HeliA:GetPos());
HeliA.light:SetAngles(HeliA:GetAngles()+Angle(30,0,0) );
HeliA.light:SetParent(HeliA);
HeliA.light:SetKeyValue("spawnflags", 2);
HeliA.light:SetKeyValue("enableshadows", 1);
HeliA.light:SetKeyValue("farz", 2000);
HeliA.light:SetKeyValue("target", "");
HeliA.light:SetKeyValue("nearz", 400);
HeliA.light:SetKeyValue("lightfov", 20);
HeliA.light:SetKeyValue("lightcolor", "0 255 255")
HeliA.light:SetKeyValue("shadowquality", 1)
HeliA.light:SetKeyValue("lightstrength", 5)
-- helispotlight:SetKeyValue("style", 6);
HeliA.light:Spawn();
HeliA.light:Activate();
end
end
end

function SpawnDynamicResuply( pos )
NPC = ents.Create( "item_dynamic_resupply" )
NPC:SetPos( pos )
NPC:SetKeyValue("DesiredHealth", 0.3)
NPC:SetKeyValue("DesiredArmor", 0.25)
NPC:SetKeyValue("DesiredAmmoPistol", 0)
NPC:SetKeyValue("DesiredAmmoSMG1", 0.1)
NPC:SetKeyValue("DesiredAmmoSMG1_Grenade", 0.1)
NPC:SetKeyValue("DesiredAmmoAR2", 00)
NPC:SetKeyValue("DesiredAmmoBuckshot", 0.1)
NPC:SetKeyValue("DesiredAmmoRPG_Round", 0)
NPC:SetKeyValue("DesiredAmmoGrenade",0.1)
NPC:SetKeyValue("DesiredAmmo357", 0.3)
NPC:SetKeyValue("DesiredAmmoCrossbow", 0.2)
NPC:Spawn()

end

function SpawnScanner ( pos )
NPC = ents.Create( "npc_cscanner" )
NPC:SetPos( pos )
NPC:SetKeyValue("neverinspectplayers", 1)
NPC:SetKeyValue("SetDistanceOverride", 2)
NPC:Spawn()
NPC:SetName("Scanner")
NPC:Fire("SetFollowTarget","Combine",0)
NPC:Fire("EquipMine","",0)
NPC:Fire("DeployMine","",0)
NPC:Activate()
end
function SpawnCombineSFlashlight ( pos )
NPC = ents.Create( "npc_combine_s" )
NPC:SetKeyValue("NumGrenades", ""..math.random(0,3).."") 
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:Spawn()
NPC:Give("ai_weapon_ar2")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
NPC:Fire("StartPatrolling","",0)
NPCSpotlight = ents.Create("env_projectedtexture");
NPCSpotlight:SetPos(NPC:GetShootPos()+(NPC:GetForward()*20)+Vector(0,0,-50))
NPCSpotlight:SetName(""..NPC:GetName().."_flashlight");
NPCSpotlight:SetAngles( Angle(20,0,0) );
NPCSpotlight:SetParent(NPC);
NPCSpotlight:SetKeyValue("spawnflags", 2);
NPCSpotlight:SetKeyValue("enableshadows", 0);
NPCSpotlight:SetKeyValue("farz", 700);
NPCSpotlight:SetKeyValue("target", "");
NPCSpotlight:SetKeyValue("nearz", 15);
NPCSpotlight:SetKeyValue("lightfov", 70);
NPCSpotlight:SetKeyValue("lightcolor", "100 200 200")
NPCSpotlight:SetKeyValue("shadowquality", 1)
NPCSpotlight:SetKeyValue("lightstrength", 2)
for k,NPCWeapon in pairs (ents.FindInSphere(NPC:GetPos(),30)) do
if NPCWeapon:IsWeapon() then
NPCSpotlight:SetAngles(NPCWeapon:GetAngles())
NPCSpotlight:SetParent(NPCWeapon)
end
end

NPCSpotlight = ents.Create( "point_spotlight" )
NPCSpotlight:SetPos(NPC:GetShootPos()+(NPC:GetForward()*20)+Vector(0,0,-50))
-- NPCSpotlight:SetAngles( Angle(20,0,0) )
for k,NPCWeapon in pairs (ents.FindInSphere(NPC:GetPos(),30)) do
if NPCWeapon:IsWeapon() then
NPCSpotlight:SetAngles(NPCWeapon:GetAngles())
NPCSpotlight:SetParent(NPCWeapon)
end
end
--NPCSpotlight:SetParent(NPC);
NPCSpotlight:SetKeyValue( "spawnflags", "1" )
NPCSpotlight:SetKeyValue( "SpotlightWidth", "20" )
NPCSpotlight:SetKeyValue( "SpotlightLength", "200" )
NPCSpotlight:Spawn()
NPCSpotlight:Activate()
end

function SpawnCanister( pos )

traceRes = util.QuickTrace(pos, Vector(0,0,500), player.GetAll())
print(traceRes.Entity)
if traceRes.Entity == NULL or traceRes.HitSky then 
print("[The Hunt]: Place is suitable for canister deployment ")

local canister = ents.Create( "env_headcrabcanister" )

--RocketLauncher:SetKeyValue( "angles", "0 0 90" )
canister:SetAngles(Angle(-70,math.random(180,-180),0))
canister:SetPos(pos)
canister:SetKeyValue( "HeadcrabType", math.random(0,2) )
canister:SetKeyValue( "HeadcrabCount", math.random(3,6) )
canister:SetKeyValue( "FlightSpeed", "8000" )
canister:SetKeyValue( "FlightTime", "3" )
canister:SetKeyValue( "StartingHeight", "0" )
canister:SetKeyValue( "Damage", "20" )
canister:SetKeyValue( "DamageRadius", "5" )
canister:SetKeyValue( "SmokeLifetime", "5" )
canister:SetKeyValue( "MaxSkyboxRefireTime", "5" )
canister:SetKeyValue( "MinSkyboxRefireTime", "1" )
canister:SetKeyValue( "SkyboxCannisterCount", "30" )
canister:Fire("FireCanister","",0.7)
canister:Spawn()

timer.Simple(100, function() canister:Remove() end)
else
print("[The Hunt]: Place is NOT suitable for canister deployment. Player is under a low ceiling.")

end
end


function util.QuickTrace( origin, dir, filter )

	local trace = {}
 
	trace.start = origin
	trace.endpos = origin + dir
	trace.filter = filter

	return util.TraceLine( trace )
end


function SpawnCanisterWave(pos)

traceRes = util.QuickTrace(pos, Vector(0,0,500), player.GetAll())
print(traceRes.Entity)
if traceRes.Entity == NULL then 
print("[The Hunt]: Place is suitable for canister deployment.")

local canister = ents.Create( "env_headcrabcanister" )
canister:SetAngles(Angle(-70,math.random(180,-180),0))
canister:SetPos(pos)
canister:SetKeyValue( "HeadcrabType", math.random(0,2) )
canister:SetKeyValue( "HeadcrabCount", math.random(3,8) )
canister:SetKeyValue( "FlightSpeed", "9000" )
canister:SetKeyValue( "FlightTime", "3" )
canister:SetKeyValue( "StartingHeight", "0" )
canister:SetKeyValue( "Damage", "20" )
canister:SetKeyValue( "DamageRadius", "5" )
canister:SetKeyValue( "SmokeLifetime", "5" )
canister:SetKeyValue( "MaxSkyboxRefireTime", "5" )
canister:SetKeyValue( "MinSkyboxRefireTime", "1" )
canister:SetKeyValue( "SkyboxCannisterCount", "30" )
canister:Fire("FireCanister","",0.7)
canister:Spawn()

timer.Simple(100, function() canister:Remove() end)
else
print("[The Hunt]: Place is NOT suitable for canister deployment. Player is under a low ceiling.")

end
end

function SpawnRebel( pos )
NPC = ents.Create( "npc_citizen" )
NPC:SetPos( pos )
NPC:SetKeyValue("squadname", "Rebels")
NPC:SetKeyValue("citizentype", "3")
NPC:Give("ai_weapon_ar2")
NPC:SetKeyValue("ammosupply", ""..table.Random(RebelsGiveAmmo).."")
NPC:SetKeyValue("spawnflags", "524288")
NPC:Spawn()
NPC:SetHealth("400")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )	
NPC:Fire("StartPatrolling","",0)
end
function SpawnFastZombie( pos )
NPC = ents.Create( "npc_fastzombie" )
NPC:SetPos( pos )
NPC:Spawn()
NPC:SetHealth("9000")
end
function spawnSNPC ( pos )
NPC = ents.Create( "npc_megacombine" )
NPC:SetKeyValue("NumGrenades", "0") 
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 1 )
NPC:Spawn()
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
end
function SpawnCombineS1 ( pos )
NPC = ents.Create( "npc_combine_s" )
NPC:SetKeyValue("NumGrenades", "0") 
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 1 )
NPC:SetKeyValue( "spawnflags", 512 )

NPC:Spawn()
NPC:Give("ai_weapon_ar2")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
NPC:Fire("StartPatrolling","",0)

end
function SpawnCombineS2 ( pos )
NPC = ents.Create( "npc_combine_s" )
NPC:SetKeyValue("NumGrenades", ""..math.random(1,3).."") 
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:SetKeyValue( "spawnflags", 512 )

NPC:Spawn()
NPC:Give("ai_weapon_ar2")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )	
NPC:Fire("StartPatrolling","",0)
 

end

function SpawnCombineShotgunner ( pos )
NPC = ents.Create( "npc_combine_s" )
NPC:SetKeyValue("NumGrenades", "0") 
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:SetKeyValue( "spawnflags", 512 )

NPC:SetSkin(1)
NPC:Spawn()
NPC:Give("ai_weapon_shotgun")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )	
NPC:Fire("StartPatrolling","",0)
 

end
function SpawnCombineShotgunnerElite ( pos )
NPC = ents.Create( "npc_combine_s" )
NPC:SetKeyValue("NumGrenades", ""..math.random(2,3).."")
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:SetKeyValue( "spawnflags", 512 )

NPC:SetSkin(1)
NPC:Spawn()
NPC:Give("ai_weapon_shotgun")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )	
NPC:Fire("StartPatrolling","",0)
 

end
function SpawnMetropoliceStunstick( pos )
NPC = ents.Create( "npc_metropolice" )
NPC:SetKeyValue("Manhacks", math.random(0,1)) 
NPC:SetKeyValue( "model", "models/Police.mdl" )
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:SetKeyValue( "spawnflags", "512" )

NPC:SetKeyValue("squadname", "")
NPC:Spawn()
NPC:Give("ai_weapon_stunstick")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )	
NPC:Fire("StartPatrolling","",0)
NPC:Fire("ActivateBaton","",0)
 

end
function SpawnMetropolice( pos )
NPC = ents.Create( "npc_metropolice" )
NPC:SetKeyValue("Manhacks", math.random(0,1)) 
NPC:SetKeyValue( "model", "models/Police.mdl" )
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
NPC:SetKeyValue( "spawnflags", "512" )

NPC:SetKeyValue("squadname", "")
NPC:Spawn()
NPC:Give("ai_weapon_pistol")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )	
NPC:Fire("StartPatrolling","",0)
 

end
function SpawnMetropoliceHard( pos )
NPC = ents.Create( "npc_metropolice" )
NPC:SetKeyValue("Manhacks", math.random(1,2)) 
NPC:SetKeyValue( "model", "models/Police.mdl" )
NPC:SetPos( pos )
NPC:SetKeyValue( "ignoreunseenenemies", 0 )
-- NPC:SetKeyValue("squadname", "heliaforce")
NPC:SetKeyValue( "spawnflags", 512 )

NPC:Spawn()
NPC:Give("ai_weapon_smg1")
combinen = combinen + 1
NPC:SetName("Combine nº"..combinen.."")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )	
NPC:Fire("StartPatrolling","",0)
 

end
function SpawnRollermine( pos )
NPC = ents.Create( "npc_rollermine" )
NPC:SetPos(pos)
NPC:Spawn()
NPC:SetName("Rollermine")
NPC:SetKeyValue( "spawnflags", "1024" )
end
function SpawnFriendlyRollermine( pos )
NPC = ents.Create( "npc_rollermine" )
NPC:SetPos( pos )
NPC:Spawn()
NPC:SetName("Rollermine")
NPC:AddRelationship("player D_LI 99")
NPC:AddRelationship("npc_combine_s D_HT 99")
NPC:AddRelationship("npc_metropolice D_HT 99")
for k,v in pairs(ents.FindByClass("npc_*")) do
if !v:IsNPC() then return end
if v:GetClass() != NPC:GetClass() then 
       NPC:AddEntityRelationship( v, D_HT, 99 ) 
       v:AddEntityRelationship( NPC, D_HT, 99 ) 
end
end
end
function SpawnEntranceInfoNode( pos )
node = ents.Create("info_node_hint")
node:SetPos(pos)
node:SetKeyValue("hinttype", 103)
node:SetKeyValue("nodeFOV", 360)
node:SetKeyValue("IgnoreFacing", 1)
end
function SpawnCombineElite1( pos )
	NPC = ents.Create( "npc_combine_s" )
	NPC:SetKeyValue("NumGrenades", "0") 
	NPC:SetKeyValue( "model", "models/Combine_Super_Soldier.mdl" )
	NPC:SetPos( pos )
	NPC:SetKeyValue( "spawnflags", 512 )

	NPC:Spawn()
	NPC:Give( "ai_weapon_ar2" )
	combinen = combinen + 1
	NPC:SetName("Combine nº"..combinen.."")
	NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )
	NPC:Fire("StartPatrolling","",0)
 

end
function SpawnCombineElite2( pos )
	NPC = ents.Create( "npc_combine_s" )
	NPC:SetKeyValue("NumGrenades", ""..math.random(0,1).."") 
	NPC:SetKeyValue( "model", "models/Combine_Super_Soldier.mdl" )
	NPC:SetKeyValue( "spawnflags", "256" )
	NPC:SetPos( pos )
	NPC:SetKeyValue( "spawnflags", 512 )

	NPC:Spawn()
	NPC:Give( "ai_weapon_ar2" )
	combinen = combinen + 1
	NPC:SetName("Combine nº"..combinen.."")
	NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )
	NPC:Fire("StartPatrolling","",0)
	 

end


function SpawnAirboat( pos, ang )
spawnairboat = ents.Create("prop_vehicle_airboat")
spawnairboat:SetModel("models/airboat.mdl")
spawnairboat:SetKeyValue("vehiclescript", "scripts/vehicles/airboat.txt")
spawnairboat:SetPos( pos )
spawnairboat:SetAngles( ang ) 
spawnairboat:Spawn()
spawnairboat:Activate()
end


function SpawnCeilingTurretStrong( pos, ang )
NPC = ents.Create( "npc_turret_ceiling" )
NPC:SetPos( pos )
NPC:SetAngles( ang ) 
NPC:SetKeyValue( "spawnflags", "32" )
NPC:Spawn()
NPC:SetHealth(2)
end

function SpawnSuitCharger( pos, ang )
NPC = ents.Create( "item_suitcharger" )
NPC:SetPos( pos )
NPC:SetAngles( ang ) 
NPC:SetKeyValue( "spawnflags", 8192 )
NPC:Spawn()
end

function SpawnDynamicAmmoCrate( pos, ang )
NPC = ents.Create( "item_item_crate" )
NPC:SetPos( pos )
NPC:SetKeyValue( "ItemClass", ""..table.Random(GOODCRATEITEMS).."" )
NPC:SetKeyValue( "ItemCount", math.random(1,2) ) 
NPC:SetAngles( ang ) 
NPC:Spawn()
end


function SpawnTurret( pos, ang )
NPC = ents.Create( "npc_turret_floor" )
NPC:SetPos( pos )
NPC:SetAngles( ang ) 
NPC:Spawn()
NPC:SetName("Turret")
end

function SpawnFriendlyTurret( pos, ang )
NPC = ents.Create( "npc_turret_floor" )
NPC:SetPos( pos )
NPC:SetAngles( ang ) 
NPC:SetKeyValue("spawnflags", 512)
NPC:Spawn()
NPC:SetName("Turret")
end
--0.101 -90.000 -0.016
---72.289574 -1476.778076 11.626291

function SpawnMine( pos )
NPC = ents.Create( "combine_mine" )
NPC:SetPos( pos )
NPC:Spawn()
NPC:SetName("Mine")
end

function SpawnFragCrate( pos, ang )
NPC = ents.Create( "item_ammo_crate" )
NPC:SetPos( pos )
NPC:SetName("RPGAMMO")
NPC:SetAngles( ang ) 
NPC:SetKeyValue("AmmoType", 5)
NPC:Spawn()
end

function SpawnAmmoCrate( pos, ang, ammotype )
NPC = ents.Create( "item_ammo_crate" )
NPC:SetPos( pos )
NPC:SetName("RPGAMMO")
NPC:SetAngles( ang ) 
NPC:SetKeyValue("AmmoType", ammotype)
NPC:Spawn()
end

function SpawnMineDisarmed( pos )
NPC = ents.Create( "combine_mine" )
NPC:SetPos( pos )
NPC:SetKeyValue("StartDisarmed", 1)
NPC:Spawn()
NPC:SetName("Mine")
end

function SpawnItem (weapon, pos, ang)
ITEM = ents.Create(weapon)
ITEM:SetPos( pos )
ITEM:SetAngles( ang )
ITEM:Spawn()
end

function SpawnStaticProp( pos, ang, model )
ITEM = ents.Create("prop_physics" )
ITEM:SetPos( pos )
ITEM:SetAngles(ang)
ITEM:SetModel(model)
ITEM:Spawn()
ITEM:Fire("DisableMotion","",0)
--ITEM:SetKeyValue("minhealthdmg", 6000)
end


function SpawnProp( pos, ang, model )
ITEM = ents.Create("prop_physics" )
ITEM:SetPos( pos )
ITEM:SetAngles(ang)
ITEM:SetModel(model)
ITEM:Spawn()

end

-- UTILITY FUNCTIONS ^


-- v PRE-PLAY THINGS

function GM:PlayerSpawn(ply)
	--timer.Simple (1.3, npcforget)
	ply:SetTeam(1)
    ply:SetCustomCollisionCheck(true)
	ply:StripAmmo()
	ply:StripWeapons()
	ply:Give("weapon_crowbar")

	ply:SetupHands()
	ply:SetWalkSpeed(150)
	ply:SetRunSpeed(250)
	ply:SetCrouchedWalkSpeed(0.3)
	ply:AllowFlashlight(true)
	ply:SetNoCollideWithTeammates(1)
	
if math.random(1,2) == 1 then
ply:SetModel(table.Random(playermodelsmale) )
ply.sex="male"
print(""..ply:GetName().." is male")
else
ply:SetModel(table.Random(playermodelsfemale) )
ply.sex="female"
print(""..ply:GetName().." is female")
end
end
-- ^ PRE-PLAY THINGS

-- CYCLES v
function coverzones()
timer.Create( "coverzones", 20, 0, coverzones ) 	
--print("[The Hunt]: Patrol Areas updated:")

table.foreach(MainEnemiesGround, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
	if WAVESPAWN == 1 then v:SetCollisionGroup(1) else v:SetCollisionGroup(9) end

	if !v:IsCurrentSchedule(SCHED_FORCED_GO) && !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then	
		if v:GetEnemy() then 
			--print(""..v:GetName().." is busy, cannot change patrol area")
		else
			v:SetLastPosition(table.Random(zonescovered) + Vector(math.random(-20,20), math.random(-20,20), -30))
			if WAVESPAWN == 1 then
				v:SetSchedule(SCHED_FORCED_GO_RUN)
			else
				v:SetSchedule(SCHED_FORCED_GO)
			end
		--print(""..v:GetName().." changed patrol area")
		end
	end
end

end)
end



function GM:ShouldCollide(ent1,ent2)

if ent1:IsPlayer() then
if ent2:GetClass() == "npc_combine_s" then
if ent1:GetPos():Distance(ent2:GetPos()) < 50 then
ent1:SetNoTarget(false)
return true
end
end
end


if ent1:GetClass() == "npc_combine_s" then
if ent2:GetClass():IsPlayer() then
if ent1:GetPos():Distance(ent2:GetPos()) < 50 then
ent1:SetNoTarget(false)
return true
end
end
end

if ent1:GetClass()== "npc_helicopter" then
if ent2:GetClass() =="npc_helicopter" or ent2:GetClass() =="npc_combinegunship" then
return false
end
end
if ent2:GetClass()== "npc_helicopter" then
if ent1:GetClass() =="npc_helicopter" or ent1:GetClass() =="npc_combinegunship" then
return false
end
end
return true
end

function metropolicewander()
for k, v in pairs(ents.FindByClass("npc_metropolice")) do
if !v:GetEnemy() then
if !v:IsCurrentSchedule(SCHED_FORCED_GO) && !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
v:SetSchedule(SCHED_IDLE_WANDER)
print(""..v:GetName().." is wandering now")
end
end
end

for k, v in pairs(ents.FindByClass("npc_rollermine")) do
if !v:GetEnemy() then
if v:GetPhysicsObject():GetVelocity():Length() < 20 then
print(""..v:GetName().." is wandering now")

if math.random(1,3)==2 then
v:SetSchedule(SCHED_IDLE_WANDER)

else
v:SetSchedule(SCHED_RUN_RANDOM)

end
end
end
timer.Create( "metropolicewander", 9, 1, metropolicewander ) 
end
end
timer.Create( "metropolicewander", 8, 1, metropolicewander ) 

function CombineIdleSpeech()
local NPCsFound = 0
for _, player in pairs(ents.FindByClass("player")) do
	for k, npc in pairs(ents.FindInSphere(player:GetPos(),900)) do
		if npc:GetClass() == "npc_metropolice" || npc:GetClass() == "npc_combine_s" then
			NPCsFound= NPCsFound+1
			if NPCsFound < 2 && npc:Health() > 0 then
				if npc:GetEnemy() then
					npc:EmitSound(table.Random(CombineCombatSounds), 90,100) else npc:EmitSound(table.Random(CombineIdleSounds), 80,100)
				end
			end
		end
	end
end
end

function npcforget()
print("[The Hunt]: npcforget APPLIED")
table.foreach(MainEnemiesGround, function(key,enemy)
for k, v in pairs(ents.FindByClass(enemy)) do 
v:SetKeyValue("squadname", "")
v:ClearEnemyMemory()
v:SetSchedule(SCHED_MOVE_AWAY)
end
end)
table.foreach(player.GetAll(), function(key,value)
net.Start( "Hidden" )
net.Send(value)
value.spotted = 0
end)
end



function GM:InitPostEntity()
print("---------------LOADING THE HUNT-------------")
team.SetUp( 1, "Rebels", Color( 0, 255, 0 ) )


if !CRATEITEMS then print("[The Hunt]: Didn't found a custom CRATEITEMS table. Building one... ") CRATEITEMS = { "weapon_357", "weapon_frag", "weapon_slam", "item_ammo_smg1_grenade", "item_healthvial","npc_headcrab_black", "npc_headcrab", } 
else print("[The Hunt]: This map has a custom CRATEITEMS table.") end

if !GOODCRATEITEMS then print("[The Hunt]: Didn't found a custom GOODCRATEITEMS table. Building one... ") GOODCRATEITEMS = { "item_dynamic_resupply","weapon_frag", "weapon_slam","item_healthkit", "item_ammo_smg1_grenade","item_box_buckshot","item_ammo_smg1_large","item_ammo_crossbow","item_ammo_ar2_large","item_ammo_ar2_altfire"} 
else print("[The Hunt]: This map has a custom GOODCRATEITEMS table.") end

INFINITE_ACHIEVED = 0

if !CUSTOMWAVESPAWN then 
print("[The Hunt]: CUSTOMWAVESPAWN not set on the map config file. CUSTOMWAVESPAWN will be 30 by default.")
CUSTOMWAVESPAWN=30 
else
print("[The Hunt]: CUSTOMWAVESPAWN set to "..CUSTOMWAVESPAWN.." by the map's config file.")
end

if GetConVarString("h_autostart") == "1" then
if win == 1 then
timer.Simple(10, autofirstwave)
end
else
end

Wave=0
timer.Create( "Item Respawn System", 10, 1, ItemRespawnSystem )
timer.Create( "CombineIdleSpeech", math.random(5,15), 0, CombineIdleSpeech ) 
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 
timer.Create( "coverzones", 10, 1, coverzones )
timer.Create( "wavefinishedchecker", 5, 1, wavefinishedchecker)
CanCheck = 0
print("[The Hunt]: Calling map setup function")

MapSetup()
print("[The Hunt]: Finished map setup function")

if MAP_PROPS then
print("[The Hunt]: found a props table, will add dynamic weapon spawnpoints. ")
table.foreach(MAP_PROPS, function(key,propclass)
for k, v in pairs(ents.GetAll()) do
	if v:GetModel() == propclass then
	table.insert(ITEMPLACES, v:GetPos()+Vector(0,0,v:BoundingRadius()+20))
	v:SetKeyValue("minhealthdmg", "9001")
	v:Fire("DisableMotion","",0)
	print("[The Hunt]: "..v:GetModel().." is now a weapon spawnpoint.")
	end
end
end)

else 
print("[The Hunt]: MAP_PROPS not found, will not add dynamic weapon spawnpoints.")
end

ORIGINAL_ZONES_NUMBER = table.Count(zonescovered)
print("---------------THE HUNT LOADED-------------")

end


function GM:GetFallDamage( ply, speed )
nearbycombinecomecasual(ply)

	return ( speed / 60 )
end

function GM:OnEntityCreated(entity)
	if entity:IsNPC() && entity:GetClass() != "npc_helicopter" && entity:GetClass() != "npc_combinegunship"  && entity:GetClass() != "npc_combine_s" && entity:GetClass() != "npc_metropolice" && entity:GetName() == "" then
	ManuallySpawnedEntity = ManuallySpawnedEntity + 1
	entity:SetName(""..entity:GetClass().." ("..entity:EntIndex()..")")
	print(""..entity:GetName().." created")
	end
end

function CicloUnSegundo()
table.foreach(MainEnemiesCoop, function(key,enemy)
for k, npc in pairs(ents.FindByClass(enemy)) do
if npc:Health() > 0 then

if npc:GetEnemy() then
	if npc:IsCurrentSchedule(SCHED_FORCED_GO) or npc:IsCurrentSchedule(SCHED_IDLE_WANDER) or npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN)	then npc:ClearSchedule() end

if npc:GetClass() == "npc_combine_s" || npc:GetClass() == "npc_metropolice" then
	if npc:HasCondition(10) then
			if npc:GetEnemy().spotted != 1 then
				if npc:GetEnemy():IsPlayer() then
					npc:EmitSound(table.Random(ContactConfirmed), 100, 100)
					PrintMessage(HUD_PRINTTALK, ""..npc:GetName()..": "..table.Random(ChatEnemySpotted).."")
					if table.Count(zonescovered) > ORIGINAL_ZONES_NUMBER+5 then
					table.remove(zonescovered)
					table.remove(zonescovered)
					table.remove(zonescovered)
					table.remove(zonescovered)
					table.remove(zonescovered)
					print("Patrol zones restarted")
					end					
					table.insert(zonescovered, npc:GetEnemy():GetPos()+Vector(0,0,30)) print("Patrol zone added")
					net.Start("Spotted")
					net.Send(npc:GetEnemy())
					npc:GetEnemy().spotted = 1
				end
			end
		npc:SetKeyValue("squadname", "CombineSquad")
		if timer.Exists("npcforgettimer") then
		timer.Destroy( "npcforgettimer")
		end
		for num, ThisEnt in pairs(ents.FindInSphere(npc:GetPos(),2000)) do 
		if ThisEnt:GetClass() == "npc_combine_s" or ThisEnt:GetClass() == "npc_metropolice" then
				if ThisEnt:GetEnemy() == nil  then 
					if CombineAssisting < GetConVarNumber("h_maxhelp") then
					--print(ThisEnt:GetName().." is helping "..npc:GetName().."")
					ThisEnt:SetLastPosition(npc:GetEnemy():GetPos())
					ThisEnt:SetSchedule(SCHED_FORCED_GO_RUN)
					CombineAssisting = CombineAssisting+1
					--print("[The Hunt]: Combines helping: "..CombineAssisting.." of "..GetConVarNumber("h_maxhelp").."")
					end
				end
		end
		end
	else
		if !timer.Exists("npcforgettimer") then
		timer.Create( "npcforgettimer", GetConVarNumber("h_lostplayertimeout"), 1, npcforget ) 
		--print("[The Hunt]: npcforget ACTIVE")
		end
	end		
end
end
end
end
end)
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 
end

function helibehavior()
for num, Heli in pairs(ents.FindByClass("npc_helicopter")) do
		if Heli:GetEnemy() then
			--print ("heli has enemy: "..HeliA:GetEnemy():GetName().."")
				if Heli:GetEnemy():IsNPC() && Heli.light then
					Heli.light:Fire("Target", ""..Heli:GetEnemy():GetName().."", 0)
					end
				if Heli:GetEnemy():IsPlayer() && Heli.light  then
				Heli:GetEnemy():SetName(""..tostring(Heli:GetEnemy():GetName()).."focus")
				Heli.light:Fire("Target", ""..tostring(Heli:GetEnemy():GetName()).."focus", 0)
				end
if Heli:HasCondition(10) then
nearbycombinecomeheli(Heli,Heli:GetEnemy())
end
elseif Heli.light then Heli.light:Fire("Target", "", 0)
end
end
end

function helipath()
helibehavior()
timer.Simple( 5, helipath )
--print("Helipath")
local found = 0
table.foreach(AirEnemies, function(key,enemy)

	for num, Heli in pairs(ents.FindByClass(enemy)) do

	if Heli:GetVelocity():Length() < 240 then
	--print("")
	--print("Heli "..Heli:EntIndex().." searching")
	 if Heli:GetEnemy() then
	 nearbycombinecome(Heli:GetEnemy())
	 		for num, HeliTrack in pairs(ents.FindInSphere(Heli:GetEnemy():GetPos(), 2000)) do
			if found == 0 or  found == 1 then
			if HeliTrack:GetClass() == "path_track" then
			--print("Found one,"..HeliTrack:EntIndex().."")
			if HeliTrack:GetName() == "used" then  found = 1 
			--print("Is NOT Empty")
			end
			if HeliTrack:GetName() != "used" then
			--print("Is Empty")
			if Heli:Visible(HeliTrack) and HeliTrack:Visible(Heli:GetEnemy()) then
			--print("Going to "..HeliTrack:EntIndex().."")
			HeliTrack:SetName("going")
			Heli:Fire("SetTrack",tostring(HeliTrack:GetName()))
			timer.Simple (0.5, function() HeliTrack:SetName("used") end)
			found = 2
			end
			end
			end 
			end
			end
	 else
			for num, HeliTrack in pairs(ents.FindInSphere(Heli:GetPos(), 2000)) do
			if found == 0 or  found == 1 then
			if HeliTrack:GetClass() == "path_track" then
			--print("Found one,"..HeliTrack:EntIndex().."")
			if HeliTrack:GetName() == "used" then  found = 1
			--print("Is NOT Empty")
			end
			if HeliTrack:GetName() != "used" then
			--print("Is Empty")
			if Heli:Visible(HeliTrack) then
			--print("Going to "..HeliTrack:EntIndex().."")
			HeliTrack:SetName("going")
			Heli:Fire("SetTrack",tostring(HeliTrack:GetName()))
			timer.Simple (0.5, function() HeliTrack:SetName("used") end)
			found = 2
			end
			end
			end 
			end
			end
			end
			--print("Heli "..Heli:EntIndex().." status: "..found.."")
			if found == 0 or found == 1 then usedpaths() end
			end
	end
	end)
end

function usedpaths()
if HeliA then
	for num, HeliTrack in pairs(ents.FindByClass("path_track")) do
				if HeliTrack:GetName() == "used" then
					HeliTrack:SetName("empty")
					--print("[The Hunt]: found used and emptied")
				end
	end
	end
end


-- CYCLES ^

-- GM HOOKS v
function GM:OnNPCKilled(victim, killer, weapon)
wavefinishedchecker()
local victimpos = victim:GetPos()
-- Uncomment to for-the-lulz explosion kills
/*
ent = ents.Create( "env_explosion" )
ent:SetPos(victim:GetPos())
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "100" )
print("[The Hunt]: assploded")
ent:Fire("Explode",0,0)
*/

if victim:GetClass() == "npc_turret_floor" then
nearbycombinecome(victim)
end
if victim:GetClass() == "npc_turret_ceiling" then
nearbycombinecome(killer)
end

if killer:IsNPC() then
	if killer:GetClass() == "npc_citizen" then
	nearbycombinecome(killer)
	end
	if killer:Health() > 0 then
		if killer:GetClass() == "npc_combine_s" then
		killer:EmitSound(table.Random(CombineKillSounds), 100, 100)
		end
	end
end

if victim:GetClass() == "npc_metropolice" or victim:GetClass() == "npc_combine_s" then
CombineAssisting = CombineAssisting/2
COMBINE_KILLED = COMBINE_KILLED+1
if killer:IsPlayer() then
		net.Start( "PlayerKillNotice" )
		net.WriteString( ""..killer:GetName().."" )
			if weapon:IsPlayer() then
				net.WriteString( ""..weapon:GetActiveWeapon():GetClass().."" )
			else
				net.WriteString( ""..weapon:GetClass().."" )
			end
		net.WriteString( ""..victim:GetName().."" )
		net.Broadcast()

			if !victim:GetEnemy() then
			killer.SilentKills=killer.SilentKills+1 team_silent_kills=team_silent_kills+1
			if killer.sex == "male" then killer:EmitSound(table.Random(malecomments), 100, 100) else
			killer:EmitSound(table.Random(femalecomments), 100, 100)
			end

			for k, v in pairs(ents.FindInSphere(victim:GetPos(),512)) do
					if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then
					if v:Visible(victim) then
					v:SetLastPosition(killer:GetPos())
					v:SetSchedule(SCHED_FORCED_GO_RUN)
					else
					v:SetLastPosition(victim:GetPos())
					v:SetSchedule(SCHED_FORCED_GO_RUN)
					end
					end
			end
				nearbycombinecomecasual(victim) 
					if math.random(1,2) == 1 then 
						SpawnDynamicResuply(victim:GetPos())
						elseif cansilentkillreward != 0 then
						cansilentkillreward = 0
						timer.Simple(10, function() cansilentkillreward = 1 end)
						SpawnItem(table.Random(SILENTKILLREWARD), victim:GetPos(), Angle(0,0,0))
					end
				else
					nearbycombinecome(victim) killer.Kills=killer.Kills+1
					team_kills=team_kills+1
			end
		end
		killer:AddFrags(1)
end
end

function GM:PlayerSelectSpawn( pl )
local availablespawns = {}
    local spawns = ents.FindByClass( "info_player_start" )
	local random_entry = math.random( #spawns )
local spawn = false
table.foreach(spawns, function(key,value)
	local can = 1
	for k, v in pairs(ents.FindInSphere(value:GetPos(),1000)) do
	if v:IsNPC() then
	if v:Visible(value) then
	can = 0
	end
	end
	end
	--print(can)
	if can == 1 then table.insert(availablespawns, value)end
end)
   return table.Random(availablespawns)

end


function ScalePlayerDamage(ply, hitgroup, dmginfo)
if dmginfo:GetAttacker():IsPlayer() and !dmginfo:IsFallDamage() then
dmginfo:ScaleDamage(GetConVarNumber("h_playerscaledamage")*0.1)
end
if !dmginfo:GetAttacker():IsPlayer() then
dmginfo:ScaleDamage(GetConVarNumber("h_playerscaledamage"))
end
end
hook.Add("ScalePlayerDamage","ScalePlayerDamage", ScalePlayerDamage)

function ScaleNPCDamage( damaged, hitgroup, damage )

	table.foreach(MainEnemiesDamage, function(key,value)
	if damaged:GetClass() == value  then
	if damage:IsDamageType(8) or damage:GetAttacker():GetClass() == damaged:GetClass() then damaged:SetSchedule(SCHED_MOVE_AWAY) end -- flee from fire and friendly fire
		if damaged:GetEnemy() == nil then
		damage:ScaleDamage(GetConVarNumber("h_npcscaledamage")*2)
		else
		damage:ScaleDamage(GetConVarNumber("h_npcscaledamage"))
		end
		if damaged:Health() > damage:GetDamage() then
		damaged:SetEnemy(damage:GetAttacker())
		end
	end
	end)
	 
	-- friendly fire between same class NPCs
	if damaged:GetClass() == damage:GetAttacker():GetClass() then
		damage:ScaleDamage(0)
	end

	
	

if damaged:GetClass() == "npc_helicopter" then

if damaged:Health() < 800 and damaged:Health() > 650 then
PrintMessage(HUD_PRINTTALK, "[Overwatch]: Air enforcement unit, you are now free to employ aggresive containment tactics.")

RunConsoleCommand( "g_helicopter_chargetime", "1") 
RunConsoleCommand( "g_helicopter_chargetime", "1") 
RunConsoleCommand( "sk_helicopter_burstcount", "10") 
RunConsoleCommand( "sk_helicopter_firingcone", "2") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
damaged:SetKeyValue( "patrolspeed", "5000" )
damaged.spotlight:Fire("LightOff","",0)
if damaged.light then
damaged.light:SetKeyValue("lightcolor", "0 0 0") 
end

/* -- Original "Heli tries to crash on you" code. Doesn't work for now.
if damaged:Health() < 151 then
timer.Simple(3, function() PrintMessage(HUD_PRINTTALK, "[Overwatch]: All units, "..damaged:GetName().." state changed to: inoperative.") end)
timer.Simple(1 , helideath(damaged))
creating = ents.Create( "info_target_helicopter_crash" )
creating:SetPos(damage:GetAttacker():GetPos() + Vector(0, 0, 500))
creating:Spawn()
creating:SetParent(damage:GetAttacker())
end
*/

if damaged:Health() < damage:GetDamage() then
damaged.spotlight:Fire("LightOff","",0)
PrintMessage(HUD_PRINTTALK, "[Overwatch]: All units, "..damaged:GetName().." state changed to: inoperative.")
--print("dead")
end
end
end
if damaged:GetClass() == "npc_sniper" then
if damage:GetInflictor():GetClass() == "crossbow_bolt" or damage:IsDamageType(64) or damage:IsDamageType(67108864) then
damaged:SetHealth(0)
PrintMessage(HUD_PRINTTALK, ""..damage:GetAttacker():GetName().." got that Sniper out of the way ")
end
end

if damaged:GetClass() == "npc_turret_ceiling" then
if damage:IsDamageType(64) then
damaged:SetHealth(0)
PrintMessage(HUD_PRINTTALK, ""..damage:GetAttacker():GetName().." destroyed a ceiling turret ")
else
damage:ScaleDamage(0)
end
end
	
end
hook.Add("ScaleNPCDamage","ScaleNPCDamage",ScaleNPCDamage)



function GM:EntityTakeDamage(damaged,damage)

--print(""..damaged:GetClass().." taken damage")

if damage:GetAttacker():GetClass() == "monster_apc" then
damage:ScaleDamage(GetConVarNumber("h_npcscaledamage"))
end

	if damaged:IsNPC() and (damage:GetDamage() < damaged:Health()) then
	damaged:SetEnemy(damage:GetAttacker())
	end

if !damaged:IsNPC() and !damaged:IsPlayer() then
if CAN_HEAR_BREAK == 1 then
CAN_HEAR_BREAK = 0
--print("player hit "..damaged:GetClass().."")
nearbycombinecomecasual(damaged)
timer.Simple(5, function() CAN_HEAR_BREAK = 1 end)
end
end
end

function PropBreak(breaker,prop)

if math.random(1,3) == 1 then
	if prop:IsValid() then
		if prop:GetModel() == "models/props_junk/wood_crate002a.mdl"
		or prop:GetModel() == "models/props_junk/wood_crate001a_damaged.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a_damagedmax.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a_damagedmax.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a.mdl" 
		or prop:GetModel() == "models/props_junk/cardboard_box003a.mdl"
		or prop:GetModel() == "models/props_junk/cardboard_box002a.mdl"
		or prop:GetModel() == "models/props_junk/cardboard_box004a.mdl"
		or prop:GetModel() == "models/props_c17/woodbarrel001.mdl"


		then
		SpawnItem(""..table.Random(CRATEITEMS).."", prop:GetPos(), Angle(0,0,0))
		end
	end
end

if CAN_HEAR_BREAK == 1 then
CAN_HEAR_BREAK = 0
nearbycombinecomecasual(prop)
timer.Simple(5, function() CAN_HEAR_BREAK = 1 end)
end
end
hook.Add("PropBreak","OnPropBreak",PropBreak)



function GetAmmoForCurrentWeapon( ply )
	if (  !IsValid( ply ) ) then return -1 end

	local wep = ply:GetActiveWeapon()
	if (  !IsValid( wep ) ) then return -1 end
 
	--print(ply:GetAmmoCount(wep:GetPrimaryAmmoType()))
end


function GM:KeyPress(player,key)

if player:Alive() then
local clip = player:GetActiveWeapon():Clip1()
local loud = 1
if key == IN_ATTACK then
if player:Alive() then
if player:GetActiveWeapon():GetClass() == "weapon_crowbar" then
if CAN_HEAR_BREAK == 1 then 
local traceRes = util.QuickTrace(player:GetPos(), player:GetForward()*75, player)
if traceRes.HitWorld then
--print(""..player:GetName().. " hit "..traceRes.Entity:GetClass().."")
CAN_HEAR_BREAK = 0
timer.Simple(5, function() CAN_HEAR_BREAK = 1 end)
nearbycombinecomecasual(player)
end
end
end

table.foreach(SILENT_WEAPONS, function(key,value)
if player:GetActiveWeapon():GetClass() == value then
loud = 0
end
end)
if loud > 0 then
timer.Simple(0.1, function()
if player:GetActiveWeapon():Clip1() then
if player:GetActiveWeapon():Clip1() < clip then
if player:GetActiveWeapon():Clip1() > -1 then
local silenced = 0
	if player:GetActiveWeapon().Silenced == true then print("Silenced 1") silenced = 1 end
	if player:GetActiveWeapon():GetClass() == "pspak_mp9" then print("Silenced 2") silenced = 1 end
	if player:GetActiveWeapon().Primary then 
		if player:GetActiveWeapon().Primary.Sound == "Weapon_USP.SilencedShot" or player:GetActiveWeapon().Primary.Sound == "Weapon_M4A1.Silenced" or player:GetActiveWeapon().Primary.Sound == "Weapon_M4A1.Silenced" then print("Silenced 3") silenced = 1 end 
	end
	if player:GetActiveWeapon().dt then
			if player:GetActiveWeapon().dt.Suppressed == true then print("Silenced 4") silenced = 1 end
	end
	if silenced == 0 then
	print("NOT Silenced")
	allthecombinecome(player,GetConVarNumber("h_maxgunshotinvestigate")) 
	end
	if silenced == 1 then
	nearbycombinecomecasual(player)
	end
end	
end
end
end)
end
--
/*
if player:GetActiveWeapon():Clip1() > 0 then
local silenced = 0
	if player:GetActiveWeapon().Silenced == true then print("yes") silenced = 1 end
	if player:GetActiveWeapon():GetClass() == "pspak_mp9" then silenced = 1 end
	if player:GetActiveWeapon().Primary then 
		if player:GetActiveWeapon().Primary.Sound == "Weapon_USP.SilencedShot" or player:GetActiveWeapon().Primary.Sound == "Weapon_M4A1.Silenced" or player:GetActiveWeapon().Primary.Sound == "Weapon_M4A1.Silenced" then silenced = 1 end 
	end
	if player:GetActiveWeapon().dt then
			if player:GetActiveWeapon().dt.Suppressed == true then silenced = 1 end
	end
			
				if silenced == 0 then
				--print("[The Hunt]: combine come (not silent)")
				local clip = player:GetActiveWeapon():Clip1()
				timer.Simple(0.2, function() if player:GetActiveWeapon():Clip1() < clip then 				allthecombinecome(player,GetConVarNumber("h_maxgunshotinvestigate")) end end)
				elseif silenced == 1 then
				nearbycombinecomecasual(player)
				end
end
*/
--
/*
if player:GetActiveWeapon():Clip1() == 0 then
local showhelp = 1
table.foreach(VanillaWeapons, function(key,value)
if player:GetActiveWeapon():GetClass() == value then
showhelp = 0
end
end)
if showhelp == 1 then PrintMessage(HUD_PRINTTALK, "[Eddlm]: This weapon does not have ammo. Say !drop to remove it from your inventary and let the game spawn it again.") end
end
*/
end
end
		if key == IN_ATTACK2 then
			if player:GetAmmoCount(player:GetActiveWeapon():GetSecondaryAmmoType()) > 0 or (player:GetActiveWeapon():GetClass() == "weapon_shotgun") then
					table.foreach(SECONDARY_FIRE_WEAPONS, function(key,value)
					if player:GetActiveWeapon():GetClass() == value then
					allthecombinecome(player,GetConVarNumber("h_maxgunshotinvestigate"))
					--print("[The Hunt]: combine come (not silent secondary fire)")
					end
					end)
			end
		end


		if key == IN_ATTACK2 or key == IN_ATTACK then
		if player:GetActiveWeapon():GetClass() == "weapon_frag" then
		if player:GetAmmoCount(player:GetActiveWeapon():GetPrimaryAmmoType()) < 2 then
		timer.Simple(1, function() player:StripWeapon("weapon_frag") end)
		end
		end
		end

end
end


function GM:PlayerSetHandsModel( ply, ent )
	local simplemodel = player_manager.TranslateToPlayerModelName( ply:GetModel() )
	local info = player_manager.TranslatePlayerHands( simplemodel )
	if ( info ) then
		ent:SetModel( info.model )
		ent:SetSkin( info.skin )
		ent:SetBodyGroups( info.body )
	end
end

-- GM HOOKS ^

function FirstSpawn(ply)
ply.deaths=0
ply.Kills=0
ply.SilentKills=0
ply.lifes=GetConVarNumber("h_player_lifes")
NUMPLAYERS()
if DARKNESS then
ply:SendLua("CLDARKNESS="..DARKNESS.."" )
end
end
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
