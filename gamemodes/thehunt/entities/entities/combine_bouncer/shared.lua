AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "Combine bouncer"
ENT.Author	= "Alig96"
ENT.Contact	= "Don't"
ENT.Purpose	= ""
ENT.Instructions	= ""

function ENT:Initialize()
if SERVER then
self:SetName("Combine bouncer ball")
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
	phys:EnableGravity(false)
	phys:Wake()
	phys:SetAngleDragCoefficient(200)
	end
	

local target = ents.Create( "info_target" )
target:SetName("target1")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(0,0,1000))
end)
local laser = ents.Create( "env_laser" )
	laser:SetName("laser1")

	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target1" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(0,0,16))
end)


local target = ents.Create( "info_target" )
target:SetName("target2")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(0,1000,0))
end)
local laser = ents.Create( "env_laser" )
	laser:SetName("laser2")
	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target2" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(0,16,0))
end)

--------------
local target = ents.Create( "info_target" )
target:SetName("target3")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(0,1000,0))
end)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(0,-1000,0))
end)

local laser = ents.Create( "env_laser" )
	laser:SetName("laser3")
	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target3" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
	
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(0,-16,0))
end)

--------------


local target = ents.Create( "info_target" )
target:SetName("target4")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(0,0,-1000))
end)
local laser = ents.Create( "env_laser" )
	laser:SetName("laser4")

	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target4" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(0,0,-16))
end)




local target = ents.Create( "info_target" )
target:SetName("target5")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(1000,0,0))
end)
local laser = ents.Create( "env_laser" )
	laser:SetName("laser5")

	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target5" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(16,0,0))
end)


local target = ents.Create( "info_target" )
target:SetName("target6")
target:Fire("SetParent",""..self:GetName().."",0)
timer.Simple(0.2, function()
	target:SetPos(self:GetPos()+Vector(-1000,0,0))
end)
local laser = ents.Create( "env_laser" )
	laser:SetName("laser6")

	laser:Fire("SetParent",""..self:GetName().."",0)
	laser:SetAngles(self:GetAngles())
	laser:SetKeyValue( "LaserTarget", "target6" )
	laser:SetKeyValue( "renderamt", "10" )
	laser:SetKeyValue( "dissolvetype", "2" )
	laser:SetKeyValue( "width", "1" )
	laser:SetKeyValue( "rendercolor", "200 200 255" )
	laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )

	laser:SetKeyValue( "damage", "20" )
	laser:SetKeyValue( "spawnflags", "37" )
	laser:Spawn()
timer.Simple(0.2, function()
	laser:SetPos(self:GetPos()+Vector(-16,0,0))
end)


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
	if ALERT == 0 then

for k, v in pairs(ents.FindInSphere(self:GetPos(),256)) do
if v:IsNPC() or v:IsPlayer() then
if v:GetPhysicsObject():IsValid() then
if v:GetPhysicsObject():GetVelocity():Length() > 1 then
if self:GetPhysicsObject():IsValid() then
self:GetPhysicsObject():SetVelocity((v:GetPos()+Vector(0,0,40) - self:GetPos()) * 0.5)
print("win")
end
end
end
end
end
end
	end

function ENT:PhysicsCollide( data, physobj )

	if ( data.DeltaTime > 0.1 && data.Speed < 50) then
		sound.Play( "buttons/combine_button1.wav", self:GetPos(), 100, 100, math.Clamp( data.Speed / 150, 0, 1 ) )

	-- Bounce like a crazy bitch
	local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed )
	local NewVelocity = physobj:GetVelocity()
	NewVelocity:Normalize()
	
	LastSpeed = math.max( NewVelocity:Length(), LastSpeed )
	
	local TargetVelocity = NewVelocity * LastSpeed * 1
	
	physobj:SetVelocity( TargetVelocity )
	end
		if ( data.Speed > 50 && data.DeltaTime > 0.1 ) then
		sound.Play( "buttons/combine_button3.wav", self:GetPos(), 75, 100, math.Clamp( data.Speed / 150, 0, 1 ) )
			physobj:SetVelocity( data.OurOldVelocity * 0.9 )
			print("too fast")
		end
	
if data.HitEntity:IsPlayer() or data.HitEntity:IsNPC()  then --data.HitEntity:Kill()
ent = ents.Create( "env_explosion" )
ent:SetPos(self:GetPos())
ent:Spawn()
ent:SetKeyValue( "iMagnitude", "100" )
ent:Fire("Explode",0,0)
self:Remove()
end
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