AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "config.lua" )
include( "shared.lua" )
include( "config.lua" )
	


util.AddNetworkString( "Spotted" )
util.AddNetworkString( "Hidden" )

/*   CHULETA
lua_run for k, model in pairs(ents.GetAll()) do if model:GetModel() == "models/mechanics/wheels/wheel_extruded_48.mdl" then print(model:GetPos()) end end

] r_drawviewmodel 1
] cl_drawhud 1



NPC:SetKeyValue( "model", "models/elite_synth/elite_synth.mdl" )
NPC:SetSkin(1)
Get info from an entity typing this on the console while facing at it
lua_run print(player.GetByID(1):GetEyeTrace().Entity:GetAngles()) print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print(player.GetByID(1):GetEyeTrace().Entity) print(player.GetByID(1):GetEyeTrace().Entity:GetModel())
*/

function GM:Initialize()

if AUTOSTART == 1 then
timer.Simple(10, autofirstwave)
end
--RunConsoleCommand( "sv_cheats", "1") 
RunConsoleCommand( "sk_helicopter_health", "1500") 
RunConsoleCommand( "air_density", "0")
--RunConsoleCommand( "sv_cheats", "0") 
NODES = 0
end
-- WHAT-MAP-ARE-THEY-PLAYING CHECK v
if file.Exists( "gamemodes/thehunt/gamemode/maps/"..game.GetMap()..".lua", "GAME" ) then
include("/maps/"..game.GetMap()..".lua")
win = 1
else
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

CURRENTTURRETS=0

MAXTURRETS=20
-- VARIABLES ^

-- PRESET WAVES v

-- PRESET WAVES ^

-- UTILITY COMMANDS v


concommand.Add( "assplode", function()
ent = ents.Create( "env_explosion" )
ent:SetPos(player.GetByID(1):GetEyeTraceNoCursor().HitPos)
--ent:SetKeyValue( "spawnflags", 32 )
ent:Spawn()
--ent:EmitSound( "siege/big_explosion.wav", 500, 500 )
ent:SetKeyValue( "iMagnitude", "100" )
print("assploded")
ent:Fire("Explode",0,0)
end )

concommand.Add( "assplodeinv", function()
ent = ents.Create( "env_physexplosion" )
ent:SetPos(player.GetByID(1):GetEyeTraceNoCursor().HitPos)
ent:SetKeyValue( "spawnflags", 1 )
ent:SetKeyValue("radius", 300)
ent:SetKeyValue( "magnitude", 20 )
ent:Spawn()
--ent:EmitSound( "siege/big_explosion.wav", 500, 500 )
print("assploded")
ent:Fire("Explode",0,0)
end )

concommand.Add( "autoturrets", function()
local turrets=0
for k, v in pairs(ents.FindByClass("npc_combine_s")) do 
if v then if v:IsMoving() then if turrets<2 then
SpawnTurret(v:GetPos()+Vector(0,0,3)-v:GetForward()*70, v:GetAngles())
turrets=turrets+1
end
end
end
end
end)

concommand.Add( "beam", function()


local laser = ents.Create( "env_beam" )
	laser:SetPos( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
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
end )

concommand.Add( "Spotted", function()
net.Start( "Spotted" )
net.Send(player.GetByID(1))
end )
concommand.Add( "Hidden", function()
net.Start( "Hidden" )
net.Send(player.GetByID(1))
end )

concommand.Add( "NearbyEntities", function()
NearbyEntities()
end )
concommand.Add( "Hunt_Difficulty_HARD", function()
PLAYERSCALEDAMAGE = 3
NPCSCALEDAMAGE = 3
print("Difficulty changed to HARD.")
end )
concommand.Add( "Hunt_Difficulty_NORMAL", function()
PLAYERSCALEDAMAGE = 1
NPCSCALEDAMAGE = 1
print("Difficulty changed to NORMAL.")
end )
concommand.Add( "Hunt_Difficulty_EASY", function()
PLAYERSCALEDAMAGE = 0.2
NPCSCALEDAMAGE = 2
print("Difficulty changed to EASY.")
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
print("Zones Hithlighted.")
end)
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
print("Zones Hithlighted.")
end)
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
end )


function revealcoverzones()
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(table.Random(zonescovered))
sprite:SetColor( Color( 255, 0, 0 ) )
sprite:SetName("ZoneReveal")
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end

