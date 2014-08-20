/*-------------------------------------------------------------------------------------
To get positions (Vectors and Angles):
To get the postion where you are right now, run getpos on the console.
example: getpos
output: setpos -2326.440186 -1495.076904 -79.968750;setang 2.316633 179.846100 0.000000


To get the position and angles of a prop/npc/whatever, run this entire command on the console while facing at the entity (use the crosshair):
lua_run print("Entity: ") print(player.GetByID(1):GetEyeTrace().Entity) print("Position: ") print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print("Angles: ") print(player.GetByID(1):GetEyeTrace().Entity:GetAngles())

example: lua_run print("Entity: ") print(player.GetByID(1):GetEyeTrace().Entity) print("Position: ") print(player.GetByID(1):GetEyeTrace().Entity:GetPos()) print("Angles: ") print(player.GetByID(1):GetEyeTrace().Entity:GetAngles())

output: Entity: 
Entity [192][button_turrets]
Position: 
-1038.817505 -1841.643799 -99.877327
Angles: 
-90.000 60.000 0.000


The position must be converted to a vector value.
-1038.817505 -1841.643799 -99.877327 > Vector(-1038.817505,-1841.643799,-99.877327)

The Angle must be converted to an Angle value.
-90.000 60.000 0.000 > Angle(-90.000, 60.000, 0.000)

To get a entity model:  lua_run print("Model: ") print(player.GetByID(1):GetEyeTrace().Entity:GetModel())

---------------------------------------------------------------------------------*/


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
CUSTOMWAVESPAWN = 50



-- Where the combine will spawn.
combinespawnzones = {
Vector(1793.563599, -2346.922607, -69.732025),
Vector(-5134.982422, 6356.156250, -31.968750)
}


-- Positions between the combine will patrol.
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
-- Run revealzones on the console to higlight these places. Run hidezones to hide the sprite.


-- Special items will spawn only there. Not implemented yet.
SPECIALITEMPLACES = {}


-- If you provide this table, the game will search for these models upon loading and will make them weapon spawnpositions. The models found will become invulnerable and unmovable. In this demo, look for the tables in the middle of the map.

MAP_PROPS = {"models/props_c17/furnituredrawer001a.mdl","models/props_junk/wood_crate001a.mdl","models/props_wasteland/kitchen_shelf001a.mdl","models/props_wasteland/kitchen_shelf002a.mdl","models/props_wasteland/kitchen_counter001d.mdl"}

-- Predefined weapon spawnpositions.
ITEMPLACES ={
Vector(-1130.401489, -1117.519531, 304.031250),
}
-- Run revealweaponspawns on the console to higlight these places. Run hidezones to hide the sprite.



-- If defined, this table sets which items a normal crate can spawn upon break. 
CRATEITEMS = { "weapon_357", "weapon_frag", "weapon_slam", "item_ammo_smg1_grenade", "item_healthvial","npc_headcrab_black", "npc_headcrab", }

-- If defined, this table sets which items an ammo crate can spawn upon break. 
GOODCRATEITEMS = { "item_dynamic_resupply","weapon_frag", "weapon_slam","item_healthkit", "item_ammo_smg1_grenade","item_box_buckshot","item_ammo_smg1_large","item_ammo_crossbow","item_ammo_ar2_large","item_ammo_ar2_altfire"}



-- Edit the text inside the "" to edit what the game will tell the players when they join.
function GM:PlayerInitialSpawn(ply)
ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Welcome to gm_construct.")
ply:PrintMessage(HUD_PRINTTALK, "[Overwatch]: Enjoy this demo.")
end


function MapSetup()
-- This removes every player spawnpoint, to make room for our custom spawnpoints.
table.foreach(SPAWNPOINTS_TO_DELETE, function(key,value)
for k, v in pairs(ents.FindByClass(value)) do
print(v:GetClass())
v:Remove()
end
end)

-- This creates the new player spawnpoints. Add as much as you like.
SpawnItem("info_player_start", Vector(-1924.559814, -2265.753174, 448.031250)+Vector(0,0,-45), Angle(8,72,0))
SpawnItem("info_player_start", Vector(-3200.793457, -1886.067017, 112.031250)+Vector(0,0,-45), Angle(9,3,0))

