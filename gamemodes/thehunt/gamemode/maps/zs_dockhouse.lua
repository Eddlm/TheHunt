
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


local NumHelis = 0
for k, v in pairs(ents.FindByClass("npc_helicopter")) do
NumHelis=NumHelis+1
end

if NumHelis > 1 then print("too much helis")
else 
SpawnHeliA(Vector(967.547241, 722.096069, 465.658081), "npc_helicopter" ,1)
end
RPGCANSPAWN = 1
end


-- Number of combine that will spawn on each wave.
CombineFirstWave = 4
CombineSecondWave = 7
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 10
CombineInfiniteWave = 15
DARKNESS = 3


-- Number of seconds the combine will be running around (going to the coverzones and so spreading around the map) a the start of each wave. If not set, will be always 30. Larger maps work better with higher values.
CUSTOMWAVESPAWN = 10



-- Where the combine will spawn.
combinespawnzones = {
Vector(1160.756592, 238.054413, -7.968750),
Vector(1151.879150, 153.612991, -7.968750),
}

-- Positions between the combine will patrol.
zonescovered ={
Vector(-782.666138, 31.267132, 64.025604),

Vector(-794.276611, 187.954407, 208.031250),
Vector(-288.535583, 218.652863, 208.031250),
Vector(-1000.467896, 725.782715, 40.782379),
Vector( -1053.290527, -126.651848, 11.906097),
Vector(-702.927246, -1351.087769, 64.031250),
Vector(-458.557800, 70.111580, -79.968750),

}

-- Run revealzones on the console to higlight these places. Run hidezones to hide the sprite.


-- Special items will spawn only there. Not implemented yet.
SPECIALITEMPLACES = { Vector(-412.031769, 469.709656, -50.026352),}


-- If you provide this table, the game will search for these models upon loading and will make them weapon spawnpositions. The models found will become invulnerable and unmovable. In this demo, look for the tables in the middle of the map.
HeliCanSpotlight = 1

MAP_PROPS = {"models/props_c17/furnituredrawer001a.mdl", "models/props_wasteland/kitchen_shelf001a.mdl","models/props_c17/furnituretable003a.mdl","models/props_c17/shelfunit01a.mdl","models/props_wasteland/prison_bedframe001a.mdl"}

-- Predefined weapon spawnpositions.
ITEMPLACES ={
Vector(-526.981873, 230.435364, 352.031250),
}
-- Run revealweaponspawns on the console to higlight these places. Run hidezones to hide the sprite.

HELIPATHS = {
Vector(967.547241, 722.096069, 465.658081),
Vector(-332.053497, 1746.362427, 424.269958),
Vector(-1783.675171, 1147.882935, 356.491699),
Vector(-1636.565674, -651.372314, 291.651062),
Vector(-479.840240, -1300.036133, 301.770630),
Vector(662.463440, -884.775635, 301.770630),
Vector(-2341.910156, 232.876266, 414.789948),
--Vector(),
--Vector(),
}



-- If defined, this table sets which items a normal crate can spawn upon break. 
CRATEITEMS = { "weapon_357", "weapon_frag", "weapon_slam", "item_ammo_smg1_grenade", "item_healthvial","npc_headcrab_black", "npc_headcrab", }

-- If defined, this table sets which items an ammo crate can spawn upon break. 
GOODCRATEITEMS = { "item_dynamic_resupply","weapon_frag", "weapon_slam","item_healthkit", "item_ammo_smg1_grenade","item_box_buckshot","item_ammo_smg1_large","item_ammo_crossbow","item_ammo_ar2_large","item_ammo_ar2_altfire"}



-- Edit the text inside the "" to edit what the game will tell the players when they join.
function GM:PlayerInitialSpawn(ply)
ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Welcome to gm_construct.")
ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Enjoy this demo.")
ply:SendLua("CLDARKNESS="..DARKNESS.."" )

end


function MapSetup()
-- This removes every player spawnpoint, to make room for our custom spawnpoints.
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)
table.foreach(HELIPATHS, function(key,value)
CreateHeliPath(value)
end)

--SpawnHeliA(Vector(967.547241, 722.096069, 165.658081), "npc_helicopter" ,0)

SpawnEntranceInfoNode(Vector(-148.775467, 220.073654, 18.680799) )

SpawnItem("info_player_start", Vector(-183.192581, 331.952728, -79.968750)+Vector(0,0,-50), Angle(9,170,0))
SpawnItem("info_player_start", Vector(-753.331421, 308.122131, 352.031250)+Vector(0,0,-50), Angle(5,180,0))
SpawnAmmoCrate(Vector(-747.637146, -1551.606201, 16.411165),Angle(0,90,0),3)

end

