/*-------------------------------------------------------------------------------------
To get the position and angles of a prop/npc/whatever:
lua_run print("Entity: ") print(player.GetByID(1):GetEyeTrace().Entity) print("Position: ") print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print("Angles: ") print(player.GetByID(1):GetEyeTrace().Entity:GetAngles())

To get a entity model:  
lua_run print("Model: ") print(player.GetByID(1):GetEyeTrace().Entity:GetModel())

---------------------------------------------------------------------------------*/
CombineFirstWave = 20
CombineSecondWave = 20
CombineThirdWave = 20
CombineFourthWave = 20
CombineFifthWave = 1
CombineInfiniteWave = 50

CUSTOMWAVESPAWN = 70

ITEMPLACES ={
Vector(5598.376953, 845.021606, 169.564438),
Vector(4811.672852, 2020.771118, -242.142380),
Vector(2369.142578, -2691.803223, -305.965485),
Vector(1501.251709, 2259.011230, -0.608799),
}

zonescovered ={
Vector(1639.299683, -686.388367, 64.031250),
Vector(1312.179321, 1663.387695, 0.031250),
Vector(1931.130859, 1663.598511, -7.968750),
Vector(2954.117920, 1760.779663, 0.031250),
Vector(3271.595215, 1764.093018, 0.031250),
Vector(4306.386719, -185.667038, 0.031250),
Vector(2832.933838, 224.289124, 16.031250),
Vector(3868.705811, 874.989685, 0.031250),
Vector(4021.185791, 1411.708008, 0.031250),
Vector(4999.776855, 2444.806396, -191.968750),
Vector(4782.586914, 1578.696899, -191.968750),
Vector(4285.488281, 2015.032715, 64.031250),
Vector(5654.048828, 1325.765015, 64.031250),
Vector(5088.790527, 2950.499756, 64.031250),
Vector(5651.779785, 849.153320, 200.031250),
Vector(4477.208984, 324.826324, 192.031250),
Vector(2226.072021, 355.806915, 288.031250),
Vector(-251.481232, 2420.021973, 288.031250),
Vector(1257.092407, 1036.988647, 288.031250),
Vector(1860.508179, -1304.199585, 256.031250),
Vector(2869.935303, -2617.646240, -126.817810),
Vector(-354.604950, -3704.404297, -175.968750),
Vector(408.216095, -2108.715820, 64.031250),
Vector(2112.899414, -2012.923950, 64.031250),
Vector(2644.628174, -2463.968750, 64.031250),
Vector(3171.071777, -2173.540283, 320.031250),
Vector(2774.020508, -3068.635986, 320.031250),
Vector(2573.004883, -3965.562500, 320.031250),
Vector(4011.360840, -4497.452148, 64.031250),
Vector(4311.144531, -3429.083008, 256.031250),
Vector(4271.703613, -4041.509521, 64.031250),
Vector(4523.650879, -3420.136230, 64.031235),
Vector(1428.922363, -3299.947266, 128.031250),
Vector(-406.398407, -4226.107910, 320.031250),
Vector(456.171539, -2174.040283, 352.031250),
Vector(104.236015, -2443.307373, 352.031250),
Vector(-1749.227783, -3421.812744, 352.031250),
Vector(-1049.858887, -2114.182129, 352.689728),
Vector(-575.587463, -1806.853638, 352.037323),
Vector(-1480.876831, -1110.617432, 352.031250),
Vector(-2287.533936, -975.968750, 352.031250),
Vector(-1663.129395, -81.944077, 352.032166),
Vector(-1944.967773, -572.907898, 352.031250),
Vector(-1853.000488, 1056.963501, 112.031250),
Vector(-2758.219727, 1726.982056, 48.031250),
Vector(-2046.090332, 2782.576172, 64.031250),
Vector(-474.487488, 2768.230957, 19.178886),
Vector(-1098.039307, 2608.826172, 288.031250),
Vector(-710.248718, 2236.443359, 288.031250),
Vector(-2132.777588, 2418.233643, 288.031250),
Vector(-3923.945313, 1679.150513, 256.031250),
Vector(-2115.780273, 982.385864, 288.031250),
Vector(-1701.505615, 658.120117, 288.031250),
Vector(-275.076355, -3544.174561, 64.031250),
Vector(-954.308411, -3919.667480, 64.031250),
Vector(888.605408, -2352.713623, 544.031250),
Vector(1085.494141, -3513.842773, 432.031250),
Vector(129.704300, -3537.333740, 432.031097),
Vector(2086.308350, -2299.440430, 496.031250),
Vector(2901.187012, 221.456070, 288.031250),
Vector(2857.859131, 908.952332, 288.031250),
Vector(2238.913330, 885.067200, 288.031250),
Vector(2931.322754, -4563.680664, 64.031250),
Vector(3426.439941, -1902.278931, 64.031250),
Vector(128.621078, -3753.956787, 432.031250),
Vector(-1727.694336, 2175.290771, 288.031250),
Vector(-327.750519, 337.134186, 128.031250),
}

