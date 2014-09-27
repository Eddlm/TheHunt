include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 30

MAP_PROPS = {"models/props_wasteland/laundry_cart001.mdl","models/props_wasteland/kitchen_shelf001a.mdl"}







zonescovered ={
Vector(-255.841858,-987.480896,-44.292374),
Vector(-568.513123,756.028992,-63.968750),
Vector(-1286.141724,237.949783,-63.968750),
Vector(-944.257568,-646.066895,-59.654816),
Vector(-543.518982,-1403.320190,472.031250),
Vector(-270.307129,-775.899170,232.031250),
Vector(200.925293,796.980347,277.558289),
Vector(-1342.208984,543.933777,72.031250),
Vector(-954.118164,868.747620,224.031250),
Vector(746.764832,-719.176941,48.031250),
Vector(686.933167,965.652222,48.031250),
Vector(46.407112,196.965424,64.031250),
}


ITEMPLACES ={
Vector(-1067.838135, -384.715851, -17.116798),
}


combinespawnzones = {
Vector(-1551.503296, -387.142822, -59.968750),
Vector(-1521.061401, -500.261841, -59.968750),
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

for k, v in pairs(ents.GetAll()) do
if v:IsWeapon() then
print(v:GetClass())
v:Remove()
end
end

--SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750), Angle(0,0,0))



SpawnItem("info_player_start", Vector(820.788330, -552.467896, 336.031250)+Vector(0,0,-45), Angle(0,120,0))
SpawnItem("info_player_start", Vector(-1317.857788, -1115.276611, -16.310135)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(-522.906494, -740.003052, -17.156982)+Vector(0,0,-45), Angle(0,-135,0))


/*

SpawnItem("npc_rollermine", Vector(554.265808, 859.175842, 973.066040), Angle(0,0,0))

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
*/

end