concommand.Add( "seesettings", function()
print("PLAYERSCALEDAMAGE: "..PLAYERSCALEDAMAGE.."")
print("NPCSCALEDAMAGE: "..NPCSCALEDAMAGE.."")
print("FRIENDLYFIRE: "..FRIENDLYFIRE.."")
print("LostPlayerTimeout: "..LostPlayerTimeout.."")
print("WEAPONOFFSET: "..WEAPONOFFSET.."")
print("AUTOREPEAT: "..AUTOREPEAT.."")
print("RPGMAX: "..RPGMAX.."")
print("FANCYSTATUSCHECKER: "..FANCYSTATUSCHECKER.."")
print("HALOS: "..HALOS.."")
print("HEALTHELP: "..HEALTHELP.."")
print("AUTOSTART: "..AUTOSTART.."")
end)

concommand.Add( "helpme", function()
print("")
print("Spawn Commands")
print("")
print("spawnmetro - Spawn Metropolice.")
print("spawnrollermine - Spawn Rollermine.")
print("SpawnCombineS1 - Spawn Combine Soldier.")
print("SpawnCombineSFlashlight - Spawn Combine Soldier with a FlashLight.")
print("SpawnCombineElite1 - Spawn Combine Soldier Elite.")
print("SpawnRebel - Spawn a Rebel. They have 1000 health.")
print("")
print("Utility Commands:")
print("")
print("revealzones - Show the zones the Combine cycle through. Run this command at least four times to reveal them all.")
print("hidezones - Hide them.")
print("revealhelipath - Show the points where the Helicopter can go. You cant hide them for now.")
print("")
print("Waves")
print("")
print("CAUTION: The second wave will be automatically called when you kill the first wave. Same with the third wave when you kill the second.")
print("")
print("firstwave -  Calls the first wave of combines, if the map is configured. It's mostly Metropolices.")
print("secondwave - Calls the second Combine wave. Better armed Metropolices, Soldiers and Shotgunners.")
print("thirdwave -  Calls the third Combine wave. Soldiers and Elite Soldiers.")
print("fourthwave -  Calls the third Combine wave. Grenade armed Soldiers and Elite Soldiers.")
end )


