include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 30

MAP_PROPS = {"models/props_wasteland/controlroom_desk001b.mdl","models/props_junk/metalbucket02a.mdl","models/props_wasteland/laundry_cart002.mdl","models/props_trainstation/BenchOutdoor01a.mdl"}


zonescovered ={
Vector(880.382874,-2510.880371,833.979126),
Vector(-2271.689453,-821.327271,576.031250),
Vector(-2370.417725,958.729980,576.031250),
Vector(2250.922119,1416.803467,576.031250),
Vector(2168.521484,-995.409851,576.031250),
Vector(-1008.914246,104.104523,576.031250),
Vector(1046.656006,32.056393,512.031250),
Vector(-353.694611,452.056458,384.031250),
Vector(991.912842,197.648911,710.765930),
Vector(-174.756027,-561.525391,576.031250),
}






ITEMPLACES ={
Vector(2090.994873, 937.955139, 542.671326),
Vector(1842.741577, 1172.930420, 534.217651),
}


combinespawnzones = {
Vector(1109.897217, -3427.356201, 840.031250),
Vector(1075.916504, -3773.385010, 840.031250),
Vector(1100.611084, -3581.416992, 840.031250),
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

--SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750), Angle(0,0,0))


SpawnItem("npc_rollermine", Vector(554.265808, 859.175842, 973.066040), Angle(0,0,0))

SpawnItem("info_player_start", Vector(537.677612, -1591.868774, 838.509216)+Vector(0,0,-45), Angle(10,90,0))
SpawnItem("info_player_start", Vector(559.968750, 398.467255, 512.031250)+Vector(0,0,-45), Angle(7,152,0))
SpawnItem("info_player_start", Vector(1319.209961, 31.348526, 512.031250)+Vector(0,0,-45), Angle(7,137,0))
SpawnItem("info_player_start", Vector(968.784058, -472.949493, 512.031250)+Vector(0,0,-45), Angle(8,0,0))
SpawnItem("info_player_start", Vector(-630.064331, -19.190281, 584.431152)+Vector(0,0,-45), Angle(8,-3,0))

SpawnItem("item_suitcharger", Vector(832.031250, 92.253288, 497.381989), Angle(0,0,0))

SpawnItem("item_healthcharger", Vector(1186.247314, -1.485645, 501.2755139), Angle(0,90,0))
SpawnItem("item_healthcharger", Vector(-1134.205933, 695.514343, 419.194244), Angle(0,90,0))

SpawnTurret(Vector(622.922485, -2372.840820, 769.727844),Angle(-0.302, -134.099, 0.633))
SpawnTurret(Vector(719.194824, -2350.281738, 769.379089),Angle(-0.597, -89.967, 0.628))
SpawnTurret(Vector(-1505.623169, 760.851624, 512.673645),Angle(0.276, -44.977, 0.304))


SpawnProp(Vector(-681.330505, 772.160461, 529.579590),Angle(0,180,0),"models/props_wasteland/controlroom_desk001b.mdl")
SpawnProp(Vector(-1659.926514, 652.734924, 533.679321),Angle(0,-90,0),"models/props_wasteland/laundry_cart002.mdl")
SpawnProp(Vector(-1626.859009, 412.592987, 533.635864),Angle(0,23,0),"models/props_wasteland/laundry_cart002.mdl")
SpawnProp(Vector(421.300659, -1904.715454, 794.784668),Angle(0,-180,0),"models/props_wasteland/laundry_cart002.mdl")
SpawnProp(Vector(490.095398, -1904.547363, 794.645325),Angle(0,0,0),"models/props_wasteland/laundry_cart002.mdl")
SpawnProp(Vector(-1626.859009, 412.592987, 533.635864),Angle(0,23,0),"models/props_wasteland/laundry_cart002.mdl")
SpawnProp(Vector(1165.991333, 368.406311, 459.842499),Angle(0,0,0),"models/props_trainstation/BenchOutdoor01a.mdl")
SpawnProp(Vector(-2150.603271, 1838.362183, 519.911072),Angle(0,-20,0),"models/props_junk/MetalBucket02a.mdl")


end


