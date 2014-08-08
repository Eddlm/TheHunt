AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "config.lua" )
include( "shared.lua" )
include( "config.lua" )
util.AddNetworkString( "Spotted" )
util.AddNetworkString( "Hidden" )
util.AddNetworkString( "light_below_limit" )
util.AddNetworkString( "light_above_limit" )

util.PrecacheModel("models/Combine_Soldier.mdl")
util.PrecacheModel("models/Combine_Super_Soldier.mdl")
util.PrecacheModel("models/Police.mdl")


net.Receive( "light_above_limit", function( length, client )
client:PrintMessage(HUD_PRINTTALK, "You are visible.")
client:SetNoTarget(false)
end )

net.Receive( "light_below_limit", function( length, client )
local hidden=1
for k, v in pairs(ents.FindByClass("npc_*")) do
if v:IsValid() then
--if v:IsNPC() then
if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
if v:Health() > 0 then
if v:GetEnemy() == client then

--if !timer.Exists("npcforgettimer") then
--if v:Visible(client) then
client:PrintMessage(HUD_PRINTTALK, "You can't hide now. "..v:GetName().." is actively looking for you.")
hidden=0
--else
--enemy:ClearEnemyMemory()
--enemy:SetEnemy(nil)
--end
--end

end
end
end
end
end
if hidden==1 then client:SetNoTarget(true) client:PrintMessage(HUD_PRINTTALK, "You are hidden.")
end
end)


/*               notes
NPC:SetKeyValue( "model", "models/elite_synth/elite_synth.mdl" )
NPC:SetSkin(1)
Get info from an entity typing this on the console while facing at it
lua_run print(player.GetByID(1):GetEyeTrace().Entity:GetAngles()) print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print(player.GetByID(1):GetEyeTrace().Entity) print(player.GetByID(1):GetEyeTrace().Entity:GetModel())
*/

function GM:Initialize()
thereareplayers = 0
RunConsoleCommand( "sk_helicopter_health", "1500") 
RunConsoleCommand( "air_density", "0")
RunConsoleCommand( "g_ragdoll_maxcount", "6")

 
NODES = 0
end

-- WHAT-MAP-ARE-THEY-PLAYING CHECK v
if file.Exists( "gamemodes/thehunt/gamemode/maps/"..game.GetMap()..".lua", "GAME" ) then
include("/maps/"..game.GetMap()..".lua")
win = 1
print("map found")
else
print("map not found")
win = 0
include("/maps/nomap.lua")
end
-- WHAT-MAP-ARE-THEY-PLAYING CHECK ^

-- VARIABLES v
player_1 = player.GetByID(1)
player_2 = player.GetByID(2)
player_3 = player.GetByID(3)

VariedPos = Vector(math.random(-100,100),math.random(-100,100),0)
EnemiesRemainining = 0
combinen = 0
npcchasing = 0
CombineAssisting = 0
ManuallySpawnedEntity = 0
HeliAangered = 0

-- VARIABLES ^

-- UTILITY COMMANDS v

concommand.Add( "Spotted", function()
net.Start( "Spotted" )
net.Send(player.GetByID(1))
end )


concommand.Add( "clnotarget", function(ply)
ply:SetNoTarget(1)
end )

concommand.Add( "cltarget", function(ply)
ply:SetNoTarget(0)
end )

concommand.Add( "HuntVersion", function()
print("TheHunt Version: v0.6-beta-PRE_WORKSHOP_UPDATE edition. Last shit added: Silverlan's APC, Infinite waves and Headcrab Canisters.")
end )


concommand.Add( "LaunchCanister", function(ply)
local canister = ents.Create( "env_headcrabcanister" )

--RocketLauncher:SetKeyValue( "angles", "0 0 90" )
canister:SetAngles(Angle(-70,math.random(180,-180),0))
canister:SetPos(ply:GetEyeTraceNoCursor().HitPos /*+ Vector(math.random(200,-200),math.random(200,-200),0)*/)
canister:SetKeyValue( "HeadcrabType", math.random(0,2) )
canister:SetKeyValue( "HeadcrabCount", math.random(1,4) )
canister:SetKeyValue( "FlightSpeed", "9000" )
canister:SetKeyValue( "FlightTime", "3" )
canister:SetKeyValue( "StartingHeight", "0" )
canister:SetKeyValue( "Damage", "5" )
canister:SetKeyValue( "DamageRadius", "5" )
canister:SetKeyValue( "SmokeLifetime", "5" )
canister:SetKeyValue( "MaxSkyboxRefireTime", "5" )
canister:SetKeyValue( "MinSkyboxRefireTime", "1" )
canister:SetKeyValue( "SkyboxCannisterCount", "30" )
canister:Fire("FireCanister","",0.7)
canister:Spawn()
end)



concommand.Add( "SpawnAPC", function(ply)
local RocketLauncher = ents.Create( "monster_apc" )
RocketLauncher:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,40))
--RocketLauncher:SetKeyValue( "spawnflags", "1" )
RocketLauncher:Spawn()
end)

concommand.Add( "SpawnSoldier", function(ply)
local RocketLauncher = ents.Create( "combine_soldier" )
RocketLauncher:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,40))
--RocketLauncher:SetKeyValue( "spawnflags", "1" )
RocketLauncher:Spawn()
end)

concommand.Add( "SpawnAPCLauncher", function(ply)


local RocketLauncher = ents.Create( "func_tankapcrocket" )
RocketLauncher:SetPos(ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,40))
RocketLauncher:SetKeyValue( "spawnflags", "1" )
RocketLauncher:Spawn()


RocketLauncher:SetKeyValue( "yawrate", 30 )
RocketLauncher:SetKeyValue( "yawrange", 180 )
RocketLauncher:SetKeyValue( "yawtolerance", 15 )
RocketLauncher:SetKeyValue( "pitchrate", 30 )
RocketLauncher:SetKeyValue( "pitchrange", 30 )
RocketLauncher:SetKeyValue( "pitchtolerance", 30 )

RocketLauncher:SetKeyValue( "barrel", 0 )
RocketLauncher:SetKeyValue( "barrely", 0 )
RocketLauncher:SetKeyValue( "barrelz", 0 )
RocketLauncher:SetKeyValue( "firespread", 0 )

