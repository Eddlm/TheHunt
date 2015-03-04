
function firstwave()
WAVESPAWN = 1
local ShouldRepeat = 0

if CountEntity("Metropolice") < math.random(5,7)   and ShouldRepeat==0 then
SpawnMetropolice(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, firstwave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end

function secondwave()
WAVESPAWN = 1
local ShouldRepeat = 0

if CountEntity("MetropoliceHard") <  math.random(2,4)  and ShouldRepeat==0 then
SpawnMetropoliceHard(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("Metropolice") < math.random(2,4)  and ShouldRepeat==0  then
SpawnMetropolice(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineS1") <  math.random(2,4)  and ShouldRepeat==0 then SpawnCombineS1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineShotgunner") <  math.random(0,2)  and ShouldRepeat==0 then SpawnCombineShotgunner(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, secondwave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end

function thirdwave()
WAVESPAWN = 1
local ShouldRepeat = 0


if CountEntity("CombineS2") < math.random(6,8)  and ShouldRepeat==0  then
		SpawnCombineS2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite1") <  math.random(2,4) and ShouldRepeat==0  then SpawnCombineElite1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunner") <  math.random(2,3) and ShouldRepeat==0  then SpawnCombineShotgunner(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, thirdwave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end

function fourthwave()
WAVESPAWN = 1
local ShouldRepeat = 0


if CountEntity("CombineS2") < math.random(4,6)  and ShouldRepeat==0  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite1") <  math.random(3,6) and ShouldRepeat==0  then SpawnCombineElite1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunnerElite") <  math.random(2,3) and ShouldRepeat==0  then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, fourthwave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end

function fifthwave()
WAVESPAWN = 1
local ShouldRepeat = 0

--HelicopterWave(1)
if CountEntity("CombineS2") < math.random(5,10)  and ShouldRepeat==0  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite2") <  math.random(5,10) and ShouldRepeat==0  then 	SpawnCombineElite2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineShotgunnerElite") <  math.random(3,6) and ShouldRepeat==0  then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, fifthwave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end



function infinitewave()
WAVESPAWN = 1
local ShouldRepeat = 0

Wave = 6
HelicopterWave(1)

if CountEntity("CombineS2") < math.random(5,10)  and ShouldRepeat==0  then
		SpawnCombineS2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite2") <  math.random(5,10)  and ShouldRepeat==0 then SpawnCombineElite2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunnerElite") <  math.random(3,6) and ShouldRepeat==0  then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if GetConVarString("h_supersoldier") == "1" then
		if CountEntity("CombineSynth") < math.random(1,3)  then
		SpawnCombineSynth(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
		end
end


if GetConVarString("h_beta_npcs") == "1" then
	if CountEntity("Cremator") < math.random(0,2)  then
		SpawnCremator(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
	end
	if CountEntity("Assassin") < math.random(0,2)  then
		SpawnAssassin(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
	end
end


if IsMounted("ep2") and GetConVarString("h_ep2_hunters") == "1"  then
		if CountEntity("Hunter") < math.random(0,2)  then
			SpawnHunter(table.Random(CombineAvailableSpawns))
			print("EP2 Hunter spawned")
		end

	else
print("EP2 Hunter can't spawn. Have you mounted EP2 and enabled them?")
end


if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, infinitewave)
else
print("Finished Spawning Wave "..Wave.."")
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
end
end