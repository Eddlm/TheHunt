include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20

zonescovered ={
Vector(-715.801270, -1541.449219, -175.968750),
Vector(323.394135, -214.058197, -95.968750),
Vector(-1079.747681, 1919.000977, -87.968750),
Vector(-1100.641968, 987.607788, -95.968750),
Vector(234.752258, 2087.459229, 64.031250),
Vector(712.359741, 2196.531006, 192.031250),
}

SPECIALITEMPLACES = {}

ITEMPLACES ={
}

combinespawnzones = {
Vector(-668.826782, -2058.153076, -175.968750),
Vector(-1089.937134, -1855.745605, -87.968750)

}



function GM:PlayerInitialSpawn(ply)
ply:PrintMessage(HUD_PRINTTALK, "This map features three full waves of Combines.")
ply:PrintMessage(HUD_PRINTTALK, "The first wave it's coming. Hide!")
ply:PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")
end

function MapSetup()
--SpawnItem("item_healthcharger", Vector(-456.275421, 479.784363, -414.434113), Angle(-90.000, 90.000, 45.000) )

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

SpawnItem("info_player_start", Vector(-410.501892, -89.787407, -87.968750)+Vector(0,0,-45), Angle(0,0,0))
SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))


--if math.random(1,2) == 1 then
--SpawnTurret(Vector(-86.159615, -1113.844360, -223.263809),Angle(0.257, 92.666, 0.642))
--end
end

