GM.Name = "The Hunt"
GM.Author = "Eddlm"
GM.Email = "eddmalaga@gmail.com"
GM.Website = "http://facepunch.com/showthread.php?t=1391522"
include( "config.lua" )



function ISaid( ply, text, public )
local GlobalRemaining = GetConVarNumber("h_combine_killed_to_win")-COMBINE_KILLED

    if text == "!remain" or text == "!REMAIN" then
	PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Number "..Wave..", you have "..EnemiesRemainining.." units remaining.")
	timer.Simple(3, function() PrintMessage(HUD_PRINTTALK, "[Overwatch]: Mission failure if "..GlobalRemaining.." ground units are lost.") end)
		        return false

    end

end
hook.Add( "PlayerSay", "ISaid", ISaid )

function GM:Initialize()
	self.BaseClass.Initialize( self )
end


function nearbycombinecome(suspect)
		for k, v in pairs(ents.FindInSphere(suspect:GetPos(),1024)) do
				if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then 
						if !v:GetEnemy() then
						if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
							print(""..v:GetName().." heard that.")
							v:SetLastPosition(suspect:GetPos())
							v:SetSchedule(SCHED_FORCED_GO_RUN)
							end
						end
					end
end
end

function nearbycombinecomeheli(spotter,suspect)
		for k, v in pairs(ents.FindInSphere(spotter:GetPos(),2024)) do
				if (v:GetClass() == "npc_metropolice" || v:GetClass() == "npc_combine_s") then 
						if !v:GetEnemy() then
						if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
							print(""..v:GetName().." is guided by the heli.")
							v:SetLastPosition(suspect:GetPos())
							v:SetSchedule(SCHED_FORCED_GO_RUN)
							end
						end
					end
end
end



function nearbycombinecomecasual(suspect)
	local come = 0
if suspect:GetPos() then
	for k, v in pairs(ents.FindInSphere(suspect:GetPos(),512)) do
		if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then 
			if v:GetPos():Distance(suspect:GetPos()) > 10 then
				if come < 1 then 
					if !v:GetEnemy() then
						if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
							--print(""..v:GetName().." investigates.")
							PrintMessage(HUD_PRINTTALK, ""..v:GetName()..": "..table.Random(CombineHearBreak).."")
							v:SetLastPosition(suspect:GetPos())
							v:SetSchedule(SCHED_FORCED_GO)
							come=come+1
						end
					end
				end
			end
		end
	end

end
end



function allthecombinecome(suspect,MAXCOMBINERUSH)
local coming=0
		for k, v in pairs(ents.FindInSphere(suspect:GetPos(),1024)) do
				if v:GetClass() == "npc_metropolice" || v:GetClass() == "npc_combine_s" then 
						if !v:GetEnemy() then
							if coming < MAXCOMBINERUSH then
							--print(""..v:GetName().." heard that.")
							v:SetLastPosition(suspect:GetPos())
							v:SetSchedule(SCHED_FORCED_GO_RUN)
							coming=coming+1
							end
							end
						end
					end
		for k, v in pairs(ents.GetAll()) do
				if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then 
						if !v:GetEnemy() then
							if coming < MAXCOMBINERUSH then
							--print(""..v:GetName().." heard that.")
							v:SetLastPosition(suspect:GetPos())
							v:SetSchedule(SCHED_FORCED_GO_RUN)
							coming=coming+1
							end
							end
						end
					end
end

function GM:PlayerCanPickupWeapon(ply, wep)
--print(""..ply:GetName().." trying to get " ..wep:GetClass().."")

CANPICKUP = 1
table.foreach(ONLY_PICKUP_ONCE, function(key,value)
if wep:GetClass() == value then
	for k,v in pairs (ply:GetWeapons()) do
		if v:GetClass() == value then
		--print(""..ply:GetName().." already has " ..v:GetClass().."")
		CANPICKUP = 0 
		end
	end
end
end)

if CANPICKUP == 0 then return false end
CANPICKUP = nil
return true end

function ItemRespawnSystem()

local PLAYERS = 0
local NUMBER = 0
for k,weapon in pairs(ents.FindByClass("player")) do 
PLAYERS = PLAYERS + 1
end
local OFFSET = PLAYERS + GetConVarNumber("h_weaponoffset")
--print("")
if PLAYERS > 5 then PLAYERS = 5 end
table.foreach(MEDIUMWEAPONS, function(key,value)
for k,weapon in pairs(ents.FindByClass(value)) do 
NUMBER=NUMBER+1
end
--print("[The Hunt]: There are "..NUMBER.." "..value.."")
while NUMBER < OFFSET do
--print("[The Hunt]: Added 1 of "..value.."")
SpawnItem(value, table.Random(ITEMPLACES), Angle(0,0,math.random(-180,180)) )
NUMBER = NUMBER+1
end
NUMBER=0
end)

