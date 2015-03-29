AddCSLuaFile()



DEFINE_BASECLASS( "base_anim" )

ENT.PrintName		= "Combine Bouncer"
ENT.Author			= "Eddlm"
ENT.Information		= "A combine weapon"
ENT.Category		= "The Hunt"

ENT.Editable		= true
ENT.Spawnable		= true
ENT.AdminOnly		= false
ENT.RenderGroup		= RENDERGROUP_TRANSLUCENT

local enemies={"player","npc_headcrab_fast","npc_zombie","npc_fastzombie","npc_headcrab_black","npc_poisonzombie","npc_citizen"}
local allies={"npc_combine_s","npc_metropolice","npc_rollermine","npc_helicopter","npc_combine_gunship","npc_manhack","combine_bouncer"}
local sounds ={"npc/scanner/scanner_scan1.wav","npc/scanner/scanner_scan2.wav","npc/scanner/scanner_scan4.wav"}
local ignore ={"func_rotating","prop_dynamic","combine_bouncer","func_tracktrain"}
local ignoreID={}
local CurrentEnemy=0
function ENT:Initialize()

if SERVER then


self:SetName("Combine bouncer ball")
self:SetModel( "models/XQM/Rails/trackball_1.mdl" )
self:SetMaterial( "models/combine_citadel/combine_citadel001" )


self:SetSolid(SOLID_VPHYSICS)
self:SetMoveType(MOVETYPE_VPHYSICS)
self:SetUseType(SIMPLE_USE)
self:PhysicsInit( SOLID_VPHYSICS )
--self:SetPos(self:GetPos())

     local phys = self:GetPhysicsObject()
	if (phys:IsValid()) then
	phys:SetMass(200)
	phys:SetMaterial("rubber")
	phys:SetBuoyancyRatio(0.9)
	phys:EnableGravity(false)
	phys:Wake()
	phys:SetAngleDragCoefficient(200)
	end
	


ALERT = 0



timer.Create("sounds"..self:EntIndex().."", 4, 0, function()
if ALERT == 0 then

self:EmitSound(table.Random(sounds), 75, 100)

else

self:EmitSound("npc/roller/mine/rmine_predetonate.wav", 75, 100)
end
end)


timer.Create("lazor"..self:EntIndex().."", 0.2, 0, function() 

if ALERT == 0 then
local filter = {combine_bouncer, "combine_bouncer"}
local tr = util.QuickTrace( self:GetPos(), Vector(0,0,-50),self)
--print(tr.Entity)
local tr2 = util.QuickTrace( self:GetPos(), Vector(0,0,-30),self)


if not tr.Hit then
if self:GetPhysicsObject():IsValid() then
self:GetPhysicsObject():AddVelocity(Vector(0,0,-3))
--self:GetPhysicsObject():SetVelocity((self:GetPhysicsObject():GetVelocity() * Vector(1,1,0.5))
end
end

if tr.Hit and not tr2.Hit then
if self:GetPhysicsObject():IsValid() then
self:GetPhysicsObject():SetVelocity((self:GetPhysicsObject():GetVelocity() * Vector(1,1,0.8)))
end
end

if tr2.Hit then
if self:GetPhysicsObject():IsValid() then
self:GetPhysicsObject():AddVelocity(Vector(0,0,3))
--self:GetPhysicsObject():SetVelocity((self:GetPhysicsObject():GetVelocity() * Vector(1,1,-0.1)))
end
end
end

end)
util.SpriteTrail(self, 1, Color(5,53,166), false, 50, 15, 3, 1/(15+3)*0.5, "trails/laser.vmt")

timer.Simple(4, function() self:GetPhysicsObject():AddVelocity(Vector(math.random(0,50), math.random(0,50), 0))
 end)
end

end
function ENT:Use(activator)
end

function ENT:OnTakeDamage( dmginfo )
	self:TakePhysicsDamage( dmginfo )


if dmginfo:IsDamageType(DMG_BLAST) and dmginfo:GetAttacker():IsPlayer() or dmginfo:GetAttacker():IsNPC() and ALERT == 0 then
ALERT = 1

self:GetPhysicsObject():EnableGravity(true)
self:EmitSound("npc/roller/mine/rmine_predetonate.wav", 75, 100)

/*
timer.Create("recover"..self:EntIndex().."", 10, 1, function() 
ALERT = 0 

self:GetPhysicsObject():EnableGravity(false)

end)
*/
end

if ALERT == 0 then
self:GetPhysicsObject():SetVelocity((dmginfo:GetInflictor():GetPos() - self:GetPos()) * 3  )
--timer.Simple(10, function() ALERT = 0 end)

end

end


function ENT:Think()
if ALERT == 0 then
for k, v in pairs(ents.FindInSphere(self:GetPos(),256)) do
if !table.HasValue(ignore, v:GetClass()) and  !table.HasValue(allies, v:GetClass()) and !table.HasValue(ignoreID, v:EntIndex()) and (!v.disguised or v.disguised==0) then
if v:GetPhysicsObject():IsValid() then
if self:Visible(v) and  v:GetPhysicsObject():GetVelocity():Length() > 50 or v:GetPhysicsObject():GetAngleVelocity():Length() > 0 then
	if self:GetPhysicsObject():IsValid() and self:Visible(v) and self:GetPhysicsObject():GetVelocity():Length() < 500 then
		self:GetPhysicsObject():AddVelocity((v:GetPhysicsObject():GetVelocity():Length()/300) * ((v:GetPos() + (v:GetPhysicsObject():GetVelocity()/3)) - self:GetPos()))
		if self:GetPhysicsObject():GetVelocity():Length() > 500 then
			self:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity()*0.6)
		end

	if CurrentEnemy!=v:EntIndex() then
		self:EmitSound("npc/roller/mine/rmine_blip1.wav", 75, 100)
	end
