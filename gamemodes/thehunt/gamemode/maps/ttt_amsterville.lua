include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 25

CUSTOMWAVESPAWN = 20

zonescovered ={
Vector(501.836151, 484.933655, 192.031250),
Vector(657.031860, 493.709961, 64.031250),
Vector(398.465088, 394.650146, 64.031250),
Vector(-190.855026, 425.764313, 80.031250),
Vector(-306.309631, 604.284119, 64.031250),
Vector(-463.572998, 207.915375, 192.031250),
Vector(592.249817, 200.880341, 320.031250),
Vector(594.006165, -734.478821, 0.031250),
Vector(1429.380493, -923.616882, 5.168159),
Vector(1073.405518, -202.366684, 144.031250),
Vector(11.221540, -555.402466, -31.968750),
Vector(-876.806946, -126.019112, 96.031250),
Vector(-1201.816895, -410.135010, -31.968750),
Vector(-1515.979736, -467.414276, -31.968750),
Vector(-1676.116455, -257.266144, 96.031250),
Vector(-736.826233, 280.074524, 400.031250),
Vector(-1708.386108, 186.852203, 256.031250),
Vector(946.685852, 448.600525, 128.031250),
Vector(1170.683472, -295.251343, 0.031250),
Vector(-427.825317, 860.325134, -51.968750),
Vector(-317.227753, 1304.841675, -31.968750),
Vector(1876.997192, 309.588318, 16.031250),
Vector(2507.577637, -747.463562, 64.031250),
Vector(2445.432617, -595.738464, 200.031250),
Vector(2926.439209, -740.055847, 64.031250),
Vector(2970.591309, -591.714844, 200.031250),
Vector(3754.796631, 559.184265, 64.031250),
Vector(3731.387695, 887.897217, 64.031250),
Vector(3549.158936, 850.585083, 64.031250),
Vector(1832.172363, 1499.639893, 16.031250),
Vector(2642.458008, 2054.531250, 16.031250),
Vector(2627.859863, 3017.379395, 16.031250),
Vector(3867.092041, 1956.471558, 0.031250),
Vector(3458.320313, -454.370300, 64.031250),
Vector(3267.599609, -951.867859, 192.031250),
Vector(3613.687256, -711.505493, 196.031250),
Vector(3255.893555, -284.252869, 224.031250),
Vector(3492.218994, -1007.060242, 352.031250),
Vector(3123.552734, -854.475525, 356.031250),
Vector(3250.520264, -281.300934, 356.031250),
Vector(2315.182861, 2415.973389, 160.031250),
Vector(2196.935791, 2390.727051, 300.031250),
Vector(1573.770752, 3156.342041, 160.031250),
Vector(1772.886353, 2895.219971, 168.031250),
Vector(1817.712158, 1880.026611, 176.031250),
Vector(1544.278809, 2012.271973, 176.031250),
Vector(1170.353516, 1791.459595, 168.031250),
Vector(865.803162, 1927.406006, 160.031250),
Vector(817.630005, 1816.407593, 160.031250),
Vector(474.160004, 1729.267090, 160.031250),
Vector(322.371063, 1695.114136, 288.031250),
Vector(19.468750, 2517.688721, 176.031250),
Vector(112.818741, 3104.126221, 160.031250),
Vector(476.774170, 2914.794678, 160.031250),
Vector(733.205811, 2908.355713, 160.031250),
Vector(2402.287842, 2859.924072, 160.031250),
Vector(1166.391479, 3042.668945, 336.031250),
Vector(820.111267, 2035.081421, 288.031250),
Vector(613.349548, 1886.878174, 416.031250),
}

MAP_PROPS = {}

SPECIALITEMPLACES = {}
--2609.979492 3121.331787 40.031250
ITEMPLACES ={
Vector(467.509888, 560.290039, 161.380127),
Vector(352.240997, 530.484497, 40.435005),
Vector(1073.566895, -245.259781, 125.816696),
Vector(2435.786377, -742.800842, 146.546936),
Vector(3003.694824, -801.920837, 146.441971),
Vector(1845.436157, 240.074463, 22.682543),
Vector(2086.660156, 1689.473633, -3.600646),
Vector(2613.685059, 1959.838257, -16.267019),
Vector(3615.117676, 898.154175, 16.591724),
Vector(3667.190918, 494.105560, 34.123810),
Vector(3141.670166, -927.665100, 146.345123),
Vector(3643.964355, -928.396179, 146.461060),
Vector(3681.218750, -971.907288, 306.466736),
Vector(3103.353027, -972.816223, 306.456970),
Vector(2603.494385, 3124.075439, -3.604105),
Vector(2364.336914, 2262.317627, 243.642685),
Vector(1704.652100, 1980.041016, 155.725922),
Vector(1137.726440, 1856.803467, 138.439957),
Vector(1941.895630, 3198.914551, 132.385056),
Vector(733.360291, 3120.158691, 130.033569),
Vector(465.228546, 3004.146240, 132.427704),
Vector(-16.297682, 3066.895020, 127.305641),
Vector(-128.377350, 2553.898193, 156.434982),
Vector(471.217499, 1756.266846, 138.410217),
Vector(794.185425, 1815.821777, 136.449173),
Vector(710.384583, 1857.845825, 352.359283),
Vector(881.662292, 1921.553833, 224.460266),
Vector(959.512817, 3023.971924, 288.653992),
Vector(-887.734802, -105.745888, 32.490032),
Vector(-198.444977, -267.634430, -47.096123),
Vector(-1844.222046, -305.694397, 72.575371),
Vector(-1847.965454, 224.054810, 208.626083),
Vector(-663.462097, 280.347687, 354.058685),
Vector(-663.462097, 280.347687, 354.058685),
Vector(-91.526016, 1493.418335, 128.371124),
Vector(1103.268921, 159.305649, -47.374924),
Vector(3897.087891, 2146.375000, -13.366784),
}

