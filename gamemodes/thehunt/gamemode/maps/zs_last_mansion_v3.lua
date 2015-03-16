include( 'basewaves.lua' )

SPECIALITEMPLACES = {Vector(-252.060135, 1484.715942, 432.480896),}


MAP_PROPS = {"models/props_combine/breendesk.mdl","models/props_c17/furniturecouch001a.mdl","models/props_interiors/furniture_couch01a.mdl",
"models/props_c17/furnituretable003a.mdl","models/props_interiors/furniture_desk01a.mdl","models/props_wasteland/laundry_cart002.mdl",
"models/props_combine/breendesk.mdl","models/props_wasteland/controlroom_desk001a.mdl","models/props_wasteland/cafeteria_table001a.mdl",
"models/props_junk/wood_crate001a.mdl","models/props_c17/furniturebed001a.mdl","models/props_c17/bench01a.mdl",}


ITEMPLACES ={
Vector(260.395447, -449.167542, -114.654221),
Vector(-1491.483643, 2460.523682, -100.896202),
Vector(1283.552124, 1580.317627, -115.029411),
Vector(1653.499634, 673.173157, -127.531509),
Vector(813.082397, -415.036285, -127.500725),
Vector(-763.697083, 199.571045, -63.548870),
}

zonescovered ={
Vector(692.041809, 331.152344, 0.031250),
Vector(897.284973, 969.294495, 0.031250),
Vector(580.910034, 1447.050537, 0.031250),
Vector(614.122009, 1161.949341, 0.031250),
Vector(72.399956, 923.382141, -63.968750),
Vector(162.567734, 1319.612915, -63.968750),
Vector(-345.599365, 1321.278687, -63.968750),
Vector(-644.072876, 944.418457, -63.968750),
Vector(159.490997, 1306.871704, 64.031250),
Vector(139.814880, 890.817200, 64.031250),
Vector(-545.291443, 896.863159, 64.031250),
Vector(-842.104370, 1038.510132, 64.031250),
Vector(-855.219910, 1032.797729, 208.031250),
Vector(-671.058289, 878.467590, 208.031250),
Vector(-552.741821, 1353.039429, 208.031250),
Vector(-269.780151, 951.031250, 208.031250),
Vector(146.364822, 905.388977, 208.031250),
Vector(-378.594513, 1363.067627, 208.031250),
Vector(-130.098099, 1362.281128, 208.031250),
Vector(40.240696, 1322.626099, 208.031250),
Vector(-253.772034, 1538.442017, 208.031250),
Vector(961.306335, 1029.690063, 144.031250),
Vector(-255.548874, 1527.807739, 352.031250),
Vector(-253.872986, 951.242859, 352.031250),
Vector(165.039307, 1254.968384, 352.031250),
Vector(-675.424377, 950.593750, 352.031250),
Vector(-607.079407, 907.842407, 496.031250),
Vector(207.535797, 1216.182251, 496.031250),
Vector(2.681413, 1519.860840, 64.031250),
Vector(-118.233101, 859.008057, 64.031250),
Vector(-280.053070, -373.174500, -59.546013),
Vector(-1665.723755, 1076.442261, -59.963097),
Vector(-1709.579346, 2689.160889, -37.187546),
Vector(-116.966499, 2546.804688, -65.286118),
Vector(1290.145752, 2659.480469, -63.968758),
Vector(1740.869019, 407.841705, -42.937050),
Vector(1686.400391, -709.175598, -35.073494),
Vector(-986.820190, 1288.811157, 0.031250),
}

combinespawnzones = {
Vector(-1458.343384, -200.453842, -55.968750),
Vector(-1532.885742, -190.577728, -55.968750),
Vector(-1461.385376, -398.373108, -55.968750),
Vector(-1567.804321, -398.151093, -55.968750),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Enemies located within the building.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: CODE: Search and destroy.") end )
timer.Simple(6, function() ply:PrintMessage(HUD_PRINTTALK, "HINT: Check the bushes for supplies.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )
end

function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

for k, v in pairs(ents.FindByModel("models/props_wasteland/kitchen_shelf001a.mdl")) do
print(v:GetModel())
v:Remove()
end

for k, v in pairs(ents.FindByModel("models/props_c17/door02_double.mdl")) do
print(v:GetModel())
v:Remove()
end

for k, v in pairs(ents.FindByModel("models/props_debris/wood_board05a.mdl")) do
print(v:GetModel())
v:Remove()
end

for k, v in pairs(ents.FindByModel("models/props_debris/wood_board06a.mdl")) do
print(v:GetModel())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*51")) do
print(v:GetModel())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*50")) do
print(v:GetModel())
v:Remove()
end

if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(845.247864, 895.478088, -12.058261), Angle(0.033, -90.015, 0.100) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-447.480011, 1035.645264, -78.312576), Angle(0.109, 0.171, 0.354) )
	else
		SpawnItem("item_healthcharger", Vector(-464.475433, 956.532166, 49.881882), Angle(-0.127, 179.836, 0.412) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1007.502808, 1164.372681, 128.785446), Angle(0.140, -179.906, 0.294) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-460.903503, 1408.430908, 196.072861), Angle(0.224, 89.674, 0.040) )
	else
		SpawnItem("item_healthcharger", Vector(-568.525696, 1110.423828, 339.464020), Angle(0.144, 179.839, -0.295) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-431.640381, 1166.069336, 480.837982), Angle(0.043, 0.052, -0.102) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-1644.510498, -556.591064, -82.366676), Angle(0.020, 179.974, 0.083) )
	else
		SpawnItem("item_healthcharger", Vector(351.849243, 1344.465088, -14.653479), Angle(0.198, 90.039, -0.243) )
