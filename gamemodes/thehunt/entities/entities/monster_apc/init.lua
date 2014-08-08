
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include( 'shared.lua' )

function ENT:SpawnFunction( ply, tr )
	if ( !tr.Hit ) then return end
	local SpawnPos = (tr.HitPos + tr.HitNormal * 16) +Vector( 0, 0, 55 )
	self.Spawn_angles = ply:GetAngles()
	self.Spawn_angles.pitch = 0
	self.Spawn_angles.roll = 0
	self.Spawn_angles.yaw = self.Spawn_angles.yaw + 180
	
	local ent = ents.Create( "monster_apc" )
	ent:SetPos( SpawnPos )
	ent:SetAngles( self.Spawn_angles )
	ent:Spawn()
	ent:Activate()
	
	return ent
end

function ENT:Initialize()
	RPG=0
	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)
	self:SetModel( "models/props_junk/watermelon01_chunk02c.mdl" )
	self:SetColor( 255, 255, 255, 0 )
	
	self.apc = ents.Create( "prop_vehicle_apc" )
	self.apc:SetKeyValue( "model", "models/combine_apc.mdl" )
	self.apc:SetKeyValue( "vehiclescript", "scripts/vehicles/apc_npc.txt" )
	self.apc:SetKeyValue( "actionScale", "1" )
	self.apc:SetName( "Combine_apc" .. self:EntIndex() )
	self.apc:SetPos( self:GetPos() )
	self.apc:SetAngles( self:GetAngles() )
	self.apc:Spawn()
	self.apc:Activate()
	self.apc_driver = ents.Create( "npc_apcdriver" )
	self.apc_driver:SetKeyValue( "vehicle", "Combine_apc" .. self:EntIndex() )
	self.apc_driver:SetName( "Combine_apc" .. self:EntIndex() .. "_driver" )
	self.apc_driver:SetPos( self:GetPos() )
	self.apc_driver:Spawn()
	self.apc_driver:Activate()
	
end

function ENT:Think()
end

function ENT:Touch(ent)
end


function ENT:OnTakeDamage(dmg)
if RPG<3 then
RPG=RPG+1
else
self.apc:Fire("Destroy","",1)
end
end

function ENT:OnRemove()
	if IsValid( self.apc ) then
		self.apc:Remove()
	end
	if IsValid( self.apc_driver ) then
		self.apc_driver:Remove()
	end
end