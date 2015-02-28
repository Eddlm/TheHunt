---------------------- THE HUNT CONFIGURATION FILE ----------------------
include( 'basewaves.lua' )
CombineFirstWave = 7
CombineSecondWave = 10
CombineThirdWave = 13
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20
MAP_PROPS = {}
entstodelete = {"117", "116", "140", "139"}

ITEMPLACES = {Vector(-1365.819336, -618.032776, 134.561630), Vector(-1372.203735, 43.254581, 134.564224), Vector(-1350.358398, 812.115234, 134.246735), Vector(371.980743, -1392.992065, 133.561310), Vector(-246.127365, -35.729557, 145.056046), Vector(-245.461853, -149.908340, 145.121582)}
combinespawnzones = {Vector(-270.879700, -1500.304565, -214.517700), Vector(-951.031799, -45.235226, 353.499786), Vector(-448.977905, -177.643890, 353.428650)}
zonescovered = {Vector(-534.844238, 508.932404, 352.396454), Vector(-508.172546, 853.395386, 106.276062), Vector(-882.052917, -87.312668, 96.401543), Vector(-680.001099, -910.601929, 96.357964), Vector(-423.272400, -508.610016, 96.401543), Vector(-458.251678, -1275.116699, 96.401543), Vector(-115.074280, -1249.488525, 96.400101), Vector(-122.332741, -617.097290, 96.385391), Vector(-122.837181, -139.686325, 96.400009), Vector(-124.759300, 479.370270, 96.320435), Vector(-189.558289, 833.575745, 96.401543), Vector(-861.732422, 1091.722656, -215.598465), Vector(262.965271, -108.254402, 0.373553), Vector(-607.021301, -34.274342, -215.598465), Vector(-257.804077, -1030.584961, -215.599594), Vector(298.572296, -732.762268, -215.627319)}
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Protection team alert, evidence of anticivil activity in this community.') end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, '[Overwatch]: Code: assemble, plan, contain.') end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, 'Type !help to see the game mechanics.') end )
end



function MapSetup()
for k, v in pairs(ents.FindByClass('func_door_rotating')) do print(v:GetClass()) v:SetKeyValue( 'spawnflags', '32' ) v:Fire('Open','',0) end
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value) for k, v in pairs(ents.FindByClass(value)) do print(v:GetClass()) v:Remove() end end)
SpawnItem('info_player_start', Vector(-1453.219849, 333.079437, 124.185310),Angle(0.000, 90.000, -0.000))
SpawnItem('info_player_start', Vector(-1449.407104, -347.082977, 125.617363),Angle(0.000, -90.001, 0.000))
SpawnItem('info_player_start', Vector(-22.377125, 1023.911499, 124.495918),Angle(0.000, 180.000, -0.000))
SpawnItem('info_player_start', Vector(-1070.099609, 970.179077, 119.036537),Angle(-0.000, -89.999, 0.000))
SpawnItem('info_player_start', Vector(-1074.729370, 170.005646, 124.151230),Angle(-0.000, -89.999, 0.000))
SpawnItem('info_player_start', Vector(-1070.456909, -471.893646, 140.777023),Angle(-0.000, -90.000, 0.000))

--  end



timer.Simple(2, function()
table.foreach(entstodelete, function(key,value)
if table.HasValue(ents.GetAll(), value) then value:Remove() end
end)
end)

end
---------------------- END OF CONFIGURATION FILE ----------------------

