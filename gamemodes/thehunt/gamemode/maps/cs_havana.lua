---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_c17/furniturecouch001a.mdl', 'models/props_wasteland/controlroom_desk001b.mdl'}
ITEMPLACES = {Vector(1303.414795, 514.728027, 41.256264), Vector(323.836639, 1622.189941, 41.290142), Vector(-106.584045, 2167.767822, 36.881702), Vector(-1089.017578, 361.080170, 46.449505), Vector(-229.632599, 2170.161621, 245.325653), Vector(-366.730652, 2171.765625, 244.232178)}
combinespawnzones = {Vector(634.551331, -877.087402, 1.484519), Vector(15.313951, -870.941650, 1.455629), Vector(-1218.387817, 889.694092, 1.499800)}
zonescovered = {Vector(85.077866, 553.910889, 16.401537), Vector(-65.455811, 1769.323242, 23.620949), Vector(-1278.188843, 422.906158, 0.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)

timer.Simple(2, function()
table.foreach(ents.GetAll(), function(key,value)
if value:EntIndex() == 518 then 
value:Remove() 
end
end)
end)

SpawnItem('info_player_start', Vector(-682.090332, 1723.041504, 263.541565),Angle(-0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-234.589890, 337.961670, 281.452454),Angle(-0.000, -90.000, -0.000))
SpawnItem('info_player_start', Vector(-477.209137, 864.165955, 39.107853),Angle(-0.000, 45.000, -0.000))
SpawnItem('info_player_start', Vector(62.608612, 1764.900635, 52.625118),Angle(-0.000, -135.000, -0.000))
SpawnItem('info_player_start', Vector(925.457336, 1534.369751, 41.173351),Angle(-0.000, 0.000, 0.000))
SpawnTurret(Vector(595.234253, 2152.238525, 240.761230),Angle(0.329, -134.027, 0.680))
SpawnTurret(Vector(12.661597, 813.920898, 248.759430),Angle(0.334, 44.686, 0.703))
SpawnTurret(Vector(-793.450745, 968.595032, 16.753107),Angle(0.354, -157.764, 0.783))
SpawnTurret(Vector(-140.763184, -11.399487, 256.646545),Angle(0.216, 1.618, 0.198))
SpawnItem('item_healthcharger', Vector(-161.968765, 2117.303955, 66.275490),Angle(0.000, 0.000, 0.000))

end
---------------------- END OF CONFIGURATION FILE ----------------------
