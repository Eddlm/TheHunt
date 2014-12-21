
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

for k, v in pairs(ents.FindByClass("npc_combinegunship")) do
NumHelis=NumHelis+1
end

if NumHelis > 2 then print("too much helis")
else
SpawnHeliA(Vector(-3741.778320, 4829.747559, 2343.333008), ""..table.Random(AirEnemies).."" ,0,1)
end

end


CombineFirstWave = 5
CombineSecondWave = 25
CombineThirdWave = 25
CombineFourthWave = 35
CombineFifthWave = 50
CombineInfiniteWave = 50
RPGCANSPAWN = 1

ITEMPLACES ={
Vector(-1292.218506, 7433.143066, 1760.031250),
Vector(466.882141, 4668.483887, 1647.441040),
Vector(2228.732178, 4602.274902, 1678.684082),
Vector(582.692688, 4150.971191, 1604.031250),
Vector(813.622742, 4158.841797, 1604.031250),
Vector(720.035278, 3735.390625, 1670.031250),
Vector(1060.562256, 3629.044189, 1760.031250),
Vector(3286.553955, 2335.576172, 1856.031250),
Vector(3415.148682, 790.170044, 1856.031250),
Vector(3403.750977, -575.776611, 1544.031250),
Vector(3222.297607, -2035.720337, 1856.031250),
Vector(3299.856689, -3570.127197, 1856.031250),
Vector(3083.215576, -4959.338379, 1600.031250),
Vector(2933.156982, -4971.928223, 1856.031250),
Vector(2872.120361, -5185.194824, 2018.085571),
Vector(3541.048584, -591.561401, 2112.031250),
Vector(3521.781982, -3233.641846, 2112.031250),
Vector(1344.292847, 3703.563232, 1412.033813),

}
 
zonescovered ={
Vector(280.265442, 4437.616699, 1600.021729),
Vector(2284.921387, 4779.880859, 1644.031250),
Vector(2973.031982, 4012.781494, 2096.031250),
Vector(1157.010742, 3570.450195, 1415.073364),
Vector(3323.848633, 3294.864502, 1600.031250),
Vector(3372.343750, 2167.758545, 1856.031250),
Vector(3437.660156, 387.051544, 2117.031250),
Vector(-1303.796265, 7792.610840, 1728.031250),
Vector(3135.811279, -2183.298584, 2112.031250),
Vector(3539.496338, -2189.726807, 2112.031250),

Vector(3424.226807, -2022.251221, 1856.031250),
Vector(3435.023193, 782.845703, 1856.031250),
Vector(3380.986816, -3387.595703, 1856.031250),
Vector(3321.935791, -3894.962646, 1600.031250),
Vector(3335.088379, -4992.561035, 1600.031250),
Vector(3139.762207, -5206.259277, 2112.031250),
Vector(3511.182129, -5250.073730, 2112.031250),
Vector(1093.859497, 7572.355957, 1740.045044),
Vector(4698.691895, -7838.013184, 1812.598633),
Vector(1576.842651, 4376.666992, 1597.451294),

}


combinespawnzones = {
Vector(-5216.941895, 4477.362793, 1664.031250),
Vector(-5167.334961, 4755.278809, 1664.031250),
Vector(3089.168945, 6062.990234, 2112.031250),
Vector(3213.862793, -7594.617676, 2112.031250),
Vector(3521.827393, 6025.966309, 2112.031250),
}



function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this area.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function() ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end

function MapSetup()


table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

SpawnItem("info_player_start", Vector(573.642517, 4005.526367, 1830.031250), Angle(0,-90,0) )
SpawnItem("info_player_start", Vector(2319.758057, 4468.031250, 1720.031250), Angle(0,90,0) )
SpawnItem("info_player_start", Vector(3343.920654, 902.210571, 1806.031250), Angle(0,-50,0) )

-- v HELI NODES

creating = ents.Create( "path_track" )
-- creating:SetName("1")
creating:SetPos( Vector(-2631.885742, 3505.292236, 2064.447998) )
-- creating:SetKeyValue( "target", "path2" )
creating:Spawn()

creating = ents.Create( "path_track" )
-- creating:SetName("1")
creating:SetPos( Vector(-1376.403320, 5715.579590, 2064.447998) )
-- creating:SetKeyValue( "target", "path2" )
creating:Spawn()


creating = ents.Create( "path_track" )
-- creating:SetName("1")
creating:SetPos( Vector(-770.078613, 6663.960938, 2187.447266) )
-- creating:SetKeyValue( "target", "path2" )
creating:Spawn()



