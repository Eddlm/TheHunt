---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 15
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
haszombies=1
MAP_PROPS = {'models/props/de_prodigy/pushcart.mdl', 'models/props_wasteland/controlroom_desk001b.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props_wasteland/cafeteria_table001a.mdl'}
ITEMPLACES = {Vector(2285.864746, -1538.832397, -200.102203), Vector(2079.264893, 216.284714, -170.615585)}
combinespawnzones = {Vector(-143.626480, -2563.404785, 40.656590), Vector(2.519132, 704.149170, 33.463428), Vector(2904.128906, -3161.853027, 33.486561), Vector(1451.016846, -348.393280, -219.161560)}
zonescovered = {Vector(5321.622070, -1262.884888, -351.598450), Vector(4149.471680, -1793.036133, -543.598450), Vector(3588.423340, -1024.866211, -543.603333), Vector(2303.824219, -1965.854004, -223.645615), Vector(2029.330811, -43.888306, -223.598465), Vector(2785.430176, 305.026581, -415.598450), Vector(3172.645264, -465.756836, -543.598450), Vector(3134.278320, -2629.601563, -223.644470), Vector(2410.843018, -2874.907471, -223.618835), Vector(2468.831543, -3069.803223, -487.598450), Vector(1310.427979, -3674.663086, -95.598465), Vector(-88.499313, -1243.386108, -95.598465), Vector(864.234192, 123.014824, 32.401539), Vector(-8.758978, 388.105927, 32.386520), Vector(1424.854858, -468.521027, -223.598465), Vector(2826.482178, -3182.052002, 32.401630)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(2739.215820, -603.993408, -198.449127),Angle(-0.002, 90.001, 0.000))
SpawnItem('info_player_start', Vector(3365.618408, -2614.786377, -197.524033),Angle(-0.000, 90.000, 0.002))
SpawnItem('info_player_start', Vector(2130.188721, -3207.583984, -199.328995),Angle(-0.000, 0.000, 0.004))
SpawnItem('info_player_start', Vector(1839.755615, -282.448853, -201.149948),Angle(0.000, 0.000, -0.000))
SpawnItem('item_healthkit',Vector(-246.757492, -1504.246826, -45.543388),Angle(-0.123, 0.089, -0.139))
SpawnItem('item_healthvial',Vector(-247.006927, -1483.888672, -43.206642),Angle(-3.631, 119.302, 90.006))
SpawnItem('item_healthvial',Vector(-248.985870, -1464.133179, -43.650604),Angle(-1.689, -123.272, -90.035))
SpawnItem('item_healthvial',Vector(457.760468, -696.245789, -93.092880),Angle(48.167, 55.060, 90.473))
SpawnItem('item_healthvial',Vector(463.497437, -739.245056, -93.710587),Angle(-42.692, -21.965, -90.008))
SpawnItem('item_healthvial',Vector(428.698364, -745.293518, -93.471237),Angle(47.850, 61.041, -90.001))
SpawnItem('item_healthcharger', Vector(206.031250, -1964.578003, -44.049522),Angle(0.000, 0.000, 0.000))
SpawnStaticProp(Vector(1897.050659, -1536.793457, -193.390823),Angle(-62.144, -0.028, 0.048),'models/props_wasteland/interior_fence001g.mdl')
SpawnStaticProp(Vector(1817.755005, -1534.364990, -192.962769),Angle(-61.653, -179.740, -0.234),'models/props_wasteland/interior_fence001g.mdl')
end
---------------------- END OF CONFIGURATION FILE ----------------------
