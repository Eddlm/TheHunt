---------------------- THE HUNT CONFIGURATION FILE ----------------------
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
ITEMPLACES = {Vector(-636.370300, 962.398560, 52.249218), Vector(905.410034, 1587.446289, 11.881441), Vector(-398.945953, -103.052452, 12.288915), Vector(151.363693, 268.775787, 11.835216), Vector(-920.436890, -1604.423218, 11.840569), Vector(-870.680176, 385.454102, 3.826494)}
combinespawnzones = {Vector(21.350826, 1949.591675, 9.488368)}
zonescovered = {Vector(-28.804056, 108.766930, 8.401537), Vector(14.109657, -1256.756714, 8.401537), Vector(1352.293335, -1299.090454, 0.401541), Vector(1285.954346, 54.228867, 8.363724), Vector(-1467.043823, -1258.531128, 8.401537), Vector(-1455.321045, -46.311668, 8.401540), Vector(-1571.881836, 1451.054932, 0.401537)}
HELIPATHS = {Vector(-1515.424561, 1682.603760, 362.698700),Vector(-1541.181152, 125.428467, 316.294189),Vector(-1690.897949, -1325.976563, 318.522888),Vector(54.833057, -1235.656494, 342.366455),Vector(-43.122952, 117.158920, 421.232422),Vector(1288.688232, -15.692611, 339.581757),Vector(1319.465942, 1462.016846, 349.155060),Vector(186.318954, 1596.123779, 425.284027),Vector(1404.671509, -1273.167114, 313.546417),}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1077.210693, 959.011230, -233.518112),Angle(-0.000, -135.000, -0.000))
SpawnItem('item_healthcharger', Vector(400.312012, -878.121704, 49.034119),Angle(0.000, 0.000, 0.000))
SpawnSuitCharger(Vector(-1516.668823, -1740.031250, 52.371933),Angle(0.000, -90.000, 0.000))
end



function firstwave()
Wave = 1
SpawnMetropolice(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function secondwave()
Wave = 2

	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	elseif math.random (1,6) == 2 then 
		SpawnMetropoliceHard(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	else
		SpawnCombineS1(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function thirdwave()
Wave = 3

	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	elseif math.random (1,6) == 2 then 
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	else
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	end
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fourthwave()
Wave = 4
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	else
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	end
	

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fifthwave()
Wave = 5
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	else
		SpawnCombineElite2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	end


-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end



function infinitewave()
Wave = 6
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	else
		SpawnCombineElite2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
	end

if GetConVarString("h_supersoldier") == "1" then
if math.random (1,20) == 1 then 
SpawnCombineSynth(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
end
end
HelicopterWave(0)
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end
