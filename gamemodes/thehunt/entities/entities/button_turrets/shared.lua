AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "button_turrets"
ENT.Author	= "Alig96"
ENT.Contact	= "Don't"
ENT.Purpose	= ""
ENT.Instructions	= ""


function ENT:Initialize()
if SERVER then
self:SetModel( "models/props_combine/combine_intmonitor003.mdl" )
self:SetSolid( SOLID_VPHYSICS )
self:SetMoveType(MOVETYPE_NONE)
self:SetUseType(SIMPLE_USE)
else
self.PosePosition = 0
end
end

function ENT:Use(activator)
if SERVER then
self:EmitSound( "buttons/combine_button2.wav", 100, 100 )
timer.Simple(math.random(120,600),function()
for k, v in pairs(ents.FindByClass("npc_turret_ceiling")) do
v:AddRelationship("player D_HT 999")
end
activator:EmitSound( "buttons/combine_button3.wav", 60, 60 )
end)
if activator:IsPlayer() then
for k, v in pairs(ents.FindByClass("npc_turret_ceiling")) do
v:AddRelationship("player D_LI 999")
end
end
end
end

function ENT:Think()
if SERVER then
--print(self.On)
else
//self:UpdateLever()
end
end

if CLIENT then
end

function ENT:Draw()
self:DrawModel()
end