/*
if MISCELANEOUS_ITEMS_PLACES then
table.foreach(MISCELANEOUS_ITEMS_PLACES, function(key,value)
local canspawnitem=1
for k,item in pairs(ents.FindInSphere(value,100)) do 
table.foreach(MISCELANEOUS_ITEMS, function(key,itemstable)
--print("[The Hunt]:  found item")
if item:GetClass() == itemstable then
--print("[The Hunt]: item class matched")

canspawnitem=0
end
end)
end
if canspawnitem==1 then
SpawnItem(table.Random(MISCELANEOUS_ITEMS),value, Angle(0,0,0))
end
end)
end
*/


for k,v in pairs(ents.FindByClass("item_healthcharger")) do 
	canrespawn = 1
	local chargerpos = v:GetPos()
	local chargerangles = v:GetAngles()
		for k, player in pairs(ents.FindInSphere(v:GetPos(),100)) do
			if player:IsPlayer() then
			canrespawn = 0
			--print("[The Hunt]: player found, wont respawn charger")
			end
		end
	if canrespawn == 1 then
	--print("[The Hunt]: player not found, will respawn charger")
	v:Remove()
	SpawnItem("item_healthcharger", chargerpos, chargerangles )
	end
end




if RPGCANSPAWN == 1 then
	RPG_IN_MAP = 0
	for k,weapon in pairs(ents.FindByClass("weapon_rpg")) do 
	RPG_IN_MAP = RPG_IN_MAP + 1
	end
	--print("[The Hunt]: RPG's on map: "..RPG_IN_MAP.."")
	RPGSPAWN = GetConVarNumber("h_rpgmax") - RPG_IN_MAP
	while RPGSPAWN > 0 && RPGCANSPAWN == 1 do
	--print("[The Hunt]: RPG's that will spawn: "..RPGSPAWN.."")
	SpawnItem("weapon_rpg", table.Random(ITEMPLACES), Angle(90, 90, 0) )
	RPGSPAWN=RPGSPAWN - 1
	end
end
timer.Create( "Item Respawn System", 10, 1, ItemRespawnSystem )
--print("")
end

SPAWNPOINTS_TO_DELETE = {"info_player_terrorist", "info_player_counterterrorist", "info_player_start", "info_player_deathmatch",
}

AirEnemies = { "npc_helicopter", "npc_combinegunship"}
MainEnemiesGround = { "npc_combine_s", "npc_metropolice"}
MainEnemies = { "npc_combine_s", "npc_metropolice", "npc_helicopter", "npc_combinegunship"}
MainEnemiesCoop = { "npc_combine_s", "npc_metropolice", "npc_helicopter", "npc_combinegunship", "npc_turret_ceiling"}
MainEnemiesDamage = { "npc_combine_s", "npc_metropolice", "npc_manhack"}

CombineHearBreak = {"I think I heard something.","What was that?","Something broke nearby.","Heard something broke.","...the fuck...","I think I hear dubstep somewhere.","Suspicious sounds near my position.","...going to check that.","Nearby units, the suspect must be in this area.","Here you are."}

ChatEnemySpotted = {"All units, hostile spotted.","All units, hostiles near my position.","Suspect found, all units provide support.","All units: hostiles found, I repeat, hostiles found."}

OVERWATCH_TAUNTS = { "I'd get ready if I were you.", "Hope you like bloodbaths.", "Let's get this farce over with.", "I've calculated who will win to a 99.93% certainty, if you're interested. ", "So at least your teammates know what they're doing. ", "Your teammates are doing a really great job. ", "This is probably the most heroic thing anyone's ever done while sitting motionless in their parents' rec room. ", "You were almost helpful this time. ", " It's a good feeling, isn't it? I wouldn't get used to it. ", "That's funny, I didn't even see you cheat. ", "That should delay the inevitable slightly. ", "Great teamwork, you vicious thugs. ", "Your entire life has been a mathematical error. A mathematical error I'm about to correct.", "Someone is going to get badly hurt.", "I hate you so much.", "Did anything happen while I was out?", "Just stop it already.", "Are you testing me?" , "You really aren't getting tired of that, are you?" , "I'm done." , "Do you need real encouragement? Let's see if this helps." , "Now, you are just wasting my time." , "If you are wondering what that smell is, that is the smell of human fear." }


OverwatchAmbientSoundsOne = {
"npc/overwatch/cityvoice/f_anticivil1_5_spkr.wav",
"npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav",
"npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav",
"npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav",
"npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav",
"npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav",
"npc/overwatch/cityvoice/f_protectionresponse_4_spkr.wav",
"npc/overwatch/cityvoice/fprison_airwatchdispatched.wav",
"npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav",
"npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav",
"npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav",
"npc/overwatch/cityvoice/fprison_restrictorsdisengaged.wav","npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav",

}

