include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 10
CombineFourthWave = 10
CombineFifthWave = 10
CombineInfiniteWave = 20

CUSTOMWAVESPAWN = 15

zonescovered ={
Vector(1744.653564, -1323.147827, -415.968750),
Vector(385.222107, -466.837311, -143.968750),
Vector(562.768127, -689.248169, -143.968750),
Vector(764.469727, 565.512695, -191.968750),
Vector(125.047203, 733.100891, -231.968750),
Vector(2115.724365, 511.861481, -329.968750),
Vector(3076.959473, -10.519232, -415.968750),
Vector(1758.782349, -1060.165771, -223.968750),
Vector(1967.932251, 144.939438, -223.968750),
Vector(2211.334473, -254.156982, -223.968750),
Vector(2143.618164, -207.926666, -351.968750),
Vector(1566.118652, -647.241699, -223.968750),
Vector(2106.572266, -821.033020, -415.968750),
Vector(2085.751953, -1566.063843, -415.968750),
Vector(3324.902344, -573.454956, -415.968750),
Vector(2401.308838, 970.505188, -319.968750),
Vector(597.373108, 664.593628, -231.968750),
Vector(-54.674984, -333.557983, -142.989548),
Vector(619.507568, -176.015442, -221.206787),
Vector(880.959717, -1572.867798, -335.968750),
}

SPECIALITEMPLACES = {Vector(415.273499, -542.931213, -207.486923),}

MAP_PROPS = {"models/props_c17/oildrum001.mdl"}


ITEMPLACES ={
Vector(-41.521809, 752.603333, -295.533325),
Vector(807.907104, 648.964233, -220.978485),
Vector(2497.378906, 927.986938, -365.975616),
Vector(3276.861816, -281.494781, -419.867035),
Vector(2136.873535, -694.075073, -426.954712),
Vector(1878.545044, -1256.778442, -438.866943),
Vector(1842.226929, -1057.890991, -252.542831),
Vector(1991.743286, -382.464508, -376.698853),
}

combinespawnzones = {
Vector(-10.309028, 291.098389, -231.968750),
Vector(-7.900296, 455.145752, -231.968750),
Vector(186.566238, 454.592224, -231.968750),
Vector(147.195541, 353.380493, -221.231689),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Rebel base located.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Exterminate all hostiles.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )
end

function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

for k, v in pairs(ents.FindByClass("func_door")) do
print(v:GetClass())
v:Remove()
end

if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(280.441681, -631.092285, -156.139618), Angle(-0.143, 0.040, -0.092) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1113.028809, 679.474548, -204.243866), Angle(0.052, -89.916, 1.122) )
	else
		SpawnItem("item_healthcharger", Vector(2995.272461, -56.708099, -428.866638), Angle(0.078, -16.004, -1.028) )
end
if math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1472.418579, -1291.303833, -427.142731), Angle(-0.006, 0.263, -0.018) )
	elseif math.random (1,2) == 1 then 
		SpawnItem("item_healthcharger", Vector(1682.437012, -173.122559, -298.975769), Angle(0.192, 0.043, 0.041) )
	else
		SpawnItem("item_healthcharger", Vector(1440.357178, -924.937927, -234.932510), Angle(0.096, 0.183, 0.014) )
end

SpawnStaticProp(Vector(160.943665, 210.115433, -216.990173),Angle(0.001, 177.962, 0.700),"models/props_debris/concrete_wall01a.mdl")

SpawnItem("info_player_start", Vector(446.814697, -370.925842, -143.968750)+Vector(0,0,-45), Angle(2.765984, -159.435364, 0.000000))
SpawnItem("info_player_start", Vector(983.786072, -1120.604370, -335.968750)+Vector(0,0,-60), Angle(3.062314, 179.479080, 0.000000))
SpawnItem("info_player_start", Vector(2156.374023, -984.792847, -415.968750)+Vector(0,0,-60), Angle(4.346467, 175.580872, 0.000000))
SpawnItem("info_player_start", Vector(1783.265747, 442.682983, -319.968750)+Vector(0,0,-45), Angle(11.062535, 0.533814, 0.000000))
SpawnItem("info_player_start", Vector(1577.702637, -1025.700439, -271.968750)+Vector(0,0,-45), Angle(1.085738, 0.435474, 0.000000))
SpawnItem("info_player_start", Vector(2245.258545, -326.827393, -351.968750)+Vector(0,0,-60), Angle(-0.396055, 144.555298, 0.000000))
SpawnItem("info_player_start", Vector(2720.290527, -520.364075, -399.968750)+Vector(0,0,-60), Angle(5.728408, -87.531525, 0.000000))
end