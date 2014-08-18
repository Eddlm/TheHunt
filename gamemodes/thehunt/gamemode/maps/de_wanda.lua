include( "basewaves.lua" )
CombineFirstWave = 8
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
CUSTOMWAVESPAWN = 50

MAP_PROPS = {"models/props_junk/trashdumpster01a.mdl","models/props_c17/furnituredrawer001a.mdl","models/props_c17/furnitureshelf002a.mdl","models/props_wasteland/kitchen_shelf001a.mdl","models/props_interiors/furniture_desk01a.mdl","models/warby/wan_prop_caffe_table_01.mdl","models/props_c17/bench01a.mdl",}
models/props_wasteland/cafeteria_table001a.mdl

ITEMPLACES ={
Vector(318.459747, -686.967041, -7.707550),

}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

--ply:PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")
end


zonescovered ={
Vector(5170.405762, -704.212036, -447.968750),
Vector(3270.019531, 1247.975952, -191.968750),
Vector(4252.611816, -285.627472, -191.968750),
Vector(846.510986, 1383.355103, -316.293579),
Vector(-409.992859, -432.523956, -319.968750),
Vector(2342.206055, -1129.709473, 64.031250),
Vector(2081.142090, -1061.074097, -447.968750),
Vector(1676.183105, 1998.240601, -449.179199),
Vector(1405.611694, -961.261658, 720.031250),
Vector(2260.902588, 229.777771, -215.968750),
Vector(335.341766, -254.671082, -95.968750),
Vector(310.771454, 674.253845, -320.958832),
Vector(1452.997681, 1297.123657, -448.97650),
Vector(2631.005371, 894.008789, -448.929871),
Vector(2947.933350, 1717.941040, -448.968506),
Vector(3832.646240, -124.042702, 352.031250),
Vector(2144.881104, 568.446533, -607.968750),
}

combinespawnzones = {
Vector(4519.271973, 471.960114, -463.968750),
Vector(6625.607422, 250.234558, -463.968750),
Vector(4782.367676, -453.445770, -480.768188),
Vector(-986.935669, -789.815308, -303.968750),
Vector(920.947510, 1981.762451, -159.968750),
Vector(5726.601074, -277.652496, -447.968750),
}


function MapSetup()
SpawnItem("item_healthcharger", Vector(4677.671875, -576.559204, -462.355103), Angle(0.000, 90.000, 0.000) )
SpawnItem("item_healthcharger", Vector(3446.221680, 383.609711, -207.672592), Angle(0.000, -90.000, 0.000) )
SpawnItem("item_healthcharger", Vector(-990.192993, -501.859619, -368.868439), Angle(-90.000, 45.000, 0.000))

SpawnItem("item_healthvial", Vector(2187.008301, -1390.041016, -509.468689), Angle(46.747, -86.796, -89.922))
SpawnItem("item_healthvial", Vector(2210.340820 ,-1369.255981 ,-509.763672), Angle(-42.627, 153.279, -90.044))
SpawnItem("item_healthvial", Vector(2215.512451, -1383.142700, -509.112366), Angle(63.156, 6.902, 89.997))


--SpawnItem("weapon_slam", Vector(-1039.689697, -506.408478, -365.325348), Angle(-0.750, 50.493, -0.097))
--SpawnItem("weapon_slam", Vector(-997.100281, -530.088257, -365.326782), Angle(-1.302, -104.776, -0.467))

if game.SinglePlayer() then
SpawnMine( Vector(1337.636230, -15.646374, -191.641296) )
SpawnMine( Vector(647.945862, -196.434509, 384.364349) )
SpawnMine( Vector(543.016296, -285.596008, 384.361145) )
SpawnMine( Vector(435.173401, -941.878540, 128.376968) )
end


SpawnStaticProp(Vector(3619.986328, -778.575745, 537.645752),Angle(0,-90,0),"models/props_junk/trashdumpster01a.mdl")
SpawnStaticProp(Vector(3525.263184, -778.629272, 537.609558),Angle(0,-90,0),"models/props_junk/trashdumpster01a.mdl")
SpawnStaticProp(Vector(2944.795166, -1020.155762, 20.891542),Angle(0,-90,0),"models/props_c17/bench01a.mdl")
SpawnStaticProp(Vector(2763.543457, -1238.370728, 20.744848),Angle(0,-29,0),"models/props_c17/bench01a.mdl")
SpawnStaticProp(Vector(2199.015625, 573.703186, -537.154663),Angle(0,-90,0),"models/props_c17/bench01a.mdl")
SpawnStaticProp(Vector(2130.858398, -1317.641846, -491.198303),Angle(0,90,0),"models/props_c17/bench01a.mdl")
SpawnStaticProp(Vector(2274.209961, -1317.731934, -491.217682),Angle(0,90,0),"models/props_c17/bench01a.mdl")


