include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
DARKNESS = 3
prevent_spotlight_lag = true
MAP_PROPS = {'models/props_wasteland/controlroom_desk001b.mdl'}

HELIPATHS = {Vector(-582.466125, -874.456482, 635.353638),Vector(-395.708496, -1561.000366, 611.784973),Vector(-1607.733276, -1092.752441, 660.214661),Vector(-1583.447388, 441.801300, 623.864990),Vector(765.051575, 319.746033, 656.989380),Vector(565.902710, 1318.342896, 569.026184),Vector(-928.647156, 1365.053223, 640.346252),Vector(755.997742, -765.848267, 609.021729),}

zonescovered ={
Vector(-268.598877, -852.607239, 64.031250),
Vector(785.468140, 1082.210327, 64.031250),
Vector(-1525.935913, 419.007050 ,64.031250),
Vector(-685.128784, 462.698761, 64.031250),
Vector(-1121.879150, -896.488281, 64.031250),
Vector(-1656.822144, -425.087280, 64.031250),
Vector(-901.148926, 1378.361206, 64.031250),

}

SPECIALITEMPLACES = {}

ITEMPLACES ={
Vector(-768.822937, -1100.280884, -153.996948),
Vector(-806.619263, -1214.258545, 95.731735),
Vector(-1281.053467, -129.556610, 107.298103),
Vector(-1966.575317, -225.405731, 101.822296),
Vector(-366.034332, 352.710266, 40.336742), Vector(-626.123596, 806.132446, 44.214462), Vector(-119.087250, 1411.166260, 43.863712), Vector(-1787.964600, -962.256653, 33.201900)
}

 
 
combinespawnzones = {

Vector(-1955.583130, -712.272705, 72.031250),
Vector(-2005.441772, 631.624451, 80.501854),
Vector(826.720764, 424.087891, 64.031250),
Vector(1398.549316, -1115.531616, 92.553925),
Vector(283.400360, -1877.980835, 64.031250),
Vector(-1388.968750, -1886.020508, 64.031250),

}





function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

ply:SendLua("CLDARKNESS="..DARKNESS.."" )
end

function MapSetup()
--SpawnItem("item_healthcharger", Vector(-456.275421, 479.784363, -414.434113), Angle(-90.000, 90.000, 45.000) )
for k, v in pairs(ents.FindByClass("info_player_deathmatch")) do
print(v:GetClass())
v:Remove()
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

SpawnItem('item_healthcharger', Vector(-1903.688110, -806.509766, -205.939590),Angle(0.000, 0.000, 0.000))
SpawnSuitCharger(Vector(-879.722107, 1016.863403, -201.755569),Angle(0.000, 0.000, 0.000))

SpawnItem("info_player_start", Vector(-596.434753, -1080.971680, -170.446259)+Vector(0,0,-45), Angle(20,144,0))
SpawnItem("info_player_start", Vector(-592.727966, -854.056519, -168.595154)+Vector(0,0,-45), Angle(10,127,0))
SpawnItem("info_player_start", Vector(-844.508057, -1008.122559, -165.020630)+Vector(0,0,-45), Angle(20,9,0))
SpawnItem("info_player_start", Vector(164.938263, -1443.621338, 320.031250)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(354.959442, -1425.662720, 320.031250)+Vector(0,0,-45), Angle(0,-180,0))
SpawnItem("info_player_start", Vector(95.127441, 29.479046, 320.031250)+Vector(0,0,-45), Angle(0,-90,0))
SpawnAmmoCrate(Vector(144.353455, -1199.482910, 272.358704),Angle(0.018, 0.075, 0.014),3)
SpawnAmmoCrate(Vector(-552.627380, -60.627796, 272.368500),Angle(0.016, 180.000, -0.010),3)



--if math.random(1,2) == 1 then
--SpawnTurret(Vector(-86.159615, -1113.844360, -223.263809),Angle(0.257, 92.666, 0.642))
--end
end