concommand.Add( "hidezones", function()
hidezones()
print("Done.")
end )
concommand.Add( "SpawnMetropolice", function()
SpawnMetropolice( player.GetByID(1):GetEyeTraceNoCursor().HitPos )
print("Spawned.")
end )
concommand.Add( "SpawnFastZombie", function()
SpawnFastZombie( player.GetByID(1):GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end )
concommand.Add( "SpawnRebel", function()
SpawnRebel( player.GetByID(1):GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end )
concommand.Add( "SpawnRollermine", function()
SpawnRollermine( player.GetByID(1):GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned.")
end )
concommand.Add( "spawnSNPC", function()
spawnSNPC( player.GetByID(1):GetEyeTraceNoCursor().HitPos + Vector(0,0,20))
print("Spawned. LOL")
end )
concommand.Add( "SpawnCombineElite1", function()
SpawnCombineElite1( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnCombineElite2", function()
SpawnCombineElite2( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnTurret", function()
SpawnTurret( player.GetByID(1):GetEyeTraceNoCursor().HitPos + Vector(0,0,5), player.GetByID(1):EyeAngles())
print("Spawned.")
end )
concommand.Add( "SpawnCombineS1", function()
SpawnCombineS1( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnCombineS2", function()
SpawnCombineS2( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnScanner", function()
SpawnScanner( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnFriendlyRollermine", function()
SpawnFriendlyRollermine( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )
concommand.Add( "SpawnCombineSFlashlight", function()
SpawnCombineSFlashlight( player.GetByID(1):GetEyeTraceNoCursor().HitPos)
print("Spawned.")
end )

concommand.Add( "firstwave", function()
Wave = 1
timer.Create( "firstwave", 2, CombineFirstWave, firstwave ) 
--timer.Create( "wavefinishedchecker", 30, 1, wavefinishedchecker)
timer.Create( "TimerRunSpawn", 30, 0, waveswalk)
end )
concommand.Add( "secondwave", function()
Wave = 2
timer.Create( "secondwave", 2, CombineSecondWave, secondwave ) 
--timer.Create( "wavefinishedchecker", 20, 1, wavefinishedchecker)
timer.Create( "TimerRunSpawn", 30, 1, waveswalk)
end )
concommand.Add( "thirdwave", function()
Wave = 3
timer.Create( "thirdwave", 2, CombineThirdWave, thirdwave ) 
--timer.Create( "wavefinishedchecker", 20, 1, wavefinishedchecker)
timer.Create( "TimerRunSpawn", 30, 1, waveswalk)
end )
concommand.Add( "fourthwave", function()
Wave = 4
timer.Create( "fourthwave", 2, CombineFourthWave, fourthwave ) 
--timer.Create( "wavefinishedchecker", 20, 1, wavefinishedchecker)
timer.Create( "TimerRunSpawn", 30, 1, waveswalk)
end )
concommand.Add( "fifthwave", function()
Wave = 5
timer.Create( "fifthwave", 2, CombineFifthWave, fifthwave ) 
--timer.Create( "wavefinishedchecker", 20, 1, wavefinishedchecker)
timer.Create( "TimerRunSpawn", 30, 1, waveswalk)
end )
-- UTILITY COMMANDS ^

-- UTILITY FUNCTIONS v (called by the commands or by game hooks)

function OverwatchAmbientOne()
		table.Random(player.GetAll()):EmitSound(table.Random(OverwatchAmbientSoundsOne), 100, 100)
end


function GM:DoPlayerDeath( ply, attacker, dmginfo )

if attacker:GetClass() == "npc_sniper" then
local pos = attacker:GetPos()
local ang = attacker:GetAngles()
attacker:Remove()
SpawnItem("npc_sniper", pos, ang )
end

ply:CreateRagdoll()
ply:AddDeaths(1)
-- PrintTable(ply:GetWeapons())
table.foreach( ply:GetWeapons(), function(key,value)
if key > 1 then
print(value:GetClass())
SpawnItem(value:GetClass(), ply:GetPos()+Vector(math.random(-30,30),math.random(-30,30),20), Angle(0,0,0))
end
end) 
end

function waveswalk()
WAVESPAWN = 0
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
timer.Create( "TimerRunSpawn", 30, 1, waveswalk)
end

function wavefinishedchecker()
timer.Create( "wavefinishedchecker", 5, 1, wavefinishedchecker)

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
	end
end
end

function waveend()
		if Wave < 5 then
			PrintMessage(HUD_PRINTCENTER, "Squad Nº"..Wave.." defeated!")
			WAVESPAWN = 1
		end
		timer.Simple(TIME_BETWEEN_WAVES, function()
		timer.Create( "TimerRunSpawn", 30, 1, waveswalk)		
		if Wave == 1 then timer.Create( "secondwave", 2, CombineSecondWave, secondwave ) end
		if Wave == 2 then timer.Create( "thirdwave", 2, CombineThirdWave, thirdwave ) end
		if Wave == 3 then timer.Create( "fourthwave", 2, CombineFourthWave, fourthwave ) 	end
		if Wave == 4 then timer.Create( "fifthwave", 2, CombineFifthWave, fifthwave )  end
		end)
		if Wave == 5 then 
			if DEFAULTGAME == 1 then
				if AUTOREPEAT == 1 then
				timer.Simple(5, autofirstwave)
				PrintMessage(HUD_PRINTCENTER, "Combine Defeated! Restarting Squads!")
				else
				PrintMessage(HUD_PRINTCENTER, "Combine Defeated!")
				end
				else
				print("DEFAULTGAME isnt 1")
			end
		end
		CanCheck = 0
		OverwatchAmbientOne()
	
end
/*
function HeliSpawnRollermine()
SpawnRollermine(HeliA:GetPos() + Vector(0, 0, -100))
end
*/
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
/*
function restorecontactstatus()
end
*/
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
	ply:StripAmmo()
	ply:StripWeapons()
	ply:Give("weapon_crowbar")
--	ply:Give("weapon_physcannon")
--	ply:Give(table.Random(MEDIUMWEAPONS))
	ply:SetupHands()
	ply:SetWalkSpeed(150)
	ply:SetRunSpeed(250)
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
/*
if WAVESPAWN == 0 then
local turrets=0
for k, v in pairs(ents.FindByClass("npc_combine_s")) do 
if v then
if turrets<1 && CURRENTTURRETS < MAXTURRETS then
SpawnTurret(v:GetPos()+Vector(0,0,3)-v:GetForward()*70, v:GetAngles())
turrets=turrets+1
CURRENTTURRETS=CURRENTTURRETS+1
end
end
end
end
*/
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
if v:GetEnemy() then if v:GetEnemy():IsPlayer() then
v:GetEnemy():PrintMessage(HUD_PRINTTALK, ""..v:GetName().." lost "..v:GetEnemy():GetName().."")
v:ClearEnemyMemory() 
v:SetEnemy(mil)
v:SetSchedule(SCHED_FORCED_GO_RUN)
end
end
end
end)
end


function GM:InitPostEntity()
timer.Create( "CountNPC", 3, 1, wander )
timer.Create( "Item Respawn System", 10, 1, ItemRespawnSystem )
timer.Create( "CombineIdleSpeech", math.random(5,15), 0, CombineIdleSpeech ) 
timer.Create( "CicloUnSegundo", 1, 1, CicloUnSegundo ) 
timer.Create( "coverzones", 10, 1, coverzones )
timer.Create( "wavefinishedchecker", 5, 1, wavefinishedchecker)
CanCheck = 0
MapSetup()

for k, v in pairs(ents.FindByClass("prop_physics")) do
if v:GetModel() == "models/props_c17/furnituredrawer001a.mdl" or v:GetModel() == "models/props_c17/furnitureshelf002a.mdl" or v:GetModel() == "models/props_wasteland/kitchen_shelf001a.mdl" or v:GetModel() == "models/props_interiors/furniture_desk01a.mdl" or v:GetModel() == "models/warby/wan_prop_caffe_table_01.mdl" or v:GetModel() == "models/props_junk/trashdumpster01a.mdl" or v:GetModel() == "models/props_c17/bench01a.mdl" then 

table.insert(ITEMPLACES, v:GetPos()+Vector(0,0,30))
print("found one")
end
end
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
table.foreach(MainEnemies, function(key,enemy)
for k, npc in pairs(ents.FindByClass(enemy)) do
if npc:Health() > 0 then

/*
if !npc:GetEnemy() then
npc:SetKeyValue("squadname", "")
end
*/
if npc:GetEnemy() then
if npc:GetEnemy():IsPlayer() then
--npc:SetKeyValue("squadname", "CombineSquad")

if npc:GetEnemy().spotted != 1 then
npc:EmitSound(table.Random(ContactConfirmed), 100, 100)
net.Start("Spotted")
net.Send(npc:GetEnemy())
npc:GetEnemy().spotted = 1
end
	if npc:IsCurrentSchedule(SCHED_FORCED_GO) || npc:IsCurrentSchedule(SCHED_FORCED_GO_RUN)	then npc:ClearSchedule() end
	if npc:HasCondition(10) then
		if timer.Exists("npcforgettimer") then
		timer.Destroy( "npcforgettimer")
		print("npcforget STOPPED")
		end
		for num, ThisEnt in pairs(ents.FindInSphere(npc:GetPos(),1000)) do 
		if ThisEnt:GetClass() == "npc_combine_s" || ThisEnt:GetClass() == "npc_metropolice" then
				if ThisEnt:GetEnemy() == nil  then 
					if CombineAssisting < MAXHELP then
					print("combine palla")
					--print(ThisEnt:GetName().." is helping "..v:GetName().."")
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
nearbycombinecome(HeliA:GetEnemy())
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
/*
ent = ents.Create( "env_explosion" )
ent:SetPos(victim:GetPos())
--ent:SetKeyValue( "spawnflags", 32 )
ent:Spawn()
--ent:EmitSound( "siege/big_explosion.wav", 500, 500 )
ent:SetKeyValue( "iMagnitude", "100" )
print("assploded")
ent:Fire("Explode",0,0)
*/

if victim:GetClass() == "npc_sniper" then
PrintMessage(HUD_PRINTTALK, ""..killer:GetName().." got that Sniper out of the way ")
end


if victim:GetClass() == "npc_turret_floor" then
nearbycombinecome(victim)
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
if killer:Alive() then
	if victim:GetClass() == "npc_metropolice" || victim:GetClass() == "npc_combine_s" then
		local MAX=0
		local TALK=0
		for k, see in pairs(ents.FindInSphere(victim:GetPos(),224)) do
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
table.foreach(player.GetAll(), function(key,value)
-- value:SetNWInt("status", "safe" )
net.Start( "Hidden" )
net.Send(value)
value.spotted = 0
end)
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


if damaged:IsNPC() then
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
		if damaged:EntIndex() == damage:GetAttacker():EntIndex() then
		damage:ScaleDamage(NPCSCALEDAMAGE)
		else
		damage:ScaleDamage(0)
		end
	end
	end
end

if damaged:GetClass() == "npc_helicopter" then
if damaged:Health() < 800 && HeliIsDead != 1 then
if HeliAangered == 0 then
PrintMessage(HUD_PRINTTALK, "The helicopter is now desesperate.")

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
PrintMessage(HUD_PRINTTALK, "The helicopter is almost dead. Beware...")
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
if damage:GetInflictor():GetClass() == "crossbow_bolt" then
damaged:SetHealth(0)
end
end

if damaged:GetClass() == "npc_turret_ceiling" then
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

if key == IN_ATTACK then
if player:GetActiveWeapon():GetClass() == "weapon_frag" then
if player:GetAmmoCount(player:GetActiveWeapon():GetPrimaryAmmoType()) < 2 then
timer.Simple(1, function()

player:StripWeapon("weapon_frag")
end)
end
end
if player:GetActiveWeapon():GetClass() != "weapon_crowbar" && player:GetActiveWeapon():GetClass() != "weapon_crossbow" && player:GetActiveWeapon():GetClass() != "weapon_slam" && player:GetActiveWeapon():GetClass() != "weapon_physcannon" && player:GetActiveWeapon():GetClass() != "weapon_frag" then 

allthecombinecome(player,MAXGUNSHOTINVESTIGATE)

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
