 ENT.Type = "ai"  
 ENT.Base = "base_ai"     
 ENT.PrintName		= "Combine soldier"  
 ENT.Author			= "Silverlan"  
 ENT.Contact			= "Silverlan@gmx.de"  
 ENT.Purpose			= ""  
 ENT.Instructions	= ""  
 
ENT.Spawnable			= false
ENT.AdminSpawnable		= false


function ENT:SpawnFunction( ply, tr )
/*
	if ( !tr.Hit ) then return end
	local SpawnPos = (tr.HitPos + tr.HitNormal * 16) +Vector( 0, 0, 55 )
	self.Spawn_angles = ply:GetAngles()
	self.Spawn_angles.pitch = 0
	self.Spawn_angles.roll = 0
	self.Spawn_angles.yaw = self.Spawn_angles.yaw + 180
	
	local ent = ents.Create( "combine_soldier" )
	ent:SetPos( SpawnPos )
	ent:SetAngles( self.Spawn_angles )
	ent:Spawn()
	ent:Activate()
	
	return ent
	*/
end

function ENT:Initialize()
self.soldier = ents.Create( "npc_combine_s" )
self:SetModel( "models/Combine_Soldier.mdl" )
self:SetCollisionGroup(  COLLISION_GROUP_NONE  )
self:Give("ai_weapon_ar2")
self:SetMoveType(MOVETYPE_STEP)
end


function ENT:Think()
print("lel")
end

function ENT:PhysicsCollide(colData,collider )
self:Kill()

end


function ENT:OnTakeDamage(dmg)
end

function ENT:OnRemove()
	if IsValid( self.apc ) then
		self.apc:Remove()
	end
	if IsValid( self.apc_driver ) then
		self.apc_driver:Remove()
	end
end
/*
*/