CurrentEnemy=v:EntIndex()

break
end
end
end
end
end
end

end



function ENT:PhysicsCollide( data, physobj )

if  ALERT == 0 then
--print(""..self:GetClass().." has collided with "..data.HitEntity:GetClass()..", ID "..data.HitEntity:EntIndex().."")

	if ( data.DeltaTime > 0.1 && data.Speed < 80) then
		sound.Play( "buttons/combine_button1.wav", self:GetPos(), 100, 100, math.Clamp( data.Speed / 150, 0, 1 ) )

	-- Bounce like a crazy bitch
	local LastSpeed = math.max( data.OurOldVelocity:Length(), data.Speed )
	local NewVelocity = physobj:GetVelocity()
	NewVelocity:Normalize()
	
	LastSpeed = math.max( NewVelocity:Length(), LastSpeed )
	
	local TargetVelocity = NewVelocity * LastSpeed * Vector(1.2,1.2,0.2)
	
	physobj:SetVelocity( TargetVelocity )
	end
		if ( data.Speed > 80 && data.DeltaTime > 0.1 ) then
		sound.Play( "buttons/combine_button3.wav", self:GetPos(), 75, 100, math.Clamp( data.Speed / 150, 0, 1 ) )
			physobj:SetVelocity( data.OurOldVelocity * 0.9 )
			--print("too fast")
		end
	end
	
	
if  table.HasValue(enemies, data.HitEntity:GetClass()) or (ALERT==1 and !data.HitEntity:IsWorld())  then
if (! data.HitEntity.disguised or  data.HitEntity.disguised==0) then
--if  table.HasValue(enemies, data.HitEntity:GetClass()) then data.HitEntity:Kill() end
self.ent = ents.Create( "env_explosion" )
self.ent:SetName("combine_explosion")
self.ent:SetPos(self:GetPos())
self.ent:Spawn()
self.ent:SetKeyValue( "iMagnitude", "100" )
self.ent:Fire("Explode",0,0)

self.ent:Remove()



timer.Destroy("sounds"..self:EntIndex().."")
timer.Destroy("lazor"..self:EntIndex().."")
timer.Destroy("recover"..self:EntIndex().."")


--timer.Simple(1, function() self:GetPhysicsObject():AddVelocity(Vector(math.random(-50,50),math.random(-50,50),0)) end)
self:Remove()
end

else
table.insert(ignoreID, tonumber(data.HitEntity:EntIndex()))
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