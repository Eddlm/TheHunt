AddCSLuaFile()



DEFINE_BASECLASS( "base_anim" )

ENT.PrintName		= "Combine Duplicator"
ENT.Author			= "Eddlm"
ENT.Information		= "Hunts for living things and kills them"
ENT.Category		= "The Hunt"

ENT.Editable		= true
ENT.Spawnable		= true
ENT.AdminOnly		= false
ENT.RenderGroup		= RENDERGROUP_TRANSLUCENT

ents_to_seek={"prop_physics","prop_physics_multiplayer"}
players_to_seek={}
can_duplicate = 1
anticrash = 0
function ENT:Initialize()
	if SERVER then	
		sounds ={"npc/scanner/scanner_scan1.wav","npc/scanner/scanner_scan2.wav","npc/scanner/scanner_scan3.wav","npc/scanner/scanner_scan4.wav"}
		self:PhysicsInitSphere(20,"rubber")
		--self:SetCollisionBounds(Vector(-r,-r,-r),Vector(r,r,r))
		self:SetName("Combine bouncer ball")
		self:SetModel( "models/XQM/Rails/trackball_1.mdl" )
		self:SetMaterial( "models/combine_citadel/combine_citadel001" )
		self:SetSolid(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:PhysicsInit( SOLID_VPHYSICS )		
		local phys = self:GetPhysicsObject()
		if (phys:IsValid()) then
			phys:SetMass(100)
			phys:SetMaterial("rubber")
			phys:SetBuoyancyRatio(1.3)
			phys:EnableGravity(true)
			phys:Wake()
			phys:SetAngleDragCoefficient(0)
		end

	
	timer.Create("sounds_roll"..self:EntIndex().."", 0.1, 0, function()
					--if self:GetPhysicsObject():GetAngleVelocity():Length() > 2 then self:SetVelocity(Vector(0,0,0)) print("lel") end
	-- !v:IsPlayer() and
		local can = 0
		for k, v in pairs(ents.FindInSphere(self:GetPos(),2048)) do
				if !v:IsPlayer() and !v.exploded then v.exploded = 0 end
				if table.HasValue(ents_to_seek, v:GetClass())  and self:Visible(v) and v.exploded < 5 then
					print(v:GetClass())
					can=1
				end					
				if self:Visible(v) and v:IsPlayer()  and table.HasValue(players_to_seek, v:GetName()) then
					can = 1
					print(v:GetClass())
				end
						
					if can == 1 and self:GetPhysicsObject():GetAngleVelocity():Length() < 800 and self:Visible(v) then
					self:GetPhysicsObject():ApplyForceOffset((v:GetPos() - self:GetPos())*200, (self:LocalToWorld(self:GetPhysicsObject():GetMassCenter())+Vector(0,0,1)))
					self:GetPhysicsObject():ApplyForceOffset((v:GetPos() - self:GetPos())*-200, (self:LocalToWorld(self:GetPhysicsObject():GetMassCenter())+Vector(0,0,-1)))
					--if self:GetPhysicsObject():GetVelocity():Length() > 2  and v:Distance(self) < 90 then self:GetPhysicsObject():ApplyForceCenter(self:GetPhysicsObject():GetVelocity()/5) print("lel") end  and self:GetPhysicsObject():GetAngleVelocity():Length() < 4000
					--break
					end
				
				end

		 end)
	

				util.SpriteTrail(self, 1, Color(255,0,0), false, 50, 15, 3, 1/(15+1)*0.5, "trails/laser.vmt")

end
	end
function ENT:Tick()


end
function ENT:OnRemove() 
timer.Destroy("sounds_roll"..self:EntIndex().."")
timer.Destroy("duplicator"..self:EntIndex().."")

timer.Destroy("anticrash"..self:EntIndex().."")

end


function ENT:Think()

end

function ENT:OnTakeDamage( dmginfo )
	self:TakePhysicsDamage( dmginfo )
--print(dmginfo:GetAttacker():GetClass())

if dmginfo:GetAttacker():IsPlayer() and  !table.HasValue(players_to_seek, dmginfo:GetInflictor():GetName()) then
table.insert(players_to_seek, dmginfo:GetInflictor():GetName())
end

if  dmginfo:GetAttacker():IsPlayer() and !table.HasValue(players_to_seek, dmginfo:GetAttacker():GetName())then
table.insert(players_to_seek,dmginfo:GetAttacker():GetName())
end
/*
	-- React physically when shot/getting blown
	self:GetPhysicsObject():SetVelocity((dmginfo:GetInflictor():GetPos() - self:GetPos()) * 3  )
	*/
end


function ENT:PhysicsCollide( data, physobj )

if anticrash < 1 then 
		if table.HasValue(players_to_seek, data.HitEntity:GetName()) then print(data.HitEntity:GetName()) table.RemoveByValue(players_to_seek, data.HitEntity:GetName()) end

	if data.HitEntity:IsPlayer() or data.HitEntity:IsNPC() or data.HitEntity:GetClass() == "prop_physics" or data.HitEntity:GetClass() == "prop_physics_multiplayer" then
		ent = ents.Create( "env_explosion" )
		ent:SetPos(self:GetPos())
		ent:Spawn()
		ent:SetKeyValue( "iMagnitude", "150" )
		ent:Fire("Explode",0,0)
		ent:Remove()
		data.HitEntity:GetPhysicsObject():AddVelocity(Vector(0,0,3*data.HitEntity:GetPhysicsObject():GetMass()))
		
		
		if data.HitEntity.exploded then
		data.HitEntity.exploded = data.HitEntity.exploded+1
		else
		data.HitEntity.exploded = 1 end
		
		

		if !data.HitEntity:IsPlayer() and can_duplicate == 1 then
			local duplicators = 0

		for k, v in pairs(ents.GetAll()) do
		if v:GetClass() == "combine_duplicator" then
		duplicators = duplicators+1
		end
		end
	if duplicators < 10 then
	duplicator = ents.Create("combine_duplicator")
	duplicator:SetPos( data.HitEntity:GetPos()+Vector(0,0,50) )
	--duplicator:SetAngles( ang )
	duplicator:Spawn()
	duplicator:GetPhysicsObject():SetVelocity(Vector(0,0,200))
	end
	can_duplicate = 0
	timer.Create("duplicator"..self:EntIndex().."", 1, 0, function() 
	anticrash = 0
	can_duplicate = 1 end)

	
	end	
anticrash=anticrash+1
	end

			
		if data.HitEntity:GetClass() == "combine_duplicator" and can_duplicate == 1 then
			local duplicators = 0

		for k, v in pairs(ents.GetAll()) do
		if v:GetClass() == "combine_duplicator" then
		duplicators = duplicators+1
		end
		end
		if duplicators > 2 then
		ent = ents.Create( "env_explosion" )
		ent:SetPos(self:GetPos())
		ent:Spawn()
		ent:SetKeyValue( "iMagnitude", "50" )
		ent:Fire("Explode",0,0)
		ent:Remove()
		self:Remove()
		end
		anticrash=anticrash+1
		end

	if self:GetPhysicsObject():GetVelocity():Length() > 500 then
	self:GetPhysicsObject():SetVelocity(self:GetPhysicsObject():GetVelocity()*0.6)

	self:GetPhysicsObject():AddVelocity(Vector(0,0,-90)) end
	
	else 
	timer.Create("anticrash"..self:EntIndex().."", 1, 0, function() 
	anticrash = 0
	end)
	
	end
end

function ENT:Use( activator, caller )	
	if ( activator:IsPlayer() ) then
	
		-- Give the collecting player some free health
		local health = activator:Health()
		activator:SetHealth( health + 500 )		
	end

end


function ENT:Draw()
	self:DrawModel()
end