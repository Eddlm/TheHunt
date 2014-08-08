
function firstwave()
Wave = 1
SpawnMetropolice(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function secondwave()
Wave = 2

	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnMetropoliceHard(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineS1(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function thirdwave()
Wave = 3

	if math.random (1,6) == 2 then 
		SpawnCombineShotgunner(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fourthwave()
Wave = 4
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineElite1(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fifthwave()
Wave = 5
PrintMessage(HUD_PRINTCENTER, "Final Squad!")
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineElite2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end



function infinitewave()
Wave = 6
	if math.random (1,6) == 2 then 
		SpawnCombineShotgunnerElite(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	elseif math.random (1,6) == 2 then 
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnCombineElite2(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -50), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end

-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end