creating = ents.Create( "path_track" )
-- creating:SetName("1")
creating:SetPos( Vector(-2024.533691, 8016.068359, 2234.612061) )
-- creating:SetKeyValue( "target", "path2" )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(-3750.367676, 4669.259277, 2370.046143) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(-1384.327637, 3688.960205, 2188.266846) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(-1163.911377, 5215.558594, 2264.346924) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(-298.809113, 6201.192383, 2186.200439) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(-191.979324, 4908.743652, 2186.200439) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(480.813141, 2936.378906, 2170.816162) )
creating:Spawn()
creating = ents.Create( "path_track" )
creating:SetPos( Vector(1809.446167, 3006.236816, 2170.816162) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2832.120850, 3742.782959, 2409.461182) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3003.012695, 4966.684570, 2537.493408) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2296.088135, 6464.984375, 2566.850098) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(1185.998779, 7749.050781, 2355.717041) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(-153.644714, 4444.686035, 2213.826416) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(-132.605255, 7956.643555, 2243.892334) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(1316.356323, 5161.966797, 2243.114258) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2244.901367, 1896.483765, 2173.788086) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(1823.712158, 2701.145996, 1792.070801) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2219.854980, 891.811584, 2173.788086) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2207.960449, -53.113869, 2273.788086) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2192.101074, -1313.013794, 2273.788086) )
creating:Spawn()
creating = ents.Create( "path_track" )
creating:SetPos( Vector(2177.091309, -2505.419189, 2273.788086) )
creating:Spawn()
creating = ents.Create( "path_track" )
creating:SetPos( Vector(2164.913574, -3472.845703, 2273.788086) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2251.183838, -5807.030762, 2301.724609) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3698.658691, -6055.693848, 2453.998291) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4818.129395, -6857.540039, 2579.236328) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(5677.500488, -7997.673340, 2466.302979) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3975.970459, -5151.094238, 2370.934082) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4000.254639, -4168.895020, 2370.934082) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4264.801758, -3376.611816, 2498.356201) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4305.193359, -2417.732422, 2498.356201) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4309.935059, -1435.440430, 2498.356201) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4266.135742, -499.069214, 2498.356201) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4293.880859, 452.986145, 2498.356201) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4304.040039, 1435.435059, 2498.356201) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(4316.283203, 2620.370850, 2498.356201) )
creating:Spawn()



creating = ents.Create( "path_track" )
creating:SetPos( Vector(3961.119629, 3653.384033, 2535.628662) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(1704.111328, 4337.450684, 2086.555908) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector( 988.478882, 5748.938477, 2152.932373) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector( 3336.322754, 2023.682373, 2484.467041) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector( 3328.207520, 443.221436, 2410.798096) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3312.254639, -1236.436035, 2395.423584) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3282.675537, -2479.912109, 2412.009277) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3255.991943, -3753.646240, 2382.248779) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(2641.434082, -6734.094238, 2492.961426) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(691.956848, 3887.828369, 2558.772461) )
creating:Spawn()


creating = ents.Create( "path_track" )
creating:SetPos( Vector(2654.865967, 3015.001465, 1945.220947) )
creating:Spawn()




creating = ents.Create( "path_track" )
creating:SetPos( Vector(-2126.199951, 2402.904297, 428.051605) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(-1001.891724, 4405.471191, 692.556030) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(872.084961, 2464.652100, 419.308716) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4406.450684, 1463.078125, 400.673004) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4297.179688, -7581.328125, 2278.129883) )
creating:Spawn()


--npc_helicopter
creating = ents.Create( "path_track" )
creating:SetPos( Vector(2785.018555, 822.823181, 1645.679321) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(3928.523438, 723.095154, 1581.009644) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4138.348633, -2079.247314, 2002.223877) )
creating:Spawn()

creating = ents.Create( "path_track" )
creating:SetPos( Vector(4242.771484, 595.206177, 1954.671387) )
creating:Spawn()

CreateHeliPath(Vector(2249.963867, -4517.336914, 1886.657104))
CreateHeliPath(Vector(4271.001465, -4606.424316, 1822.444580))
CreateHeliPath(Vector(4283.023438, -3954.037109, 1822.444580))
CreateHeliPath(Vector(4717.763672, -1971.718872, 2022.101196))
CreateHeliPath(Vector(4597.998535, -72.546082, 1999.731934))
CreateHeliPath(Vector(4863.755371, 850.982849, 831.898438))
CreateHeliPath(Vector(5275.937012, -2134.092529, 590.251709))
CreateHeliPath(Vector(3361.802002, -2135.041992, 590.251709))
CreateHeliPath(Vector(1257.597900, -1475.744873, 652.813416))
CreateHeliPath(Vector(937.715515, 809.380188, 569.994629))
CreateHeliPath(Vector(-1077.730713, -2385.192627, 535.989624))
CreateHeliPath(Vector(-2540.005615, 62.853806, 471.016846))
CreateHeliPath(Vector(-4348.676270, 1430.612671, 449.091064))
CreateHeliPath(Vector(-2553.131104, -3863.231689, 812.503723))
CreateHeliPath(Vector(-661.142944, -4975.639648, 644.320496))
CreateHeliPath(Vector(682.304321, -5658.952148, 523.371582))
CreateHeliPath(Vector(2546.669922, 2944.299805, 1612.087524))
CreateHeliPath(Vector(923.999695, 2459.790771, 1775.661621))