combinespawnzones = {
Vector(1418.704956, -219.534561, 64.031250),
Vector(1415.690063, 429.557861, 64.031250),
Vector(3641.687012, -3025.595459, 64.031250),
Vector(3092.261719, -3410.646240, 64.031250),
Vector(1566.765625, 550.422363, 64.031250),
Vector(1544.315430, -311.538544, 64.031250),
Vector(3292.492676, -2960.350830, 64.031250),
Vector( 2775.436523, -3403.709473, 64.031250),
}


SPECIALITEMPLACES = {Vector(2323.769531, -2851.547852, -255.968750),}

MAP_PROPS = {"models/props_combine/breendesk.mdl","models/props_junk/wood_crate001a.mdl","models/props_c17/FurnitureDrawer001a.mdl",
"models/props_wasteland/prison_bedframe001b.mdl","models/props_c17/oildrum001.mdl","models/props_c17/FurnitureTable002a.mdl",
"models/props_c17/furniturecouch001a.mdl","models/props_c17/furniturecouch002a.mdl","models/props_junk/trashdumpster01a.mdl",
"models/props_vehicles/car005a.mdl","models/props_wasteland/kitchen_counter001d.mdl","models/props_vehicles/car005b_physics.mdl", 
"models/props_combine/combine_interface001.mdl","models/props_combine/combine_interface002.mdl","models/props_combine/combine_interface003.mdl",
"models/props_interiors/furniture_couch01a.mdl","models/props_c17/furniturewashingmachine001a.mdl","models/props_interiors/furniture_couch02a.mdl",
"models/props_c17/furniturestove001a.mdl","models/props_junk/wood_crate002a.mdl","models/props_wasteland/kitchen_stove002a.mdl",
"models/props_wasteland/laundry_dryer002.mdl","models/props_vehicles/wagon001a.mdl"}


