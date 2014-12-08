-- Loads the default waves system. If you don't include this, you should include your own wave functions on this map configuration file.
include( "basewaves.lua" )


-- Number of combine that will spawn on each wave.
CombineFirstWave = 7
CombineSecondWave = 15
CombineThirdWave = 15
CombineFourthWave = 15
CombineFifthWave = 20
CombineInfiniteWave = 20


-- Number of seconds the combine will be running around (going to the coverzones and so spreading around the map) a the start of each wave. If not set, will be always 30. Larger maps work better with higher values.
CUSTOMWAVESPAWN = 30


-- If you provide this table, the game will search for these models upon loading and will make them weapon spawnpositions. The models found will become invulnerable and unmovable. In this demo, look for the tables in the middle of the map.
MAP_PROPS = {"models/props_wasteland/cafeteria_bench001a.mdl","models/props_wasteland/kitchen_shelf002a.mdl","models/props_wasteland/controlroom_desk001b.mdl","models/props_c17/bench01a.mdl","models/props_junk/trashdumpster01a.mdl"}




-- Where the combine will spawn.
zonescovered ={

Vector(2039.058838, 1422.693726, 128.031250),

Vector(-2605.775635, -298.130493, 152.031250),

Vector(-545.174683, 564.466797, 193.031250),

Vector(-218.404053, -713.975586, 96.031250),

Vector(143.576263, 1388.521240, 63.177567),

Vector(-1700.481934, 2417.018066, 224.031250),

Vector(-1338.425659, 959.869751, 288.031250),

Vector(70.690933, 329.411011, 512.031250),

}


ITEMPLACES ={

Vector(33.450947, 368.418365, 304.031250),

Vector(-455.399841, -742.010010, 144.031250),

Vector(-1263.123535, -12.129912, 152.031250),

}


-- Positions between the combine will patrol.
combinespawnzones = {

Vector(2039.058838, 1422.693726, 128.031250),

Vector(-2605.775635, -298.130493, 152.031250),

}


 
function GM:PlayerInitialSpawn(ply)

