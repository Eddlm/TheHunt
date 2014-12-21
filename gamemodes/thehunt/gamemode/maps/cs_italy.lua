include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 10
CombineInfiniteWave = 20

MAP_PROPS = {"models/props_c17/furnituredrawer001a.mdl","models/props_c17/furnituretable002a.mdl","models/props_c17/furnituretable001a.mdl",}

zonescovered ={
Vector(-715.801270, -1541.449219, -175.968750),
Vector(323.394135, -214.058197, -95.968750),
Vector(-1079.747681, 1919.000977, -87.968750),
Vector(-1100.641968, 987.607788, -95.968750),
Vector(234.752258, 2087.459229, 64.031250),
Vector(712.359741, 2196.531006, 192.031250),
}

ITEMPLACES ={
Vector(-1261.686646, 1220.821899, -99.216232),
Vector(955.465820, 1928.274536, 56.938904),
Vector(698.684509, 2116.305664, 180.031250),
Vector(431.968750, 2255.913574, 96.031250),
Vector(647.080750, -302.631409, -117.468765),
Vector(663.113403, -457.634277, -118.530411),
Vector(460.007019, -383.301483, -117.090652),
Vector(-471.744293, 472.556305, 72.031250),
}


combinespawnzones = {
Vector(-668.826782, -2058.153076, -175.968750),
Vector(-1089.937134, -1855.745605, -87.968750)

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

SpawnItem("info_player_start", Vector(-410.501892, -89.787407, -87.968750)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(177.478897, 95.992462, -87.968750)+Vector(0,0,-45), Angle(0,0,0))
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

end



