include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 15
CombineInfiniteWave = 20

MAP_PROPS = {"models/props_wasteland/controlroom_desk001b.mdl","models/props_wasteland/laundry_cart002.mdl","models/props_wasteland/kitchen_shelf002a.mdl"}


zonescovered ={
Vector(-143.548355,-2661.684814,-959.968750),
Vector(1123.766846,-304.927521,-63.968750),
Vector(234.770203,-361.127350,-959.968750),
Vector(-12.508271,-2316.974365,-959.968750),
}





ITEMPLACES ={
Vector( 1554.963257, 197.944290, -52.166748),
}


combinespawnzones = {
Vector(-1192.663330, -1933.438232, -895.977295),
Vector(-452.412903, 225.464554, -959.968750),
Vector(-543.746277, 163.22158, -63.968750),
Vector(-545.614990, -80.473564, -63.968750),

}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this building.") end )
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
for k,v in pairs(ents.GetAll()) do if v:EntIndex() == 394 or v:EntIndex() == 417 or v:EntIndex() == 495 or v:EntIndex() == 394 or v:EntIndex() == 439 or v:EntIndex() == 417 or v:EntIndex() == 396 or v:EntIndex() == 854 or v:EntIndex() == 270 or v:EntIndex() == 496 or v:EntIndex() == 395 or v:EntIndex() == 398 or v:EntIndex() == 420 or v:EntIndex() == 418 or v:EntIndex() == 419 or v:EntIndex() == 397 then print (v:GetClass()) v:Remove() end end

--SpawnItem("monster_apc", Vector(-512.362732, -1917.421143, -175.968750), Angle(0,0,0))

--SpawnItem("npc_rollermine", Vector(554.265808, 859.175842, 973.066040), Angle(0,0,0))

SpawnItem("info_player_start", Vector(377.936951, -561.039734, -191.968750)+Vector(0,0,-45), Angle(0,-108,0))

SpawnItem("info_player_start", Vector(1597.979248, 567.516174, 64.031250)+Vector(0,0,-45), Angle(16,-112,0))
SpawnItem("info_player_start", Vector(-702.274109, -1433.864502, -959.968750)+Vector(0,0,-45), Angle(0,-90,0))
SpawnItem("info_player_start", Vector(-143.548355, -2661.684814, -959.968750)+Vector(0,0,-45), Angle(0,0,0))

/*
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


