---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_c17/furnituretable001a.mdl'}
ITEMPLACES = {}
combinespawnzones = {Vector(-352.544830, -793.676331, 54.480869)}
zonescovered = {Vector(-1404.793945, -729.850586, 120.367867), Vector(-1557.996704, -760.031982, 272.401550), Vector(-1189.744751, -322.699249, 120.401535)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1954.948242, -293.940460, 292.466156),Angle(0.130, -90.083, 0.252))
SpawnItem('info_player_start', Vector(-1890.781494, -862.961243, 295.384460),Angle(0.000, 90.000, -0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------
