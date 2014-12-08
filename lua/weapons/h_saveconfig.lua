SWEP.PrintName			= "Config generator"			
SWEP.Author			= "Eddlm"
SWEP.Instructions		= "Left click: copy to console"
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


function SWEP:Equip()
self.Owner:PrintMessage(HUD_PRINTTALK, "Primary attack: Place spawnpoint")
self.Owner:PrintMessage(HUD_PRINTTALK, "Secondary attack: Change spawnpoint type")
self.Owner:PrintMessage(HUD_PRINTTALK, "Reload: generate code for all")
tool_mode="ply_spawnpoint"
model_file="models/props_wasteland/controlroom_chair001a.mdl"

end

--
-- Called when the left mouse button is pressed
--
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
tool_mode = "prop_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Prop selector mode.") model_file="models/weapons/w_irifle.mdl" self.Owner:EmitSound("physics/metal/metal_solid_impact_soft2.wav", 100, 100)

 return false end
if tool_mode == "prop_spawnpoint" then 
tool_mode = "weapon_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Weapon spawnpoint mode.") model_file="models/weapons/w_irifle.mdl"  self.Owner:EmitSound("weapons/pistol/pistol_reload1.wav", 100, 100)
 return false end

if tool_mode == "weapon_spawnpoint" then 
tool_mode = "prop_model_weapon_spawner" self.Owner:PrintMessage(HUD_PRINTTALK, "Model sampler mode.") model_file="models/props_trainstation/TrackSign02.mdl"  self.Owner:EmitSound("vo/npc/barney/ba_bringiton.wav", 100, 100)
return false end


if tool_mode == "prop_model_weapon_spawner" 
 then tool_mode = "ply_spawnpoint" self.Owner:PrintMessage(HUD_PRINTTALK, "Player spawnpoint mode.") model_file="models/props_wasteland/controlroom_chair001a.mdl"  self.Owner:EmitSound("vo/npc/barney/ba_bringiton.wav", 100, 100)
return false end
end



function SWEP:ThrowChair(  )



	if ( CLIENT ) then return end
	local ent = ents.Create( "prop_physics" )
	if ( !IsValid( ent ) ) then return end
	if tool_mode != "prop_spawnpoint" and tool_mode != "prop_model_weapon_spawner" then
	self:EmitSound( ShootSound )
	ent:SetModel( model_file )
	ent:SetPos( self.Owner:GetEyeTraceNoCursor().HitPos + Vector(0,0,20) )
	ent:SetAngles( self.Owner:EyeAngles())
	ent:Spawn()
	ent.type=tostring(tool_mode)

	local phys = ent:GetPhysicsObject()
	if ( !IsValid( phys ) ) then ent:Remove() return end
	
	cleanup.Add( self.Owner, "props", ent )	
	undo.Create( "Spawn Point" )
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
	undo.Finish()

	elseif !self.Owner:GetEyeTraceNoCursor().Entity:IsWorld() then
	if tool_mode=="prop_model_weapon_spawner" then
	self.Owner:PrintMessage(HUD_PRINTTALK, "Model sample added.")
	local prop = self.Owner:GetEyeTraceNoCursor().Entity
	prop.type2=tostring("prop_model_weapon_spawner")
	self:EmitSound( "ui/buttonclick.wav" )
	
	end
	if tool_mode=="prop_spawnpoint" then
	self.Owner:PrintMessage(HUD_PRINTTALK, "Prop selected.")
	self.Owner:PrintMessage(HUD_PRINTTALK, "Prop spawnpoint added.")
	local prop = self.Owner:GetEyeTraceNoCursor().Entity
	prop.type=tostring("prop_spawnpoint")
	self:EmitSound( "ui/buttonclick.wav" )
	end
	elseif self.Owner:GetEyeTraceNoCursor().Entity:IsWorld() then
	self:EmitSound( "common/wpn_select.wav" )
	end
	
end

function SWEP:Reload()
if CurTime() > cooldown then


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
snipers_spawnpoints={}


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


if entity:GetClass() == "npc_turret_floor" then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(npc_turret_floor_spawnpoints, "SpawnTurret(Vector("..advancedpos.."),Angle("..advancedangles.."))")
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


if entity:GetModel() == "models/props_wasteland/controlroom_filecabinet002a.mdl" and !entity:CreatedByMap()  then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(snipers_spawnpoints, "SpawnItem('npc_sniper',Vector("..advancedpos.."),Angle("..advancedangles.."))")
end

if entity:GetModel() == "models/combine_helicopter.mdl" and !entity:CreatedByMap() then
local plypos = tostring(entity:GetPos())
local pos = string.Explode( " ", plypos )
local advancedpos = string.Implode( ", ", pos)

local plyangles = tostring(entity:GetAngles())
local angles = string.Explode( " ", plyangles )
local advancedangles = string.Implode( ", ", angles)
table.insert(heli_patrolpoints, "CreateHeliPath(Vector("..advancedpos.."))")
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
table.insert(prop_spawnpoints, "SpawnProp(Vector("..advancedpos.."),Angle("..advancedangles.."),'"..entity:GetModel().."')")
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


print("---------------------- THE HUNT CONFIGURATION FILE ----------------------")
print("include( 'basewaves.lua' )")
print("CombineFirstWave = 7")
print("CombineSecondWave = 10")
print("CombineThirdWave = 13")
print("CombineFourthWave = 15")
print("CombineFifthWave = 20")
print("CombineInfiniteWave = 20")
print("MAP_PROPS = {"..table.concat(prop_model_weapon_spawners, ", " ).."}")
print("ITEMPLACES = {"..table.concat(weapon_spawnpoints, ", " ).."}")
print("combinespawnzones = {"..table.concat(combine_spawnpoints, ", " ).."}")
print("zonescovered = {"..table.concat(combine_patrolpoints, ", " ).."}")
print("function GM:PlayerInitialSpawn(ply)")
print("timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )")
print("timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )")
print("timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )")
print("end")
print("")
print("function MapSetup()")
print("for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end")
print("table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)")


table.foreach(player_spawnpoints, function(key,entity)
print(entity)
end)
table.foreach(prop_spawnpoints, function(key,entity)
print(entity)
end)
table.foreach(npc_turret_floor_spawnpoints, function(key,entity)
print(entity)
end)

table.foreach(npc_turret_ceiling_spawnpoints, function(key,entity)
print(entity)
end)
table.foreach(button_turrets_spawnpoints, function(key,entity)
print(entity)
end)

table.foreach(item_healthcharger_spawnpoints, function(key,entity)
print(entity)
end)

table.foreach(item_suitcharger_spawnpoints, function(key,entity)
print(entity)
end)

table.foreach(ammo_crates_spawnpoints, function(key,entity)
print(entity)
end)


table.foreach(heli_patrolpoints, function(key,entity)
print(entity)
end)

table.foreach(rpgcrate_spawnpoints, function(key,entity)
print(entity)
end)
table.foreach(snipers_spawnpoints, function(key,entity)
print(entity)
end)



print("end")
print("---------------------- END OF CONFIGURATION FILE ----------------------")
print("")
print("Copy all of that.")
	self.Owner:PrintMessage(HUD_PRINTTALK, "Code generated on the console.")

end
cooldown=CurTime()+1
end