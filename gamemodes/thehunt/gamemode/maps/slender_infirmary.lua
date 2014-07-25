
-- VARIABLES v
CombineFirstWave = 8
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20


-- VARIABLES ^

-- PRESET WAVES v

function firstwave()
Wave = 1
SpawnMetropolice(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))

WAVESPAWN = 1
CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)

end
function secondwave()
Wave = 2
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnMetropoliceHard(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineSFlashlight(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end
WAVESPAWN = 1
CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end
function thirdwave()
Wave = 3
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineSFlashlight(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end

WAVESPAWN = 1
CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end
function fourthwave()
Wave = 4
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineSFlashlight(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end
WAVESPAWN = 1
CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end
function fifthwave()
Wave = 5
PrintMessage(HUD_PRINTCENTER, "Final Squad!")
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineSFlashlight(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineElite2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end
WAVESPAWN = 1
CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

-- PRESET WAVES ^



-- PRE-PLAY THINGS v
function FirstSpawn()
PrintMessage(HUD_PRINTTALK, "This map features three full waves of Combines.")
PrintMessage(HUD_PRINTTALK, "The first wave it's coming. Hide!")
PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")
end
-- PRE-PLAY THINGS ^

-- MAP INITIAL SETUP v
zonescovered ={
Vector(-246.252655, 779.252075, 128.031250),
Vector(402.092773, 1882.570923, 128.031250),
Vector(249.728470, -56.602673, 248.031250),
Vector(-942.569519, -365.803955, 128.031250),
Vector(-1011.498352, 753.641174, 128.031250),
Vector(-1516.851318, 153.432281, 128.031250),

Vector(-1993.509033, 1304.063721, 128.031250),
Vector(-2294.312744, 2212.087402, 128.031250),
Vector(-2772.503662, 2150.733154, 48.031250),
Vector(-2269.383789, 247.571762, 56.031250),
Vector(200.550461, -790.239929, 248.031250),
Vector(-1092.949463, -175.162811, 520.031250),
Vector(-900.014648, 818.675354, 520.031250),
Vector(-1737.636597, 2261.688721, 128.031250),
}

combinespawnzones = {
Vector(-2785.974365, 1336.782104, 48.031250),
Vector(-2802.452393, 1003.880920, 48.031250),
Vector(-573.289856, 911.736267, 520.031250),
Vector(716.890442, 1874.073853, 128.031250),
}

ITEMPLACES ={
Vector(481.884155, 2293.824463, 168.293152),
Vector(-368.509918, 1004.281738, 164.031250),
Vector(-596.316162, 789.119507, 164.031250),
Vector(-985.628784, 964.789551, 158.031250),
Vector(-896.237915, -678.662781, 164.031250),
Vector(-788.436829, -682.048401, 164.031250),
Vector(-1122.188232, 31.821182, 550.334229),
Vector(-929.997375, 663.615051, 550.334229),
Vector(-1049.958374, -636.534302, 550.031250),
Vector(-1049.958374, -636.534302, 550.031250),
Vector(-1490.904663, -94.456474, 550.334229),
Vector(-521.903992, 2057.753906, 158.308838),
Vector(-2458.434570, 981.718506, 65.604446),
Vector(-2714.307129, 1065.896606, 88.432152),
}

function GM:InitPostEntity()
timer.Create( "CountNPC", 3, 1, wander )
timer.Create( "Item Respawn System", 5, 0, ItemRespawnSystem )
timer.Create( "CombineIdleSpeech", math.random(5,15), 0, CombineIdleSpeech ) 
timer.Create( "CicloUnSegundo", 1, 0, CicloUnSegundo ) 
timer.Create( "coverzones", 10, 1, coverzones ) 
end
-- MAP INITIAL SETUP ^


--[[
	Wrap the fog entity
]]

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
Fog:SetDensity( 0.1 )
Fog:SetStartDistance( 320 )
Fog:SetEndDistance( 768 )
Fog:SetEndDistLerpTo( 128 )
Fog:StartFogTransition( )