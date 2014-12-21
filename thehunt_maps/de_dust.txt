include( "basewaves.lua" )
CombineFirstWave = 5
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {}

zonescovered ={
Vector(342.533783, -1665.020508, 128.031250),
Vector(117.793747, 627.510925, 64.033913),
Vector(-1092.172607, 1958.346924, -126.812973),
Vector(94.613914, 3200.717285, 62.287811),
Vector(-18.188326, 2182.016602, 64.031250),
Vector(1951.292236, 693.956177, 65.097351),
}



ITEMPLACES ={
Vector(2264.042725, 876.579163, 67.562698),
Vector(585.471375, -565.893250, 97.855263),
Vector(-1251.169922, 1931.840942, -114.763748),
Vector(-188.980881, 3116.895996, 63.192032),
Vector(1501.978638, 478.247406, 39.244583),
Vector(-1267.476196, 3618.250977, 44.450798),
}




combinespawnzones = {
Vector(2356.598633, 282.017426, 70.822952),
Vector(1853.021240, 3349.281250, -63.627007),
Vector(-1721.762207, 3505.886475, 65.163788),
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


SpawnItem("info_player_start", Vector(-1252.078613, 1985.548706, -115.899109)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(-1146.563965, 1507.953003, 64.031250)+Vector(0,0,-45), Angle(0,-90,0))
SpawnItem("info_player_start", Vector(1634.191895, 2833.028076, -44.123940)+Vector(0,0,-45), Angle(0,90,0))
SpawnItem("info_player_start", Vector(-475.674103, -624.031250, 93.256264)+Vector(0,0,-45), Angle(0,-90,0))


end