function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this island.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(8, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: A maximun of "..GetConVarNumber("h_combine_killed_to_win").." ground units are available for this mission.") end )
timer.Simple(15, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )
timer.Simple(30, function()ply:PrintMessage(HUD_PRINTTALK, "HINT: RPG spawns on one of the islands.") end )

end

function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

if math.random (1,2) == 1 then 
		SpawnTurret(Vector(1296.726685, -3441.329834, 64.772011),Angle(0.292, 41.580, 0.428))
	elseif math.random (1,2) == 1 then 
		SpawnTurret(Vector(1614.545410, -3121.053711, 64.723488),Angle(0.217, -136.475, 0.003))
	else
		SpawnTurret(Vector(1614.545410, -3121.053711, 64.723488),Angle(0.217, -136.475, 0.003))
		SpawnTurret(Vector(1296.726685, -3441.329834, 64.772011),Angle(0.292, 41.580, 0.428))
end
if math.random (1,2) == 1 then 
		SpawnTurret(Vector(1302.889648, -3125.792969, 64.762810),Angle(0.324, -44.232, 0.660))
	elseif math.random (1,2) == 1 then 
		SpawnTurret(Vector(1615.629028, -3440.439453, 64.769547),Angle(0.302, 137.163, 0.575))
	else
		SpawnTurret(Vector(1615.629028, -3440.439453, 64.769547),Angle(0.302, 137.163, 0.575))
		SpawnTurret(Vector(1302.889648, -3125.792969, 64.762810),Angle(0.324, -44.232, 0.660))
end
SpawnTurret(Vector(2123.841797, -3515.516602, -175.246979),Angle(0.353, -179.877, 0.668))
SpawnTurret(Vector(2124.125244, -3448.574463, -175.247986),Angle(0.356, -179.881, 0.677))

SpawnRollermine(Vector(7279.389648, -1044.230957, 11.271468))
SpawnRollermine(Vector(7279.492676, -1675.874756, 11.809002))
SpawnRollermine(Vector(7914.436035, -1681.226074, 11.594821))
SpawnRollermine(Vector(7917.287598, -1042.820435, 13.057981))
SpawnRollermine(Vector(770.411865, -3484.906738, -498.942352))
SpawnRollermine(Vector(1906.360107, -3820.618164, -500.573547))
SpawnRollermine(Vector(1166.265747, -3899.351074, -500.348602))
SpawnRollermine(Vector(1743.860596, -3528.816162, -500.075073))

SpawnItem("npc_sniper", Vector(6923.431152, -1289.412598, 502.105530), Angle(0.000, 180.626, 0.000))
SpawnStaticProp(Vector(7023.188477, -1255.104858, 447.703949),Angle(-0.085, -89.111, 0.014),"models/props_combine/combinetower001.mdl")
SpawnItem("npc_sniper", Vector(-5891.018066, -1258.150757, 360.305756), Angle(0.000, 0.012, 0.000))
SpawnStaticProp(Vector(-5928.246582, -1169.723755, 305.951172),Angle(0.000, 0.000, 0.000),"models/props_combine/combinetower001.mdl")
SpawnItem("npc_sniper", Vector(-5231.165039, 6229.983398, 325.061249), Angle(0.000, 300.369, 0.000))
SpawnStaticProp(Vector(-5259.581055, 6322.396484, 270.405945),Angle(-0.678, -3.266, 0.183),"models/props_combine/combinetower001.mdl")
SpawnItem("npc_sniper", Vector(-5153.548340, -7073.489746, 512.031250), Angle(0.000, 45.712, 0.000))

if math.random (1,2) == 1 then 
		SpawnAmmoCrate(Vector(3184.586670, -2906.053955, 16.494267),Angle(0.029, -0.415, 0.006),1)
	else
		SpawnAmmoCrate(Vector(3184.299072, 544.625610, -95.607323),Angle(-0.017, 0.072, -0.035),1)
end
SpawnAmmoCrate(Vector(1296.274048, -3277.729248, 80.405571),Angle(-0.018, 0.063, 0.010),5)
SpawnAmmoCrate(Vector(2033.897827, -3032.898438, -303.526520),Angle(0.054, -179.897, 0.023),8)
SpawnAmmoCrate(Vector(1936.518921, -2460.506104, 448.464081),Angle(0.005, 0.777, 0.000),3)
SpawnAmmoCrate(Vector(-1167.674072, -3729.789307, 384.499512),Angle(-0.000, -0.019, 0.000),3)
SpawnAmmoCrate(Vector(4589.982422, -3422.386719, 16.499527),Angle(-0.002, -178.889, 0.001),3)

if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(-2728.415039, 1600.456909, 35.088768), Angle(0.078, 90.029, 0.060) )
	else
		SpawnItem("item_healthcharger", Vector(-2726.816162, 1855.573608, 33.039696), Angle(0.050, -90.069, -0.160) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(4704.346191, 84.687721, 54.381073), Angle(0.035, 0.219, -0.015) )
	else
		SpawnItem("item_healthcharger", Vector(3936.312012, -3688.983154, 240.647614), Angle(0.000, 0.000, 0.000) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1633.049438, -544.481140, 54.784180), Angle(0.304, -90.338, 0.012) )
	else
		SpawnItem("item_healthcharger", Vector(3202.211914, -3712.453613, 53.990517), Angle(0.012, -89.811, -0.025) )
end
SpawnItem("item_healthcharger", Vector(1504.321045, 1952.439331, 50.104649), Angle(0.000, 90.000, 0.000) )

SpawnItem("button_turrets", Vector(2178.723877, -3484.556641, -431.086761), Angle(0.000, 180.000, -0.000))

