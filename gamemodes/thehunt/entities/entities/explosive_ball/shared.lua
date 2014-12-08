AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "Explosive Ball"
ENT.Author	= "Eddlm"
ENT.Contact	= "Don't"
ENT.Purpose	= ""
ENT.Instructions	= ""

function ENT:Initialize()
if SERVER then
self:SetName("Bouncer ball")
self:SetModel( "models/XQM/Rails/trackball_1.mdl" )
self:SetSolid(SOLID_VPHYSICS)
self:SetMoveType(MOVETYPE_VPHYSICS)
self:SetUseType(SIMPLE_USE)
self:PhysicsInit( SOLID_VPHYSICS )

     local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:SetMass(200)
	phys:SetMaterial("rubber")
	phys:SetBuoyancyRatio(0.9)
	phys:EnableGravity(true)
	phys:Wake()
	phys:SetAngleDragCoefficient(200)
	end
	


ALERT = 0

end
end

function ENT:Use(activator)
end

function ENT:OnTakeDamage( dmginfo )
ALERT = 1

	-- React physically when shot/getting blown
	self:TakePhysicsDamage( dmginfo )
	self:GetPhysicsObject():SetVelocity((dmginfo:GetInflictor():GetPos() - self:GetPos()) * 3  )
timer.Simple(10, function() ALERT = 0 end)
end

function ENT:Think()
	end

function ENT:PhysicsCollide( data, physobj )

 if (data.Speed > 50 ) then
local ent = ents.Create( "env_explosion" )
ent:SetPos(self:GetPos())
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "0" )
ent:Fire("Explode",0,0)
--self:Remove()
ent:Remove()
end


	-- Bounce like a crazy bitch
	local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed )
	local NewVelocity = physobj:GetVelocity()
	NewVelocity:Normalize()
	
	LastSpeed = math.max( NewVelocity:Length(), LastSpeed )
	
	local TargetVelocity = NewVelocity * LastSpeed * 1.1
	
	physobj:SetVelocity( TargetVelocity )
	

end


function ENT:Use( activator, caller )

--	self:Remove()
	
	if ( activator:IsPlayer() ) then
	
		-- Give the collecting player some free health
		local health = activator:Health()
		activator:SetHealth( health + 5 )		
	end

end


function ENT:Draw()
self:DrawModel()
end