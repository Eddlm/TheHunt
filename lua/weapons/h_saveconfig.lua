SWEP.PrintName			= "Map Configurator"			
SWEP.Author			= "Eddlm"
SWEP.Instructions		= "Read what the tool says"
SWEP.Spawnable = true
SWEP.AdminOnly = false
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo		= "none"
SWEP.Category = "The Hunt tools"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"
SWEP.Weight			= 5
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Slot			= 1
SWEP.SlotPos			= 2
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true
SWEP.ViewModel			= "models/weapons/v_pistol.mdl"
SWEP.WorldModel			= "models/weapons/w_pistol.mdl"

local ShootSound = Sound( "Metal.SawbladeStick" )
cooldown=CurTime()+1
hints_cooldown=CurTime()+10




function SWEP:Equip()

self.Owner:SendLua("notification.AddLegacy( 'Primary attack: place/select',   NOTIFY_HINT  , 6 )" )
self.Owner:SendLua("notification.AddLegacy( 'Secondary attack: change mode',   NOTIFY_HINT  , 6 )" )
self.Owner:SendLua("notification.AddLegacy( 'Reload: generate code for all',   NOTIFY_HINT  , 6 )" )
self.Owner:SendLua("notification.AddLegacy( 'Player Spawnpoint Mode',   NOTIFY_HINT  , 6 )" )


tool_mode="ply_spawnpoint"
model_file="models/props_wasteland/controlroom_chair001a.mdl"

end


function SWEP:PrimaryAttack()

	-- This weapon is 'automatic'. This function call below defines
	-- the rate of fire. Here we set it to shoot every 0.5 seconds.
	self.Weapon:SetNextPrimaryFire( CurTime() + 0.5 )	

	-- Call 'ThrowChair' on self with this model
--	self:ThrowChair( "models/props/cs_office/Chair_office.mdl" )
	self:ThrowChair( "models/props_trainstation/TrackSign02.mdl" )


end
	
--
-- Called when the rightmouse button is pressed
--
function SWEP:SecondaryAttack()
if tool_mode == "ply_spawnpoint" then
tool_mode = "combine_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Combine spawnpoint mode.") model_file="models/props_combine/combine_mortar01b.mdl" self.Owner:EmitSound("npc/combine_soldier/vo/copythat.wav", 100, 100)
 return false end
if tool_mode == "combine_spawnpoint" then
 
tool_mode = "combine_patrolpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Combine patrol point mode.") model_file="models/props_combine/combine_mine01.mdl" self.Owner:EmitSound("npc/combine_soldier/vo/containmentproceeding.wav", 100, 100)
 return false end
 
 
if tool_mode == "combine_patrolpoint" then 
tool_mode = "sniper_spawner" self.Owner:PrintMessage(HUD_PRINTTALK, "Sniper Spawner mode.") self.Owner:EmitSound("npc/sniper/echo1.wav", 100, 100)
 return false end
 
 
if tool_mode == "sniper_spawner" then 
tool_mode = "heli_spawner" self.Owner:PrintMessage(HUD_PRINTTALK, "Heli patrolpoint spawner mode.") self.Owner:PrintMessage(HUD_PRINTTALK, "Place them on the air, where you want Helicopters and gunships to spawn and patrol.")  self.Owner:PrintMessage(HUD_PRINTTALK, "Try to maintain patrol points not too far of each other. 20-50 meters is a good range.") model_file= "models/combine_helicopter.mdl" self.Owner:EmitSound("npc/attack_helicopter/aheli_charge_up.wav", 100, 100)
 return false end
 
 
 if tool_mode == "heli_spawner" then 
tool_mode = "prop_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Prop selector mode.") self.Owner:PrintMessage(HUD_PRINTTALK, "Select wich props will spawn on the map")  model_file="models/weapons/w_irifle.mdl" self.Owner:EmitSound("physics/metal/metal_solid_impact_soft2.wav", 100, 100)

 return false end


 
if tool_mode == "prop_spawnpoint" then 
tool_mode = "weapon_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Weapon spawnpoint mode.") model_file="models/weapons/w_irifle.mdl"  self.Owner:EmitSound("weapons/pistol/pistol_reload1.wav", 100, 100)
 return false end