SpawnCeilingTurretStrong(Vector(2447.041748, -3012.408936, -192.031219),Angle(0.000, 126.797, 0.000))
SpawnCeilingTurretStrong(Vector(2447.362061, -2717.342041, -192.031250),Angle(1.520, -127.759, -0.484))
SpawnCeilingTurretStrong(Vector(2237.177246, -2992.990967, -192.031250),Angle(-0.000, 56.393, 0.000))
SpawnCeilingTurretStrong(Vector(2234.515625, -2722.580566, -192.030014),Angle(-1.200, -51.079, 0.011))
SpawnCeilingTurretStrong(Vector(6976.949219, -703.935181, 159.968750),Angle(0.000, 315.377, 0.000))
SpawnCeilingTurretStrong(Vector(8569.809570, -675.819336, 175.968750),Angle(0.000, 226.765, 0.000))
SpawnCeilingTurretStrong(Vector(8565.261719, -1495.999512, 175.968750),Angle(0.000, 133.418, 0.000))
SpawnCeilingTurretStrong(Vector(8074.458008, -1492.597168, 175.968750),Angle(0.000, 48.512, 0.000))
SpawnCeilingTurretStrong(Vector(7931.117676, -891.563477, 159.993423),Angle(0.000, 135.000, 0.000))
SpawnCeilingTurretStrong(Vector(7326.024414, -898.020203, 159.968750),Angle(0.000, 46.032, 0.000))
SpawnCeilingTurretStrong(Vector(7935.949707, -673.563049, 159.968750),Angle(0.000, 227.776, 0.000))
SpawnCeilingTurretStrong(Vector(7331.228516, -672.669861, 159.968750),Angle(0.000, 317.711, 0.000))
SpawnCeilingTurretStrong(Vector(8071.860840, -678.042786, 175.968750),Angle(0.000, 314.892, 0.000))

if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(2506.557373, -3000.291992, 384.487427), Angle(0.001, 104.983, 0.049))
	else
		SpawnDynamicAmmoCrate(Vector(-31.375372, 183.539566, 273.487854), Angle(90.000, 179.934, 180.000))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(3035.103516, -2403.142090, 456.500916), Angle(0.023, -156.856, 179.977))
	else
		SpawnDynamicAmmoCrate(Vector(1356.904663, -2468.102783, 288.497314), Angle(0.001, 92.235, 0.009))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(-1750.305664, -2605.188232, 272.490448), Angle(-0.034, 102.729, -0.002))
	else
		SpawnDynamicAmmoCrate(Vector(-1278.261719, -3623.759033, 272.418243), Angle(-0.123, -115.057, 0.054))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(5247.671387, 670.947998, 176.473343), Angle(0.080, 0.018, 0.192))
	else
		SpawnDynamicAmmoCrate(Vector(3056.397949, 277.138367, -47.558582), Angle(-0.098, -179.829, 0.015))
end
if math.random (1,2) == 1 then 
		SpawnDynamicAmmoCrate(Vector(4449.247559, 1821.508179, 448.447235), Angle(-0.178, 1.101, -0.001))
	else
		SpawnDynamicAmmoCrate(Vector(4417.972168, -4318.392578, 0.339740), Angle(0.001, -111.118, -0.001))
end
SpawnDynamicAmmoCrate(Vector(2360.614990, -3034.981445, -319.514008), Angle(0.002, 111.739, 0.002))
SpawnDynamicAmmoCrate(Vector(2322.824463, -3037.767822, -302.512207), Angle(90.000, -2.734, 180.000))
SpawnDynamicAmmoCrate(Vector(2217.723633, -2704.186523, -295.072449), Angle(-0.053, -53.380, 0.429))
SpawnDynamicAmmoCrate(Vector(2218.657227, -2703.299072, -319.554047), Angle(-0.133, -18.809, -0.049))
SpawnDynamicAmmoCrate(Vector(6859.861816, -655.903076, 0.391035), Angle(-0.049, -88.734, 0.220))
SpawnDynamicAmmoCrate(Vector(6738.099609, -1287.434814, 17.414131), Angle(89.952, 90.241, 180.000))

SpawnSuitCharger(Vector(2479.613281, -2864.105713, -266.347839), Angle(0.326, 179.994, -1.121) )
SpawnSuitCharger(Vector(7600.055664, -1695.541382, 50.305809), Angle(0.009, 90.017, -0.828) )

SpawnAirboat(Vector(8229.806641, -1047.568604, -39.637466),Angle(0.265, -179.160, -0.277))
SpawnAirboat(Vector(3077.021484, 2094.950928, -39.171932),Angle(0.390, -2.298, 0.188))

