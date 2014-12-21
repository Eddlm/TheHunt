---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/controlroom_desk001a.mdl', 'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_c17/furniturecouch001a.mdl', 'models/props_c17/furnituretable002a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl'}
ITEMPLACES = {Vector(-1700.066040, 1066.987061, 325.412781)}
combinespawnzones = {Vector(375.522705, 298.510437, 321.501343), Vector(380.202637, 537.427856, 321.464600), Vector(364.755127, 792.677551, 321.450745)}
zonescovered = {Vector(215.121292, 1249.623901, 320.401550), Vector(-714.542114, -1108.784424, 256.401550), Vector(-1776.526489, -232.513412, 256.401550), Vector(-1061.606445, 1448.170288, 320.401550), Vector(411.976074, -1189.082275, 320.364410)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-175.617554, 964.455933, 144.683838),Angle(0.004, -90.000, 0.000))
SpawnItem('info_player_start', Vector(-2035.664429, 186.909531, 293.565277),Angle(0.000, -0.000, 0.000))
SpawnItem('info_player_start', Vector(-796.638855, 1483.117676, 207.810486),Angle(0.009, 180.000, 0.000))
SpawnTurret(Vector(-28.450468, -885.060425, 320.990204),Angle(-0.000, -45.000, -0.000))
SpawnTurret(Vector(79.223816, 1063.948853, 320.552399),Angle(0.250, 44.835, 0.320))
SpawnTurret(Vector(-1412.869629, 1000.407593, 320.730316),Angle(0.274, -134.914, 0.416))
SpawnCeilingTurretStrong(Vector(-1634.844727, -339.208740, 383.968750),Angle(0.000, 125.019, 0.000))
SpawnItem('button_turrets',Vector(-1693.269287, -367.831024, 288.276550),Angle(1.628, 89.898, -0.041))
end
---------------------- END OF CONFIGURATION FILE ----------------------
