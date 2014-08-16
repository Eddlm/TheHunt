include( "basewaves.lua" )
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20

ITEMPLACES ={
Vector(315.101501, -2831.495605, 212.031250),
Vector(-315.563049, -2839.528564, 212.031250),
Vector(3.830299, -2326.775391, 372.892365),
Vector(38.199932, -769.898743, 336.031250),
Vector(202.883270, -1085.992065, 336.031250),
Vector(611.003845, -265.433563, 369.773712),
Vector(-140.420853, -698.478333, 230.031250),
Vector(-179.740677, -841.495911, 334.706879),
Vector(-323.812653, -842.400635, 334.706909),
Vector(-432.044830, -1002.993958, 76.600952),
Vector(-432.044830, -1002.993958, 76.600952),
Vector(-159.318420, -1487.731201, 95.088943),
Vector(-441.468842, -1405.445435, 61.131882),
Vector(624.803894, 368.617981, 340.031250),
Vector(629.244080, 164.188248, 340.031250),
Vector(376.882935, 1044.030518, 204.031250),
Vector(33.796799, 978.117065, 98.232132),
}
 
 
zonescovered ={
Vector(-3.576389, -2861.876709, 200.031250),
Vector(474.047516, -2001.201660, 200.031250),
Vector(-664.672729, -712.387268, 200.031250),
Vector(570.296448, -658.630127, 200.031250),
Vector(-3.075608, 359.789703, 336.031250),
Vector(-449.871002, 1066.243774, 200.031250),
Vector(361.334442, 861.498779, 200.031250),
Vector( 8.713186, -952.360413, 201.031250),
Vector(-642.768372, -1520.757935, 64.031250),
Vector(9.348595, 233.104843, 64.031250),
Vector(169.163757, -923.210388, 337.031250),
Vector(-403.873901, -1466.540283, 200.031250),
Vector(229.718094, -2007.913086, 200.031250),
Vector(200.366638, -1706.040283, 336.031250),
Vector(-204.633881, -1688.207642, 336.031250),
Vector(140.356186, 777.847351, 64.031250),
Vector(-611.074402, 108.929848, 201.031250),
Vector( 593.831909, 99.746208, 201.031250),
Vector( -113.403198, -562.164612, 336.031250),
Vector( -525.428162, -2393.323486, 64.031250),
Vector( -205.755844, -1742.970337, 64.031250),

}

combinespawnzones = {
Vector(591.173035, 1392.703369, 240.030884),
Vector(-587.028198, 1394.786133, 240.031250),
Vector(-110.087517, -3461.303223, 232.031250),
Vector(120.340599, -3447.776367, 232.031250),
}


function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end



function MapSetup()
RunConsoleCommand( "r_shadowdist", "500") 
RunConsoleCommand( "r_shadowcolor", ('20 20 20')) 


SpawnItem("item_healthcharger", Vector(126.031250, -1090.029663, 330.202118), Angle(0,0,0))
SpawnItem("item_healthcharger", Vector(126.031250, -756.941406, 328.275513), Angle(0,0,0))
SpawnItem("item_healthcharger", Vector(261.511932, -320.889648, 328.923553), Angle(0.000, 90.000, 0.000))
SpawnItem("item_healthcharger", Vector(-471.269989, -1166.581787, 53.356747), Angle(0.000, -90.000, 0.000))
SpawnItem("item_healthcharger", Vector(342.514343, -1703.161987, 55.275497), Angle(0.000, 90.000, 0.000))
SpawnItem("item_healthcharger", Vector(342.514343, -1703.161987, 55.275497), Angle(0.000, 90.000, 0.000))
SpawnItem("item_healthcharger", Vector(-495.031250, 178.636093, 327.759247), Angle(0.000, -180.000, 0.000))


-- for k,v in pairs(ents.FindByClass("func_door")) do print (v:GetClass()) v:Remove() end
for k,v in pairs(ents.FindByClass("func_door_rotating")) do print (v:GetClass()) v:Remove() end


for k, v in pairs(ents.FindByClass("info_player_deathmatch")) do
print(v:GetClass())
v:Remove()
end

for k, v in pairs(ents.FindByClass("info_player_start")) do
print(v:GetClass())
v:Remove()
end
SpawnItem("info_player_start", Vector(255.010361, -256.592407, 270.041107), Angle(0,0,0) )
SpawnItem("info_player_start", Vector(-649.375671, 106.820007, 270.948212), Angle(0,0,0) )
SpawnItem("info_player_start", Vector(-452.823029, -2179.458008, 270.535217), Angle(0,90,0) )
SpawnItem("info_player_start", Vector(87.508965, -1760.342773, 5.031571), Angle(0,180,0) )

end