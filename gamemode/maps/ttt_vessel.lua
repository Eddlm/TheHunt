CombineFirstWave = 5
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 20
CombineFifthWave = 1
HeliCanSpotlight = 1

ITEMPLACES ={
Vector(-243.778427, -1995.507813, 420.315125),
Vector(44.273861, -2029.945557, 441.120453),
Vector(51.939381, -80.826294, 434.059967),
Vector(-146.837585, -1477.589111, 454.803101),
Vector(-235.127838, 2111.062500, 445.555939),
Vector(-69.101395, -706.768188, 71.352997)
}

zonescovered ={
Vector(246.037033, -2250.410400, 672.031250),
Vector(355.217957, -2163.359863, 1056.031250),
Vector(-203.644577, -1627.570679, 448.031250),
Vector(111.395767, 823.474976, 448.031250),
Vector(68.121735, 1880.409424, 544.031250),
Vector(-119.223145, -844.104370, 80.031250),
Vector(355.006836, -1197.513672, 260.031250),
Vector(-182.410660, -529.323303, 264.031250),
}



combinespawnzones = {
Vector(305.004791, 2149.614258, 562.676086),
Vector(-580.755127, -43.298927, 326.312256),
Vector(586.047729, -782.080017, 448.031250),
Vector(-247.039856, -2637.929688, 448.031250),
Vector(-576.679199, -133.586029, 326.312256),
Vector(-324.615234, -2660.272949, 448.031250),
}

 

function FirstSpawn()
PrintMessage(HUD_PRINTTALK, "The Combine are coming!")
PrintMessage(HUD_PRINTTALK, "Hide and try to kill them without being noticed!")
PrintMessage(HUD_PRINTTALK, "Be creative, and use map features to take advantage over them!")
	for k,v in pairs(ents.FindByClass("func_door")) do
		print (v:GetClass())
		v:Remove()
		-- v:SetKeyValue( "spawnflags", "1024" )
	end
end

function MapSetup()
RunConsoleCommand( "r_shadowdist", "200") 
RunConsoleCommand( "r_shadowcolor", ('20 20 20')) 
RunConsoleCommand( "sk_helicopter_health", "1500") 
RunConsoleCommand( "g_helicopter_chargetime", "2") 
RunConsoleCommand( "sk_helicopter_burstcount", "12") 
RunConsoleCommand( "sk_helicopter_firingcone", "20") 
RunConsoleCommand( "sk_helicopter_roundsperburst", "5") 
RunConsoleCommand( "air_density", "0")


for k,v in pairs(ents.FindByClass("func_door_rotating")) do 
if v:EntIndex() != 232 then
print(v:GetClass())
v:Remove()
end
end

SpawnHeliA( Vector(356.599335, 2395.603760, 672.474854), "npc_helicopter" )
HeliA:Fire("gunoff","",0)

if HeliA:Health() != 1500 then print("WARNING: This Helicopter hasn't the adequeate health.") end

--SpawnTurret(Vector(-202.601089, -1152.92810, -31.238178),Angle(0,-25,0))
--SpawnTurret(Vector(-137.459900, -1649.471436, -31.230539),Angle(0,11,0))

if math.random(1,2) == 1 then
SpawnTurret(Vector(222.714203, -2269.970947, 992.753479),Angle(0.261, 58.264, 0.100))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-469.682404, -2241.459473, 992.748413),Angle(0.324, 43.668, 0.743))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(276.678711, -2285.612793, 737.763489),Angle(0.321, 150.847, 0.651))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-479.177094, -2082.432617, 1160.730103),Angle(0.418, -49.209, 0.498))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(101.186325, -2116.627197, 608.755066),Angle(0.296, -42.952, 0.014))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(308.575714, -1997.693726, 384.756927),Angle(0.302, -153.797, 0.648))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-454.812592, -2303.397705, 384.765411),Angle(0.315, 3.184, 0.627))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-220.893234, 1160.684082, 263.044617),Angle(0.321, 123.450, 0.650))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(117.561218, 540.434448, 16.773226),Angle(0.290, -93.806, 0.528))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(19.477045, -2438.757080, 737.780212),Angle(0.247, 131.532, 0.336))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(221.130569, -71.438072, 384.764343),Angle(0.309, 35.972, 0.047))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-282.292908, -79.917114, 384.686646),Angle(0.197, 151.102, 0.068))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(604.672363, -2639.347900, 384.681610),Angle(0.202, 138.892, -0.277))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(27.640423, -401.884644, 400.690521),Angle(0.248, -32.321, 0.360))
end
if math.random(1,2) == 1 then
SpawnRollermine(Vector(-308.976135, 1105.927979, 395.274292))
end
if math.random(1,8) == 1 then
SpawnItem("npc_sniper", Vector(1.436721, 2327.846191, 814.919250), Angle(0.000, -90.000, 0.000) )
SpawnStaticProp(Vector(-36.970547, 2432.588867, 762.860474),Angle(0.000, 0.000, 0.000),"models/props_combine/combinetower001.mdl")
end

