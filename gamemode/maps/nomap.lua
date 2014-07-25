-- PRE-PLAY THINGS v
playermodels = {
"models/player/group01/female_01.mdl",
"models/player/group01/female_02.mdl",
"models/player/group01/female_03.mdl",
"models/player/group01/female_04.mdl",
"models/player/group01/female_05.mdl",
"models/player/group01/female_06.mdl",
"models/player/group01/male_01.mdl",
"models/player/group01/male_02.mdl",
"models/player/group01/male_03.mdl",
"models/player/group01/male_04.mdl",
"models/player/group01/male_05.mdl",
"models/player/group01/male_06.mdl",
"models/player/group01/male_07.mdl",
"models/player/group01/male_08.mdl",
"models/player/group01/male_09.mdl",
"models/player/odessa.mdl"}


-- PRE-PLAY THINGS ^

-- MAP INITIAL SETUP v


function FirstSpawn()
end

function GM:InitPostEntity()

timer.Create( "makenpcwander", math.random(6,15), 0, wander )
timer.Create( "CombineIdleSpeech", math.random(2,5), 0, CombineIdleSpeech ) 
timer.Create( "CicloUnSegundo", 1, 0, CicloUnSegundo ) 
timer.Create( "OverwatchAmbientOne", math.random(30,200), 0, OverwatchAmbientOne ) 

end
-- MAP INITIAL SETUP ^
