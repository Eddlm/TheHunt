---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props/cs_office/table_coffee.mdl', 'models/props/de_inferno/furniturecouch001a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl', 'models/props/cs_office/shelves_metal.mdl', 'models/props_wasteland/cafeteria_table001a.mdl'}
ITEMPLACES = {Vector(-366.535370, 1001.757446, 103.735161), Vector(-973.675781, 957.878540, 97.822113)}
zonescovered ={
Vector(-246.252655, 779.252075, 128.031250),
Vector(402.092773, 1882.570923, 128.031250),
Vector(249.728470, -56.602673, 248.031250),
Vector(-942.569519, -365.803955, 128.031250),
Vector(-1011.498352, 753.641174, 128.031250),
Vector(-1516.851318, 153.432281, 128.031250),
}
combinespawnzones = {
Vector(-2285.673828, 1306.519897, 44.380402),
Vector(-2304.039063, 1012.998840, 45.629108),
Vector(-1575.854736, -688.813782, 46.031250),
Vector(701.816895, 1887.032471, 118.031250),
}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1788.668092, 288.177002, 460.943359),Angle(-0.000, -45.000, -0.000))
SpawnItem('info_player_start', Vector(231.053619, 250.719910, 460.342957),Angle(-0.000, 135.000, -0.000))
SpawnTurret(Vector(-2179.852051, 100.140648, -7.325008),Angle(0.322, 103.411, 0.432))
SpawnTurret(Vector(-668.809875, 1447.294922, 64.734558),Angle(0.394, -15.342, 0.055))
SpawnTurret(Vector(-886.129700, 2394.805420, 64.767166),Angle(0.307, -39.861, 0.457))
SpawnTurret(Vector(394.993073, -235.495712, 185.149307),Angle(-0.731, 38.060, 6.372))
SpawnTurret(Vector(-39.761848, 146.551926, 184.750687),Angle(0.362, -51.356, 0.814))
SpawnItem('item_healthcharger', Vector(-1155.968750, 1472.033580, 114.812935),Angle(0.000, 0.000, 0.000))
end
---------------------- END OF CONFIGURATION FILE ----------------------