-- Edit the text inside the "" to edit what the game will tell the players when they join.
timer.Simple(2, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Protection team alert, evidence of anticivil activity in this community.") end )
timer.Simple(4, function() ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Code: assemble, plan, contain.") end )
timer.Simple(10, function()ply:PrintMessage(HUD_PRINTTALK, "Type !help to see the game mechanics. ") end )

end


function MapSetup()
-- Open doors for the NPC
for k, v in pairs(ents.FindByClass("func_door_rotating")) do
print(v:GetClass())
v:SetKeyValue( "spawnflags", "32" )
v:Fire("Open","",0)
end

-- This removes every player spawnpoint, to make room for our custom spawnpoints.
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

SpawnProp(Vector(795.289307, 112.086082, 368.501831),Angle(-0.007, 89.973, -0.063),'models/props_wasteland/kitchen_shelf002a.mdl')



SpawnTurret(Vector(1070.020020, 284.688080, 368.767700),Angle(0.308, -18.617, 0.598))
SpawnTurret(Vector(465.211731, 686.005859, 192.754379),Angle(0.323, 40.885, 0.452))
SpawnTurret(Vector(-590.909973, 1583.052246, 352.747620),Angle(0.257, 44.902, 0.420))

SpawnProp(Vector(-970.119202, 2391.764160, 169.606689),Angle(0.139, -179.975, 0.125),'models/props_junk/trashdumpster01a.mdl')

SpawnProp(Vector(-2163.504150, 377.703766, 185.583160),Angle(0.050, -179.967, 0.119),'models/props_junk/trashdumpster01a.mdl')

SpawnProp(Vector(-2156.313965, 280.291626, 185.580994),Angle(-0.048, -179.989, -0.003),'models/props_junk/trashdumpster01a.mdl')

SpawnProp(Vector(1294.897217, 309.506683, 180.860886),Angle(5.030, -89.854, -0.042),'models/props_c17/bench01a.mdl')

SpawnProp(Vector(1775.192749, 1363.225464, 275.866119),Angle(-0.086, -90.042, 0.017),'models/props_c17/bench01a.mdl')

SpawnProp(Vector(1141.844482, 679.987366, 176.885742),Angle(-0.260, 0.064, -0.054),'models/props_wasteland/controlroom_desk001b.mdl')

SpawnProp(Vector(1192.328857, 683.067932, 179.741730),Angle(0.080, -158.791, -0.000),'models/props_interiors/furniture_chair03a.mdl')

SpawnProp(Vector(1489.452759, 118.321098, 368.350006),Angle(0.013, -1.293, -0.019),'models/props_wasteland/kitchen_shelf002a.mdl')

SpawnProp(Vector(1487.966919, 171.276993, 368.520813),Angle(0.206, -0.037, -0.166),'models/props_wasteland/kitchen_shelf002a.mdl')

SpawnProp(Vector(349.670258, 248.376068, 522.118591),Angle(0.342, 135.000, 0.000),'models/props_wasteland/cafeteria_bench001a.mdl')

SpawnProp(Vector(-182.879074, 208.841507, 522.441162),Angle(-1.962, 44.966, 0.029),'models/props_wasteland/cafeteria_bench001a.mdl')
SpawnItem('info_player_start', Vector(1530.842896, 34.742859, 368.031250),Angle(4.376, 86.577, 0.000))


SpawnItem('info_player_start', Vector(479.968750, 575.968750, 256.031250),Angle(8.700, -134.376, 0.000))

SpawnItem('info_player_start', Vector(-1163.760010, 1277.537231, 112.031250),Angle(2.420, 87.400, 0.000))

SpawnProp(Vector(-1181.660889, 1411.558960, 171.858704),Angle(-0.004, -179.913, 1.742),'models/props_junk/trashdumpster02.mdl')

--Here you can look what each spawn function does. Don't worry, the /*  */ prevent it from actually spawning in the game.
/*
-- This creates the new player spawnpoints. Add as much as you like.
SpawnItem("info_player_start", Vector(0,0,0),Angle(0.000, 0.000, 0.000))

-- This spawns a simple Health Charger. The game will refill them every 10 seconds if no players are around them.
SpawnItem("item_healthcharger", Vector(0,0,0), Angle(0,0,0) )

-- This spawns a Suit Charger. They are configured to recharge suit and health with a limit of 500 for both, so use them with caution.
SpawnSuitCharger(Vector(0,0,0), Angle(0,0,0,))

-- This spawns a combine turret.
SpawnTurret(Vector(0,0,0),Angle(0,0,0))


-- This spawns a ceiling turret. Pay attention to the structure above them, as their remains could be seen in the ground above it, as this demo shows.
SpawnCeilingTurretStrong(Vector(0,0,0),Angle(0,0,0))

-- This spawns a Combine Control Panel. When used, it disables the Ceiling Turrets mentioned above.
SpawnItem("button_turrets", Vector(0,0,0), Angle(0,0,0))


-- Spawns an ammo crate, wich gives the items mentioned in the GOODCRATEITEMS table.
SpawnDynamicAmmoCrate(Vector(0,0,0), Angle(0,0,0))


-- Spawns an infinite ammo box. The last digit is used to decide wich type of ammo it gives when used.
-- The possible types are 1(SMG) 2(AR2) 3(RPG) 5(Grenade) 8(AR2 Orbs)
SpawnAmmoCrate(Vector(0,0,0),Angle(0,0,0),1)


-- These props have a model matching with the MAP_PROPS table we set earlier. They will become unmovable and unkillable, and will spawn weapons on top of them.
SpawnProp(Vector(0,0,0),Angle(0,0,0),"models/props_c17/furnituredrawer001a.mdl")

-- You can spawn static props, too. It "flies" above the normal bathub, and can't be moved or destroyed.
SpawnStaticProp(Vector(0,0,0),Angle(0,0,0),"models/props_c17/furniturebathtub001a.mdl")
*/

end