-- This spawns a simple Health Charger. The game will refill them every 10 seconds if no players are around them.
SpawnItem("item_healthcharger", Vector(-1024.458374, -1130.372192, -89.968269), Angle(0,0,0) )

-- This spawns a Suit Charger. They are configured to recharge suit and health with a limit of 500 for both, so use them with caution.
SpawnSuitCharger(Vector(-398.440582, -1921.263306, -91.961334), Angle(0.000, 90.000, 0.000) )

-- This spawns a combine turret.
SpawnTurret(Vector(-507.989563, -1469.181152, -143.244995),Angle(0.348, -87.556, 0.759))


-- This spawns a ceiling turret. Pay attention to the structure above them, as their remains could be seen in the ground above it, as this demo shows.
SpawnCeilingTurretStrong(Vector(-1128.775024, -1820.341187, 207.968750),Angle(0,112,0))

-- This spawns a Combine Control Panel. When used, it disables the Ceiling Turrets mentioned above.
SpawnItem("button_turrets", Vector(-1038.817505, -1841.643799, -99.877327), Angle(0,0,0))


-- Spawns an ammo crate, wich gives the items mentioned in the GOODCRATEITEMS table.
SpawnDynamicAmmoCrate(Vector(-702.493530, -1880.046143, -143.624039), Angle(0.012, 86.199, -0.028))
SpawnDynamicAmmoCrate(Vector(-647.017029, -1866.075195, -143.564606), Angle(0.036, 135.651, 0.035))
SpawnDynamicAmmoCrate(Vector(-746.645447, -1860.714600, -143.618469), Angle(0.002, 59.769, 0.001))

-- Spawns an infinite ammo box. The last digit is used to decide wich type of ammo it gives when used.
-- The possible types are 1(SMG) 2(AR2) 3(RPG) 5(Grenade) 8(AR2 Orbs)
SpawnAmmoCrate(Vector(-214.994064, -1871.720947, -127.531189),Angle(0,90,0),1)




-- You can spawn normal props on the game.
SpawnProp(Vector(-1541.396484, -216.380890, -136.314957),Angle(0.025, 5.657, -0.027),"models/props_c17/furniturebathtub001a.mdl")
SpawnProp(Vector(-1553.859985, -91.109039, -128.820740),Angle(-0.267, 5.740, 0.026),"models/props_wasteland/controlroom_chair001a.mdl")
SpawnProp(Vector(-1563.082642, 1.272108, -147.644424),Angle(-0.034, 5.646, 0.021),"models/props_c17/oildrum001_explosive.mdl")
SpawnProp(Vector(-10.956421, -523.323730, -128.883469),Angle(0, 0, 0),"models/props_junk/wood_crate001a_damaged.mdl") -- This one is a crate and can give you items (1/3 chance) if you break it. Uses the CRATEITEMS table.



-- These props have a model matching with the MAP_PROPS table we set earlier. They will become unmovable and unkillable, and will spawn weapons on top of them.
SpawnProp(Vector(-574.179077, 16.162729, -128.047134),Angle(-0.000, 39.901, -0.191),"models/props_c17/furnituredrawer001a.mdl")
SpawnProp(Vector(-610.956421, 123.323730, -128.883469),Angle(0, 0, 0),"models/props_junk/wood_crate001a.mdl") -- This is also a crate. It won't break.
SpawnProp(Vector(-592.919250, 233.960098, -149.613480),Angle(-0.734, -7.447, -0.401),"models/props_wasteland/kitchen_shelf001a.mdl")
SpawnProp(Vector(-576.113647, 456.798950, -150.273407),Angle(-0.964, -8.550, 0.214),"models/props_wasteland/kitchen_shelf002a.mdl")
SpawnProp(Vector(-598.574951, 344.100098, -130.304733),Angle(0, 0, 0),"models/props_wasteland/kitchen_counter001d.mdl")





-- You can spawn static props, too. It "flies" above the normal bathub, and can't be moved or destroyed.
SpawnStaticProp(Vector(-1541.396484, -216.380890, 0),Angle(0.025, 5.657, -0.027),"models/props_c17/furniturebathtub001a.mdl")

SpawnStaticProp(Vector(-841.396484, -216.380890, 0),Angle(0.025, 5.657, -0.027),"models/props_junk/wood_crate001a_damaged.mdl") -- A flying crate. You can break it.


end

