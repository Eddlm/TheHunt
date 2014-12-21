---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 5
CombineSecondWave = 7
CombineThirdWave = 10
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_warehouse/office_furniture_coffee_table.mdl'}
ITEMPLACES = {Vector(-407.542908, 1587.112427, -211.638382), Vector(-286.862000, 1086.835938, -210.147034), Vector(-176.380356, 999.603699, -217.445023)}
combinespawnzones = {Vector(1502.095703, 2619.886230, -158.541855), Vector(489.589508, 3581.114990, -158.499374), Vector(-968.072144, 1619.995850, -254.535294), Vector(259.098145, -380.495148, -254.530579)}
zonescovered = {Vector(313.033783, 1620.281494, -287.598450), Vector(1073.771606, 2630.633545, -159.598465), Vector(-249.619797, 2907.924072, -159.598495), Vector(1180.842407, 1530.552124, -159.598465), Vector(247.032150, 280.100464, -287.627716)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-268.348633, 1640.492920, -234.347046),Angle(-0.000, 180.000, -0.000))
SpawnItem('info_player_start', Vector(-410.167816, 1217.511719, -230.993103),Angle(0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-389.176605, 833.159363, -226.780853),Angle(0.000, -0.000, 0.000))

end
---------------------- END OF CONFIGURATION FILE ----------------------