SpawnRPGCrate(Vector(-306.447327, -2283.708496, 1176.364502),Angle(0,90,0))
SpawnRPGCrate(Vector(-95.464302, 1928.546753, 496.437103),Angle(0,0,0))
SpawnFragCrate(Vector(-240.591293, -1640.027466, -15.631243),Angle(0,0,0))


SpawnItem("item_healthcharger", Vector(199.316650, -2221.875488, 1046.708740), Angle(0.000, 0.000, 0.000) )
SpawnItem("item_healthcharger", Vector(136.031250, -2285.958252, 662.275452), Angle(0.000, 0.000, 0.000) )
SpawnItem("item_healthcharger", Vector(541.742615, -2351.913574, 438.275482), Angle(0.000, 0.000, 0.000) )
SpawnItem("item_healthcharger", Vector(-455.397827, -2112.535156, 439.275482), Angle(0.000, 90.000, 0.000) )

SpawnItem("item_rpg_round", Vector(-20.392382, -2025.527222, 386.241119), Angle(-1.000, -63.503, 52.809) )
SpawnItem("item_rpg_round", Vector(-28.810713, -1968.042603, 386.233917), Angle(0.592, 170.257, -71.574) )


SpawnDynamicAmmoCrate(Vector(125.528694, 1138.000977, 448.031250), Angle(0.000, 0.000, 0.000))


if math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(183.530060, -2251.568604, 1031.667236), Angle(0,0,0))
SpawnTurret(Vector(491.179657, -2265.853027, 992.753479),Angle(0.219, 153.462, 0.484))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(470.051300, -2113.187500, 641.475037), Angle(0,-90,0))
SpawnTurret(Vector(321.406891, -2352.754883, 608.756287),Angle(0.172, 38.357, 0.367))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(196.602066, -835.457825, 62.296585), Angle(0,180,0))
SpawnTurret(Vector(117.152908, -994.882324, 16.771614),Angle(0.283, 74.981, 0.172))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(-398.644043, -1950.274170, 418.167389), Angle(0,90,0))
SpawnTurret(Vector(-164.961319, -1418.562012, 514.164368),Angle(0.250, -114.064, 0.262))
end



SpawnCeilingTurretStrong(Vector(268.757446, -935.670044, 375.968750),Angle(0,90,0))
SpawnCeilingTurretStrong(Vector(-342.446320, -945.943359, 375.968750),Angle(0,270,0))
SpawnCeilingTurretStrong(Vector(34.018002, -1222.997070, 375.968750),Angle(0,270,0))


SpawnDynamicAmmoCrate(Vector(-230.471420, -1579.545166, -31.615103), Angle(0.000, 0.000, 0.000))
SpawnDynamicAmmoCrate(Vector(-170.331329, -1579.753052, -31.492853), Angle(0.000, 0.000, 0.000))
SpawnDynamicAmmoCrate(Vector(-170.943298, -1632.518311, -31.668612), Angle(0.000, 0.000, 0.000))

SpawnSuitCharger(Vector(52.103043, -1772.168701, 23.371933), Angle(0.000, 90.000, 0.000) )
SpawnSuitCharger(Vector(25.139523, -1773.168701, 23.235916), Angle(0.000, 90.000, 0.000) )
/*
SpawnFriendlyTurret(Vector(-32.045780, -1498.981567, 8.971822),Angle(0.240, -0.520, 0.367))
SpawnFriendlyTurret(Vector(-143.808929, -1497.576904, 8.930364),Angle(0.338, -0.204, 0.612))
SpawnFriendlyTurret(Vector(-29.140911, -1451.474487, 8.946697),Angle(0.337, 0.500, 0.438))
SpawnFriendlyTurret(Vector(-143.900421, -1452.632202, 8.884084),Angle(0.226, -0.116, -0.150))
*/

SpawnAirboat(Vector(-57.304810, -1479.193115, 11.625523),Angle(0,-90,0))


SpawnMineDisarmed(Vector(218.802872, -1502.265259, -31.629747))
SpawnMineDisarmed(Vector(214.066345, -1453.735229, -31.620562))
SpawnMineDisarmed(Vector(147.568909, -1450.174561, -31.633881))
SpawnMineDisarmed(Vector(136.554672, -1514.493896, -31.598463))