RocketLauncher:Fire("Activate","",0)
/*
minRange
maxRange
_minlight

--RocketLauncher:Fire("SetEnemyEntity",ply,0)
--RocketLauncher:Activate()
print("RocketLauncher spawned")
--timer.Simple( 1, function()
RocketLauncher:Fire("FireOnce","",5)

RocketLauncher:Fire("FireOnce","",1)
print("RocketLauncher activated")

 --end )
*/

end )


concommand.Add( "SpawnRocketLauncher", function(ply)


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
print("RocketLauncher spawned")


RocketLauncher:Fire("TurnOn","",0)
--timer.Simple( 1, function()
RocketLauncher:Fire("FireOnce","",5)

RocketLauncher:Fire("FireOnce","",1)
print("RocketLauncher activated")

 --end )


end )



concommand.Add( "Hidden", function()
net.Start( "Hidden" )
net.Send(player.GetByID(1))
end )

concommand.Add( "NearbyEntities", function()
NearbyEntities()
end )

concommand.Add( "revealzones", function()
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
print("Combine Covered Zones Hithlighted.")

end)


concommand.Add( "revealweaponspawns", function()
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
print("Weapon Spawn Zones Hithlighted.")

end)


concommand.Add( "revealhelipath", function()
for k, v in pairs(ents.FindByClass("path_track")) do 
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
print("Heli Path Hithlighted.")
end
end)

concommand.Add( "seesettings", function()
print("PLAYERSCALEDAMAGE: "..PLAYERSCALEDAMAGE.."")
print("NPCSCALEDAMAGE: "..NPCSCALEDAMAGE.."")
print("FRIENDLYFIRE: "..FRIENDLYFIRE.."")
print("HEALTHELP: "..HEALTHELP.."")
print("HALOS: "..HALOS.."")
print("")
print("AUTOSTART: "..AUTOSTART.."")
print("AUTOREPEAT: "..AUTOREPEAT.."")
print("MINENEMIES: "..MINENEMIES.."")
print("MAXHELP: "..MAXHELP.."")
print("MAXGUNSHOTINVESTIGATE: "..MAXGUNSHOTINVESTIGATE.."")
print("LostPlayerTimeout: "..LostPlayerTimeout.."")
print("TIME_BETWEEN_WAVES: "..TIME_BETWEEN_WAVES.."")
print("")
print("WEAPONOFFSET: "..WEAPONOFFSET.."")
print("RPGMAX: "..RPGMAX.."")
print("KILL_UNUSED_WEAPONS: "..KILL_UNUSED_WEAPONS.."")
print("Weapons that TheHunt spawns: ")
PrintTable(MEDIUMWEAPONS)
end)
concommand.Add( "helpme", function()
print("Commands")
print("seesettings: See the current settings. You can change them (for this map only) by typing lua_run VARIABLE=VALUE, like lua_run RPGMAX=25")
print("This section is in development right now.")

end )
concommand.Add( "hidezones", function()
hidezones()
print("All sprites removed.")
end)

