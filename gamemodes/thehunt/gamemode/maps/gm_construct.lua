---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/laundry_cart002.mdl', 'models/props_wasteland/laundry_cart002.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl'}
ITEMPLACES = {Vector(-2304.073730, -2347.522461, 261.106964)}
combinespawnzones = {Vector(1628.457642, -2262.601807, -142.543030)}
zonescovered = {Vector(1272.391235, -1595.949951, -143.640411), Vector(357.178802, -650.254761, -147.600754), Vector(-2045.388428, -1453.680908, -143.598465), Vector(1454.048340, -34.603443, -143.598465)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-2299.241455, -2932.889160, 278.164948),Angle(-0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-1976.164063, -2535.203857, 283.244293),Angle(-0.000, -134.999, 0.000))
SpawnItem('info_player_start', Vector(-2728.874512, -3148.232178, 279.130585),Angle(0.000, 45.000, 0.000))
SpawnProp(Vector(-1072.485718, -1850.807373, -122.341446),Angle(0.040, 90.216, 0.021),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1216.027588, -1901.602905, -122.506371),Angle(0.002, 179.949, 0.028),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1097.523560, -1075.333374, -143.555069),Angle(0.036, -1.661, -0.068),'models/props_wasteland/kitchen_shelf001a.mdl')
SpawnProp(Vector(-1233.706299, -1082.704468, -118.449181),Angle(0.000, -90.000, -0.000),'models/props_junk/trashdumpster01a.mdl')
SpawnTurret(Vector(-2186.433594, -1059.119263, -143.245239),Angle(0.349, -91.823, 0.762))
SpawnTurret(Vector(-958.356934, -1199.999023, -143.245621),Angle(0.309, -89.183, 0.676))
SpawnTurret(Vector(-967.785095, -1821.435059, -143.240982),Angle(0.297, 90.103, 0.624))
SpawnCeilingTurretStrong(Vector(-1567.668701, -1980.980103, 23.968750),Angle(0.000, 95.186, 0.000))
SpawnCeilingTurretStrong(Vector(-2551.331299, -1974.442871, 23.968750),Angle(0.000, 91.274, 0.000))
SpawnCeilingTurretStrong(Vector(-2064.022705, -1965.731323, 23.968750),Angle(0.000, 88.751, 0.000))
SpawnItem('button_turrets',Vector(-1089.429077, -1013.943542, -123.648163),Angle(0.000, 90.000, 0.000))
SpawnItem('item_healthcharger', Vector(-1023.687988, -1864.040894, -94.319168),Angle(0.000, 0.000, 0.000))
SpawnSuitCharger(Vector(-1023.722107, -1112.205688, -94.848068),Angle(0.000, 0.000, 0.000))
SpawnDynamicAmmoCrate(Vector(-1509.645264, -1267.684814, -143.530609),Angle(-0.002, -79.987, 0.025))
SpawnDynamicAmmoCrate(Vector(-1509.499023, -1268.201538, -119.052567),Angle(0.016, -79.936, 0.053))
SpawnDynamicAmmoCrate(Vector(-1510.767456, -1271.018921, -94.588020),Angle(0.003, -80.013, 0.055))
SpawnDynamicAmmoCrate(Vector(-1509.963135, -1271.549194, -70.130646),Angle(-0.013, -80.014, 0.033))
SpawnDynamicAmmoCrate(Vector(-1511.039307, -1269.054321, -45.697624),Angle(-0.002, -80.065, 0.014))
SpawnDynamicAmmoCrate(Vector(-1510.403076, -1270.022461, -21.288948),Angle(0.016, -80.063, 0.055))
SpawnAmmoCrate(Vector(-796.560974, -1903.665039, -127.501480),Angle(0.207, 90.000, -0.000),3)
SpawnItem('npc_sniper',Vector(764.623596, -1489.112549, 1171.319824),Angle(-0.069, 179.917, 0.062))
end
---------------------- END OF CONFIGURATION FILE ----------------------