SpawnStaticProp(Vector(2078.591309, -663.148071, 292.413055),Angle(-2.736, 149.800, -178.771),"models/props_combine/combine_barricade_tall04a.mdl")
SpawnStaticProp(Vector(2081.083008, -1051.724609, 293.912506),Angle(-2.736, 150.590, -178.771),"models/props_combine/combine_barricade_tall04a.mdl")
SpawnStaticProp(Vector(417.240479, -2427.609619, 26.106607),Angle(-6.538, 90.244, -0.430),"models/props_combine/combine_barricade_tall01a.mdl")
SpawnStaticProp(Vector(479.271851, -2428.325928, 26.988401),Angle(-7.114, 89.924, -0.000),"models/props_combine/combine_barricade_tall01a.mdl")
SpawnStaticProp(Vector(-1807.790771, 655.152283, 510.444031),Angle(0.009, 0.566, -0.006),"models/props_combine/combine_booth_short01a.mdl")
SpawnStaticProp(Vector(-1054.423462, -3385.385986, 30.439697),Angle(0.005, 89.984, -0.014),"models/props_combine/combine_booth_short01a.mdl")
SpawnStaticProp(Vector(-5371.084961, -562.132996, 68.352554),Angle(6.752, -0.068, -0.685),"models/props_combine/combine_barricade_med02c.mdl")
SpawnStaticProp(Vector(-5642.994629, 6345.157227, 36.761147),Angle(6.705, -0.047, -0.421),"models/props_combine/combine_barricade_med02c.mdl")
SpawnStaticProp(Vector(-1177.244019, -1889.673706, 32.187645),Angle(1.285, -0.001, -0.005),"models/props_combine/combine_barricade_med02a.mdl")
SpawnStaticProp(Vector(-292.342499, -2320.306152, 355.156006),Angle(-2.765, 115.075, -1.278),"models/props_combine/combine_barricade_short03a.mdl")
SpawnStaticProp(Vector(-219.904831, -2321.051514, 354.420197),Angle(-1.159, 116.150, -0.642),"models/props_combine/combine_barricade_short03a.mdl")
SpawnStaticProp(Vector(-1713.790894, -3072.112549, 175.244034),Angle(9.805, -0.002, -0.009),"models/props_combine/combine_barricade_short01a.mdl")
SpawnStaticProp(Vector(2125.084961, -3483.928467, -512.250122),Angle(-2.459, 179.008, -0.000),"models/props_exteriors/wood_stairs_40.mdl")
SpawnStaticProp(Vector(2227.904053, 430.147583, -21.592709),Angle(-1.908, 179.759, 14.360),"models/props_docks/canal_dock01a.mdl")

