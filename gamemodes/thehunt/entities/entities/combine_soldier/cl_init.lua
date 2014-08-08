include('shared.lua')

language.Add("prop_vehicle_apc", "Combine APC")

function ENT:Draw()
	self.Entity:DrawModel()
end