if tool_mode == "weapon_spawnpoint" then 
tool_mode = "prop_model_weapon_spawner" self.Owner:PrintMessage(HUD_PRINTTALK, "Model sampler mode.") self.Owner:PrintMessage(HUD_PRINTTALK, "Sample a prop's model to generate spawnpoints on all the props wich match that model.") model_file="models/props_trainstation/TrackSign02.mdl"  self.Owner:EmitSound("buttons/button24.wav", 100, 100)
return false end


if tool_mode == "prop_model_weapon_spawner" 
 then tool_mode = "ply_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Player spawnpoint mode.") model_file="models/props_wasteland/controlroom_chair001a.mdl"  self.Owner:EmitSound("vo/npc/barney/ba_bringiton.wav", 100, 100)
 self.Owner:PrintMessage(HUD_PRINTTALK, "Put the chair straight up (USE+SHIFT) or players will spawn inclined.")
return false end
end


function SWEP:ThrowChair(  )


	local ent = ents.Create( "prop_physics" )

	if ( CLIENT ) then return end
	if ( !IsValid( ent ) ) then return end
	if tool_mode != "prop_spawnpoint" and tool_mode != "prop_model_weapon_spawner"  and tool_mode != "sniper_spawner" then
	self:EmitSound( ShootSound )
	ent:SetModel( model_file )
	ent:SetPos( self.Owner:GetEyeTraceNoCursor().HitPos + Vector(0,0,20) )
	if tool_mode == "heli_spawner" then ent:SetPos( ent:GetPos() + Vector(0,0,500))  end
	ent:SetAngles( self.Owner:EyeAngles())
	ent:Spawn()
	if tool_mode == "heli_spawner" then ent:GetPhysicsObject():EnableMotion(false) end
	ent.type=tostring(tool_mode)
	cleanup.Add( self.Owner, "props", ent )	
	undo.Create( "Spawn Point" )
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
	undo.Finish()
end


	if tool_mode == "sniper_spawner" then
	local ent = ents.Create( "npc_sniper" )
	self:EmitSound( ShootSound )
	ent:SetPos( self.Owner:GetEyeTraceNoCursor().HitPos + Vector(0,0,0) )
	ent:SetAngles( self.Owner:EyeAngles())
	ent:Spawn()

	cleanup.Add( self.Owner, "props", ent )	
	undo.Create( "Spawn Point" )
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
	undo.Finish()
end


	if !self.Owner:GetEyeTraceNoCursor().Entity:IsWorld() then
	if tool_mode=="prop_model_weapon_spawner" then
	local prop = self.Owner:GetEyeTraceNoCursor().Entity
	prop.type2=tostring("prop_model_weapon_spawner")
	self:EmitSound( "ui/buttonclick.wav" )
	self.Owner:PrintMessage(HUD_PRINTTALK, "Model sample added to the list.")
	self.Owner:PrintMessage(HUD_PRINTTALK, "Every prop wich model is '"..prop:GetModel().."' will now be a Weapon Spawnpoint.")
	end
	if tool_mode=="prop_spawnpoint" then
	self.Owner:PrintMessage(HUD_PRINTTALK, "Prop added.")
	local prop = self.Owner:GetEyeTraceNoCursor().Entity
	prop.type=tostring("prop_spawnpoint")
	self:EmitSound( "ui/buttonclick.wav" )
	end
	end

end

function SWEP:Reload()
if CurTime() > cooldown then
sniper_spawnpoints={}
combine_spawnpoints={}
combine_patrolpoints={}
weapon_spawnpoints={}
player_spawnpoints={}
prop_spawnpoints={}
prop_model_weapon_spawners={}
npc_turret_floor_spawnpoints={}
npc_turret_ceiling_spawnpoints={}
button_turrets_spawnpoints={}
item_healthcharger_spawnpoints={}
item_suitcharger_spawnpoints={}
ammo_crates_spawnpoints={}
heli_patrolpoints={}
rpgcrate_spawnpoints={}
helipath_spawnpoints={}