if math.random(1,2) == 1 then
SpawnProp(Vector(-1658.559448, 2158.350830, 224.476395),Angle(0.064, -179.959, 0.001),"models/props_combine/combine_interface002.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-2211.287109, 1062.493164, 250.174347),Angle(-0.000, 72.677, -0.000),"models/props_vehicles/car005a_physics.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-2004.684082, 1182.571411, 248.879761),Angle(-0.074, 35.369, 1.863),"models/props_vehicles/car001a_hatchback.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-2119.217285, 2225.288086, 246.084229),Angle(-0.380, -80.558, -0.061),"models/props_vehicles/car004b_physics.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-815.857483, 2154.572021, 283.449371),Angle(0.333, -75.800, -0.049),"models/props_vehicles/truck001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-568.175537, 2254.524414, 301.898193),Angle(1.432, -79.095, 0.739),"models/props_vehicles/truck002a_cab.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-2248.769531, 1893.394165, 48.577061),Angle(-0.103, -89.957, 0.036),"models/props_combine/combine_interface001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1966.762817, 1048.768188, 68.501198),Angle(0.000, 0.148, 0.000),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1392.583740, -1228.258545, 288.445984),Angle(-0.154, 65.701, -0.220),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1644.868652, -3284.294189, 288.369354),Angle(-0.047, -32.517, 0.110),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-577.696716, -2650.876953, 308.310333),Angle(0.278, -72.388, -0.252),"models/props_junk/wood_crate001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1158.143311, -3304.125000, 308.445587),Angle(-0.000, -4.774, -0.000),"models/props_junk/wood_crate001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(55.494514, -3239.116211, 308.505310),Angle(-0.000, 150.135, 0.000),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(34.082283, -2254.632813, 308.496490),Angle(-0.008, 0.605, -0.008),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(1239.963379, -2458.438232, 308.499542),Angle(-0.018, 126.891, -0.001),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2163.082275, -2426.620361, 224.480118),Angle(-0.119, -89.949, -0.043),"models/props_combine/combine_interface003.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2579.763672, -2346.845947, -136.227417),Angle(4.092, 28.861, 101.82),"models/props_wasteland/kitchen_stove002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-301.515686, -3483.560303, -239.586502),Angle(0.009, -0.049, 0.278),"models/props_wasteland/kitchen_stove002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(545.302124, -2915.706299, -213.238419),Angle(7.429, 132.653, -11.418),"models/props_docks/canal_dock02a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-56.826260, 137.105072, 84.464714),Angle(89.895, 32.993, 28.070),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-310.537292, 286.632446, 95.788651),Angle(-85.878, 99.710, 0.000),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(34.082283, -2254.632813, 308.496490),Angle(-0.008, 0.605, -0.008),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2251.233154, 906.534912, 282.805023),Angle(0.171, -138.395, 0.356),"models/props_vehicles/truck003a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2416.827393, 433.290833, 224.428680),Angle(-0.005, -94.515, 0.006),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2642.196777, 877.931274, 224.499817),Angle(-0.000, 160.299, 0.000),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-301.515686, -3483.560303, -239.586502),Angle(0.009, -0.049, 0.278),"models/props_wasteland/kitchen_stove002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2234.575195, -2502.436523, 452.456696),Angle(-0.007, -176.132, -0.012),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1108.372803, -2022.861816, 308.460114),Angle(-0.000, -66.737, -0.076),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1923.959595, 2884.701172, 20.391685),Angle(-0.216, -117.778, -0.408),"models/props_junk/wood_crate001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1777.434692, -464.909088, 288.419525),Angle(0.286, 90.477, 0.159),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-2045.749634, -425.451111, 305.480225),Angle(-0.016, 96.610, 89.991),"models/props_wasteland/kitchen_stove002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2652.451172, -3101.149414, 284.437561),Angle(0.602, 116.468, -179.051),"models/props_vehicles/wagon001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(3016.822510, -4559.702637, 31.773289),Angle(-85.796, -48.762, 0.142),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(4414.192871, -4195.212402, 34.701141),Angle(-0.216, -40.678, 89.824),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(2289.126709, -2078.471191, 0.490877),Angle(0.037, -178.687, -0.184),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-812.918213, -3967.040039, 44.620396),Angle(-0.899, -133.226, -0.006),"models/props_vehicles/trailer002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(-1062.374268, -3989.230469, 34.193577),Angle(-0.362, 114.141, -0.291),"models/props_vehicles/van001a_physics.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(800.839111, -2680.587891, 500.374420),Angle(-0.109, 155.783, -179.994),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(1251.122192, -2518.117676, 500.358704),Angle(0.007, 124.732, 89.978),"models/props_junk/wood_crate001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(5342.835449, 3009.461182, 20.501200),Angle(0.000, -179.859, -0.000),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(4186.185547, 3102.655762, 20.501200),Angle(0.000, -89.736, 0.000),"models/props_wasteland/kitchen_counter001d.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(4206.885254, 1009.100708, -63.539017),Angle(0.159, -65.563, -0.106),"models/props_c17/oildrum001.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(4177.124512, -335.511444, -43.592564),Angle(-89.980, -25.409, 180.000),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(3435.235107, 1786.047974, -43.515961),Angle(0.115, 179.842, 0.054),"models/props_junk/wood_crate002a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(3045.813721, 1832.558472, -43.554279),Angle(-0.049, -80.645, -0.049),"models/props_junk/wood_crate001a.mdl")
end
if math.random(1,2) == 1 then
SpawnProp(Vector(1198.543701, 1488.247559, -63.551094),Angle(0.195, 73.159, -0.208),"models/props_c17/oildrum001.mdl")
end

SpawnProp(Vector(3143.906982, 822.822021, 157.538376),Angle(-89.995, -176.059, 180.000),"models/props_wasteland/laundry_dryer002.mdl")
SpawnProp(Vector(130.240372, -3666.385986, 368.298676),Angle(0.479, -90.000, 0.000),"models/props_combine/combine_interface002.mdl")
SpawnProp(Vector(4170.936035, 1470.618896, -18.527561),Angle(0.104, 53.597, 179.477),"models/props_c17/oildrum001.mdl")
SpawnProp(Vector(1423.942993, -3280.131836, 64.407394),Angle(0.019, -1.062, -0.021),"models/props_combine/breendesk.mdl")
SpawnProp(Vector(1401.861938, -3280.531494, 64.455132),Angle(-0.000, -1.094, 0.000),"models/props_combine/breenchair.mdl")
SpawnProp(Vector(1866.848511, -2196.508789, 308.359436),Angle(0.156, 0.000, 90.182),"models/props_junk/wood_crate001a.mdl")

