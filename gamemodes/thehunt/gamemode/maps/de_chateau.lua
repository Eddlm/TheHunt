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
MAP_PROPS = {"models/props_wasteland/laundry_cart001.mdl","models/props_junk/trashdumpster01a.mdl","models/props_wasteland/cafeteria_table001a.mdl"}




-- Where the combine will spawn.
zonescovered ={

Vector(115.512436, 184.686234, -39.968750),

Vector(2234.495850, 1214.838745, 0.031250),

Vector(654.441345, 1383.377319, 214.031250),

Vector(639.176636, 1573.637451, 0.031250),

Vector(1258.565918, 2665.448730, -7.968750),

Vector(140.502747, 980.966736, 0.031250),

}


ITEMPLACES ={

Vector(1439.544312, -863.770325, -146.039536),


}


-- Positions between the combine will patrol.
combinespawnzones = {

Vector(1541.860718, -1056.785522, -88.000038),

Vector(1308.580322, -886.584717, -136.220139),

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



SpawnItem('info_player_start', Vector(532.935486, 47.812969, 208.031250),Angle(5.354, 86.548, 0.000))
SpawnItem('info_player_start', Vector(2991.968750, 935.968750, -159.968750),Angle(7.255, -94.356, 0.000))
SpawnItem('info_player_start', Vector(-353.190735, 9.958529, 208.031250),Angle(2.107, 86.493, 0.000))
SpawnItem('info_player_start', Vector(-423.405334, 1401.659058, 223.028061),Angle(3.446, -47.458, 0.000))
SpawnTurret(Vector(1336.082275, 1012.166260, 208.732193),Angle(0.411, 44.586, 0.474))
SpawnTurret(Vector(2234.597656, 958.174011, 0.758731),Angle(0.336, 90.315, 0.712))
SpawnTurret(Vector(837.835938, 2796.574219, -7.242479),Angle(0.340, -26.486, 0.727))
SpawnTurret(Vector(-321.466461, 765.489624, 208.681595),Angle(0.287, 86.513, 0.033))
SpawnTurret(Vector(129.714813, 406.628784, 0.757687),Angle(0.340, -91.644, 0.725))



SpawnProp(Vector(-408.278076, 1040.047729, 0.328558),Angle(-0.029, -42.737, 0.000),'models/props_c17/oildrum001_explosive.mdl')

SpawnProp(Vector(109.065620, 968.773376, 0.391432),Angle(-0.014, 89.773, 0.000),'models/props_c17/oildrum001_explosive.mdl')

SpawnProp(Vector(164.507507, 968.552246, 0.363856),Angle(-0.018, 89.773, 0.000),'models/props_c17/oildrum001_explosive.mdl')



SpawnProp(Vector(1169.732788, 2814.605225, 17.655401),Angle(-0.034, -90.001, 0.023),'models/props_junk/trashdumpster01a.mdl')

SpawnProp(Vector(1250.768188, 2814.219727, 17.673462),Angle(-0.036, -90.430, 0.036),'models/props_junk/trashdumpster01a.mdl')

SpawnProp(Vector(1359.822021, 2791.571289, 17.549402),Angle(0.153, -63.283, 0.091),'models/props_junk/trashdumpster01a.mdl')
SpawnProp(Vector(931.094604, -121.549255, 223.734085),Angle(0.038, 179.999, 0.000),'models/props_wasteland/cafeteria_table001a.mdl')

SpawnProp(Vector(2767.055908, 91.362663, -140.077408),Angle(-0.026, 1.523, 0.124),'models/props_wasteland/laundry_cart001.mdl')



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
