---------------------- THE HUNT CONFIGURATION FILE ----------------------
function firstwave()
WAVESPAWN = 1
local ShouldRepeat = 0

if CountEntity("MetropoliceHard") <  5 and ShouldRepeat==0 then
SpawnMetropoliceHard(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineS1") <  10 and ShouldRepeat==0 then SpawnCombineS1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end


if CountEntity("CombineShotgunner") <  1 and ShouldRepeat==0 then SpawnCombineShotgunner(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
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
if CountEntity("MetropoliceHard") <  5 and ShouldRepeat==0 then
SpawnMetropoliceHard(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("Metropolice") < 5 and ShouldRepeat==0 then
SpawnMetropolice(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end


if CountEntity("CombineS1") <  5 and ShouldRepeat==0 then SpawnCombineS1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end


if CountEntity("CombineShotgunner") <  5 and ShouldRepeat==0 then SpawnCombineShotgunner(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end
if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, secondwave)
else
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
print("Finished Spawning Wave "..Wave.."")
end
end

function thirdwave()
WAVESPAWN = 1
local ShouldRepeat = 0
if CountEntity("CombineS2") < 10 and ShouldRepeat==0 then
		SpawnCombineS2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite1") < 10 and ShouldRepeat==0 then SpawnCombineElite1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunner") <  5 and ShouldRepeat==0 then SpawnCombineShotgunner(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end
if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, thirdwave)
else
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
print("Finished Spawning Wave "..Wave.."")
end
end

function fourthwave()
WAVESPAWN = 1
local ShouldRepeat = 0
if CountEntity("CombineS2") < 15 and ShouldRepeat==0 then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite1") <  15 and ShouldRepeat==0 then SpawnCombineElite1(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunnerElite") <  10 and ShouldRepeat==0 then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, fourthwave)
else
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
print("Finished Spawning Wave "..Wave.."")
end
end

function fifthwave()
WAVESPAWN = 1
local ShouldRepeat = 0
--HelicopterWave(1)
if CountEntity("CombineS2") < 15 and ShouldRepeat==0  then
		SpawnCombineS2(table.Random(combinespawnzones) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite2") <  15 and ShouldRepeat==0 then 	SpawnCombineElite2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineShotgunnerElite") <  15 and ShouldRepeat==0 then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if ShouldRepeat==1 then
	timer.Simple(0.5, coverzones)
	timer.Simple(1, fifthwave)
else
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
print("Finished Spawning Wave "..Wave.."")
end
end



function infinitewave()
HelicopterWave(1)
WAVESPAWN = 1
local ShouldRepeat = 0
if CountEntity("CombineS2") < 15 and ShouldRepeat==0 then
		SpawnCombineS2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if CountEntity("CombineElite2") <  15 and ShouldRepeat==0 then SpawnCombineElite2(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1

end

if CountEntity("CombineShotgunnerElite") <  10 and ShouldRepeat==0 then SpawnCombineShotgunnerElite(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
ShouldRepeat=1
end

if GetConVarString("h_supersoldier") == "1" then
		if CountEntity("CombineSynth") < 3  then
		SpawnCombineSynth(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
		end
end


if GetConVarString("h_beta_npcs") == "1" then
	if CountEntity("Cremator") < 2  then
		SpawnCremator(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
	end
	if CountEntity("Assassin") < 4  then
		SpawnAssassin(table.Random(CombineAvailableSpawns) + Vector(math.random(-5,5)))
	end
end


if IsMounted("ep2") and GetConVarString("h_ep2_hunters") == "1"  then
		if CountEntity("Hunter") < 5 then
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
WAVESPAWN = 0
CanCheck = 1
timer.Simple(5, ClearCombineSpawnPoints)
print("Finished Spawning Wave "..Wave.."")
end
end



CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/controlroom_desk001a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props_wasteland/kitchen_shelf002a.mdl', 'models/props_wasteland/kitchen_counter001d.mdl', 'models/props_wasteland/cafeteria_table001a.mdl'}
ITEMPLACES = {Vector(-1256.353027, 3805.950195, 548.426941), Vector(-1686.498169, 1299.676147, 532.390503), Vector(-1713.644775, 1705.739502, 532.911682)}
combinespawnzones = {Vector(-385.081451, 3953.319092, 385.500458), Vector(-516.845398, 3939.837891, 385.465729), Vector(-370.494293, 4187.746094, 385.473175), Vector(-499.395691, 4181.951660, 385.454346),Vector(8831.085938, 1143.959351, 370.566742), Vector(8830.524414, 1023.898499, 370.584961)}
zonescovered = {Vector(-1313.679077, 2659.703857, 384.401550), Vector(-1938.384644, 2205.682861, 256.369171), Vector(-1306.215454, 3516.928467, 512.401550), Vector(-2457.272461, 3455.805176, 384.401550), Vector(-639.378601, 1447.982666, 512.392883), Vector(2495.626709, 984.974548, 507.357086), Vector(5997.735840, -1969.888184, 363.353180), Vector(8725.908203, 1082.007446, 373.907806)}
HELIPATHS = {Vector(7553.647949, 1064.274780, 923.031250),Vector(8143.673828, -766.061401, 937.882629),Vector(8501.332031, -2093.353516, 916.786499),Vector(7057.410156, -2279.827637, 958.247375),Vector(6843.160156, -1240.516724, 921.385620),Vector(5938.294434, -2433.060547, 904.446533),Vector(5968.998047, -1117.878662, 921.430603),Vector(5051.764648, -1177.975830, 892.126343),Vector(4443.655762, -1856.500244, 1070.352539),Vector(3115.637695, -1788.384033, 990.175659),Vector(3028.808105, -509.018860, 923.031250),Vector(3262.430664, 256.016693, 1017.428711),Vector(3450.245117, 1104.890869, 1027.031250),Vector(2894.296631, 1072.481079, 1293.048584),Vector(1781.076416, 945.758972, 1027.031250),Vector(-50.777527, 906.484741, 1027.031250),Vector(-2403.421143, 244.271667, 1026.545044),Vector(-2423.815430, -398.289917, 1006.575684),Vector(-1085.395508, -622.041565, 1052.781128),Vector(901.375427, 167.619080, 1052.219849),Vector(-279.779419, 235.161667, 1026.576294),Vector(68.714142, 512.761414, 1184.042480),Vector(-1962.636230, 326.126038, 868.141724),Vector(7346.145020, -668.013062, 827.520447),Vector(7697.482422, 493.313110, 299.930420),Vector(7665.995117, -2052.958008, 337.761749),Vector(7088.025879, -804.865906, 302.209717),Vector(5080.945313, -801.967896, 237.032089),Vector(3406.671387, -827.773254, 250.983261),}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end

table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1721.704224, 2438.339111, 276.430450),Angle(0.166, -179.328, -0.046))
SpawnItem('info_player_start', Vector(-2164.762451, 2292.585693, 276.486359),Angle(0.047, -2.954, 0.093))
SpawnItem('info_player_start', Vector(-952.017395, 3111.610352, 406.401611),Angle(-0.000, 180.000, 0.000))
SpawnItem('info_player_start', Vector(-951.337219, 3258.448242, 405.056335),Angle(0.000, -180.000, -0.000))
SpawnItem('item_healthvial',Vector(-1415.374878, 2778.134766, 412.059357),Angle(0.533, 1.979, 1.670))
SpawnItem('item_healthvial',Vector(-1435.616211, 2780.633301, 412.049042),Angle(-0.413, 0.000, 1.421))
SpawnTurret(Vector(-2289.486084, 2441.308594, 512.768494),Angle(0.268, -135.434, 0.260))
SpawnTurret(Vector(-2680.650635, 2156.887939, 512.743835),Angle(0.335, 0.343, 0.794))
SpawnCeilingTurretStrong(Vector(-327.310272, 4184.061523, 809.530212),Angle(0.000, -90.000, 0.000))
SpawnCeilingTurretStrong(Vector(-427.799194, 4171.421875, 776.563110),Angle(0.000, -90.000, 0.000))
SpawnItem('item_healthcharger', Vector(-2783.968750, 1892.429688, 562.275452),Angle(0.000, 0.000, 0.000))
SpawnSuitCharger(Vector(-2786.451172, 1926.739380, 558.099976),Angle(0.000, 0.000, 0.000))
SpawnDynamicAmmoCrate(Vector(-344.388031, 1185.839844, 507.484192),Angle(0.060, -47.360, 0.000))
SpawnDynamicAmmoCrate(Vector(-375.132690, 1024.534180, 522.462830),Angle(-89.916, -167.493, 16.134))
SpawnDynamicAmmoCrate(Vector(-324.928192, 1122.433838, 522.439392),Angle(0.010, 121.627, -89.790))
SpawnDynamicAmmoCrate(Vector(-308.029541, 1170.223633, 522.515076),Angle(0.044, -128.355, -90.024))
SpawnDynamicAmmoCrate(Vector(-337.185303, 1057.065430, 534.006653),Angle(-5.192, -64.539, 34.825))
SpawnDynamicAmmoCrate(Vector(-345.701752, 1110.974854, 563.979370),Angle(0.436, -4.782, 179.756))
SpawnDynamicAmmoCrate(Vector(-299.501709, 1054.178833, 522.471863),Angle(0.117, 117.833, -89.928))
SpawnDynamicAmmoCrate(Vector(-287.481934, 1130.453735, 522.473877),Angle(-89.838, -4.143, 89.791))
SpawnDynamicAmmoCrate(Vector(-332.110046, 1155.777466, 552.015747),Angle(-4.544, 48.738, -143.551))
SpawnAmmoCrate(Vector(6492.421875, 537.367493, 427.499512),Angle(-0.000, 90.051, -0.000),3)
SpawnItem('npc_sniper', Vector(-2818.187988, -704.215210, 1117.991211),Angle(0.000, 45.000, 0.000))
SpawnItem('npc_sniper', Vector(1283.865601, 279.082458, 1117.991211),Angle(0.000, -180.000, 0.000))
SpawnItem('weapon_rpg',Vector(6434.261719, 618.837280, 456.987885),Angle(0.638, 84.328, 80.040))



SpawnItem('weapon_shotgun',Vector(-1330.052368, 2796.845947, 433.944092),Angle(-3.651, 54.731, 95.028))
SpawnProp(Vector(122.800972, -11.825412, 506.929718),Angle(-0.020, 149.873, 0.000),'models/props_c17/oildrum001_explosive.mdl')
SpawnProp(Vector(100.573624, -39.786896, 506.934814),Angle(-0.019, 143.850, 0.000),'models/props_c17/oildrum001_explosive.mdl')
SpawnProp(Vector(59.602837, -53.742527, 506.990540),Angle(0.221, 150.904, -0.175),'models/props_c17/oildrum001_explosive.mdl')
SpawnProp(Vector(171.858490, -42.698421, 506.884308),Angle(-0.028, 100.453, -0.000),'models/props_c17/oildrum001_explosive.mdl')
SpawnProp(Vector(-14.723393, -37.695728, 526.958435),Angle(0.005, 89.515, 0.112),'models/props_junk/wood_crate001a_damaged.mdl')
SpawnProp(Vector(-83.351471, -37.080708, 526.910034),Angle(0.009, 89.515, 0.117),'models/props_junk/wood_crate001a_damaged.mdl')
SpawnProp(Vector(-171.192139, -36.294502, 526.919189),Angle(-0.024, 89.486, -0.021),'models/props_junk/wood_crate002a.mdl')
SpawnProp(Vector(1297.601685, 1247.071777, 507.499817),Angle(-0.000, -111.204, -0.000),'models/items/item_item_crate.mdl')
SpawnProp(Vector(1311.509888, 1249.578247, 531.999573),Angle(-0.000, -131.606, 0.000),'models/items/item_item_crate.mdl')
SpawnProp(Vector(1309.603394, 1255.303101, 556.499390),Angle(0.000, -104.139, 0.000),'models/items/item_item_crate.mdl')
SpawnProp(Vector(1307.817993, 1254.004883, 580.999146),Angle(-0.000, -94.581, 0.000),'models/items/item_item_crate.mdl')
SpawnProp(Vector(1306.235352, 1254.903320, 605.498901),Angle(-0.000, -92.365, 0.000),'models/items/item_item_crate.mdl')
SpawnProp(Vector(1298.442871, 1261.504395, 654.498108),Angle(-0.001, -86.249, 0.002),'models/items/item_item_crate.mdl')
SpawnItem('combine_mine',Vector(886.995911, 1067.855957, 543.410339),Angle(-2.018, 5.429, -1.124))
SpawnItem('combine_mine',Vector(921.296387, 1053.582642, 544.782043),Angle(-1.724, 9.951, -0.979))
SpawnItem('combine_mine',Vector(954.459473, 1048.411255, 546.046997),Angle(-1.107, 38.083, -1.712))
SpawnItem('combine_mine',Vector(981.756836, 1041.227295, 547.069519),Angle(-0.955, 37.699, -1.602))
SpawnProp(Vector(-798.082275, 472.901733, 518.234436),Angle(0.032, -87.444, -0.266),'models/props_junk/cinderblock01a.mdl')
SpawnProp(Vector(-777.619141, 387.757721, 512.380554),Angle(-0.462, 31.834, 90.205),'models/props_junk/cinderblock01a.mdl')
SpawnProp(Vector(-825.225342, 462.315887, 512.287109),Angle(-0.553, 131.194, -90.038),'models/props_junk/cinderblock01a.mdl')
SpawnProp(Vector(1244.890015, 615.640442, 517.874878),Angle(0.161, 173.049, 0.081),'models/props_junk/gascan001a.mdl')
SpawnProp(Vector(1226.934448, 585.305054, 510.542450),Angle(89.856, -107.001, 69.553),'models/props_junk/gascan001a.mdl')
SpawnProp(Vector(1237.446899, 557.799377, 517.845398),Angle(0.212, 169.858, 0.107),'models/props_junk/gascan001a.mdl')
SpawnProp(Vector(1314.973145, 400.510101, 1019.361755),Angle(-0.025, 18.961, 0.000),'models/props_c17/oildrum001.mdl')
SpawnProp(Vector(1307.968750, 438.784912, 1019.381165),Angle(-0.022, 10.107, 0.000),'models/props_c17/oildrum001.mdl')
SpawnProp(Vector(1318.514893, 64.631447, 1138.430542),Angle(0.120, -156.842, 0.010),'models/props_wasteland/controlroom_chair001a.mdl')
SpawnProp(Vector(-2807.755859, -802.013184, 1138.344482),Angle(0.015, 50.455, 0.007),'models/props_wasteland/controlroom_chair001a.mdl')
SpawnDynamicAmmoCrate(Vector(1297.601685, 1247.071777, 507.499817),Angle(-0.000, -111.204, -0.000))
SpawnDynamicAmmoCrate(Vector(1311.509888, 1249.578247, 531.999573),Angle(-0.000, -131.606, 0.000))
SpawnDynamicAmmoCrate(Vector(1309.603394, 1255.303101, 556.499390),Angle(0.000, -104.139, 0.000))
SpawnDynamicAmmoCrate(Vector(1307.817993, 1254.004883, 580.999146),Angle(-0.000, -94.581, 0.000))
SpawnDynamicAmmoCrate(Vector(1306.235352, 1254.903320, 605.498901),Angle(-0.000, -92.365, 0.000))
SpawnDynamicAmmoCrate(Vector(1306.158936, 1259.754761, 629.998657),Angle(-0.000, -88.180, 0.000))
SpawnDynamicAmmoCrate(Vector(1298.442871, 1261.504395, 654.498108),Angle(-0.001, -86.249, 0.002))



print("Removing troubling entities")
for k, v in pairs(ents.GetAll()) do
--if tostring(v:EntIndex()) == "459" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "444" then  print(v:EntIndex()) v:Remove() end

if tostring(v:EntIndex()) == "306" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "443" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "290" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "291" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "483" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "475" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "476" then  print(v:EntIndex()) v:Remove() end
end
print("Done")
end
---------------------- END OF CONFIGURATION FILE ----------------------