SpawnProp(Vector(-570.822754, -3712.119141, 389.090515),Angle(-0.000, -87.891, -88.441),"models/props_junk/wood_crate001a_damaged.mdl")
SpawnProp(Vector(-583.767456, -3666.971924, 429.348999),Angle(0.420, -105.852, -1.738),"models/props_junk/wood_crate001a_damaged.mdl")
SpawnProp(Vector(-591.513306, -3662.728027, 388.521545),Angle(-0.033, 166.194, 89.425),"models/props_junk/wood_crate001a_damaged.mdl")

SpawnItem("info_player_start", Vector(3994.403076, 1308.080566, 0.031250)+Vector(0,0,-45), Angle(4.448360, 43.793793, 0.000000))
SpawnItem("info_player_start", Vector(-2084.846680, 2840.206543, 64.031250)+Vector(0,0,-45), Angle(6.024621, -10.061868, 0.000000))
SpawnItem("info_player_start", Vector(-2573.796631, 1624.656250, 48.031250)+Vector(0,0,-45), Angle(6.419731, 57.845436, 0.000000))
SpawnItem("info_player_start", Vector(-1653.581055, 1216.906982, 112.031250)+Vector(0,0,-45), Angle(7.407530, -123.119606, 0.000000))
SpawnItem("info_player_start", Vector(-1671.480469, -425.886322, 352.031250)+Vector(0,0,-45), Angle(17.087982, 83.870071, 0.000000))
SpawnItem("info_player_start", Vector(-1582.166626, -1198.044067, 352.031250)+Vector(0,0,-45), Angle(3.851451, 78.779350, 0.000000))
SpawnItem("info_player_start", Vector(-1296.008545, -3385.096680, 352.031250)+Vector(0,0,-45), Angle(5.234374, -179.378265, 0.000000))
SpawnItem("info_player_start", Vector(700.976929, -2479.794678, 352.031250)+Vector(0,0,-45), Angle(4.542919, 53.932663, 0.000000))
SpawnItem("info_player_start", Vector(164.784073, -2501.334717, 352.031250)+Vector(0,0,-45), Angle(8.988017, 95.914101, 0.000000))
SpawnItem("info_player_start", Vector(1830.847534, -2603.333984, 496.031250)+Vector(0,0,-45), Angle(4.250966, -0.808381, 0.000000))
SpawnItem("info_player_start", Vector(378.920563, -3831.217773, 432.031250)+Vector(0,0,-45), Angle(10.474080, 88.580154, 0.000000))
SpawnItem("info_player_start", Vector(1920.031250, -1856.031250, 64.031250)+Vector(0,0,-45), Angle(9.288696, -41.110222, 0.000000))
SpawnItem("info_player_start", Vector(2882.894531, -2430.384521, -134.844788)+Vector(0,0,-45), Angle(3.658246, -137.124390, 0.000000))
SpawnItem("info_player_start", Vector(-110.053726, -3519.215088, 64.031250)+Vector(0,0,-45), Angle(4.547256, -159.152756, 0.000000))
SpawnItem("info_player_start", Vector(3041.916260, 1626.535767, 0.031250)+Vector(0,0,-45), Angle(10.770336, 146.912140, 0.000000))
SpawnItem("info_player_start", Vector(3981.705078, -29.075815, 0.031250)+Vector(0,0,-45), Angle(5.436231, -64.423653, 0.000000))
SpawnItem("info_player_start", Vector(3175.458984, 924.850830, 288.031250)+Vector(0,0,-45), Angle(6.325254, -162.553696, 0.000000))
SpawnItem("info_player_start", Vector(-117.761375, 474.903168, 128.031250)+Vector(0,0,-45), Angle(8.791447, 178.780380, 0.000000))

