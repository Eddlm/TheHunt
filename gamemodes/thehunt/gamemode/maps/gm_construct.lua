include( "basewaves.lua" ) -- Load the default waves system. If you don't include this, you should include your own wave functions on this map configuration file.

-- Number of combine that will spawn on each wave.
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20




-- Where the combine will spawn.
-- To get the position, run getpos on the console to get the postion where you are right now, and put the first three values into "Vector(value,value,value)," then put the full thing on this list. The fourth comma included.
--example: setpos -2326.440186 -1495.076904 -79.968750;setang 2.316633 179.846100 0.000000 > Vector(-2326.440186, -1495.076904, -79.968750),
combinespawnzones = {
Vector(1793.563599, -2346.922607, -69.732025),
Vector(-5134.982422, 6356.156250, -31.968750)
}

-- Positions where the combine will patrol.
zonescovered ={
Vector(1443.025757, -1619.412598, -79.968750),
Vector(-2326.440186, -1495.076904, -79.968750),
Vector(-3114.188477, -1449.609131, 112.031250),
Vector(1632.136719, -277.455750, 128.031250),

Vector(1333.282471, 5911.624512, 32.031250),
Vector(-4396.029785, 3846.360352, -36.667709),
Vector(-4458.035156, 5415.626465, -31.968750),
Vector(-4232.584961, -2587.774170, 314.031250),
Vector(-4241.004883, -2099.174072, -79.968750),
Vector(-2006.796875, -1276.833130, -335.968750),

}

 





--Not implemented yet. 
SPECIALITEMPLACES = {}


 --If you provide this table, the game will search for these models upon loading and will make them weapon spawnpositions. They wil become invulnerable and unmovable.
MAP_PROPS = {"models/props_c17/furniturecouch001a.mdl",}

-- Predefined weapon spawnpositions.
ITEMPLACES ={
Vector(0,0,0),

}


PLAYER_SPAWNPOINTS = {
Vector(-410.501892, -89.787407, -87.968750),
Vector(177.478897, 95.992462, -87.968750),
Vector(-159.968750, 1913.448975, -95.968750),
}


-- Edit the text inside the "" to edit what the game will tell the players when they join.
function GM:PlayerInitialSpawn(ply)
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )

end


function MapSetup()
--SpawnItem("item_healthcharger", Vector(-456.275421, 479.784363, -414.434113), Angle(-90.000, 90.000, 45.000) )



--SpawnItem("info_player_start", Vector(-410.501892, -89.787407, -87.968750)+Vector(0,0,-45), Angle(0,0,0))
--SpawnItem("info_player_start", Vector(177.478897, 95.992462, -87.968750)+Vector(0,0,-45), Angle(0,0,0))
--SpawnItem("info_player_start", Vector(-159.968750, 1913.448975, -95.968750)+Vector(0,0,-45), Angle(0,0,0))

--SpawnTurret(Vector(-491.003052, -1442.955566, -239.262634),Angle(0.397, 167.418, 0.522))


-- This removes every player spawnpoint, to make room for our custom spawnpoints.
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

-- This creates the new player spawnpoints.
SpawnItem("info_player_start", Vector(-1924.559814, -2265.753174, 448.031250)+Vector(0,0,-45), Angle(8,72,0))



--if math.random(1,2) == 1 then
--SpawnTurret(Vector(-86.159615, -1113.844360, -223.263809),Angle(0.257, 92.666, 0.642))
--end
end

