include( "basewaves.lua" )
CombineFirstWave = 5
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {}

zonescovered ={
Vector(724.800598, 2766.128418, 128.031250),
Vector(2419.385498, 2179.683594, 124.894287),
Vector(2261.531494, 50.598194, 121.208023),
Vector(-740.592529, 513.120728, -31.968752),
Vector(-1604.040039, 557.122925, -59.968750),
Vector(-737.803833, -128.125061, -12.231413),
}


ITEMPLACES ={
Vector(-420.760101, -513.362305, 209.068390),
Vector(-349.916016, 151.452164, 200.421249),
Vector(-455.462677, -225.129715, 45.776642),
Vector(460.050079, 2021.482178, 167.946701),
Vector(521.962341, 3038.298340, 212.583023),
Vector(1470.965454, 2954.932129, 161.260910),
Vector(2697.861816, 1187.919678, 200.153763),
Vector(2161.779541, -61.674614, 167.327164),
Vector(1121.772949, -126.964363, 272.068390),
Vector(197.032272, 446.829132, 126.574997),
Vector(-1743.957520, 135.507919, -22.354519),
Vector(-899.862976, 119.393463, 16.448227),

}



combinespawnzones = {
Vector(883.976685, -733.134399, 98.921143),
Vector(2513.859863, 2585.871338, 142.700012)
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

SpawnItem("info_player_start", Vector(684.295776, 3064.048096, 160.031250),Angle(0.000, 90.219, 0.000))
SpawnItem("info_player_start", Vector(992.028259, -551.968750, 256.031250),Angle(0.000, 71.763, 0.000))

SpawnItem("info_player_start", Vector(992.031250, 55.968750, 256.031250),Angle(0.000, -75.038, 0.000))
SpawnItem("info_player_start", Vector(285.097961, 216.617279, 28.320465),Angle(0.000, -87.001, 0.000))
SpawnItem("info_player_start", Vector(-393.896271, -599.743530, 192.031250),Angle(0.000, 85.920, 0.000))
SpawnItem("info_player_start", Vector(1696.404663, 1996.364380, 160.031250),Angle(0.000, 137.870, 0.000))




end