SpawnTurret(Vector(2399.942627, -1451.707397, -511.248260),Angle(0,110,0))
SpawnTurret(Vector(1066.489502, -1106.694824, 624.773071),Angle(0,150,0))
SpawnTurret(Vector(1402.557861, 73.241920, -191.248886),Angle(0,220,0))

SpawnItem ("weapon_357", Vector(-884.515442, -28.447969, -91.765511), Angle(7.757, 27.987 ,-77.472))
SpawnItem ("item_healthvial", Vector(323.829559, -710.399658, -127.578796), Angle(0.492, 2.112, 0.112))
SpawnItem ("item_box_buckshot", Vector(323.315002, -659.787537, -75.284492), Angle(14.039, -129.443, 16.148))
SpawnItem ("item_box_buckshot", Vector(341.511902, -724.893616, -127.573868), Angle(0.277, 173.550, 0.356))
SpawnItem ("weapon_shotgun", Vector(344.242096, -758.839783, -114.216454), Angle(50.656, 130.644, -165.590))

helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(1113.660156, 1213.706543, -303.968750));
helispotlight:SetKeyValue("hinttype", 103);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1);
-- helispotlight:Spawn()

helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(3922.692871, 314.702087, -183.968750));
helispotlight:SetKeyValue("hinttype", 103);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1);
-- helispotlight:Spawn()


helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(1155.743896, 1000.987549, -367.968750));
helispotlight:SetKeyValue("hinttype", 103);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1);
-- helispotlight:Spawn()

helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(4421.788574, -87.004852, -134.428741));
helispotlight:SetKeyValue("hinttype", 13);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1);
-- helispotlight:Spawn()


helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(2997.448242, 445.808167, -271.968750));
helispotlight:SetKeyValue("hinttype", 13);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1);
-- helispotlight:Spawn()



helispotlight = ents.Create("info_node_hint");
helispotlight:SetPos(Vector(2802.916016, 454.717407, -381.044678));
helispotlight:SetKeyValue("hinttype", 13);
helispotlight:SetKeyValue("nodeFOV", 360);
helispotlight:SetKeyValue("IgnoreFacing", 1)
-- helispotlight:Spawn()


SpawnStaticProp(Vector(1012.828430, 992.573303, 188.606232),Angle(0.000, -90.000, -90.000),"models/props_combine/combine_bunker01.mdl")

SpawnStaticProp(Vector(923.716309, 1316.218750, 258.461914),Angle(-0.000, 180.000, -0.000),"models/props_combine/combinetower001.mdl")

SpawnStaticProp(Vector(-405.374695, -906.803101, -171.756943),Angle(0.000, -0.000, -90.000),"models/props_combine/combine_train02a.mdl")
SpawnStaticProp(Vector(-138.546280, -920.708313, -98.096375),Angle(0.000, 0.000, -90.000),"models/props_combine/combine_train02a.mdl")
SpawnStaticProp(Vector(-290.605225, -1111.907349, 191.438995),Angle(0.000, 0.000, -90.000),"models/props_combine/combinetrain01a.mdl")


if math.random(1,2) == 1 then
SpawnItem("npc_sniper", Vector(264.701355, -742.659790, 353.738403), Angle(0.000, 90.000, 0.000) )
SpawnStaticProp(Vector(295.017578, -861.739380, 299.215607),Angle(0.000, 180.000, 0.000),"models/props_combine/combinetower001.mdl")
else
SpawnItem("npc_sniper", Vector(1191.594727, 836.494019, -56.115135), Angle(0.000, 0.000, 0.000) )
SpawnStaticProp(Vector(1028.177734, 838.166443, -37.060078),Angle(0,0,0),"models/props_combine/combine_booth_short01a.mdl")
SpawnStaticProp(Vector(1071.785278, 804.460815, -110.469765),Angle(0,90,0),"models/props_combine/combinetower001.mdl")
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


playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(3669.630371, -1750.382935, 576.031250))
playerspawnpoint:SetAngles(Angle(28.880289, 107.799171, 0.000000))
playerspawnpoint = ents.Create("info_player_start");
playerspawnpoint:SetPos(Vector(3156.461914, -1764.994873, 576.031250))
playerspawnpoint:SetAngles(Angle(17.809420, -0.722448, 0.000000))
end