-- ^ NPC

-- v ITEM


ITEM = ents.Create("weapon_rpg" )
ITEM:SetPos( Vector(-1330.538086, 7354.035156, 1721.205566) )
ITEM:SetAngles(Angle(1.325, -31.494, 74.569) )
ITEM:Spawn()


ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(901.463318, 4320.484863, 1648.646362) )
ITEM:SetAngles(Angle(-7.226, -87.818, -142.662) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(2354.380371, 3791.113281, 1582.415161) )
ITEM:SetAngles(Angle(-57.650, -52.310, 136.354) )
ITEM:Spawn()


ITEM = ents.Create("item_healthkit" )
ITEM:SetPos( Vector(2109.168701, 3796.572266, 1568.395874) )
ITEM:SetAngles(Angle(-0.427, -11.176, -0.003) )
ITEM:Spawn()


ITEM = ents.Create("item_healthcharger" )
ITEM:SetPos( Vector(3316.549072, 2400.108398, 1843.767822) )
ITEM:SetAngles(Angle(0.000, -90.000, 0.000) )
ITEM:Spawn()


ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4908.882813, 1597.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4895.882813, 1577.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4915.882813, 1587.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4894.882813, 1597.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4899.882813, 1607.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4904.882813, 1617.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4902.882813, 1627.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()

ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3478.959473, -4895.882813, 1637.011475) )
ITEM:SetAngles(Angle(0.000, 0.000, 0.000) )
ITEM:Spawn()


ITEM = ents.Create("item_rpg_round" )
ITEM:SetPos( Vector(3501.121094, 680.120605, 1806.945679) )
ITEM:SetAngles(Angle(-61.994, -29.626, 46.211) )
ITEM:Spawn()

ITEM = ents.Create("item_healthkit" )
ITEM:SetPos( Vector(3480.571289, 893.794617, 1837.949097) )
ITEM:SetAngles(Angle(-0.176, 59.373, -0.012) )
ITEM:Spawn()


-- ^ ITEM

-- v LIGHT


-- ^ LIGHT

-- PROPS 


PROP = ents.Create("prop_ragdoll")
PROP:SetModel("models/props_vehicles/car001a_phy.mdl")
PROP:SetPos(Vector(1718.283813, 4156.554199, 1591.967407))
PROP:SetAngles(Angle(0.000, 90.000, 0.000) )
PROP:Spawn()


PROP = ents.Create("prop_physics")
PROP:SetModel("models/props_interiors/BathTub01a.mdl")
PROP:SetPos(Vector(3480.880127, -4897.309082, 1543.454346))
PROP:SetAngles(Angle(0.009, -179.789, -0.022) )
PROP:Spawn()

PROP = ents.Create("prop_physics")
PROP:SetModel("models/props_c17/oildrum001_explosive.mdl")
PROP:SetPos(Vector(1123.975708, 3623.494873, 1696.371826))
PROP:SetAngles(Angle(-0.016, 120.490, 0.000) )
PROP:Spawn()

PROP = ents.Create("prop_physics")
PROP:SetModel("models/props_c17/oildrum001_explosive.mdl")
PROP:SetPos(Vector(1110.985352, 3567.599121, 1696.499756))
PROP:SetAngles(Angle(-0.000, 84.584, 0.000) )
PROP:Spawn()

PROP = ents.Create("prop_physics")
PROP:SetModel("models/props_c17/oildrum001_explosive.mdl")
PROP:SetPos(Vector(1087.305176, 3598.761719, 1696.386475))
PROP:SetAngles(Angle(-0.015, 103.759, 0.000) )
PROP:Spawn()

PROP = ents.Create("prop_physics")
PROP:SetName("jaja")
PROP:SetModel("models/props_c17/oildrum001_explosive.mdl")
PROP:SetPos(Vector(1080.519531, 3558.557129, 1696.450439))
PROP:SetAngles(Angle(-0.006, 98.920, 0.000) )
PROP:Spawn()

SpawnHeliA(Vector(-3741.778320, 4829.747559, 2343.333008), ""..table.Random(AirEnemies).."" ,0,1)

end