include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20

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





SPECIALITEMPLACES = {}

ITEMPLACES ={
Vector(1540.359375, 427.524811, -101.968750),
Vector(1298.221558, 50.166527, -110.355179),
Vector(2171.060303, -268.845703, -102.953552),
Vector(2131.773926, -37.425266, -108.965073),
Vector(-1438.419922, -1458.935913, -279.867950),
Vector(-693.724304, -1146.022461, -191.640594),
Vector(-56.639225, -724.146973, -176.947861),
}

combinespawnzones = {
Vector(1384.189331, -1481.687378, -265.544403),
Vector(-1183.324829, 313.127258, -262.019531),
Vector(-1192.216553, 1217.630005, -346.024506),
Vector(-1209.991821, 480.031372, -266.932922),
}


function FirstSpawn()
PrintMessage(HUD_PRINTTALK, "This map features three full waves of Combines.")
PrintMessage(HUD_PRINTTALK, "The first wave it's coming. Hide!")
PrintMessage(HUD_PRINTTALK, "Kill the majority of Combines. then, the second wave will come.")

	for k,v in pairs(ents.FindByClass("func_door")) do
		print (v:GetClass())
		v:Remove()
		-- v:SetKeyValue( "spawnflags", "1024" )
	end

end

function MapSetup()
SpawnItem("item_healthcharger", Vector(-456.275421, 479.784363, -414.434113), Angle(-90.000, 90.000, 45.000) )
SpawnItem("item_healthcharger", Vector(2426.728027, 1045.636841, -503.854034), Angle(0.000, 0.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2652.968750, 1045.645264, -502.366577), Angle(0.000, -180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2179.817871, 1431.281738, -427.116882), Angle(0.000, -180.000, 0.000) )
SpawnItem("item_healthcharger", Vector(2188.407715, 1016.049683, -426.366516), Angle(0.000, -180.000, 0.000) )

for k, v in pairs(ents.FindByClass("info_player_start")) do
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

SpawnItem("info_player_start", Vector(-840.900513, 341.436676, -303.968750)+Vector(0,0,-45), Angle(0,-30,0) )
SpawnItem("info_player_start", Vector(-1679.968750, -582.632629, -175.093262)+Vector(0,0,-60), Angle(0,40,0) )
SpawnItem("info_player_start", Vector(-873.838318, -1199.497314, -175.968750)+Vector(0,0,-45), Angle(0,50,0) )


end