end

SpawnAmmoCrate(Vector(-257.767242, 946.521545, 448.368774),Angle(-0.077, 90.001, -0.012),3)

if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(-1628.736816, -299.827820, 15.016652), Angle(7.414, -168.123, 1.485))
	else
		SpawnDynamicAmmoCrate(Vector(414.388428, -826.694519, -97.237213), Angle(0.098, -178.821, 18.059))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(638.023499, 432.375214, -145.047150), Angle(6.076, -147.136, -5.881))
	else
		SpawnDynamicAmmoCrate(Vector(494.926453, 1386.521606, 0.829452), Angle(0.038, -124.764, -179.920))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(-798.037170, 967.123474, 17.473536), Angle(-0.001, 89.428, 90.002))
	else
		SpawnDynamicAmmoCrate(Vector(-788.125610, 1196.580444, 226.198410), Angle(0.264, -94.339, -0.037))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(218.021942, 889.618042, 144.499802), Angle(-0.000, -150.924, 0.000))
	else
		SpawnDynamicAmmoCrate(Vector(-580.414368, 1432.552246, 288.440918), Angle(0.000, -93.876, -0.199))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(148.055054, 984.074829, 303.516815), Angle(-89.998, 3.972, 180.000))
	else
		SpawnDynamicAmmoCrate(Vector(-115.665207, 1090.282715, 432.413727), Angle(0.379, -0.537, -0.049))
end

SpawnItem("info_player_start", Vector(351.872437, 1118.991699, 288.031250)+Vector(0,0,-50), Angle(2.568245, -0.018379, 0.000000))
SpawnItem("info_player_start", Vector(958.559875, 1118.084351, 288.031250)+Vector(0,0,-50), Angle(1.975563, 179.312897, 0.000000))
SpawnItem("info_player_start", Vector(214.144440, 984.791016, -63.968750)+Vector(0,0,-50), Angle(3.951168, -159.943329, 0.000000))
SpawnItem("info_player_start", Vector(-605.886169, 962.621155, 496.031250)+Vector(0,0,-50), Angle(3.259727, -90.849640, 0.000000))
SpawnItem("info_player_start", Vector(166.160736, 1261.343872, 352.031250)+Vector(0,0,-50), Angle(29.732651, -0.906848, 0.000000))
SpawnItem("info_player_start", Vector(-132.020325, 1364.806885, 208.031250)+Vector(0,0,-50), Angle(4.840076, 88.040962, 0.000000))
SpawnItem("info_player_start", Vector(-538.777039, 1358.129028, 208.031250)+Vector(0,0,-50), Angle(5.531556, -115.688408, 0.000000))
SpawnItem("info_player_start", Vector(595.887756, 1157.908813, 0.031250)+Vector(0,0,-50), Angle(4.840142, 148.008621, 0.000000))

CreateHeliPath(Vector(-265.203308, 311.989502, 257.066467))
CreateHeliPath(Vector(-184.974014, -426.362640, 769.427490))
CreateHeliPath(Vector(848.412354, -371.686768, 769.427490))
CreateHeliPath(Vector(1528.907227, 151.521790, 769.427490))
CreateHeliPath(Vector(1411.878906, 1120.251221, 315.593811))
CreateHeliPath(Vector(1476.852417, 1697.437256, 638.736084))
CreateHeliPath(Vector(401.123505, 1819.369019, 392.150665))
CreateHeliPath(Vector(-228.225739, 2312.030029, 587.693909))
CreateHeliPath(Vector(-237.358658, 2134.791504, 251.434158))
CreateHeliPath(Vector(-1378.595703, 2385.163574, 625.027405))
CreateHeliPath(Vector(-1510.294556, 1161.726440, 533.791077))
CreateHeliPath(Vector(-1440.244507, 1111.286987, 218.088043))
CreateHeliPath(Vector(-1577.310059, 201.387558, 543.994019))
CreateHeliPath(Vector(-855.064575, 113.647316, 400.935913))
CreateHeliPath(Vector(1239.635864, 562.460938, 45.070675))

CreateHeliPath(Vector(668.977295, 1930.734741, 94.814011))
CreateHeliPath(Vector(437.942902, 2685.917236, 258.317383))
CreateHeliPath(Vector(-1101.770996, 1869.359009, 222.640884))
CreateHeliPath(Vector(-1149.094727, -583.516785, 401.819305))
CreateHeliPath(Vector(1430.080322, -384.125458, 220.638916))
CreateHeliPath(Vector(-272.539001, -512.948853, 83.659737))
CreateHeliPath(Vector(599.955444, 246.994080, 1400.792603))
CreateHeliPath(Vector(-1129.677734, 423.459961, 1400.792603))
CreateHeliPath(Vector(-278.414764, 547.019287, 1518.450439))
CreateHeliPath(Vector(147.783127, 1908.621704, 1316.231323))
CreateHeliPath(Vector(-817.209900, 1888.825439, 1316.231323))
CreateHeliPath(Vector(-1240.823364, 1128.402588, 1343.844482))
CreateHeliPath(Vector(1427.200806, 1124.467041, 1298.343872))
CreateHeliPath(Vector(-94.497116, 1271.690796, 2117.913818))
end
