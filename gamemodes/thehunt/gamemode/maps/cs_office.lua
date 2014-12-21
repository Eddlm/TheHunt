include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

zonescovered ={
Vector(109.848724, -491.705963, -142.564056),
Vector(86.201492, 76.837189, -142.667480),
Vector(681.523682, 964.000488, -142.646240),
Vector(1566.709717, 551.995239, -142.515396),
Vector(968.367981, -745.158630, -142.618393),
Vector(1443.772339, -472.668091, -142.631546),
Vector(1978.673096, -125.802963, -142.579987),
Vector(1369.898682, 193.094101, -142.604904),
Vector(-1203.890381, 696.109558, -310.807953),
Vector(-527.536621, 585.673523, -142.616608),
Vector(-446.158600, 118.868263, -142.644379),
Vector(-1596.477661, -809.852112, -222.582382),
Vector(-567.130737, -1855.733398, -318.606476),
Vector(104.910156, -1802.716431, -318.667389),
Vector(1084.016113, -1428.655518, -315.430908),
}

MAP_PROPS = {"models/props_junk/trashdumpster01a.mdl", }



SPECIALITEMPLACES = {}

ITEMPLACES ={
Vector(1540.359375, 427.524811, -101.968750),
Vector(1298.221558, 50.166527, -110.355179),
Vector(2171.060303, -268.845703, -102.953552),
Vector(2131.773926, -37.425266, -108.965073),
Vector(-1438.419922, -1458.935913, -279.867950),
Vector(-693.724304, -1146.022461, -191.640594),
Vector(-344.726959, -725.520874, -240.393250),
Vector(-384.318817, -32.022541, -101.968750),
Vector(-667.256470, 148.832520, -101.968750),
}

combinespawnzones = {
Vector(1384.189331, -1481.687378, -265.544403),
Vector(-1183.324829, 313.127258, -262.019531),
Vector(-1192.216553, 1217.630005, -346.024506),
Vector(-1209.991821, 480.031372, -266.932922),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

	for k,v in pairs(ents.FindByClass("func_door")) do
		print (v:GetClass())
		v:Remove()
		-- v:SetKeyValue( "spawnflags", "1024" )
	end

end

function MapSetup()

-- 


SpawnItem("item_healthcharger", Vector(-64.968750, -2096.217285, -281.618439), Angle(0,0,0) )
SpawnItem("item_healthcharger", Vector(-801.182800, 79.031235, -316.246277), Angle(0.000, 90.000, 0.000) )
SpawnItem("item_healthcharger", Vector(-255.031250, 427.936035, -107.724518), Angle(0.000, -180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(-1538.991577, -31.031250, -189.724503), Angle(0.000, -90.000, 0.000) )
SpawnItem("item_healthcharger", Vector(1477.891357, -351.031250, -105.174438), Angle(0.000, -90.000, 0.000) )

table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)


SpawnStaticProp(Vector(-1313.221558, -1243.587769, -310.317780),Angle(0,0,0),"models/props_junk/trashdumpster01a.mdl")
SpawnStaticProp(Vector(-1313.120972, -1328.330322, -310.333618),Angle(0,0,0),"models/props_junk/trashdumpster01a.mdl")



SpawnItem("info_player_start", Vector(-840.900513, 341.436676, -303.968750)+Vector(0,0,-45), Angle(0,-30,0))
SpawnItem("info_player_start", Vector(-1679.968750, -582.632629, -175.093262)+Vector(0,0,-60), Angle(0,40,0))
SpawnItem("info_player_start", Vector(-873.838318, -1199.497314, -175.968750)+Vector(0,0,-45), Angle(0,50,0))
if math.random(1,2) == 1 then
SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-86.159615, -1113.844360, -223.263809),Angle(0.257, 92.666, 0.642))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(160.571671, 258.939148, -159.335083),Angle(0.246, -135.069, 0.669))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(46.546043, 245.570648, -159.359268),Angle(0.245, -44.737, 0.494))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(533.487549, 399.575165, -159.320435),Angle(0.267, 68.587, 0.236))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1520.726563, 712.739624, -159.232742),Angle(0.251, -117.771, 0.229))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1438.213135, -100.056686, -159.260376),Angle(0.388, -139.589, 0.437))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(1596.922363, -66.794807, -159.254135),Angle(0.365, -55.106, 0.123))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-476.431427, 743.850830, -159.272491),Angle(0.395, -89.819, 0.520))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(-1749.798584, -1412.027466, -327.260681),Angle(0.127, -0.001, 0.366))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(376.728180, -867.903198, -223.239578),Angle(0.320, -52.959, -0.013))
end
if math.random(1,2) == 1 then
SpawnTurret(Vector(2311.805420, 87.288605, -159.254349),Angle(0.238, -161.699, 0.572))
end
end