CreateHeliPath(Vector(564.066650, 4525.123047, 1127.825195))
CreateHeliPath(Vector(639.569519, 1663.438965, 1198.911255))
CreateHeliPath(Vector(516.780334, -1074.561646, 1189.562866))
CreateHeliPath(Vector(2256.108887, 828.205139, 1343.124268))
CreateHeliPath(Vector(4835.272949, 1403.697510, 1343.124268))
CreateHeliPath(Vector(3463.739014, -1515.791992, 1343.124268))
CreateHeliPath(Vector(2943.554199, -4720.465820, 1343.124268))
CreateHeliPath(Vector(922.125427, -3981.445801, 1343.124268))
CreateHeliPath(Vector(-1049.768433, -2400.585693, 1343.124268))
CreateHeliPath(Vector(-1057.526245, 1672.566895, 1343.124268))
CreateHeliPath(Vector(2576.955322, 2246.208496, 1343.124268))
CreateHeliPath(Vector(5602.979980, -650.664001, 1425.638794))
CreateHeliPath(Vector(7973.642578, -2781.933350, 1472.639648))
CreateHeliPath(Vector(1872.591309, -1098.548706, 1331.858032))
CreateHeliPath(Vector(-4179.760254, -146.672882, 1530.137451))
CreateHeliPath(Vector(-2030.912109, -5043.209473, 1338.300659))
CreateHeliPath(Vector(6366.286133, -3930.844727, 1230.071289))
CreateHeliPath(Vector(7272.689453, 1571.875366, 1309.867554))
CreateHeliPath(Vector(4330.930176, 4923.148926, 1118.183960))
CreateHeliPath(Vector(-3811.563965, 2566.665527, 1202.947021))
CreateHeliPath(Vector(-5010.525879, 5641.643066, 1238.598389))
CreateHeliPath(Vector(5666.755859, 2759.303223, 1064.141846))
CreateHeliPath(Vector(4555.541016, -5682.021484, 831.526184))
CreateHeliPath(Vector(5021.071289, -2481.224121, 801.015198))
CreateHeliPath(Vector(1091.125977, -6795.336914, 1430.005615))
CreateHeliPath(Vector(1838.758057, -2798.128418, 1479.820313))

CreateHeliPath(Vector(1026.682129, -1221.959351, 151.241730))
CreateHeliPath(Vector(294.791138, -540.915649, 257.234528))
CreateHeliPath(Vector(6104.748535, 119.911522, 560.254761))
CreateHeliPath(Vector(5104.076660, 1393.291016, 675.699768))
CreateHeliPath(Vector(5378.442383, 4495.848145, 257.036743))
CreateHeliPath(Vector(3343.496582, 4227.496094, 196.094864))
CreateHeliPath(Vector(1503.317627, 3986.720459, 489.812988))
CreateHeliPath(Vector(1448.135620, 3511.280518, 59.591309))
CreateHeliPath(Vector(-3504.910400, 3064.805176, 287.848145))
CreateHeliPath(Vector(-3634.729492, 187.690948, 295.896545))
CreateHeliPath(Vector(-3496.192627, -2412.253418, 268.078125))
CreateHeliPath(Vector(-492.215698, -3000.909912, 966.109375))
CreateHeliPath(Vector(3483.071045, -4037.228516, 459.653351))
CreateHeliPath(Vector(1849.480103, -3635.176270, 561.680176))
CreateHeliPath(Vector(7604.626465, -1379.411865, 1503.327515))
CreateHeliPath(Vector(8305.940430, -2189.511230, 125.911629))
CreateHeliPath(Vector(7040.363281, -2596.434570, 130.119110))
CreateHeliPath(Vector(6246.130859, -334.248291, 160.325928))
CreateHeliPath(Vector(5964.025879, -3430.635010, 154.008972))
CreateHeliPath(Vector(260.266693, -5699.772949, 119.368835))
CreateHeliPath(Vector(-1034.606323, -5473.069824, 112.631683))
CreateHeliPath(Vector(-3027.587402, -1193.849854, 468.443207))
CreateHeliPath(Vector(-6590.920410, -1198.241943, 1257.568970))
CreateHeliPath(Vector(-6124.779297, -7889.253418, 1348.724365))

SpawnHeliA( Vector(564.066650, 4525.123047, 1127.825195), "npc_helicopter", 0,0 )
SpawnHeliA( Vector(1091.125977, -6795.336914, 1430.005615), "npc_helicopter", 0,0 )

end

function firstwave()
Wave = 1
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
for k, v in pairs(ents.FindByClass("npc_helicopter")) do v:Fire("gunon","",0) v.boss = 1 end
for k, v in pairs(ents.FindByClass("npc_combinegunship")) do v:Fire("gunon","",0) v.boss = 1 end

SpawnItem("weapon_rpg", Vector(7584.053223, -1355.736450, 2.657773), Angle(0.808, -17.401, -82.631) )

if HeliA:Health() != 1100 then print("WARNING: This Helicopter hasn't the adequeate health.") end
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
HelicopterWave(0)
RPGCANSPAWN = 1
end