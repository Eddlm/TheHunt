CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 16
CombineFifthWave = 19
CombineInfiniteWave = 22

CUSTOMWAVESPAWN = 15

SPECIALITEMPLACES = {
Vector(-2326.205811, -416.080566, -1240.272705)
}

ITEMPLACES ={
Vector(-2968.660889, -1021.968994, -25.418840),
Vector(-1317.194824, -1096.616821, -85.239471),
Vector(-1203.288452, 1582.665649, 34.602936),
Vector(-604.178345, 1098.507568, 38.623512),
Vector(-826.972168, -1022.266113, -75.583145),
Vector(-1389.274780, -93.002090, -29.496500),
Vector(-2194.375000, -154.355927, 2.361422),
Vector(-2817.805176, -212.348709, 100.911423),
Vector(-3603.481934, -476.376495, 103.065292),
Vector(-3926.722900, 703.649719, 98.401726),
Vector(-422.466431, 1256.267700, 32.216370),
}
 
MAP_PROPS = {"models/props_blackmesa/bms_metalcrate_48x48.mdl"}
 
zonescovered ={
Vector(-1345.426514, -1315.144653, -63.968750),
Vector(-905.129822, -980.850342, -63.968750),
Vector(-2134.881592, -476.972198, 0.031250),
Vector(-2281.596191, -122.323334, 0.031250),
Vector(-2764.894531, -276.566956, 128.031250),
Vector(-3510.256836, -134.464584, 112.031250),
Vector(-3830.934326, -584.493652, 128.031250),
Vector(-3591.295654, 832.363403, 128.040588),
Vector(-2761.721680, -601.502502, 12.031250),
Vector(-3028.178955, -1167.298462, 0.031250),
Vector(-1538.169434, -60.250244, 0.031250),
Vector(-1991.583130, 427.616638, 0.031250),
Vector(-852.699707, 440.033325, 64.031250),
Vector(-476.991486, -198.250275, 128.031250),
Vector(-502.537109, 194.920837, 64.031250),
Vector(-569.223633, 1296.462524, 64.031250),
Vector(-848.882080, 1188.708252, 64.031250),
Vector(139.568130, 461.569244, 192.031250),
Vector(-1208.019043, 1520.844727, 64.031250),
Vector(-1790.804199, 1377.626465, 64.031250),
Vector(-617.517334, 1047.024780, 64.031250),
}

combinespawnzones = {
Vector(-1350.888916, -1457.321777, -63.968750),
Vector(-1456.172485, -1457.663208, -63.968750),
Vector(-1555.500610, -1456.381348, -63.968750),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Infiltrate and sabotage the base.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Eliminate all inhabitants with extreme prejudice.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics.") end )
end

function MapSetup()

if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-3696.155029, 863.588623, 117.654640), Angle(-0.040, -89.948, -0.092) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-3940.530518, -84.092773, 114.392784), Angle(0.000, 180.000, 90.075) )
	else
		SpawnItem("item_healthcharger", Vector(-2688.457764, -592.721924, -0.945021), Angle(0.069, -179.910, -0.142) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-1458.480347, -1535.533691, 117.073975), Angle(0.146, 89.913, -0.068) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-1952.441162, 459.815277, -10.327841), Angle(0.117, 179.838, 0.320) )
	else
		SpawnItem("item_healthcharger", Vector(-1041.139282, -287.472717, -43.377663), Angle(0.035, 90.054, 0.349) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(335.780457, 576.523743, 180.940094), Angle(0.070, 90.110, 0.551) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-482.353973, -511.500793, 117.329361), Angle(0.181, 90.195, 0.294) )
	else
		SpawnItem("item_healthcharger", Vector(-911.766663, 1152.441284, 51.408638), Angle(0.173, 90.045, -0.086) )
end

SpawnSuitCharger(Vector(-2382.268311, -511.555420, -1227.432373), Angle(0.002, 90.020, -0.044) )