ContactConfirmed = {
"npc/metropolice/vo/confirmpriority1sighted.wav",
"npc/metropolice/vo/allunitscode2.wav",
"npc/combine_soldier/vo/contact.wav",
"npc/combine_soldier/vo/contactconfim.wav",
"npc/combine_soldier/vo/contactconfirmprosecuting.wav",
"npc/combine_soldier/vo/goactiveintercept.wav",
"npc/combine_soldier/vo/overwatchreportspossiblehostiles.wav",
}

CombineKillSounds = {
"npc/combine_soldier/vo/onecontained.wav",
"npc/combine_soldier/vo/onedown.wav",
"npc/combine_soldier/vo/thatsitwrapitup.wav",
"npc/metropolice/vo/clearandcode100.wav",
"npc/metropolice/vo/finalverdictadministered.wav",
"npc/combine_soldier/vo/readyweapons.wav",
}

CombineCombatSounds = {
"npc/combine_soldier/vo/overwatchrequestreinforcement.wav",
"npc/combine_soldier/vo/flush.wav",
"npc/combine_soldier/vo/containmentproceeding.wav",
"npc/combine_soldier/vo/coverhurt.wav",
"npc/combine_soldier/vo/displace2.wav",
"npc/combine_soldier/vo/gosharpgosharp.wav",
"npc/combine_soldier/vo/heavyresistance.wav",
"npc/combine_soldier/vo/requestmedical.wav",
"npc/combine_soldier/vo/executingfullresponse.wav",
"npc/combine_soldier/vo/unitisclosing.wav",
"npc/metropolice/vo/holdthisposition.wav",
}

CombineIdleSounds = {
"npc/combine_soldier/vo/teamdeployedandscanning.wav",
"npc/overwatch/radiovoice/accomplicesoperating.wav",
"npc/overwatch/radiovoice/controlsection.wav",
"npc/overwatch/radiovoice/completesentencingatwill.wav",
"npc/overwatch/radiovoice/disengaged647e.wav",
"npc/overwatch/radiovoice/engagingteamisnoncohesive.wav",
"npc/overwatch/radiovoice/investigateandreport.wav",
"npc/overwatch/radiovoice/leadersreportratios.wav",
"npc/combine_soldier/vo/motioncheckallradials.wav",
"npc/combine_soldier/vo/standingby].wav",
"npc/combine_soldier/vo/isfieldpromoted.wav",
"npc/combine_soldier/vo/isfinalteamunitbackup.wav",
"npc/combine_soldier/vo/lostcontact.wav",
"npc/combine_soldier/vo/prepforcontact.wav",
"npc/combine_soldier/vo/copythat.wav",
"npc/combine_soldier/vo/copy.wav",
"npc/combine_soldier/vo/overwatchconfirmhvtcontained.wav",
"npc/combine_soldier/vo/overwatchtargetcontained.wav",
"npc/metropolice/vo/lockyourposition.wav",
"npc/metropolice/vo/rodgerthat.wav",
"npc/overwatch/radiovoice/airwatchcopiesnoactivity.wav",
"npc/overwatch/radiovoice/lostbiosignalforunit.wav",
"npc/overwatch/radiovoice/preparevisualdownload.wav",
"npc/overwatch/radiovoice/recalibratesocioscan.wav",
"npc/overwatch/radiovoice/rewardnotice.wav",
}

CombineKilledSounds = {
"npc/metropolice/vo/officerneedshelp.wav",
"npc/metropolice/vo/officerunderfiretakingcover.wav",
"npc/metropolice/vo/officerneedsassistance.wav",
"npc/metropolice/vo/officerdowncode3tomy10-20.wav",
"npc/metropolice/vo/officerdowniam10-99.wav",
"npc/metropolice/vo/reinforcementteamscode3.wav",
}

malecomments={
"vo/npc/male01/yeah02.wav",
"vo/npc/male01/gotone02.wav",
"vo/npc/male01/likethat.wav",
"vo/npc/male01/gotone01.wav",
}
femalecomments={
"vo/npc/female01/gotone01.wav",
"vo/npc/female01/gotone02.wav",
"vo/npc/female01/likethat.wav",
"vo/npc/female01/yeah02.wav",
}

playermodelsmale = {
"models/player/group03/male_01.mdl",
"models/player/group03/male_02.mdl",
"models/player/group03/male_03.mdl",
"models/player/group03/male_04.mdl",
"models/player/group03/male_05.mdl",
"models/player/group03/male_06.mdl",
"models/player/group03/male_07.mdl",
"models/player/group03/male_08.mdl",
"models/player/group03/male_09.mdl",
}

playermodelsfemale = {
"models/player/group03/female_01.mdl",
"models/player/group03/female_02.mdl",
"models/player/group03/female_03.mdl",
"models/player/group03/female_04.mdl",
"models/player/group03/female_05.mdl",
"models/player/group03/female_06.mdl",
}