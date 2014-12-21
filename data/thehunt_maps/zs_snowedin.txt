---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/controlroom_desk001a.mdl', 'models/props_wasteland/laundry_cart001.mdl', 'models/props_wasteland/laundry_cart002.mdl','models/props_wasteland/cafeteria_table001a.mdl', 'models/props_wasteland/kitchen_shelf001a.mdl','models/props_wasteland/kitchen_shelf002a.mdl'}
ITEMPLACES = {Vector(-754.644409, 2992.507080, 38.340076)}
combinespawnzones = {Vector(-1706.499634, 3568.995117, 1.488960)}
zonescovered = {Vector(12.003983, 223.564133, 0.401537), Vector(-1387.635742, -9.821785, 0.349936), Vector(2478.219727, 991.750732, 0.374813), Vector(-289.176239, 2430.446777, 0.401537), Vector(56.992546, -1416.461182, 0.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(1123.077759, -1754.563599, 23.701078),Angle(-0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(2650.154297, 724.596619, 20.351681),Angle(0.026, -89.987, -0.082))
SpawnItem('info_player_start', Vector(-1577.701660, -549.849731, -78.771759),Angle(-0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-1611.173950, 683.417419, -102.421112),Angle(-0.000, -90.000, 0.000))
SpawnItem('info_player_start', Vector(-228.347305, -616.624573, 21.621725),Angle(-0.000, 180.000, -0.000))
SpawnTurret(Vector(-1279.147095, 146.837540, 0.763561),Angle(0.321, -177.175, 0.650))
SpawnCeilingTurretStrong(Vector(1506.728027, 1135.923950, 447.968750),Angle(0.000, 266.433, 0.000))
SpawnCeilingTurretStrong(Vector(1498.764526, 544.381836, 447.968750),Angle(0.000, 86.433, 0.000))
SpawnItem('item_healthcharger', Vector(288.000000, 2304.000000, 56.000000),Angle(0.000, 0.000, 0.000))
SpawnItem('item_healthcharger', Vector(-688.000000, 528.000000, 80.000000),Angle(0.000, 90.000, 0.000))
SpawnDynamicAmmoCrate(Vector(2563.583984, 1598.065674, 0.415592),Angle(-0.043, 138.612, -0.189))
SpawnDynamicAmmoCrate(Vector(2560.873535, 1601.215942, 24.816547),Angle(-0.059, 138.765, -0.158))
SpawnDynamicAmmoCrate(Vector(2329.018311, 1106.035522, 40.781769),Angle(0.010, 39.937, -0.025))
SpawnDynamicAmmoCrate(Vector(2352.102051, 978.905945, 17.487789),Angle(90.000, -135.521, 180.000))
SpawnDynamicAmmoCrate(Vector(-431.987396, -462.999237, 0.449642),Angle(0.003, 23.393, 0.194))
SpawnDynamicAmmoCrate(Vector(-449.483002, -369.111786, 17.442663),Angle(89.835, -86.215, 22.599))
SpawnDynamicAmmoCrate(Vector(-462.226593, -404.419861, 15.517396),Angle(0.048, 110.829, -90.000))
SpawnDynamicAmmoCrate(Vector(-452.265137, -443.071198, 15.516788),Angle(0.050, 20.519, -90.186))
SpawnDynamicAmmoCrate(Vector(-457.084564, -440.901154, 32.986286),Angle(0.538, -8.134, 0.396))
SpawnItem('button_turrets',Vector(972.462341, 803.787292, 89.559074),Angle(0.001, -179.999, -0.213))

end
---------------------- END OF CONFIGURATION FILE ----------------------