table.foreach(ents.GetAll(), function(key,entity)
if entity.type == "ply_spawnpoint" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(player_spawnpoints, "SpawnItem('info_player_start', Vector("..advancedpos.."),Angle("..advancedangles.."))")
end

if entity:GetModel() == "models/combine_helicopter.mdl" and entity.type == "heli_spawner" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(helipath_spawnpoints, "Vector("..advancedpos.."),")
end

if entity:GetClass() == "npc_turret_floor" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(npc_turret_floor_spawnpoints, "SpawnTurret(Vector("..advancedpos.."),Angle("..advancedangles.."))")
end


if entity:GetClass() == "npc_sniper" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(sniper_spawnpoints, "SpawnItem('npc_sniper', Vector("..advancedpos.."),Angle("..advancedangles.."))")
end

if entity:GetClass() == "item_healthcharger" and !entity:CreatedByMap()  then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(item_healthcharger_spawnpoints, "SpawnItem('item_healthcharger', Vector("..advancedpos.."),Angle("..advancedangles.."))")
end


if entity:GetClass() == "item_suitcharger" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(item_suitcharger_spawnpoints, "SpawnSuitCharger(Vector("..advancedpos.."),Angle("..advancedangles.."))")
end

if entity:GetClass() == "npc_turret_ceiling" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(npc_turret_ceiling_spawnpoints, "SpawnCeilingTurretStrong(Vector("..advancedpos.."),Angle("..advancedangles.."))")
end

if entity:GetModel() == "models/props_combine/combine_intmonitor001.mdl" and !entity:CreatedByMap()  then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(button_turrets_spawnpoints, "SpawnItem('button_turrets',Vector("..advancedpos.."),Angle("..advancedangles.."))")
end


if entity:GetModel() == "models/items/ammocrate_rockets.mdl" and !entity:CreatedByMap()  then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(rpgcrate_spawnpoints, "SpawnAmmoCrate(Vector("..advancedpos.."),Angle("..advancedangles.."),3)")
end


if entity:GetModel() == "models/items/item_item_crate_dynamic.mdl" or entity:GetModel() == "models/items/item_item_crate.mdl" and !entity:CreatedByMap()  then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(ammo_crates_spawnpoints, "SpawnDynamicAmmoCrate(Vector("..advancedpos.."),Angle("..advancedangles.."))")
end



if entity.type == "prop_spawnpoint" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)

if entity:GetClass() == "prop_physics" or entity:GetClass() == "prop_physics_multiplayer" then
table.insert(prop_spawnpoints, "SpawnProp(Vector("..advancedpos.."),Angle("..advancedangles.."),'"..entity:GetModel().."')")
else
table.insert(prop_spawnpoints, "SpawnItem('"..entity:GetClass().."',Vector("..advancedpos.."),Angle("..advancedangles.."))")
end


end


if entity.type2 == "prop_model_weapon_spawner" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(prop_model_weapon_spawners, "'"..entity:GetModel().."'")
end

if entity.type == "combine_spawnpoint" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)
table.insert(combine_spawnpoints, "Vector("..advancedpos..")")
end

if entity.type == "combine_patrolpoint" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)
table.insert(combine_patrolpoints, "Vector("..advancedpos..")")
end

if entity.type == "weapon_spawnpoint" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)
table.insert(weapon_spawnpoints, "Vector("..advancedpos..")")
end

end)


WriteAll()
self.Owner:SendLua("notification.AddLegacy( '"..game:GetMap()..".txt successfully generated. You can now play it!',  NOTIFY_GENERIC , 3 )" )