concommand.Add( "assplode", function(ply)
if ply:IsAdmin() then
ent = ents.Create( "env_explosion" )
ent:SetPos(ply:GetEyeTraceNoCursor().HitPos)
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "100" )
print("assploded")
ent:Fire("Explode",0,0)
end
end )
concommand.Add( "assplodeinv", function(ply)
if ply:IsAdmin() then
ent = ents.Create( "env_physexplosion" )
ent:SetPos(ply:GetEyeTraceNoCursor().HitPos)
ent:SetKeyValue( "spawnflags", 1 )
ent:SetKeyValue("radius", 300)
ent:SetKeyValue( "magnitude", 20 )
ent:Spawn()
--ent:EmitSound( "siege/big_explosion.wav", 500, 500 )
print("assploded inv")
ent:Fire("Explode",0,0)
end
end )
concommand.Add( "beam", function(ply)
if ply:IsAdmin() then
local laser = ents.Create( "env_beam" )
	laser:SetPos( ply:GetEyeTraceNoCursor().HitPos)
	laser:SetKeyValue( "StrikeTime", "0.2" )
	laser:SetKeyValue( "spawnflags", "5" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )
	laser:SetKeyValue( "TextureScroll", "1" )
	laser:SetKeyValue( "Damage", "11" )
	--laser:SetKeyValue( "renderfx", "6" )
	laser:SetKeyValue( "NoiseAmplitude", ""..math.random(5,2) )
	laser:SetKeyValue( "BoltWidth", "1" )
	laser:SetKeyValue( "TouchType", "0" )
--	laser:SetKeyValue( "LightningStart",  )
--	laser:SetKeyValue( "LightningEnd",  )
	laser:SetKeyValue("Radius", "100")
	laser:SetKeyValue("life", "0.5")
	laser:Spawn()
	laser:Activate()
	end
end )
concommand.Add( "SpawnMetropolice", function(ply)
if ply:IsAdmin() then
SpawnMetropolice( ply:GetEyeTraceNoCursor().HitPos )
print("Spawned.")
end
end )
concommand.Add( "SpawnFastZombie", function(ply)
if ply:IsAdmin() then
SpawnFastZombie( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end
end )
concommand.Add( "SpawnRebel", function(ply)
if ply:IsAdmin() then
SpawnRebel( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end
end )
concommand.Add( "SpawnRollermine", function(ply)
if ply:IsAdmin() then
SpawnRollermine( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end
end )
concommand.Add( "spawnSNPC", function(ply)
if ply:IsAdmin() then
spawnSNPC( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned. LOL")
end
end )
concommand.Add( "SpawnCombineElite1", function(ply)
if ply:IsAdmin() then
SpawnCombineElite1( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnCombineElite2", function(ply)
if ply:IsAdmin() then
SpawnCombineElite2( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnTurret", function(ply)
if ply:IsAdmin() then
SpawnTurret( ply:GetEyeTraceNoCursor().HitPos + Vector(0,0,5), ply:EyeAngles())
print("Spawned.")
end
end )
concommand.Add( "SpawnCombineS1", function(ply)
if ply:IsAdmin() then
SpawnCombineS1( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnCombineS2", function(ply)
if ply:IsAdmin() then
SpawnCombineS2( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnScanner", function(ply)
if ply:IsAdmin() then
SpawnScanner( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnFriendlyRollermine", function(ply)
if ply:IsAdmin() then
SpawnFriendlyRollermine( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )
concommand.Add( "SpawnCombineSFlashlight", function(ply)
if ply:IsAdmin() then
SpawnCombineSFlashlight( ply:GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end
end )



concommand.Add( "firstwave", function()
Wave = 1
timer.Create( "firstwave", 2, CombineFirstWave, firstwave )
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )	
end )
concommand.Add( "secondwave", function()
Wave = 2
timer.Create( "secondwave", 2, CombineSecondWave, secondwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )	

end )
concommand.Add( "thirdwave", function()
Wave = 3
timer.Create( "thirdwave", 2, CombineThirdWave, thirdwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )	

end )
concommand.Add( "fourthwave", function()
Wave = 4
timer.Create( "fourthwave", 2, CombineFourthWave, fourthwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )	

end )
concommand.Add( "fifthwave", function()
Wave = 5
timer.Create( "fifthwave", 2, CombineFifthWave, fifthwave ) 
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )	
end )

concommand.Add( "infinitewave", function()
Wave = 6
infinitewavehandler()
end )
concommand.Add( "combinehatecrates", function()
for k, v in pairs(ents.FindByClass("npc_combine_s")) do
v:AddRelationship("prop_physics D_HT 999")
v:AddRelationship("prop_physics_multiplayer D_HT 999")

end
end)

function NUMPLAYERS()
PLAYERSINMAP=0
for k, v in pairs(ents.FindByClass("player")) do
PLAYERSINMAP=PLAYERSINMAP+1
end
end

-- UTILITY COMMANDS ^


-- UTILITY FUNCTIONS v (called by the commands or by game hooks)
function OverwatchAmbientOne()
		table.Random(player.GetAll()):EmitSound(table.Random(OverwatchAmbientSoundsOne), 100, 100)
end

function GM:PlayerDeathThink(ply)
if PLAYERSINMAP > 1 then 
if MAXDEATHS == ply:Deaths() or MAXDEATHS > ply:Deaths() then
if ply:KeyPressed(IN_ATTACK2) then
ply:SpectateEntity(table.Random(player.GetAll()))
end

if !timer.Exists("Playernoobspawn") then
timer.Create( "Playernoobspawn", NOOBPUNISH, 1, function() ply:UnSpectate() ply:SetDeaths(0) ply:SetFrags(0) ply:Spawn() end ) 
end

else

--if !timer.Exists("Playerspawn") then
if ply:KeyPressed(IN_ATTACK2) then
ply:UnSpectate()
ply:Spectate(4)
ply:SetMoveType(10)
ply:SpectateEntity(table.Random(player.GetAll()))
end

if ply:KeyPressed(IN_ATTACK) then
ply:UnSpectate()
ply:Spawn()
end
end

elseif ply:KeyPressed(IN_ATTACK) then
ply:Spawn()
end
end


function GM:DoPlayerDeath( ply, attacker, dmginfo )
NUMPLAYERS()
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

ply:CreateRagdoll()
ply:AddDeaths(1)
table.foreach( ply:GetWeapons(), function(key,value)
if key > 1 then
print(value:GetClass())
SpawnItem(value:GetClass(), ply:GetPos()+Vector(math.random(-30,30),math.random(-30,30),20), Angle(0,0,0))
end
end)

timer.Create( "ddd", 3, 1, function()
if PLAYERSINMAP > 1 then 
if MAXDEATHS == ply:Deaths() or MAXDEATHS > ply:Deaths() then
ply:Spectate(4)
ply:SetMoveType(10)
ply:PrintMessage(HUD_PRINTTALK, "You have no lifes left. You will respawn in "..NOOBPUNISH.." seconds.")
ply:PrintMessage(HUD_PRINTTALK, "While you wait, think on a better strategy for the next time.")
else
ply:PrintMessage(HUD_PRINTTALK, "You have "..MAXDEATHS-ply:Deaths().." lifes left.")
end
end
end)
end

function NearbyEntities()
print("Entities found:")
for k, v in pairs(ents.FindInSphere(player.GetByID(1):GetPos(),256)) do
print(""..v:GetClass()..", "..v:GetName().."")
 end
 print("End of entities")
end

function autofirstwave()
timer.Create( "firstwave", 2, CombineFirstWave, firstwave )
WAVESPAWN = 1
timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )		
end

function wavefinishedchecker()
timer.Create( "wavefinishedchecker", 10, 1, wavefinishedchecker)
EnemiesRemainining=0

table.foreach(MainEnemies, function(key,enemy)
for k, npc in pairs(ents.FindByClass(enemy)) do
EnemiesRemainining=EnemiesRemainining+1
end
end)

if EnemiesRemainining >= MINENEMIES then CanCheck = 1 end

if CanCheck == 1 then 
	if EnemiesRemainining < MINENEMIES then 
	waveend()
	CanCheck = 0
	end
end
end

function waveend()
		WAVESPAWN = 1

		OverwatchAmbientOne()
		if Wave < 5 then
			PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..Wave.." proven unable to contain hostiles.")
		end
		timer.Simple(TIME_BETWEEN_WAVES, function()
		timer.Simple( 30, function() CanCheck = 1 print("Can check is 1, wave can be defeated now.") end )
		timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )		
		if Wave == 1 then timer.Create( "secondwave", 2, CombineSecondWave, secondwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 2 then timer.Create( "thirdwave", 2, CombineThirdWave, thirdwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 3 then timer.Create( "fourthwave", 2, CombineFourthWave, fourthwave ) 
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		if Wave == 4 then timer.Create( "fifthwave", 2, CombineFifthWave, fifthwave )  
		PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Nº"..(Wave+1).." dispatched.") end
		end)
		if Wave == 5 or Wave == 6 then 
				if INFINITE_MODE == 1 then
				infinitewavehandler()
				elseif AUTOREPEAT == 1 then
				timer.Simple(5, autofirstwave)
				PrintMessage(HUD_PRINTTALK, "Combine Defeated! Restarting Squads!")
				end

		end
		end
		
function infinitewavehandler()
		WAVESPAWN = 1

CanCheck = 0
Wave=6
PrintMessage(HUD_PRINTTALK, "[Overwatch]: Dude you fucked up.")

if math.random(1,2) == 2 then
	timer.Simple(20, function()
	timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )		
	timer.Create( "infinitewave", 2, CombineInfiniteWave, infinitewave )
	timer.Simple(20, function() CanCheck = 0 end)
	end)
	timer.Create( "launchanisters", 3, 5, function()
	SpawnCanister(table.Random(player.GetAll()):GetPos())
	end	) 

else
	timer.Simple( 20, function() WAVESPAWN = 0 print("wavespawn is now 0") end )		
	timer.Create( "infinitewave", 2, CombineInfiniteWave, infinitewave )
end

end
function CreateHeliPath(pos)
creating = ents.Create( "path_track" )
creating:SetPos( pos )
creating:Spawn()
end
function restorecombineassistance ()
		if CombineAssisting > 0 then
			CombineAssisting = 0
		--	print("Combines helping automatically decreased to "..CombineAssisting.." of "..MAXHELP.."")
		end
end
function hidezones()
	for k, v in pairs(ents.FindByName("ZoneReveal") ) do
	v:Remove()
	end
end
function SpawnHeliA( pos,type )
RunConsoleCommand( "sk_helicopter_health", "1500") 
RunConsoleCommand( "g_helicopter_chargetime", "2") 
RunConsoleCommand( "sk_helicopter_burstcount", "12") 
RunConsoleCommand( "sk_helicopter_firingcone", "20") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
timer.Create( "helibehavior", 1, 1, helibehavior ) 
timer.Create( "helipath", 1, 1, helipath ) 
timer.Create( "usedpaths", 1, 1, usedpaths ) 
HeliIsDead = 0

HeliA = ents.Create( ""..type.."" )
-- HeliA:SetKeyValue( "target", "2" )
HeliA:SetKeyValue( "targetname", "Heli" )
--HeliA:SetKeyValue( "ignoreunseenenemies", 1 )
HeliA:SetKeyValue( "spawnflags", "262144" )
HeliA:SetKeyValue( "patrolspeed", "500" )
HeliA:SetKeyValue("squadname", "heliaforce")
HeliA:SetPos( pos )
if type == "npc_combinegunship" then
RunConsoleCommand( "sk_gunship_health_increments", 8) 
HeliA:Fire("SetPenetrationDepth ","24",0)
HeliA:Fire("BlindfireOn","",0)
end

HeliA:Spawn()
HeliA:Activate()
HeliA:Fire("activate","",0)
-- HeliA:Fire("missileon","",0)
HeliA:Fire("gunon","",0)
if HeliCanSpotlight == 1 then

helispotlight = ents.Create("env_projectedtexture");
helispotlight:SetPos(HeliA:GetPos());
helispotlight:SetAngles(HeliA:GetAngles()+Angle(30,0,0) );
helispotlight:SetParent(HeliA);
helispotlight:SetKeyValue("spawnflags", 2);
helispotlight:SetKeyValue("enableshadows", 1);
helispotlight:SetKeyValue("farz", 2000);
helispotlight:SetKeyValue("target", "");
helispotlight:SetKeyValue("nearz", 400);
helispotlight:SetKeyValue("lightfov", 20);
helispotlight:SetKeyValue("lightcolor", "0 255 255")
helispotlight:SetKeyValue("shadowquality", 1)
helispotlight:SetKeyValue("lightstrength", 5)
-- helispotlight:SetKeyValue("style", 6);
helispotlight:Spawn();
helispotlight:Activate();

HeliAFocus = ents.Create( "point_spotlight" )
HeliAFocus:SetPos(HeliA:GetPos()+(HeliA:GetForward()*150+Vector(0,0,-50)))
HeliAFocus:SetAngles(helispotlight:GetAngles())
HeliAFocus:SetParent(helispotlight)
HeliAFocus:SetKeyValue( "spawnflags", "1" )
HeliAFocus:SetKeyValue( "SpotlightWidth", "50" )
HeliAFocus:SetKeyValue( "SpotlightLength", "200" )
HeliAFocus:SetKeyValue("rendercolor", "100 200 200")
--NPCSpotlight:SetColor(0,0,0,255)
HeliAFocus:Spawn()
HeliAFocus:Activate()
end
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
timer.Create( "Scanner Wander", 1, 1, scannerwander ) 
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

local canister = ents.Create( "env_headcrabcanister" )

--RocketLauncher:SetKeyValue( "angles", "0 0 90" )
canister:SetAngles(Angle(-70,math.random(180,-180),0))
canister:SetPos(pos + Vector(math.random(200,-200),math.random(200,-200),0))
canister:SetKeyValue( "HeadcrabType", math.random(0,2) )
canister:SetKeyValue( "HeadcrabCount", math.random(1,4) )
canister:SetKeyValue( "FlightSpeed", "9000" )
canister:SetKeyValue( "FlightTime", "3" )
canister:SetKeyValue( "StartingHeight", "0" )
canister:SetKeyValue( "Damage", "5" )
canister:SetKeyValue( "DamageRadius", "5" )
canister:SetKeyValue( "SmokeLifetime", "5" )
canister:SetKeyValue( "MaxSkyboxRefireTime", "5" )
canister:SetKeyValue( "MinSkyboxRefireTime", "1" )
canister:SetKeyValue( "SkyboxCannisterCount", "30" )
canister:Fire("FireCanister","",0.7)
canister:Spawn()
end
function SpawnRebel( pos )
NPC = ents.Create( "npc_citizen" )
NPC:SetPos( pos )
NPC:SetKeyValue("squadname", "Rebels")
NPC:Spawn()
NPC:SetHealth("100")
NPC:Give("ai_weapon_ar2")
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_PERFECT )	
NPC:Fire("StartPatrolling","",0)
end
function SpawnFastZombie( pos )
NPC = ents.Create( "npc_fastzombie" )
NPC:SetPos( pos )
NPC:Spawn()
NPC:SetHealth("90000")
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
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_AVERAGE )
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
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_GOOD )	
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
NPC:SetCurrentWeaponProficiency( WEAPON_PROFICIENCY_POOR )	
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

function PropBreak(breaker,prop)
if math.random(1,1) == 1 then
	if prop:IsValid() then
		if prop:GetModel() == "models/props_junk/wood_crate002a.mdl"
		or prop:GetModel() == "models/props_junk/wood_crate001a_damaged.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a_damagedmax.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a_damagedmax.mdl" 
		or prop:GetModel() == "models/props_junk/wood_crate001a.mdl" 
		then
		SpawnItem(""..table.Random(CRATEITEMS).."", prop:GetPos(), Angle(0,0,0))
		end
	end
end

if breaker:IsPlayer() then
nearbycombinecomecasual(breaker)
end
end
hook.Add("PropBreak","OnPropBreak",PropBreak)



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
ITEM:SetKeyValue("minhealthdmg", 6000)
end
-- UTILITY FUNCTIONS ^


-- v PRE-PLAY THINGS
function GM:PlayerSpawn(ply)

-- MapLoadout() Placeholder
--	ply.safe=yes
    ply:SetCustomCollisionCheck(true)
	ply:StripAmmo()
	ply:StripWeapons()
	ply:Give("weapon_crowbar")
--	ply:Give("weapon_physcannon")
--	ply:Give(table.Random(MEDIUMWEAPONS))
	ply:SetupHands()
	ply:SetWalkSpeed(150)
	ply:SetRunSpeed(250)
	ply:SetCrouchedWalkSpeed(0.3)
	ply:AllowFlashlight(true)
	ply:SetNoCollideWithTeammates(1)
--	ply:SetCollisionGroup(11)
	timer.Simple(1, npcforget)
if math.random(1,2) == 1 then
ply:SetModel(table.Random(playermodelsmale) )
ply.sex="male"
print("male")
else
ply:SetModel(table.Random(playermodelsfemale) )
ply.sex="female"
print("female")
end
end
-- ^ PRE-PLAY THINGS

-- CYCLES v
function coverzones()
timer.Create( "coverzones", 20, 0, coverzones ) 	
print("Patrol Areas updated:")
for k, v in pairs(ents.FindByClass("npc_combine_s")) do
	if !v:GetEnemy() then 
		if 	!v:IsCurrentSchedule(SCHED_FORCED_GO) && !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
		v:SetLastPosition(table.Random(zonescovered) + Vector(math.random(-20,20), math.random(-20,20), -30))
			if WAVESPAWN == 1 then
			v:SetSchedule(SCHED_FORCED_GO_RUN)
			else
			v:SetSchedule(SCHED_FORCED_GO)
			end
		print(""..v:GetName().." changed patrol area")
		end
	end
end

for k, v in pairs(ents.FindByClass("npc_metropolice")) do
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
end

function wander()
--	print("NPC on map:")
	for k, v in pairs(ents.FindByClass("npc_*") ) do
	if v:IsNPC() then --print(v:GetName())
	end
	end
timer.Create( "CountNPC", 50, 0, wander)
--print("")
end

function metropolicewander()
for k, v in pairs(ents.FindByClass("npc_metropolice")) do
if !v:GetEnemy() then
if !v:IsCurrentSchedule(SCHED_FORCED_GO) && !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
v:SetSchedule(SCHED_IDLE_WANDER)
-- print(""..v:GetName().." is wandering now")
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
		--	print(NPCsFound)
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
print("npcforget APPLIED")
table.foreach(player.GetAll(), function(key,value)
--value:SetNWInt("status", "safe" )
net.Start( "Hidden" )
net.Send(value)
value.spotted = 0
end)
table.foreach(MainEnemies, function(key,enemy)
for k, v in pairs(ents.FindByClass(enemy)) do 
v:SetKeyValue("squadname", "")
if v:GetEnemy() then if v:GetEnemy():IsPlayer() then
--v:GetEnemy():PrintMessage(HUD_PRINTTALK, ""..v:GetName().." lost "..v:GetEnemy():GetName().."")
v:ClearEnemyMemory() 
v:SetEnemy(nil)
v:SetSchedule(SCHED_FORCED_GO_RUN)
end
end
end
end)
end



function GM:PlayerConnect( name, address )
--if thereareplayers == 0 then
--timer.Simple(10, autofirstwave)
--thereareplayers = 1
--end
end

function GM:InitPostEntity()


if AUTOSTART == 1 && win == 1 then
timer.Simple(10, autofirstwave)
end

timer.Create( "CountNPC", 3, 1, wander )
timer.Create( "Item Respawn System", 10, 1, ItemRespawnSystem )
timer.Create( "CombineIdleSpeech", math.random(5,15), 0, CombineIdleSpeech ) 
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 
timer.Create( "coverzones", 10, 1, coverzones )
timer.Create( "wavefinishedchecker", 5, 1, wavefinishedchecker)
CanCheck = 0
MapSetup()
/*
for k, v in pairs(ents.FindByClass("prop_physics")) do
if v:GetModel() == "models/props_c17/furnituredrawer001a.mdl" or v:GetModel() == "models/props_c17/furnitureshelf002a.mdl" or v:GetModel() == "models/props_interiors/furniture_desk01a.mdl" or v:GetModel() == "models/warby/wan_prop_caffe_table_01.mdl" or v:GetModel() == "models/props_junk/trashdumpster01a.mdl" or v:GetModel() == "models/props_c17/bench01a.mdl" or v:GetModel() == "models/props_wasteland/cafeteria_table001a.mdl" then 

table.insert(ITEMPLACES, v:GetPos()+Vector(0,0,30))
print("found one, "..v:GetModel().."")
end
end
*/
end

function GM:GetFallDamage( ply, speed )
	return ( speed / 60 )
end
function GM:OnEntityCreated(entity)
	if entity:IsNPC() && entity:GetClass() != "npc_helicopter" && entity:GetClass() != "npc_combinegunship"  && entity:GetClass() != "npc_combine_s" && entity:GetClass() != "npc_metropolice" && entity:GetName() == "" then
	ManuallySpawnedEntity = ManuallySpawnedEntity + 1
	entity:SetName("NPC nº"..ManuallySpawnedEntity.."")
	print(entity:GetName())
	end
end

function CicloUnSegundo()


table.foreach(MainEnemiesCoop, function(key,enemy)
for k, npc in pairs(ents.FindByClass(enemy)) do
if npc:Health() > 0 then

if npc:GetEnemy() then
	if npc:IsCurrentSchedule(SCHED_FORCED_GO) or npc:IsCurrentSchedule(SCHED_IDLE_WANDER) or npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN)	then npc:ClearSchedule() end
if npc:GetEnemy():IsPlayer() then
npc:SetKeyValue("squadname", "CombineSquad")
if npc:GetEnemy().spotted != 1 then
if npc:GetClass() == "npc_combine_s" || npc:GetClass() == "npc_metropolice" then
npc:EmitSound(table.Random(ContactConfirmed), 100, 100) end

net.Start("Spotted")
net.Send(npc:GetEnemy())
npc:GetEnemy().spotted = 1
end

	if npc:HasCondition(10) then
		if timer.Exists("npcforgettimer") then
		timer.Destroy( "npcforgettimer")
		print("npcforget STOPPED")
		end
		for num, ThisEnt in pairs(ents.FindInSphere(npc:GetPos(),2000)) do 
		if ThisEnt:GetClass() == "npc_combine_s" || ThisEnt:GetClass() == "npc_metropolice" then
				if ThisEnt:GetEnemy() == nil  then 
					if CombineAssisting < MAXHELP then
					print("combine palla")
					print(ThisEnt:GetName().." is helping "..npc:GetName().."")
					ThisEnt:SetLastPosition(npc:GetEnemy():GetPos())
					ThisEnt:SetSchedule(SCHED_FORCED_GO_RUN)
					CombineAssisting = CombineAssisting+1
				--	print("Combines helping: "..CombineAssisting.." of "..MAXHELP.."")
					end
				end
		end
		end
	else
		if !timer.Exists("npcforgettimer") then
		timer.Create( "npcforgettimer", LostPlayerTimeout, 1, npcforget ) 
		print("npcforget ACTIVE")
		end
	end		
end
end
end
end
end)
/*
	for k, turret in pairs(ents.FindByClass("npc_turret_floor")) do 
		for num, v in pairs(ents.FindInSphere(turret:GetPos(), 40)) do
			if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
			turret:SetAngles(Angle(1,1,0))
			end
		end
	end	
*/
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 
end

function helibehavior()
if HeliA then
if HeliIsDead != 1 then
		if HeliA:GetEnemy() then
			print ("heli has enemy: "..HeliA:GetEnemy():GetName().."")
				if HeliA:GetEnemy():IsNPC() && HeliCanSpotlight == 1 then
					helispotlight:Fire("Target", HeliA:GetEnemy():GetName(), 0)
					end
				if HeliA:GetEnemy():IsPlayer() && HeliCanSpotlight == 1 then
				HeliA:GetEnemy():SetName(""..tostring(HeliA:GetEnemy():GetName()).."focus")
				helispotlight:Fire("Target", ""..tostring(HeliA:GetEnemy():GetName()).."focus", 0)
				end
if HeliA:HasCondition(10) then
nearbycombinecome(HeliA,HeliA:GetEnemy())
end
		end
end
end
timer.Create( "helibehavior", 1, 1, helibehavior ) 

end
function helipath()
if HeliA:IsValid() && HeliA:GetEnemy() == nil then
	for num, HeliTrack in pairs(ents.FindInSphere(HeliA:GetPos(), 1700)) do
		if HeliCanSpotlight == 1 then helispotlight:Fire("Target", "", 0)	end
			if HeliTrack:IsValid() && HeliTrack:GetClass() == "path_track" && HeliTrack:GetName() != "used" then
			if HeliA:Visible(HeliTrack) then
			--	print("found "..HeliTrack:GetName().."")
				HeliTrack:SetName("going")
				HeliA:Fire("SetTrack","going",0)
				Usada = HeliTrack
			--	print(Usada)
				timer.Create( "GoingToUsed", 0, 1, goingtoused ) 
				timer.Create( "helipath", math.random(3,6), 0, helipath ) 
				timer.Create( "usedpaths", 7, 0, usedpaths ) 
				return false
			end
			end
	end
		
elseif  HeliA:IsValid() && HeliA:GetEnemy() != nil then
	for num, HeliTrack in pairs(ents.FindInSphere(HeliA:GetEnemy():GetPos(), 2000)) do
		if HeliTrack:IsValid() && HeliTrack:GetClass() == "path_track" && HeliTrack:GetName() != "used" then	
			if HeliA:Visible(HeliTrack) && HeliTrack:Visible(HeliA:GetEnemy()) then
			--	print("found "..HeliTrack:GetName().."")
				HeliTrack:SetName("going")
				HeliA:Fire("SetTrack","going",0)
				HeliA:SetVelocity(Vector(2,2,2))
				Usada = HeliTrack
			--	print(Usada)
				timer.Create( "GoingToUsed", 0, 1, goingtoused ) 
				timer.Create( "helipath", math.random(4,8), 0, helipath ) 
				timer.Create( "usedpaths", 9, 0, usedpaths ) 
				return false
			end
		end
	end
end
-- timer.Create( "helipath", math.random(3,6), 0, helipath ) 
end


function goingtoused()
		Usada:SetName("used")
	--	print("Changed to Used")
end

function usedpaths()
if HeliA:IsValid() then
	for num, HeliTrack in pairs(ents.FindInSphere(HeliA:GetPos(), 200560)) do
				if HeliTrack:GetName() == "used" then
					HeliTrack:SetName("empty")
					--print("found used and emptied")
					Usada:SetName("used")
				end
	end
	end
-- timer.Create( "usedpaths", 40, 0, usedpaths ) 
end


function scannerwander()
	for numA, scanner in pairs(ents.GetAll()) do
		if scanner:GetName() == "Scanner" then
			for numB, scannertarget in pairs(ents.FindInSphere(scanner:GetPos(), 25600)) do
				if scannertarget:IsNPC() then
					if scanner:GetEnemy() == nil && scannertarget:GetClass() == "npc_metropolice" || scannertarget:GetClass() == "npc_combine_s" then
					scanner:Fire("SetFollowTarget",""..scannertarget:GetClass().."",0)
					if mines != 1 then
					scanner:Fire("EquipMine","",0)
					scanner:Fire("DeployMine","",2)
					local mines = 1
					end
					end
				end
			end
		end
	end
timer.Create( "Scanner Wander", 30, 1, scannerwander )
mines = 0
end
-- CYCLES ^

-- GM HOOKS v
function GM:OnNPCKilled(victim, killer, weapon)
-- Uncomment to for-the-lulz explosion kills
/*
ent = ents.Create( "env_explosion" )
ent:SetPos(victim:GetPos())
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "100" )
print("assploded")
ent:Fire("Explode",0,0)
*/



if victim:GetClass() == "npc_turret_floor" then
print("turret killed")
nearbycombinecome(victim)
for k, v in pairs(ents.FindInSphere(victim:GetPos(),1024)) do
if v:IsPlayer() then
net.Start( "Hidden" )
net.Send(killer)
killer.spotted = 0
print("Player killet it")

end
end
end


if victim:GetClass() == "npc_turret_ceiling" then
nearbycombinecome(killer)
end

if victim:GetClass() == "npc_combinegunship" then
HeliIsDead = 1
timer.Stop( "helipath")
timer.Stop( "usedpaths")
timer.Stop( "helibehavior")
end

if victim:GetClass() == "npc_helicopter" then
timer.Stop( "helipath")
timer.Stop( "usedpaths")
timer.Stop( "helibehavior")
end

if killer:IsNPC() then
if killer:Health() > 0 then
	if killer:GetClass() == "npc_combine_s" then
	killer:EmitSound(table.Random(CombineKillSounds), 100, 100)
	end
PrintMessage(HUD_PRINTTALK, ""..killer:GetName().." killed "..victim:GetName().."")
end
end

if killer:IsPlayer() then
net.Start( "Hidden" )
net.Send(killer)
killer.spotted = 0

if killer:Alive() then
	if victim:GetClass() == "npc_metropolice" || victim:GetClass() == "npc_combine_s" then
		local MAX=0
		local TALK=0
		for k, see in pairs(ents.FindInSphere(victim:GetPos(),256)) do
			if see:GetClass() == "npc_combine_s" && see:EntIndex() != victim:EntIndex() then
				if TALK<1 then
				see:EmitSound(table.Random(CombineKilledSounds), 360, 100)
				TALK=TALK+1
				end
				if see:GetEnemy() == nil then
					if see:Visible(victim) then 
					if MAX < 1 then
						print("SOSPECHA")
					--	victim:SetName("kill")
						see:Fire("ThrowGrenadeAtTarget",""..tostring(victim:GetName()) .."",0)
					--	see:SetEnemy(killer)
					--	print(see)
						MAX=MAX+1
					end
					end
					elseif math.random (1,8) == 1 then
						killer:SetName("player")
						see:Fire("ThrowGrenadeAtTarget","player",0)
					end
				end
			end
		if victim:GetEnemy() then
			CombineAssisting = 0	
			PrintMessage(HUD_PRINTTALK, ""..killer:GetName().." killed "..victim:GetName().."")
			nearbycombinecome(killer)
			if killer.sex == "male"  then
				killer:EmitSound(table.Random(malecomments), 360, 100)
			else
				killer:EmitSound(table.Random(femalecomments), 360, 100)
			end
		end
		if !victim:GetEnemy() then
			if weapon:GetClass() == "npc_tripmine" || weapon:GetClass() == "npc_satchel" then
			killstyle = 2
			--print("MINE")
			elseif killer:GetActiveWeapon():GetClass() != "weapon_crowbar" && killer:GetActiveWeapon():GetClass() != "weapon_crossbow"  then
			killstyle = 2
			--print("WEAPON")
			elseif killer:GetActiveWeapon():GetClass() == "weapon_crowbar"  || killer:GetActiveWeapon():GetClass() == "weapon_crossbow" then
			killstyle = 3
			--print("SILENT")
			end
			if killstyle == 3 then
				PrintMessage(HUD_PRINTTALK, ""..killer:GetName().." killed "..victim:GetName().." silently")
				if killer:Frags() < 1 then
				timer.Simple(2 , function()	killer:EmitSound("music/hl1_song11.mp3", 40, 100)end)
				end
			end
			if killstyle == 2 then
				PrintMessage(HUD_PRINTTALK, ""..killer:GetName().." killed "..victim:GetName().." (loud)")
				CombineAssisting = 0
				nearbycombinecome(victim)
			end
		end
	end

end
killer:AddFrags(1)
end
end

function helideath()
if HeliA:IsValid() && HeliIsDead != 1 then
HeliIsDead = 1
helispotlight:Remove()
HeliAFocus:Remove()
--HeliA:Fire("Kill","",5)
timer.Create( "SpawnRollermine", 2, 2, function()
SpawnRollermine(HeliA:GetPos() + Vector(0, 0, -100))
end)
--HeliA:Fire("SelfDestruct","",0)
HeliA:Fire("SelfDestruct","",5)
PrintMessage(HUD_PRINTCENTER, "You killed the Helicopter!")
timer.Stop( "helipath")
timer.Stop( "usedpaths")
end
end

function GM:EntityTakeDamage(damaged,damage)
if damage:GetAttacker():GetClass() =="monster_apc" then
damage:ScaleDamage(NPCSCALEDAMAGE)
end



if !damaged:IsNPC() then
nearbycombinecomecasual(damage:GetAttacker())
end

if damaged:IsNPC() then
if damage:GetAttacker():IsPlayer() then
if damaged:Health() > damage:GetDamage() then
damage:GetAttacker():SetNoTarget(false)
end
end
	if damaged:GetClass() != "npc_helicopter" && damaged:GetClass() != "npc_combinegunship" then
		if damaged:GetEnemy() == nil then
		damage:ScaleDamage(NPCSCALEDAMAGE*2)
		else
		damage:ScaleDamage(NPCSCALEDAMAGE)
		end
		if damaged:Health() > damage:GetDamage() then
		damaged:SetEnemy(damage:GetAttacker())
		end
	end
end
if damaged:IsPlayer() then
damage:ScaleDamage(PLAYERSCALEDAMAGE)
end


if FRIENDLYFIRE != 1 then
	if damaged:IsPlayer() && damage:GetAttacker():IsPlayer() then
		if damaged:EntIndex() == damage:GetAttacker():EntIndex() then
		damage:ScaleDamage(PLAYERSCALEDAMAGE)
		else
		damage:ScaleDamage(0)
		end
	end
	if damaged:IsNPC() && damage:GetAttacker():IsNPC() then
	if damaged:GetClass() == damage:GetAttacker():GetClass() then
		damage:ScaleDamage(0)
	end
	end
end

if damaged:GetClass() == "npc_helicopter" then
if damaged:Health() < 800 && HeliIsDead != 1 then
if HeliAangered == 0 then
PrintMessage(HUD_PRINTTALK, "[Overwatch]: Air enforcement unit, you are now free to employ aggresive containment tactics.")

RunConsoleCommand( "g_helicopter_chargetime", "1") 
HeliA:Fire("BlindfireOn","",0)
HeliA:Fire("SetPenetrationDepth","200",0)
RunConsoleCommand( "g_helicopter_chargetime", "1") 
RunConsoleCommand( "sk_helicopter_burstcount", "10") 
RunConsoleCommand( "sk_helicopter_firingcone", "2") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
HeliA:SetKeyValue( "patrolspeed", "5000" )
if HeliCanSpotlight == 1 then
helispotlight:SetKeyValue("lightcolor", "255 0 0") 
HeliAFocus:Remove()
HeliAFocus = ents.Create( "point_spotlight" )
HeliAFocus:SetPos(HeliA:GetPos()+(HeliA:GetForward()*150+Vector(0,0,-50)))
HeliAFocus:SetAngles(helispotlight:GetAngles())
HeliAFocus:SetParent(helispotlight)
HeliAFocus:SetKeyValue( "spawnflags", "1" )
HeliAFocus:SetKeyValue( "SpotlightWidth", "50" )
HeliAFocus:SetKeyValue( "SpotlightLength", "200" )
HeliAFocus:SetKeyValue("rendercolor", "255 0 0")
HeliAFocus:Spawn()
HeliAFocus:Activate()
end
HeliAangered = 1
end

if damaged:Health() < 151 then
PrintMessage(HUD_PRINTTALK, "[Overwatch]: All units, "..damaged:GetName().." state changed to: inoperative.")
timer.Simple(1 , helideath)
creating = ents.Create( "info_target_helicopter_crash" )
creating:SetPos(damage:GetAttacker():GetPos() + Vector(0, 0, 500))
creating:Spawn()
creating:SetParent(damage:GetAttacker())
end

end
end


if damaged:GetClass() == "npc_sniper" then
print(damage:GetInflictor():GetClass())
if damage:GetInflictor():GetClass() == "crossbow_bolt" or damage:IsDamageType(64) then
damaged:SetHealth(0)
PrintMessage(HUD_PRINTTALK, ""..damage:GetAttacker():GetName().." got that Sniper out of the way ")
end
end

if damaged:GetClass() == "npc_turret_ceiling" then
if damage:IsDamageType(64) then
--damage:ScaleDamage(1)
damaged:SetHealth(0)
PrintMessage(HUD_PRINTTALK, ""..damage:GetAttacker():GetName().." got that Ceiling Turret out of the way ")
else
damage:ScaleDamage(0)
end
end
if damaged:GetClass() == "npc_helicopter" then
if damage:IsDamageType(64) then
damage:ScaleDamage(1)
else
damage:ScaleDamage(0)
end
end

end
function GetAmmoForCurrentWeapon( ply )
	if (  !IsValid( ply ) ) then return -1 end

	local wep = ply:GetActiveWeapon()
	if (  !IsValid( wep ) ) then return -1 end
 
	print(ply:GetAmmoCount(wep:GetPrimaryAmmoType()))
end
function GM:KeyPress(player,key)

	if player:Alive() then
	
		if player:GetAmmoCount(player:GetActiveWeapon():GetPrimaryAmmoType()) < 2 && player:GetActiveWeapon():GetClass() == "weapon_frag" then
		if key == IN_ATTACK2 or key == IN_ATTACK then
		timer.Simple(1, function()
		player:StripWeapon("weapon_frag")
		end)
		end
		end
		
		if player:GetAmmoCount(player:GetActiveWeapon():GetPrimaryAmmoType()) > 0 then
			if key == IN_ATTACK2 then
				if player:GetActiveWeapon():GetClass() == "weapon_shotgun" then allthecombinecome(player,MAXGUNSHOTINVESTIGATE)	print("combine come (shotgun)") end
			end
			if key == IN_ATTACK then
				if player:GetAmmoCount(player:GetActiveWeapon():GetPrimaryAmmoType()) > 0 then			
				local silent=0
				table.foreach(SILENT_WEAPONS, function(key,value)
				if player:GetActiveWeapon():GetClass() == value then
				silent=1
				print("combine not come")
				end
				end)
				if silent==0 then
				print("combine come (not silent)")
				allthecombinecome(player,MAXGUNSHOTINVESTIGATE)
				end
				end		
			end
		end
		
		if player:GetAmmoCount(player:GetActiveWeapon():GetSecondaryAmmoType()) > 0 then
			if key == IN_ATTACK2 then
				table.foreach(SECONDARY_FIRE_WEAPONS, function(key,value)
					if player:GetActiveWeapon():GetClass() == value then
					allthecombinecome(player,MAXGUNSHOTINVESTIGATE)
					print("combine come (not silent secondary fire)")
					end
				end)
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
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", FirstSpawn )
