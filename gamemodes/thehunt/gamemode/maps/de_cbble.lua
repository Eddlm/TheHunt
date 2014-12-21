---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {'models/props_wasteland/kitchen_shelf002a.mdl', 'models/props_wasteland/laundry_cart002.mdl'}
ITEMPLACES = {Vector(-572.962952, 2906.218750, 67.771935), Vector(-300.867828, 1181.947510, 69.113037), Vector(-142.577515, 1773.294434, 29.128014), Vector(-790.202271, 986.681824, 117.135941), Vector(-1370.622925, 1451.672363, 91.825478), Vector(-2105.012451, 1932.614258, 52.833408), Vector(-2804.472656, -1973.623657, 100.612122), Vector(-1141.184448, 2491.674316, 155.798569)}
combinespawnzones = {Vector(1407.276489, -1031.528198, -126.519630), Vector(390.993195, 2278.099365, -254.500198), Vector(354.604462, 1589.972656, 1.442204), Vector(-2241.131104, -2197.788574, 1.455106), Vector(-2790.516357, 1342.014404, 1.456754)}
zonescovered = {Vector(-2281.073975, 268.472076, -255.598465), Vector(-1039.229248, 2290.741943, -255.598465), Vector(-55.300060, 992.941772, 7.931900), Vector(-736.647400, 174.611435, 0.374608), Vector(671.639099, -1024.238403, -127.598457), Vector(-2245.483887, 2118.270752, 0.347071), Vector(-2140.250732, -1095.041016, 0.401537)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-794.056030, 1355.752563, 93.058617),Angle(0.000, 135.000, -0.000))
SpawnItem('info_player_start', Vector(-931.845398, 8.878958, 33.188099),Angle(-0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-682.827332, -745.060791, -99.993271),Angle(-0.000, 90.000, 0.000))
SpawnItem('info_player_start', Vector(-2398.894775, 456.961517, 119.862221),Angle(-0.000, -45.000, 0.000))
SpawnItem('info_player_start', Vector(-1183.728394, 2605.813232, 349.030548),Angle(-0.000, 90.000, 0.000))
SpawnProp(Vector(-2127.959473, 675.987793, 96.360687),Angle(-0.048, -179.991, 0.006),'models/props_wasteland/kitchen_shelf002a.mdl')
SpawnProp(Vector(-2138.341553, 578.503540, 117.576782),Angle(-0.066, 129.850, 0.025),'models/props_wasteland/laundry_cart002.mdl')
SpawnProp(Vector(-1178.685669, 2756.064697, 320.495514),Angle(0.070, -134.929, 0.023),'models/props_wasteland/kitchen_shelf002a.mdl')
end
---------------------- END OF CONFIGURATION FILE ----------------------
