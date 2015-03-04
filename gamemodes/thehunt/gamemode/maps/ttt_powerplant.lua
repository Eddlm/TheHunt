---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( '/../../gamemodes/thehunt/gamemode/maps/basewaves.lua' )
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/controlroom_desk001b.mdl', 'models/props_junk/pushcart01a.mdl', 'models/props_wasteland/cafeteria_table001a.mdl', 'models/props_wasteland/cafeteria_bench001a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl'}
ITEMPLACES = {Vector(238.741776, 158.092926, 3.819426)}
combinespawnzones = {Vector(-330.990387, -1561.076172, -254.534683), Vector(-320.212677, -1301.121948, -254.503006)}
zonescovered = {Vector(-55.808697, -1407.568970, -255.598465), Vector(-587.411377, -183.519852, -255.598465), Vector(-684.005310, -528.662537, -127.598465), Vector(-379.564026, -0.334248, 0.361374), Vector(61.866467, -231.287628, -255.598450), Vector(-106.636436, -586.360657, -255.625565), Vector(422.774231, -588.590881, -255.598465), Vector(894.683105, -716.378662, -255.636719)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1253.739746, -718.599365, -103.875061),Angle(0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(468.590454, -102.230064, 23.355120),Angle(-0.000, 135.000, -0.000))
SpawnItem('info_player_start', Vector(-418.724945, 546.604004, -105.562126),Angle(-0.000, 45.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

