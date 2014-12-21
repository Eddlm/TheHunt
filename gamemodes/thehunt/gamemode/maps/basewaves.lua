
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


if IsMounted("ep2") and GetConVarString("h_ep2_hunters") == "1"  then
	if math.random (1,6) == 2 then 
		SpawnHunter(table.Random(combinespawnzones))
		print("EP2 Hunter spawned")
	end
else
print("EP2 Hunter can't spawn")
end

timer.Create( "coverzonesall", 0.4, 1, coverzones)
end