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
lasertime = CurTime()


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

	self.laser:SetKeyValue( "damage", "60" )
	self.laser:SetKeyValue( "spawnflags", "1" )
	self.laser:SetRenderMode(RENDERMODE_TRANSALPHA)
	self.laser:Spawn()

timer.Simple(0.2, function()
	self.laser:SetPos(self:GetPos()+self:GetForward()*13)
	self.target:SetPos(self:GetPos()+self:GetForward()*200)
end)
self:SetModel( "models/props_lab/tpplug.mdl" )
self:SetSolid( SOLID_VPHYSICS )
self:SetMoveType(MOVETYPE_NONE)
self:SetUseType(SIMPLE_USE)

self:SetPos(self:GetPos()+ (self:GetForward()*-5))

end
end


function ENT:Use(activator)
if SERVER then
self:Remove()
end
end



function Check()

end

function ENT:Think()
if SERVER then
if CurTime() > lasertime then
--print(traceRes.Entity)
--print(self:GetName())
--print(t)

local nearby = 0

/*
traceRes = util.QuickTrace( self:GetPos(), self:GetForward()*200, self)
if traceRes.Entity:IsNPC() or traceRes.Entity:IsPlayer() then
print(traceRes.Entity)
end
*/

for k, v in pairs(ents.FindInSphere(self:GetPos(),100)) do
if v then
if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then
nearby = 1
--print("player")
end
end

if nearby == 1 then 
self.target:SetPos(self:GetPos()+self:GetForward()*14) 
else
self.target:SetPos(self:GetPos()+self:GetForward()*200)
end
end

lasertime = math.Round(CurTime())+0.2
end
end
end

function ENT:Draw()
self:DrawModel()
end