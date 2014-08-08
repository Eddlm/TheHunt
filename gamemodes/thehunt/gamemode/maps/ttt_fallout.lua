include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

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
ply:PrintMessage(HUD_PRINTTALK, "This map features three full waves of Combines.")
ply:PrintMessage(HUD_PRINTTALK, "The first wave it's coming. Hide!")
ply:PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")
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

SpawnItem("info_player_start", Vector(-596.434753, -1080.971680, -170.446259)+Vector(0,0,-45), Angle(20,144,0))
SpawnItem("info_player_start", Vector(-592.727966, -854.056519, -168.595154)+Vector(0,0,-45), Angle(10,127,0))
SpawnItem("info_player_start", Vector(-844.508057, -1008.122559, -165.020630)+Vector(0,0,-45), Angle(20,9,0))
--SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))


--if math.random(1,2) == 1 then
--SpawnTurret(Vector(-86.159615, -1113.844360, -223.263809),Angle(0.257, 92.666, 0.642))
--end
end

