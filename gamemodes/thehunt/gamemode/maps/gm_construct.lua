---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
ITEMPLACES = {Vector(281.279907, -371.198669, -143.058380)}
combinespawnzones = {Vector(939.357483, -2793.966797, -78.066734)}
zonescovered = {Vector(-230.720947, 724.042847, -147.609955)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(76.713356, -368.614410, -117.299965),Angle(-0.000, -0.000, 0.000))
SpawnItem('npc_grenade_frag',Vector(29.799540, -678.815918, -143.216415),Angle(0.824, 0.127, 3.801),'models/weapons/w_npcnade.mdl')
SpawnItem('combine_mine',Vector(21.395361, -618.980835, -147.622070),Angle(0.038, -0.009, -0.456),'models/props_combine/combine_mine01.mdl')
SpawnItem('durgz_lsd',Vector(42.867477, -665.536133, -147.502655),Angle(0.015, 0.574, 0.143),'models/smile/smile.mdl')
SpawnItem('prop_physics',Vector(32.986340, -742.618713, -129.131531),Angle(0.273, -179.451, -0.381),'models/props_trainstation/bench_indoor001a.mdl')
end
---------------------- END OF CONFIGURATION FILE ----------------------

