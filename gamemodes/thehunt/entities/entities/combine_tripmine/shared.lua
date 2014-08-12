AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "combine tripmine"
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



function ENT:Initialize()
if SERVER then

self:SetName("CombineTripmine"..self:EntIndex().."")

self.target = ents.Create( "info_target" )
self.target:SetName("target"..self:EntIndex().."")
self.target:Fire("SetParent",""..self:GetName().."",0)

self.laser = ents.Create( "env_laser" )
	self.laser:SetName("laser6"..self:EntIndex().."")
	self.laser:Fire("SetParent",""..self:GetName().."",0)
	self.laser:SetAngles(self:GetAngles())
	self.laser:SetKeyValue( "LaserTarget", "target"..self:EntIndex().."" )
	self.laser:SetKeyValue( "dissolvetype", "2" )
	self.laser:SetKeyValue( "width", "0.5" )
	self.laser:SetKeyValue( "rendercolor", "18 122 148" )
	self.laser:SetKeyValue( "texture", "sprites/laserbeam.spr" )
	self.laser:SetKeyValue( "renderfx", "16" )

	self.laser:SetKeyValue( "damage", "10" )
	self.laser:SetKeyValue( "spawnflags", "1" )
	self.laser:SetRenderMode(RENDERMODE_TRANSALPHA)
	self.laser:Spawn()

timer.Simple(0.2, function()
	self.laser:SetPos(self:GetPos()+Vector(13,0,0))
	self.target:SetPos(self:GetPos()+Vector(200,0,0))
end)
self:SetModel( "models/props_lab/tpplug.mdl" )
self:SetSolid( SOLID_VPHYSICS )
self:SetMoveType(MOVETYPE_NONE)
self:SetUseType(SIMPLE_USE)
end
end


function ENT:Use(activator)
if SERVER then
self:Remove()
end
end



function ENT:Think()
traceRes = util.QuickTrace( self:GetPos(), self:GetForward()*200, self)
if traceRes.Entity:IsNPC() or traceRes.Entity:IsPlayer() then
print(traceRes.Entity)
end
end

function ENT:Draw()
self:DrawModel()
end