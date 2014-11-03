include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 15
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {"models/props_wasteland/cafeteria_table001a.mdl","models/props_wasteland/controlroom_desk001b.mdl",""}

zonescovered ={
Vector(2590.766846,1664.665894,72.031250),
Vector(351.418060,1.735169,64.031250),
Vector(2306.842285,-1174.925903,65.197800),
Vector(2145.614014,60.378609,72.031250),
Vector(3518.141113,857.030518,72.031250),
Vector(1454.358521,1094.332764,65.819206),
Vector(1815.434082, 630.772766, 64.031250),

}


ITEMPLACES ={
Vector(2629.842773, 713.630371, 59.563690),
Vector(986.192505, -1462.739990, 59.629112),
Vector(2019.680908, -1600.264526, 44.219730),
}


combinespawnzones = {
Vector(4266.699707, 1479.186035, 72.031250),
Vector(4028.567139, 1678.643433, 72.031250),
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

--SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750)+Vector(0,0,0), Angle(0,0,0))

SpawnItem("info_player_start", Vector(2449.683105, 2428.832764, 72.031250)+Vector(0,0,-45), Angle(0,-120,0))
SpawnItem("info_player_start", Vector(1892.359741, -1407.343018, 80.031250)+Vector(0,0,-45), Angle(0,-135,0))

SpawnItem("item_healthcharger", Vector(2495.968750, -278.858459, 302.537872), Angle(0,-180,0))
SpawnItem("item_healthcharger", Vector(2072.373047, 416.031250, 56.275494), Angle(0,90,0))


/*
SpawnItem("info_player_start", Vector(-159.968750, 1913.448975, -95.968750)+Vector(0,0,-45), Angle(0,0,0))

SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))
SpawnTurret(Vector(556.156494, 2330.056641, 128.705292),Angle(0.331, 22.378, 0.497))
SpawnTurret(Vector(-709.125061, 169.305756, 8.702634),Angle(0.201, 51.508, 0.738))
SpawnProp(Vector(490.964935, 2385.634766, 0.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")
SpawnProp(Vector(490.964935, 2385.634766, 2.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")
SpawnProp(Vector(490.964935, 2385.634766, 4.909191),Angle(0,0,0),"models/props_junk/sawblade001a.mdl")


SpawnProp(Vector(941.523132, 184.121384, -131.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, -101.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 21.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")

SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")
SpawnProp(Vector(941.523132, 184.121384, 51.631363),Angle(0,0,0),"models/props_junk/wood_crate001a.mdl")


SpawnProp(Vector(983.913452, -794.092651, -151.607880),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1008.994324, -780.184509, -151.532333),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1062.439209, -714.620239, -151.612885),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1042.702026, -686.063293, -151.616333),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(1057.852783, -654.657043, -151.643707),Angle(0,0,0),"models/props_c17/oildrum001_explosive.mdl")
*/
end