combinespawnzones = {
Vector(3901.625000, 2846.694824, 118.031250),
Vector(3609.580811, 2348.395264, 250.031250),
Vector(3750.737793, 3139.266846, 250.031250),
Vector(3712.239990, 2220.289063, 250.031250),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )
end

function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

for k, v in pairs(ents.FindByClass("func_door_rotating")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "32" )
v:Fire("Open","",0)
end

for k, v in pairs(ents.FindByClass("func_door")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "32" )
v:Fire("Open","",0)
end

for k, v in pairs(ents.FindByModel("*208")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByModel("*207")) do
print(v:GetClass())
v:Remove()
end

if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(929.037170, -224.430328, -13.841413), Angle(-0.037, -89.812, 0.169) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(296.513580, 500.610870, 179.300674), Angle(0.138, 0.186, -0.477) )
	else
		SpawnItem("item_healthcharger", Vector(-1863.581421, 138.178558, 246.314468), Angle(-0.079, 0.185, 0.122) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1664.466797, 2895.915039, 155.071243), Angle(0.210, -0.047, 0.168) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(760.294800, 1808.440186, 407.046722), Angle(0.132, 90.166, -0.217) )
	else
		SpawnItem("item_healthcharger", Vector(800.439514, 1925.468262, 148.610657), Angle(0.084, 0.112, -0.017) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(3608.422363, 820.397278, 53.308140), Angle(-0.021, -0.040, -0.172) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(2512.513916, 3044.610840, 4.130755), Angle(0.033, 0.129, 0.114) )
	else
		SpawnItem("item_healthcharger", Vector(3487.173096, -543.472351, 52.721039), Angle(-0.081, 90.179, -0.196) )
end

if math.random (1,2) == 1 then 
		SpawnSuitCharger(Vector(542.865662, 239.642395, 307.737762), Angle(0.050, -90.044, 0.141) )
	elseif math.random (1,2) == 1 then 
		SpawnSuitCharger(Vector(1663.593506, 497.106903, 117.740036), Angle(-0.006, 179.992, -0.142) )
		SpawnRollermine(Vector(1564.063477, 567.247559, 75.347557))
		SpawnRollermine(Vector(1596.603149, 279.769562, 75.414597))
	else
		SpawnSuitCharger(Vector(1152.902344, 3183.602539, 323.366302), Angle(-0.006, -90.005, -0.029) )
		SpawnRollermine(Vector(1221.813965, 3158.554443, 317.045380))
		SpawnRollermine(Vector(960.570557, 2984.521240, 283.695679))
end

SpawnItem("info_player_start", Vector(-65.936447, 2483.590332, 176.031250)+Vector(0,0,-45), Angle(4.049902, 98.529289, 0.000000))
SpawnItem("info_player_start", Vector(833.940918, 1811.186890, 160.031250)+Vector(0,0,-60), Angle(3.986375, 179.392227, 0.000000))
SpawnItem("info_player_start", Vector(1068.864746, 1733.973511, 168.031250)+Vector(0,0,-60), Angle(7.740058, 34.877365, 0.000000))
SpawnItem("info_player_start", Vector(1812.770386, 1947.011841, 176.031250)+Vector(0,0,-45), Angle(5.234495, -90.951256, 0.000000))
SpawnItem("info_player_start", Vector(2316.290039, 2311.003418, 288.031250)+Vector(0,0,-45), Angle(2.765016, 87.141396, 0.000000))
SpawnItem("info_player_start", Vector(1780.490601, 2953.845703, 160.031250)+Vector(0,0,-60), Angle(6.913822, 138.446655, 0.000000))
SpawnItem("info_player_start", Vector(751.842529, 3024.031250, 160.031250)+Vector(0,0,-60), Angle(5.728522, -90.623634, 0.000000))
SpawnItem("info_player_start", Vector(431.922913, 2972.889648, 160.031250)+Vector(0,0,-45), Angle(5.827255, -179.874573, 0.000000))
SpawnItem("info_player_start", Vector(2085.878662, 1650.613770, 20.031250)+Vector(0,0,-45), Angle(4.604880, -104.394394, 0.000000))
SpawnItem("info_player_start", Vector(2419.525635, -593.574280, 200.031250)+Vector(0,0,-60), Angle(3.320865, -15.194940, 0.000000))
SpawnItem("info_player_start", Vector(3009.162842, -597.413757, 200.031250)+Vector(0,0,-60), Angle(3.752659, 178.648697, 0.000000))
SpawnItem("info_player_start", Vector(3660.838379, -858.090698, 356.031097)+Vector(0,0,-45), Angle(2.665900, -179.671722, 0.000000))
SpawnItem("info_player_start", Vector(3119.494385, -720.376526, 196.031250)+Vector(0,0,-45), Angle(2.863479, -2.361682, 0.000000))
SpawnItem("info_player_start", Vector(936.783752, -953.372314, -13.757813)+Vector(0,0,-60), Angle(3.258843, -162.977081, 0.000000))
SpawnItem("info_player_start", Vector(1124.601440, 1210.089844, 0.031250)+Vector(0,0,-60), Angle(5.234459, -64.493729, 0.000000))
SpawnItem("info_player_start", Vector(659.030884, 455.911682, 64.031250)+Vector(0,0,-45), Angle(4.938328, 0.700540, 0.000000))
end