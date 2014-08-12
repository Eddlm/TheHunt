AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "combine tripmine beam"
ENT.Author	= "Eddlm"
ENT.Contact	= "Don't"
ENT.Purpose	= ""
ENT.Instructions	= ""

function util.QuickTrace( origin, dir, filter )

	local trace = {}
 
	trace.start = origin
	trace.endpos = origin + dir
	trace.filter = filter

	return util.TraceLine( trace )
end


function ENT:SpawnFunction()

end

function ENT:Initialize()
if SERVER then

self:SetName("CombineTripmine"..self:EntIndex().."")
self.target = ents.Create( "info_target" )
self.target:SetName("target"..self:EntIndex().."")
self.target:SetPos(self:GetPos()+Vector(200,0,0))
self.target:Fire("SetParent",""..self:GetName().."",0)

self.target2 = ents.Create( "info_target" )
self.target2:SetName("target"..self:EntIndex().."2")
self.target2:SetPos(self:GetPos() + (self:GetRight()) + (self:GetUp() * 3) + Vector(0,0,0))
self.target2:Fire("SetParent",""..self:GetName().."",0)
--
	self.laser = ents.Create( "env_beam" )
	self.laser:SetPos(self:GetPos())
	--self.laser:SetKeyValue( "StrikeTime", "0.2" )
	self.laser:SetKeyValue( "spawnflags", "1" )
	self.laser:SetKeyValue( "rendercolor", "255 0 0" )
	self.laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )
	--self.laser:SetKeyValue( "TextureScroll", "1" )
	--self.laser:SetKeyValue( "Damage", "3" )
	--laser:SetKeyValue( "renderfx", "6" )
	--self.laser:SetKeyValue( "NoiseAmplitude", ""..math.random(5,2) )
	self.laser:SetKeyValue( "BoltWidth", "1" )
	--self.laser:SetKeyValue( "TouchType", "0" )

--

timer.Simple(0.2, function()
	self.laser:SetPos(self:GetPos()+Vector(13,0,0))
  
	traceRes = util.QuickTrace( self:GetPos(), self:GetForward()*20000, self)
if traceRes.Entity:IsWorld() then 
	self.target:SetPos(traceRes.HitPos)
	end

	self.laser:SetKeyValue( "LightningStart", ""..self.target2:GetName().."" )
	self.laser:SetKeyValue( "LightningEnd", ""..self.target:GetName().."" )
	self.laser:Spawn()
	self.laser:Activate()
	self.laser:Fire("Alpha","50",0)

end)
--models/props_combine/combinebutton.mdl
--models/Items/combine_rifle_ammo01.mdl
--models/props_lab/tpplug.mdl
self:SetModel( "models/props_combine/combinebutton.mdl" )
self:SetSolid( SOLID_VPHYSICS )
self:SetMoveType(MOVETYPE_NONE)
self:SetUseType(SIMPLE_USE)
end
end


function ENT:Use(activator)
if SERVER then
self:Remove()
self.laser:Remove()
end
end



function ENT:Think()
traceRes = util.QuickTrace( self:GetPos(), self:GetForward()*200, self)
if traceRes.Entity:IsPlayer() or (traceRes.Entity:IsNPC() and !traceRes.Entity:GetClass() == "npc_combine_s" and !traceRes.Entity:GetClass() == "npc_metropolice" ) then
--if traceRes.Entity:GetClass() == "npc_citizen" then
print(traceRes.Entity)
--end
end
end
function ENT:Draw()
self:DrawModel()
end