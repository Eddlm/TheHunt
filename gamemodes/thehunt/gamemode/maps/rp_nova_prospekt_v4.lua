include( "basewaves.lua" )
CombineFirstWave = 15
CombineSecondWave = 20
CombineThirdWave = 20
CombineFourthWave = 20
CombineFifthWave = 30
CombineInfiniteWave = 40

MAP_PROPS = {"models/props_wasteland/controlroom_desk001b.mdl","models/props_wasteland/controlroom_desk001a.mdl"}

zonescovered ={
Vector(-715.801270, -1541.449219, -175.968750),

Vector(-1319.781372,2637.140137,448.031250),
Vector(-1947.983521,1809.843994,448.031250),
Vector(-1372.229370,3511.158936,576.031250),
Vector(-2313.461182,3085.354492,320.031250),
Vector(-1830.321411,1429.751709,576.031250),

Vector(-742.643005,1468.996582,576.022583),
Vector(-1512.014771,-947.837158,704.031250),
Vector(-1872.106934,-141.743393,570.576294),
Vector(-3640.577881,2364.115723,832.031250),
Vector(-3229.316162,864.670227,576.031250),
Vector(-2623.568359,1960.793579,576.031250)

}

ITEMPLACES ={

Vector(-981.357544, 2928.031250, 357.494965),
Vector(-1356.022095, 2784.031250, 357.494965),

Vector(-3092.159912, 1710.449951, 549.910889),
Vector(-1425.323486, 2792.412109, 420.642303),
Vector(-1743.442505, 1710.994629, 539.400024),
Vector(-1255.344971, 3802.370605, 607.329590),
Vector(-3490.758789, 2129.673340, 832.031250),
}


combinespawnzones = {
Vector(-438.174988, 4007.500488, 448.031250),
}

function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end


function MapSetup()
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)


for k,v in pairs(ents.GetAll()) do 
if v:GetClass() == "func_door" then v:Remove() end
end


SpawnItem("info_player_start", Vector(-2511.968750, 3205.644287, 320.031250)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(-2299.313721, 3550.281494, 448.031250)+Vector(0,0,-45), Angle(0,-90,0))
SpawnItem("info_player_start", Vector(-923.768677, 3117.926758, 320.031250)+Vector(0,0,-45), Angle(0,180,0))
SpawnItem("info_player_start", Vector(-1421.892700, 3125.981934, 320.031250)+Vector(0,0,-45), Angle(0,0,0))
SpawnItem("info_player_start", Vector(-2226.308594, 2311.633301, 320.031250)+Vector(0,0,-45), Angle(0,0,0))



SpawnItem("item_healthcharger", Vector(-2553.862305, 2177.485596, 560.275452), Angle(0,-90,0))
SpawnItem("item_healthcharger", Vector(-3912.968750, 2260.100342, 816.275452), Angle(0,-0,0))

SpawnItem("npc_rollermine", Vector(-1958.974365, 2242.080566, 267.272339), Angle(0,-0,0))

if math.random(1,2) == 1 then
SpawnItem("npc_sniper", Vector(1250.122070, 145.206009, 1123.044312), Angle(0.000, -180.000, 0.000) )
else
SpawnItem("npc_sniper", Vector(-2819.449463, -745.193176, 1118.159180), Angle(0.000, 45.000, 0.000) )
end

SpawnTurret(Vector(-2291.516113, 2433.726563, 512.714233),Angle(0.228, -91.654, -0.099))
SpawnTurret(Vector(-2311.140381, 1941.476929, 512.760864),Angle(0.330, 90.098, 0.684))
SpawnTurret(Vector(-3586.198975, 1363.349854, 512.738525),Angle(0.166, -18.989, 0.255))

SpawnTurret(Vector(-1067.520508, 3348.314453, 256.752380),Angle(0.314, -118.638, 0.698))
SpawnTurret(Vector(-1238.250122, 2616.962158, 256.708710),Angle(0.367, 90.078, 0.540))

SpawnTurret(Vector(-3707.658447, 2012.483521, 640.747559),Angle(0.206, -19.785, 0.378))


--SpawnTriplaser( Vector(-2269.284424, 2401.454346, 588.476624), Angle(0,-90,0))
--SpawnTriplaser(Vector(-2268.204102, 2401.454346, 563.519043), Angle(0,-90,0))
--SpawnTriplaser(Vector(-2268.493652, 2401.454346, 538.842712), Angle(0,-90,0))


end



