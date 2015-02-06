---------------------- THE HUNT CONFIGURATION FILE ----------------------
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props_c17/furnituredrawer001a.mdl', 'models/props_c17/furnituredrawer001a.mdl', 'models/props_c17/furnituredrawer002a.mdl', 'models/props/cs_office/table_coffee.mdl'}
ITEMPLACES = {Vector(-297.507904, 226.654587, 48.342533)}
combinespawnzones = {Vector(526.625916, -501.856445, -134.648117), Vector(-946.109741, -476.694580, -137.158340), Vector(-954.501099, 662.396484, -141.817459), Vector(523.099060, 690.126343, -138.202057)}
zonescovered = {Vector(-132.821503, 267.375732, -115.998695), Vector(-398.641327, 295.368774, 8.401537), Vector(-106.320610, 313.649261, 8.361381)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-209.106674, 120.628265, 35.934498),Angle(-0.000, 179.999, -0.000))
SpawnItem('info_player_start', Vector(88.915489, 102.594154, 37.061001),Angle(-0.000, -180.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------


function firstwave()

Wave = 1
SpawnMetropolice(CombineSelectSpawn() + Vector(math.random(-5,5)))
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function secondwave()
Wave = 2
if CountEntity("MetropoliceHard") <  math.random(2,2) then
SpawnMetropoliceHard(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("Metropolice") < math.random(2,2)  then
SpawnMetropolice(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineS1") <  math.random(2,2) then SpawnCombineS1(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineShotgunner") <  math.random(0,2) then SpawnCombineShotgunner(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

end

function thirdwave()
Wave = 3

if CountEntity("CombineS2") < 2  then
		SpawnCombineS2(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite1") <  3 then 		SpawnCombineElite1(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunner") <  2 then SpawnCombineShotgunner(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fourthwave()
Wave = 4

if CountEntity("CombineS2") < 3  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite1") <  2 then SpawnCombineElite1(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunnerElite") <  2 then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fifthwave()
Wave = 5
HelicopterWave(1)
if CountEntity("CombineS2") < 4  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite2") <  3 then 	SpawnCombineElite2(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunnerElite") <  3 then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end



function infinitewave()
Wave = 6
HelicopterWave(1)

if CountEntity("CombineS2") < 4  then
		SpawnCombineS2(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite2") <  4 then SpawnCombineElite2(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunnerElite") <  4 then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

timer.Create( "coverzonesall", 0.4, 1, coverzones)
end