include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

ITEMPLACES ={
Vector(-603.057617, 791.082275, 107.628723),
Vector(-968.179749, 965.132202, 102.797371),
}

MAP_PROPS = {"models/props/cs_office/sofa.mdl","models/props/cs_office/shelves_metal.mdl","models/props/cs_office/table_coffee.mdl","models/props_junk/pushcart01a.mdl","models/props_wasteland/laundry_cart002.mdl",}







-- MAP INITIAL SETUP v
zonescovered ={
Vector(-246.252655, 779.252075, 128.031250),
Vector(402.092773, 1882.570923, 128.031250),
Vector(249.728470, -56.602673, 248.031250),
Vector(-942.569519, -365.803955, 128.031250),
Vector(-1011.498352, 753.641174, 128.031250),
Vector(-1516.851318, 153.432281, 128.031250),
}

combinespawnzones = {
Vector(-2285.673828, 1306.519897, 44.380402),
Vector(-2304.039063, 1012.998840, 45.629108),
Vector(-1575.854736, -688.813782, 46.031250),
Vector(701.816895, 1887.032471, 118.031250),
}


function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end

function MapSetup()


table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

SpawnItem("info_player_start", Vector(-633.248779, 896.269897, 520.031250)+Vector(0,0,-45), Angle(10, -80, 0))
SpawnItem("info_player_start", Vector(-499.215118, -213.626007, 520.031250)+Vector(0,0,-45), Angle(7, 110, 0))
SpawnItem("info_player_start", Vector(-2023.968750, 592.031250, 128.031250)+Vector(0,0,-45), Angle(12, 35, 0))
SpawnItem("info_player_start", Vector(-1528.031250, -723.968750, 56.031250)+Vector(0,0,-45), Angle(4, 174, 0))



end
/*
Fog = { }
Fog._ent = NULL

function Fog:FindFogEntity( bDontCreate )
	local k, v
	
	for k, v in ipairs( ents.GetAll( ) ) do
		if v:GetClass( ) == "env_fog_controller" then
			self._ent = v
			break
		end
	end
	
	if not bDontCreate and not self._ent:IsValid( ) then
		v = ents.Create( "env_fog_controller" )
		v:Spawn( )
		self._ent = v
	end
end

function Fog:IsValid( )
	return self._ent:IsValid( )
end
function Fog:SetStartDistance( fStartDistance )	
	return self:IsValid( ) and self._ent:Input( "SetStartDist", self, self, fStartDistance )
end
function Fog:SetEndDistance( fEndDistance )	
	return self:IsValid( ) and self._ent:Input( "SetEndDist", self, self, fEndDistance )
end
function Fog:TurnOn( )	
	return self:IsValid( ) and self._ent:Input( "TurnOn", self, self )
end
function Fog:TurnOff( )	
	return self:IsValid( ) and self._ent:Input( "TurnOff", self, self )
end
function Fog:SetPrimaryColor( color )
	return self:IsValid( ) and self._ent:Input( "SetColor", self, self, string.format( "%d %d %d", color.r, color.g, color.b ) )
end
function Fog:SetSecondaryColor( color )
	return self:IsValid( ) and self._ent:Input( "SetColorSecondary", self, self, string.format( "%d %d %d", color.r, color.g, color.b ) )
end
function Fog:SetColorPrimaryLerpTo( color )
	return self:IsValid( ) and self._ent:Input( "SetColorLerpTo", self, self, string.format( "%d %d %d", color.r, color.g, color.b ) )
end
function Fog:SetColorSecondaryLerpTo( color )
	return self:IsValid( ) and self._ent:Input( "SetColorSecondaryLerpTo", self, self, string.format( "%d %d %d", color.r, color.g, color.b ) )
end
function Fog:SetStartDistLerpTo( fStartDistance )	
	return self:IsValid( ) and self._ent:Input( "SetStartDistLerpTo", self, self, fStartDistance )
end
function Fog:SetEndDistLerpTo( fStartDistance )	
	return self:IsValid( ) and self._ent:Input( "SetEndDistLerpTo", self, self, fStartDistance )
end
function Fog:StartFogTransition( )
	return self:IsValid( ) and self._ent:Input( "StartFogTransition",  self, self )
end
function Fog:SetFarZ( iFarZ )
	return self:IsValid( ) and self._ent:Input( "SetFarZ", self, self, iFarZ )
end
function Fog:SetAngles( ang )
	return self:IsValid( ) and self._ent:Input( "SetAngles", self, self, tostring( ang ) )
end
function Fog:SetDensity( fDensity )
	return self:IsValid( ) and self._ent:SetKeyValue( "FogMaxDensity", fDensity )
end
function Fog:SetBlend( bBlend )
	return self:IsValid( ) and self._ent:SetKeyValue( "FogBlend", bBlend and 1 or 0 )
end
function Fog:SetLerpTime( fDelay )
	return self:IsValid( ) and self._ent:SetKeyValue( "foglerptime", fDelay )
end

Fog:FindFogEntity( )
Fog:SetLerpTime( 8 )
Fog:SetDensity( .7 )
Fog:SetStartDistance( 32 )
Fog:SetEndDistance( 768 )
Fog:SetEndDistLerpTo( 128 )
Fog:StartFogTransition( )
*/