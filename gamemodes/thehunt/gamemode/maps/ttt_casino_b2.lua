include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

zonescovered ={
Vector(836.879578, -540.654480, -333.608490),
Vector(392.221466, -105.919655, -333.608490),
Vector(1817.301636, -534.499268, -205.610748),
Vector(1202.892578, 571.071289, -413.610748),
Vector(23.213648, 459.509064, -333.608490),
Vector(778.483398, 1240.408203, -205.610748),
Vector(1711.669434, 795.665466, -413.610748),
Vector(2538.426758, 1196.953125, -493.610779),
Vector(1805.086426, 487.553314, -205.610748),
Vector(1797.835938, 1240.799927, -205.610748),
Vector(1050.088501, 1741.339966, -205.610748),
Vector(23.831120, 1792.862305, -181.610748),
Vector(12.259025, 1034.796387, -333.608490),
Vector(-313.237091, 551.117920, -181.610748),
Vector(345.607849, 561.957825, -181.610748),
}


SPECIALITEMPLACES = {
Vector(3085.746582, 1062.142090, -453.610748),

}

ITEMPLACES ={

Vector(-55.533367, -657.813293, -330.130920),
Vector(97.264153, 943.915649, -291.444733),
Vector(-78.339119, 1197.247314, -291.444733),
Vector(1223.590942, 971.265015, -353.610748),
Vector(1157.468750, 777.662598, -353.610748),
Vector(1020.357849, 1409.550293, -170.856766),
Vector(393.465851, 221.868484, -145.659744),
Vector(-272.442139, 1070.221680, -168.173691),
Vector(1097.548706, 1297.175049, -190.173676),
Vector(-436.397766, 743.798462, -317.603882),

}

combinespawnzones = {
Vector(-973.726196, 1129.821289, -357.610748),
Vector(-825.683228, -1617.408325, -357.610748),
Vector(-611.771362, 1273.689575, -349.610748),
Vector(-914.559692, 1275.795776, -357.610748),

}



function GM:PlayerInitialSpawn(ply)
ply:PrintMessage(HUD_PRINTTALK, "This map features three full waves of Combines.")
ply:PrintMessage(HUD_PRINTTALK, "The first wave it's coming. Hide!")
ply:PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")
	for k,v in pairs(ents.FindByClass("func_door")) do
		print (v:GetClass())
		v:Remove()
	end

end

function MapSetup()
SpawnItem("item_healthcharger", Vector(-456.275421, 479.784363, -414.434113), Angle(-90.000, 90.000, 45.000) )
SpawnItem("item_healthcharger", Vector(2426.728027, 1045.636841, -503.854034), Angle(0.000, 0.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2652.968750, 1045.645264, -502.366577), Angle(0.000, -180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2179.817871, 1431.281738, -427.116882), Angle(0.000, -180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2188.407715, 1016.049683, -426.366516), Angle(0.000, -180.000, 0.000) )


if math.random(1,2) == 1 then
SpawnTurret(Vector(1363.599487, -531.949219, -372.918884),Angle(0.217, 179.845, 0.243))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(665.899292, -654.582397, -396.883698),Angle(0.230, 34.330, 0.205))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(2051.810059, 543.282959, -268.988983),Angle(0.213, -145.612, 0.637))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1884.698120, 669.628784, -268.887268),Angle(0.168, 164.775, 0.367))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1400.463989, 1401.295776, -269.021393),Angle(0.252, 73.594, 0.447))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(619.846375, 920.118591, -244.870850),Angle(0.241, 125.842, 0.284))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1069.034546, 1458.466431, -476.868164),Angle(0.283, 24.406, 0.188))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1966.360962, 1533.554565, -476.955444),Angle(0.199, -38.274, -0.225))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(2605.754395, 1232.238403, -556.891174),Angle(0.167, -131.570, 0.386))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1656.469604, 593.426453, -476.879425),Angle(0.260, 78.819, 0.524))
end


