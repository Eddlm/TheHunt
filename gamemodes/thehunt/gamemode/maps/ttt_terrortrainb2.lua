---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( '/../../gamemodes/thehunt/gamemode/maps/basewaves.lua' )
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
ITEMPLACES = {Vector(-363.928467, -1665.457153, 113.964180), Vector(-378.063232, -1170.979370, 118.702751), Vector(-367.141937, -1034.697266, 117.431847), Vector(-373.675568, -775.098389, 118.318161), Vector(-414.742920, 437.653473, 102.275902), Vector(-329.276733, 2586.062012, 110.825722)}
combinespawnzones = {Vector(-370.105286, 3794.473145, -26.522655), Vector(-265.028107, 3787.316162, -26.515219)}
zonescovered = {Vector(-301.375916, 2530.580078, -48.598461), Vector(-289.002655, 1675.823486, -48.617973), Vector(-338.497467, 1254.130981, 74.356834), Vector(-344.516174, 986.905945, 74.380363), Vector(-274.753326, -196.438507, -48.598461), Vector(-383.334106, -78.619705, 74.369125), Vector(-327.462006, -915.869385, -48.598461), Vector(-283.453400, -1613.837646, -48.612843), Vector(-296.365112, -1093.850220, 74.401535), Vector(-316.940338, -2828.533936, 83.401543)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end

function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-388.524048, -2113.865723, -19.330385),Angle(0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-256.389679, -2113.479980, -14.218471),Angle(0.000, 90.000, -0.000))



print("Removing troubling entities")
for k, v in pairs(ents.GetAll()) do
if tostring(v:EntIndex()) == "28" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "65" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "67" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "88" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "32" then  print(v:EntIndex()) v:Remove() end

if tostring(v:EntIndex()) == "91" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "89" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "92" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "90" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "66" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "64" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "33" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "34" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "35" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "36" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "37" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "87" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "31" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "26" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "27" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "172" then  print(v:EntIndex()) v:Remove() end


if tostring(v:EntIndex()) == "171" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "170" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "167" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "165" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "166" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "102" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "101" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "94" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "95" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "96" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "97" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "60" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "12" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "13" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "16" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "17" then  print(v:EntIndex()) v:Remove() end
if tostring(v:EntIndex()) == "24" then  print(v:EntIndex()) v:Remove() end



end
print("Done")
end





















---------------------- END OF CONFIGURATION FILE ----------------------