SpawnDynamicAmmoCrate(Vector(-3242.373779, -266.704407, -1292.595703), Angle(-42.784, -67.024, -16.166))
SpawnDynamicAmmoCrate(Vector(-3296.392578, -311.378540, -1279.514648), Angle(-0.000, -76.014, 0.055))
SpawnDynamicAmmoCrate(Vector(-2302.392334, -430.570099, -293.050049), Angle(0.056, -179.318, 0.046))
SpawnDynamicAmmoCrate(Vector(-1629.495361, -66.038239, -17.468481), Angle(0.184, 2.653, -0.342))
SpawnDynamicAmmoCrate(Vector(-1706.050171, 591.753540, -127.516296), Angle(-0.007, -90.431, 0.020))
SpawnDynamicAmmoCrate(Vector(-1689.394531, 439.236389, -127.538055), Angle(-0.131, 19.920, 0.003))
SpawnDynamicAmmoCrate(Vector(-2915.184326, 32.128551, 72.146461), Angle(-13.679, 68.957, -0.543))
SpawnDynamicAmmoCrate(Vector(-3453.824219, 45.066494, 95.615150), Angle(-89.623, 173.361, -91.811))
SpawnDynamicAmmoCrate(Vector(-4020.324463, -103.538193, 193.391983), Angle(0.113, -70.853, -0.016))
SpawnDynamicAmmoCrate(Vector(-1165.837158, 1144.835938, 106.959595), Angle(0.031, -115.934, -0.227))

SpawnItem("npc_zombie", Vector(-3240.691895, -342.278687, -1279.968750), Angle(0.000, 262.914, 0.000))
SpawnItem("npc_poisonzombie", Vector(-3259.347656, -536.135803, -1279.968750), Angle(0.000, 37.159, 0.000))
SpawnItem("npc_zombie", Vector(-3222.836426, -422.626099, -1279.968750), Angle(0.000, 294.231, 0.000))
SpawnItem("npc_zombie", Vector(-3021.761963, -709.006592, -1279.968750), Angle(0.000, 23.425, 0.000))
SpawnItem("npc_zombie", Vector(-2745.536621, -595.361816, -1279.968750), Angle(0.000, 250.615, 0.000))
SpawnItem("npc_zombie", Vector(-2596.104736, -300.865753, -1279.968750), Angle(0.000, 300.401, 0.000))
SpawnItem("npc_poisonzombie", Vector(-2366.406250, -395.867218, -1279.968750), Angle(0.000, 167.937, 0.000))
SpawnItem("npc_zombie", Vector(-2518.125732, -511.937622, -1279.968750), Angle(0.000, 167.937, 0.000))

SpawnItem("npc_citizen", Vector(-1148.212280, -1420.985229, -127.968750), Angle(0.000, 202.378, 0.000))
SpawnItem("npc_citizen", Vector(-1459.027832, -931.348389, -127.968750), Angle(0.000, 271.570, 0.000))
SpawnItem("npc_citizen", Vector(-1757.236084, -1111.452271, -127.968750), Angle(0.000, 319.722, 0.000))

table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

for k, v in pairs(ents.FindByClass("trigger_hurt")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "1" )
end

for k, v in pairs(ents.FindByModel("*128")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "1024" )
end

for k, v in pairs(ents.FindByModel("*127")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "1024" )
end

for k, v in pairs(ents.FindByModel("*185")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*184")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*248")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*247")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*193")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*194")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*192")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*191")) do
print(v:GetClass())
v:Remove()
end

SpawnItem("info_player_start", Vector(-624.343994, 1062.672729, 64.031250), Angle(4.542994, -90.282127, 0.000000) )
SpawnItem("info_player_start", Vector(-471.708496, 1226.387573, 64.031250), Angle(2.468607, 43.367115, 0.000000) )
SpawnItem("info_player_start", Vector(-1321.532593, 1390.299561, 64.031250), Angle(4.543045, 92.704247, 0.000000) )
SpawnItem("info_player_start", Vector(-3155.666992, -1183.656494, 0.027077), Angle(4.246710, 15.663026, 0.000000) )
SpawnItem("info_player_start", Vector(-1457.650635, -1468.014893, 128.031250), Angle(5.926008, 89.945511, 0.000000) )
SpawnItem("info_player_start", Vector(-704.004456, -788.682983, -127.968750), Angle(2.764920, 88.805725, 0.000000) )
SpawnItem("info_player_start", Vector(-377.521240, -107.690689, 64.031250), Angle(2.962517, 146.295639, 0.000000) )
SpawnItem("info_player_start", Vector(192.574646, 954.887451, 192.031250), Angle(2.172230, -106.231514, -0.058637) )
SpawnItem("info_player_start", Vector(-1432.688965, -153.709427, 0.031250), Angle(3.357615, 178.452682, 0.000000) )
SpawnItem("info_player_start", Vector(-1414.184570, 399.616669, 220.031250), Angle(60.551239, -179.867859, 0.000000) )
SpawnItem("info_player_start", Vector(-2443.595215, -441.268951, -335.968750), Angle(2.074437, -83.815331, 0.000000) )

function firstwave()
Wave = 1
	if math.random (1,6) == 2 then 
		SpawnMetropoliceHard(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	else
		SpawnMetropolice(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))
	end
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end
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
-- CanCheck = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end