AddCSLuaFile()

ENT.Type = "anim" 
ENT.PrintName	= "button_turrets"
ENT.Author	= "Alig96"
ENT.Contact	= "Don't"
ENT.Purpose	= ""
ENT.Instructions	= ""

function ENT:Initialize()
if SERVER then
ARMED=0
self:SetModel( "models/props_combine/combine_intmonitor003.mdl" )
self:SetSolid( SOLID_VPHYSICS )
self:SetMoveType(MOVETYPE_NONE)
self:SetUseType(SIMPLE_USE)

end
end

function ENT:Use(activator)
	if SERVER then
	self:EmitSound( "buttons/combine_button2.wav", 200, 100 )
		if activator:IsPlayer() then
			if ARMED==0 then
				ARMED=1
				for k, v in pairs(ents.FindByClass("npc_turret_ceiling")) do
					v:AddRelationship("player D_LI 999")
				end
			PrintMessage(HUD_PRINTTALK, "Ceiling Turrets disarmed.")
			end
		end
	end
end

function ENT:Draw()
self:DrawModel()
end