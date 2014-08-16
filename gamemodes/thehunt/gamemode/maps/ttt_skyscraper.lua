include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

zonescovered ={
Vector(550.441528, -368.682709, 528.031250),
Vector(844.767395, -687.454529, 336.031250),
Vector(7.008403, -810.382751, 336.031250),
Vector(198.147202, -101.514679, 336.031250),
Vector(98.759155, -250.281982, 128.031250),
Vector(882.647705, -644.181396, 128.031250),
Vector(442.664307, 71.864281, 128.031250),

}


SPECIALITEMPLACES = {}

ITEMPLACES ={
Vector(-456.275421, 479.784363, -414.434113),
}

combinespawnzones = {
Vector(853.685974, 197.012299, 128.031250),
Vector(-250.236496, -898.850647, 544.031250),
Vector(-244.987717, 374.593567, 544.031250),
}



function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this building.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end

function MapSetup()
SpawnItem("item_healthcharger", Vector(521.684570, 61.264465, 517.327454), Angle(0.000, 180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(576.968750, -143.969116, 325.275513), Angle(0.000, 180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(14.532608, -289.850403, 117.275497), Angle(0.000, 0.000, 0.000) )

for k, v in pairs(ents.FindByClass("info_player_start")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByClass("info_player_deathmatch")) do
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

SpawnStaticProp(Vector(-1313.221558, -1243.587769, -310.317780),Angle(0,0,0),"models/props_junk/trashdumpster01a.mdl")
SpawnStaticProp(Vector(-1313.120972, -1328.330322, -310.333618),Angle(0,0,0),"models/props_junk/trashdumpster01a.mdl")

SpawnItem("info_player_start", Vector(94.778450, -228.619507, 528.031250)+Vector(0,0,-45), Angle(11,163,0))

SpawnItem("info_player_start", Vector(8.136069, -245.698151, 528.031250)+Vector(0,0,-45), Angle(12,84,0))
SpawnItem("info_player_start", Vector(731.411194, -7.968749, 128.031250)+Vector(0,0,-45), Angle(29,178,0))



if math.random(1,2) == 1 then
SpawnTurret(Vector(98.184120, 18.359150, 464.757080),Angle(0.342, 1.965, 0.733))
end

if math.random(1,2) == 1 then
SpawnTurret(Vector(851.955505, 305.158295, 464.691071),Angle(0.242, -173.247, 0.620))
end

if math.random(1,2) == 1 then
SpawnTurret(Vector(-49.663445, -439.092285, 464.756348),Angle(0.344, -39.451, 0.728))
end

if math.random(1,2) == 1 then
SpawnTurret(Vector(999.439819, -112.668625, 160.671432),Angle(0.225, 132.771, 0.280))
end

if math.random(1,2) == 1 then
SpawnTurret(Vector(297.947205, 87.794601, 64.682976),Angle(0.239, -35.348, 0.477))
end


if math.random(1,2) == 1 then
SpawnTurret(Vector(-33.551304, -179.801208, 272.661255),Angle(0.265, 15.414, 0.247))
end







end

