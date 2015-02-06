
function firstwave()

Wave = 1
SpawnMetropolice(CombineSelectSpawn() + Vector(math.random(-5,5)))
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function secondwave()
Wave = 2
if CountEntity("MetropoliceHard") <  math.random(2,4) then
SpawnMetropoliceHard(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("Metropolice") < math.random(2,4)  then
SpawnMetropolice(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineS1") <  math.random(2,4) then SpawnCombineS1(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineShotgunner") <  math.random(0,2) then SpawnCombineShotgunner(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

end

function thirdwave()
Wave = 3

if CountEntity("CombineS2") < math.random(6,8)  then
		SpawnCombineS2(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite1") <  math.random(2,4) then SpawnCombineElite1(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunner") <  math.random(2,3) then SpawnCombineShotgunner(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fourthwave()
Wave = 4

if CountEntity("CombineS2") < math.random(4,6)  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite1") <  math.random(3,6) then SpawnCombineElite1(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunnerElite") <  math.random(2,3) then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fifthwave()
Wave = 5
HelicopterWave(1)
if CountEntity("CombineS2") < math.random(5,10)  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite2") <  math.random(5,10) then 	SpawnCombineElite2(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineShotgunnerElite") <  math.random(3,6) then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end



function infinitewave()
Wave = 6
HelicopterWave(1)

if CountEntity("CombineS2") < math.random(5,10)  then
		SpawnCombineS2(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if CountEntity("CombineElite2") <  math.random(5,10) then SpawnCombineElite2(CombineSelectSpawn() + Vector(math.random(-5,5)))

end

if CountEntity("CombineShotgunnerElite") <  math.random(3,6) then SpawnCombineShotgunnerElite(CombineSelectSpawn() + Vector(math.random(-5,5)))
end

if GetConVarString("h_supersoldier") == "1" then
		if CountEntity("CombineSynth") < math.random(1,3)  then
		SpawnCombineSynth(CombineSelectSpawn() + Vector(math.random(-5,5)))
		end
end


if GetConVarString("h_beta_npcs") == "1" then
	if CountEntity("Cremator") < math.random(0,2)  then
		SpawnCremator(CombineSelectSpawn() + Vector(math.random(-5,5)))
	end
	if CountEntity("Assassin") < math.random(0,2)  then
		SpawnAssassin(CombineSelectSpawn() + Vector(math.random(-5,5)))
	end
end


if IsMounted("ep2") and GetConVarString("h_ep2_hunters") == "1"  then
		if CountEntity("Hunter") < math.random(0,2)  then
			SpawnHunter(CombineSelectSpawn())
			print("EP2 Hunter spawned")
		end

	else
print("EP2 Hunter can't spawn. Have you mounted EP2 and enabled them?")
end

timer.Create( "coverzonesall", 0.4, 1, coverzones)
end