SpawnCeilingTurretStrong(Vector(2540.163818, 1012.583130, -377.673248),Angle(0,90,0))
SpawnCeilingTurretStrong(Vector(2482.168945, 1408.941895, -359.673248),Angle(0.000, 307.383, 0.000))
SpawnCeilingTurretStrong(Vector(2606.615479, 1418.773315, -359.673248),Angle(0.000, 229.082, 0.000))

SpawnDynamicAmmoCrate(Vector(2510.223633, 1399.513916, -557.142212), Angle(0.000, -90.000, 0.000))
SpawnDynamicAmmoCrate(Vector(2470.184570, 1400.305908, -557.170593), Angle(0.000, -90.000, 0.000))
SpawnSuitCharger(Vector(2632.964355, 1306.589600, -507.415039), Angle(0.000, 90.000, 0.000) )
SpawnAmmoCrate(Vector(2589.500977, 1399.023926, -541.156372),Angle(0,-90,0),8)

if math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(-238.699768, 874.053345, -359.754150), Angle(0,180,0))
SpawnTurret(Vector(-276.811981, 702.857727, -396.902557),Angle(0.198, 93.169, 0.534))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(-395.554504, 858.777649, -370.641388), Angle(0,-180,0))
SpawnTurret(Vector(-440.282837, 823.157410, -412.911774),Angle(0.261, 148.822, -0.071))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(539.599976, 554.556458, -197.683426), Angle(0,-180,0))
SpawnTurret(Vector(196.623581, 505.613708, -244.907227),Angle(0.303, 19.676, 0.406))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(1870.660156, 995.599365, -440.934845), Angle(0,0,0))
SpawnTurret(Vector(2122.213623, 942.593140, -476.876862),Angle(0.316, 133.774, 0.630))
elseif math.random(1,2) == 1 then
SpawnItem("button_turrets", Vector(502.875458, 809.920593, -202.281784), Angle(0,90,0))
SpawnTurret(Vector(467.057709, 854.514771, -244.892578),Angle(0.321, 45.270, 0.732))
end


SpawnStaticProp(Vector(2199.015625, 573.703186, -537.154663),Angle(0,-90,0),"models/props_c17/furnituredrawer001a.mdl")
SpawnStaticProp(Vector(235.944275, 1073.582275, -353.404755),Angle(0,-180,0),"models/props_c17/furnitureshelf002a.mdl")
SpawnStaticProp(Vector(958.268982, 1587.688721, -440.704742),Angle(0,-90,0),"models/props_c17/furnitureshelf002a.mdl")
SpawnStaticProp(Vector(1879.860229, -89.707169, -249.764725),Angle(0,-180,0),"models/props_interiors/furniture_desk01a.mdl")
SpawnStaticProp(Vector(1157.729492, 1575.480713, -249.207413),Angle(0,-180,0),"models/props_c17/furnituredrawer001a.mdl")
SpawnStaticProp(Vector(1247.508301, 1300.867798, -249.224884),Angle(0,-90,0),"models/props_c17/furnituredrawer001a.mdl")
SpawnStaticProp(Vector(1949.937622, 735.193970, -249.079269),Angle(0,-180,0),"models/props_c17/furnituredrawer001a.mdl")






for k, v in pairs(ents.FindByClass("info_player_start")) do
print(v:GetClass())
v:Remove()
end
for k, v in pairs(ents.FindByClass("info_player_deathmatch")) do
print(v:GetClass())
v:Remove()
end

SpawnItem("info_player_start", Vector(-429.867126, 619.942383, -394.978424), Angle(0,180,0) )
SpawnItem("info_player_start", Vector(1982.917114, 1202.584351, -543.610748), Angle(0,0,0) )
SpawnItem("info_player_start", Vector(1996.031250, 379.810242, -543.610779), Angle(0,40,0) )
SpawnItem("info_player_start", Vector(2786.576172, 910.185669, -553.610779), Angle(11,-60,0) )
SpawnItem("info_player_start", Vector(1972.139160, 1328.204102, -543.610748), Angle(0,0,0) )
SpawnItem("info_player_start", Vector(1971.831055, 1081.172485, -543.610748), Angle(0,180,0) )
end