timer.Simple(3, function()


-- WARNINGS
if table.Count(player_spawnpoints) < 1 then
self.Owner:SendLua("notification.AddLegacy( 'No player spawnpoints found!',  NOTIFY_ERROR , 3 )" )
else self.Owner:SendLua("notification.AddLegacy( '"..table.Count(player_spawnpoints).." player spawnpoints found!',  NOTIFY_GENERIC , 3 )" )
end

if table.Count(weapon_spawnpoints) < 1 then
self.Owner:SendLua("notification.AddLegacy( 'No weapon spawnpoints found!',  NOTIFY_ERROR , 3 )" )
else self.Owner:SendLua("notification.AddLegacy( '"..table.Count(weapon_spawnpoints).." weapon spawnpoints found!',  NOTIFY_GENERIC , 3 )" )
end
if table.Count(combine_spawnpoints) < 1 then
self.Owner:SendLua("notification.AddLegacy( 'No combine spawnpoints found!',  NOTIFY_ERROR , 3 )" )
else self.Owner:SendLua("notification.AddLegacy( '"..table.Count(combine_spawnpoints).." combine spawnpoints found!',  NOTIFY_GENERIC , 3 )" )
end

if table.Count(combine_patrolpoints) < 1 then
self.Owner:SendLua("notification.AddLegacy( 'No combine patrolpoints found!',  NOTIFY_ERROR , 3 )" )
else self.Owner:SendLua("notification.AddLegacy( '"..table.Count(combine_patrolpoints).."  combine patrolpoints found!',  NOTIFY_GENERIC , 3 )" )
end
-- WARNINGS



timer.Simple(3, function()
self.Owner:SendLua("notification.AddLegacy( 'Map entities found:',  NOTIFY_GENERIC , 3 )" )

timer.Simple(2, function()

self.Owner:SendLua("notification.AddLegacy( '"..table.Count(npc_turret_floor_spawnpoints).." Turrets found.',  NOTIFY_GENERIC , 5 )" )
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(npc_turret_ceiling_spawnpoints).." Ceiling Turrets found.',  NOTIFY_GENERIC , 5 )" )
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(button_turrets_spawnpoints).." Ceiling Turret Disablers found',  NOTIFY_GENERIC , 5 )" )
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(item_healthcharger_spawnpoints).." Health Chargers found.',  NOTIFY_GENERIC , 5 )" )
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(item_suitcharger_spawnpoints).." Suit Chargers found.',  NOTIFY_GENERIC , 5 )" )
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(ammo_crates_spawnpoints).." Ammo Crates found.',  NOTIFY_GENERIC , 5 )" )

if table.Count(helipath_spawnpoints ) > 0 and table.Count(rpgcrate_spawnpoints) < 1 then
self.Owner:SendLua("notification.AddLegacy( 'No RPG Ammo boxes found!.',  NOTIFY_ERROR , 7 )" )
else
self.Owner:SendLua("notification.AddLegacy( '"..table.Count(rpgcrate_spawnpoints).." RPG Crates found.',  NOTIFY_GENERIC , 5 )" )
end
end)
end)
end)
cooldown=CurTime()+1

end
end


function WriteAll()

if file.Exists( "thehunt_maps/"..game.GetMap()..".txt", "DATA" ) then
file.Delete( "thehunt_maps/"..game.GetMap()..".txt" )
end
file.Write("thehunt_maps/"..game.GetMap().."", "")
file.Append("thehunt_maps/"..game.GetMap()..".txt","---------------------- THE HUNT CONFIGURATION FILE ----------------------\n")

file.Append("thehunt_maps/"..game.GetMap()..".txt","include( '/../../gamemodes/thehunt/gamemode/maps/basewaves.lua' )\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","include( 'basewaves.lua' )\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineFirstWave = 7\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineSecondWave = 10\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineThirdWave = 13\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineFourthWave = 15\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineFifthWave = 20\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","CombineInfiniteWave = 20\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","MAP_PROPS = {"..table.concat(prop_model_weapon_spawners, ", " ).."}\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","ITEMPLACES = {"..table.concat(weapon_spawnpoints, ", " ).."}\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","combinespawnzones = {"..table.concat(combine_spawnpoints, ", " ).."}\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","zonescovered = {"..table.concat(combine_patrolpoints, ", " ).."}\n")
if table.Count(helipath_spawnpoints) > 0 then
file.Append("thehunt_maps/"..game.GetMap()..".txt","HELIPATHS = {"..table.concat(helipath_spawnpoints, "" ).."}\n")
end
file.Append("thehunt_maps/"..game.GetMap()..".txt","function GM:PlayerInitialSpawn(ply)\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","end\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","function MapSetup()\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)\n")

table.foreach(player_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")
end)

table.foreach(prop_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(npc_turret_floor_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(npc_turret_ceiling_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)
table.foreach(button_turrets_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(item_healthcharger_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(item_suitcharger_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(ammo_crates_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(heli_patrolpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(rpgcrate_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")

end)

table.foreach(sniper_spawnpoints, function(key,entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt",entity)
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")
end)


file.Append("thehunt_maps/"..game.GetMap()..".txt","end\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","---------------------- END OF CONFIGURATION FILE ----------------------\n")
file.Append("thehunt_maps/"..game.GetMap()..".txt","\n")
end