for k, v in pairs(ents.GetAll()) do
if v:GetModel() == "models/props/cs_office/vending_machine.mdl" then
v:Remove()
end
end
for k, v in pairs(ents.FindByClass("info_player_start")) do
print(v:GetClass())
v:Remove()
end
for k, v in pairs(ents.FindByClass("info_player_counterterrorist")) do
print(v:GetClass())
v:Remove()
end
for k, v in pairs(ents.FindByClass("info_player_terrorist")) do
print(v:GetClass())
v:Remove()
end
for k, v in pairs(ents.FindByClass("info_player_start")) do
print(v:GetClass())
v:Remove()
end
for k, v in pairs(ents.FindByClass("info_teleport_destination")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByClass("info_player_deathmatch")) do
print(v:GetClass())
v:Remove()
end



playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-410.791443, -2164.727051, 761.031250))
playerspawnpoint:SetAngles(Angle(0,-0,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-450.057098, -1984.592163, 358.031250))
playerspawnpoint:SetAngles(Angle(0,-90,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-152.732101, -1518.024902, 42.221054))
playerspawnpoint:SetAngles(Angle(0,0,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-488.252899, -719.962524, 668.142029))
playerspawnpoint:SetAngles(Angle(0,144,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-373.458618, -706.107666, 644.723816))
playerspawnpoint:SetAngles(Angle(14,36,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(3.234746, 494.026917, 668.142029))
playerspawnpoint:SetAngles(Angle(0,180,0))


playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(-233.881912, -510.460052, 60.031250))
playerspawnpoint:SetAngles(Angle(0,0,0))

playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(498.165588, -765.472473, 300.031250))
playerspawnpoint:SetAngles(Angle(0,180,0))

for k, v in pairs(ents.FindByClass("path_track")) do
v:Remove()
end

CreateHeliPath(Vector(895.712402, 2176.167969, 936.525208))
CreateHeliPath(Vector(-848.916321, 2226.292480, 924.334839))
CreateHeliPath(Vector(4.516278, 3079.905273, 916.213257))
CreateHeliPath(Vector(986.941528, -50.513008, 1009.225891))
CreateHeliPath(Vector(-892.660950, -78.087456, 988.133667))
CreateHeliPath(Vector(1025.318726, 1205.115234, 1027.817627))
CreateHeliPath(Vector(-1139.587524, 1173.579346, 1011.573364))
CreateHeliPath(Vector(-1199.278564, -1579.448853, 1055.975464))
CreateHeliPath(Vector(1037.729492, -1535.510254, 1049.335205))
CreateHeliPath(Vector(-1046.420166, -2894.975342, 1583.012207))
CreateHeliPath(Vector(-1034.948730, -2885.037354, 773.152466))
CreateHeliPath(Vector(-62.316116, -3579.519287, 846))
CreateHeliPath(Vector(-62.316116, -3579.519287, 1528))
CreateHeliPath(Vector(1116.552490, -3004.801514, 840.075134))
CreateHeliPath(Vector(1116.552490, -3004.801514, 1507))
CreateHeliPath(Vector(16.721441, -1317.307495, 1142.637695))

CreateHeliPath(Vector(-310.733459, 865.215881, 1176.937988))
CreateHeliPath(Vector(281.699432, 856.300415, 1176.937988))
CreateHeliPath(Vector(772.732788, -532.288757, 984.124207))
CreateHeliPath(Vector(-978.102783, -561.310120, 1009.071960))
CreateHeliPath(Vector(-28.981747, -1393.342041, 1511.466553))
CreateHeliPath(Vector(1348.423096, -1197.659912, 476.140381))
CreateHeliPath(Vector(1327.552856, 598.159241, 430.564240))
CreateHeliPath(Vector(-1576.685791, 411.529968, 412.394684))
CreateHeliPath(Vector(-1463.168823, -2125.438965, 317.130859))
CreateHeliPath(Vector(-151.730103, 931.550598, 901.892700))
CreateHeliPath(Vector(-182.156021, -3284.438477, 284.432190))
CreateHeliPath(Vector(-262.379700, -605.173218, 987.925659))
CreateHeliPath(Vector(-587.394531, -1073.043579, 1056.065063))
CreateHeliPath(Vector(412.914429, -1063.362305, 914.630493))
CreateHeliPath(Vector(30.142984, -102.481514, 1043.941162))
CreateHeliPath(Vector(159.281540, 136.682281, 1252.971191))


for k, v in pairs(ents.FindByClass("func_tracktrain")) do
v:Remove()
end

end


function firstwave()
Wave = 1
SpawnMetropolice(table.Random(combinespawnzones) + Vector(math.random(-5,5), math.random(-5,5), -10), table.Random(zonescovered) + Vector(math.random(-200,250), math.random(-200,250), 0))

WAVESPAWN = 1
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
WAVESPAWN = 1
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

WAVESPAWN = 1
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
WAVESPAWN = 1
timer.Create( "coverzonesall", 0.4, 1, coverzones)
end

function fifthwave()
Wave = 5
RPGCANSPAWN = 1
HeliA:Fire("gunon","",0)

end


