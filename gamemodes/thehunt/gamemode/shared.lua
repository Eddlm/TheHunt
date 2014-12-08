GM.Name = "The Hunt"
GM.Author = "Eddlm"
GM.Email = "eddmalaga@gmail.com"
GM.Website = "http://facepunch.com/showthread.php?t=1391522"

net.Receive( "Scoreboard", function( length, client )
local DermaPanel = vgui.Create( "DFrame" )
DermaPanel:SetPos( ScrW() * 0.1, ScrH() * 0.1 )
DermaPanel:SetSize( ScrW() * 0.7, ScrH() * 0.5 )
DermaPanel:SetTitle( "Scoreboard" )
DermaPanel:SetVisible( true )
DermaPanel:SetDraggable( true )
DermaPanel:ShowCloseButton( true )
DermaPanel:SetMouseInputEnabled(false)
DermaPanel:SetKeyboardInputEnabled(false)
DermaPanel:MakePopup()

local DermaListView = vgui.Create("DListView")
DermaListView:SetParent(DermaPanel)
DermaListView:SetPos(25, 50)
DermaListView:SetSize(ScrW() * 0.65, ScrH() * 0.4)
DermaListView:SetMultiSelect(false)
DermaListView:AddColumn("Player")
DermaListView:AddColumn("Total Kills")
DermaListView:AddColumn("Silent Kills")
DermaListView:AddColumn("% of Team Kills")
DermaListView:AddColumn("Deaths")
DermaListView:AddColumn("% of Team Deaths")
DermaListView:AddColumn("Score")

for k,v in pairs(player.GetAll()) do

DermaListView:AddLine(v:Nick(),v:Frags(),v:GetNWString("SilentKills"),""..v:GetNWString("Killpercent").."%",v:Deaths(),""..v:GetNWString("Deathpercent").."%",v:GetNWInt("Score"))
end
DermaListView:AddLine("Team",team_kills+team_silent_kills,team_silent_kills,"-",team_deaths,"-",teamscore)


end )


function CalculatePlayerScore(ply)
teamscore = (team_kills+(team_silent_kills*3))-(team_deaths*(PLAYERSINMAP+1))

	local killpercent = ((ply.Kills+ply.SilentKills)/(team_kills+team_silent_kills))*100
	local deathpercent = (ply.deaths/team_deaths)*100
	local player_points = ((ply.Kills+(ply.SilentKills*3)-ply.deaths*2))

	if ply.deaths==0 then ply:SetNWInt("Survivor", 1) else ply:SetNWInt("Survivor", 0) end
	ply:SetNWString("Killpercent", ""..math.Round(killpercent).."")
	ply:SetNWString("SilentKills", ""..ply.SilentKills.."")
	ply:SetNWString("Deathpercent", ""..math.Round(deathpercent).."")
	ply:SetNWInt("Kills", ply.Kills+ply.SilentKills)
	ply:SetNWInt("Deaths", ""..ply.deaths.."")
	ply:SetNWInt("Score", ""..player_points.."")

	ply:SendLua("team_kills="..team_kills.."" )
	ply:SendLua("team_silent_kills="..team_silent_kills.."" )
	ply:SendLua("team_deaths="..team_deaths.."" )
	ply:SendLua("teamscore="..teamscore.."" )
	
	local score=tonumber(ply:GetNWInt("Score"),10)
	local referencescore=tonumber(ply:GetNWInt("ReferentScore"),10)

	if score < referencescore then
	ply:SendLua("score_color=Color(255,179,0)" )
	end
	
	if score < referencescore - 4 then
	ply:SendLua("score_color=Color(255,8,8)" )
	end
	
	if score == referencescore then
	ply:SendLua("score_color=Color(200,200,200)" )
	end
	
	if score > referencescore then
	ply:SendLua("score_color=Color(156,255,120)" )
	end
	
	if score > referencescore + 4 then
	ply:SendLua("score_color=Color(0,255,0)" )
	end

end

function ISaid( ply, text, public )
local GlobalRemaining = GetConVarNumber("h_combine_killed_to_win")-COMBINE_KILLED

	
    if text == "!listmaps" or text == "!LISTMAPS" then
	MapVoteThing(ply)
	return false end

	
	
    if text == "!taunt" or text == "taunt" then
	if ply.sex=="female" then ply:EmitSound(table.Random(femaletaunts), 100, 100) else ply:EmitSound(table.Random(maletaunts), 100, 100) end
nearbycombinecomesilent(ply)
return false end
    if text == "!remain" or text == "!REMAIN" then
	PrintMessage(HUD_PRINTTALK, "[Overwatch]: Squad Number "..Wave..", you have "..EnemiesRemainining.." units remaining.")
	timer.Simple(3, function() PrintMessage(HUD_PRINTTALK, "[Overwatch]: Mission failure if "..GlobalRemaining.." ground units are lost.") end)
		        return false

    end

	if text == "!remove" or text == "!REMOVE" then
	ply:PrintMessage(HUD_PRINTTALK, ""..ply:GetActiveWeapon():GetClass().." removed from your inventary.")
	ply:StripWeapon(ply:GetActiveWeapon():GetClass())
	return false end
	
if text == "!drop" or text == "!DROP" then
ManualWeaponDrop(ply)
if GetConVarString("h_weight_system") == "1" or GetConVarString("h_hardcore_mode") == "1" then timer.Simple(1, function() AdjustWeight(ply) end) end
		        return false
end



	if text == "!myscore" or text == "!MYSCORE" then
	PlayerStats(ply)
	return false
    end

	if text == "!teamscore" or text == "!TEAMSCORE" then
	teamscore = (team_kills+(team_silent_kills*3))-(team_deaths*(PLAYERSINMAP+1))

	for k,player in pairs(player.GetAll()) do
	local killpercent = ((player.Kills+player.SilentKills)/(team_kills+team_silent_kills))*100
	local deathpercent = (player.deaths/team_deaths)*100
	local player_points = ((player.Kills+(player.SilentKills*3)-player.deaths*2))

	player:SetNWString("Killpercent", ""..math.Round(killpercent).."")
	player:SetNWString("SilentKills", ""..player.SilentKills.."")
	player:SetNWString("Deathpercent", ""..math.Round(deathpercent).."")
	player:SetNWInt("Score", ""..player_points.."")
	ply:SendLua("team_kills="..team_kills.."" )
	ply:SendLua("team_silent_kills="..team_silent_kills.."" )
	ply:SendLua("team_deaths="..team_deaths.."" )
	ply:SendLua("teamscore="..teamscore.."" )
	end
	timer.Simple(1, function() 
	net.Start( "Scoreboard" )
	net.Send(ply)
	end)
		return false
    end
	if text == "!restart" or text == "!RESTART" then
	if PLAYERSINMAP>0 then
	PrintMessage(HUD_PRINTTALK, ""..ply:GetName().." voted for a map restart by typing !restart. ")
	VOTES_FOR_RESTART=VOTES_FOR_RESTART+1
		if VOTES_FOR_RESTART > 0 then
		PrintMessage(HUD_PRINTTALK, "Game restart applied.")
		RestartGame()
		VOTES_FOR_RESTART=0
		end
	else
	RestartGame()
	end
		return false
    end
	
		if text == "!patrolzones" or text == "!PATROLZONES" then
		if ply:IsAdmin() then revealzonestemp() end
		return false
		end
	end
	
hook.Add( "PlayerSay", "ISaid", ISaid )
function revealzonestemp()
table.foreach(zonescovered, function(key,value)
local sprite = ents.Create( "env_sprite" )
sprite:SetPos(value)
sprite:SetColor( Color( 255, 0, 0 ) )
sprite:SetKeyValue( "model", "sprites/light_glow01.vmt" )
sprite:SetKeyValue( "scale", 0.50 )
sprite:SetKeyValue( "rendermode", 5 )
sprite:SetKeyValue( "renderfx", 7 )
sprite:Spawn()
sprite:Activate()
sprite:SetName("ZoneReveal")
end)
timer.Simple(4, hidezones)
end
function GM:Initialize()
	self.BaseClass.Initialize( self )
end

function ManualWeaponDrop(ply)

local wep = ply:GetActiveWeapon():GetClass()
local candrop = 1
if ply:GetActiveWeapon():GetClass() == "weapon_physcannon" then
candrop = 0 end

if ply:GetActiveWeapon():Clip1() < 0 or ply:GetActiveWeapon():GetClass() == "weapon_slam" then
candrop = 0
end

if candrop == 1 then
			if ply:GetActiveWeapon():Clip1() == 0 then
				ply:GetActiveWeapon():Remove()
				ply:PrintMessage(HUD_PRINTTALK, "Removed "..ply:GetActiveWeapon():GetClass()..".")
				else
				ply:PrintMessage(HUD_PRINTTALK, "Dropped "..ply:GetActiveWeapon():GetClass()..".")
				ply:DropWeapon(ply:GetActiveWeapon())
			end

else
ply:PrintMessage(HUD_PRINTTALK, "You can't drop "..ply:GetActiveWeapon():GetClass()..". Sorry.")
end


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
	for k, v in pairs(ents.FindInSphere(suspect:GetPos(),1024)) do
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

function nearbycombinecomesilent(suspect)

if suspect:GetPos() then
	for k, v in pairs(ents.FindInSphere(suspect:GetPos(),812)) do
		if v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_combine_s" then 
			if v:GetPos():Distance(suspect:GetPos()) > 10 then
				if !v:GetEnemy() then
					if !v:IsCurrentSchedule(SCHED_FORCED_GO_RUN) then
						v:SetLastPosition(suspect:GetPos())
						v:SetSchedule(SCHED_FORCED_GO)
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
local CANPICKUP = 1
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

if GetConVarString("h_weight_system") == "1" then timer.Simple(1, function() AdjustWeight(ply) end) end


if GetConVarNumber("h_selective_weapon_pickup") == 1 then
if wep:GetClass() != "weapon_crowbar" then 
if !ply:KeyDown(IN_USE) then CANPICKUP = 0
end
end
end

if CANPICKUP == 0 then return false end
CANPICKUP = nil
return true end

function AdjustWeight(ply)
local weight = 1
table.foreach(ply:GetWeapons(), function(key,value)

if value:GetClass() != "weapon_frag" and value:GetClass() != "weapon_crowbar"  and value:GetClass() != "weapon_slam" and value:GetClass() != "weapon_pistol" and value:GetClass() != "weapon_smg" then
weight=weight*0.95
end
end)
ply:SetWalkSpeed(150*weight)
ply:SetRunSpeed(250*weight)
if ply:GetWalkSpeed() < 150 then
--ply:PrintMessage(HUD_PRINTTALK, "Te pesa el culo")
end
end 


function ItemRespawnSystem()
if 1 == 1 then
local CAN = 1
local PLAYERS = 0
local NUMBER = 0
for k,weapon in pairs(ents.FindByClass("player")) do 
PLAYERS = PLAYERS + 1
end
--print("")
if PLAYERS > 3 then PLAYERS = PLAYERS/2 end
table.foreach(MEDIUMWEAPONS, function(key,value)
for k,weapon in pairs(ents.FindByClass(value)) do 
 NUMBER=NUMBER+1
end
--print("[The Hunt]: There are "..NUMBER.." "..value.."")
while NUMBER < PLAYERS do
--print("[The Hunt]: Added 1 of "..value.."")
SpawnItem(value, table.Random(ITEMPLACES), Angle(0,0,math.random(-180,180)) )
NUMBER = NUMBER+1
end
NUMBER=0
end)

for k,v in pairs(ents.FindByClass("item_healthcharger")) do 
	local canrespawn = 1
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



for k,v in pairs(ents.FindByClass("item_suitcharger")) do 
	local canrespawn = 1
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
	SpawnSuitCharger(chargerpos, chargerangles )
	end
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


RebelsGiveAmmo = { "Pistol", "SMG1", "SMG1_Grenade", "AR2", "Buckshot", "Grenade", "XBowBolt"}



TOO_BRIGHT_WEAPONS = { "weapon_crossbow", "weapon_physcannon", "weapon_rpg", "weapon_medkit"}
-- Weapons that make you more visible. It's harder to hide while carrying this weapon.

DARK_WEAPONS = { "weapon_frag", "weapon_crowbar","weapon_357","weapon_slam","fas2_dv2","fas2_ammobox","fas2_ifak","fas2_machete","stalker_knife","m9k_machete" }
-- Weapons that don't have any bright items on them.

SILENCED_WEAPONS = {"weapon_crossbow", "pspak_mp9", "stalker_vintorez","stalker_val", "weapon_nomad","weapon_doom3_plasmagun","m9k_svu","stalker_enfield","kf_mac10_fas","pspak_m14","bakker's blaster","murphy's law","the hammerhead","the pea shooter","the quadruple agent","the reanimated rocket rifle","the secret carbine","the sleeping pill",}
-- Using them will attract nearby combine.

SILENT_WEAPONS = { "weapon_frag", "weapon_crowbar","weapon_slam",
-- DOOM SWEPS support
"weapon_doom3_fists","weapon_doom3_fists",
-- M90 Suppport
"m9k_damascus","m9k_fists","m9k_m61_frag","m9k_harpoon","m9k_ied_detonator","m9k_knife","m9k_machete","m9k_nerve_gas","m9k_nitro","m9k_orbital_strike","m9k_proxy_mine","m9k_sticky_grenade","m9k_suicide_bomb",
-- Serious Sam Support
"weapon_ss_knife",
-- FA:S support
"fas2_ifak","fas2_machete","kf_knife_fas","fas2_dv2",
-- Mad Cow's Weapons Support
"weapon_mad_tmp","weapon_mad_c4","weapon_mad_charge","weapon_mad_flash","weapon_mad_grenade","weapon_mad_crossbow","weapon_mad_incendiary","weapon_mad_knife","weapon_mad_smoke","weapon_mad_magnade",
-- STALKER
"stalker_knife",
"the penguinade",}
-- Using them wont atract anyone.

SECONDARY_FIRE_WEAPONS = { "weapon_ar2", "weapon_shotgun","the kilroy warhammer"}
-- Weapons that have a loud secondary fire.


ONLY_PICKUP_ONCE = { "weapon_physcannon","seal6-claymore","weapon_doom3_chainsaw","death_note","weapon_stunstick","m9k_machete","goldenpan","weapon_stickyrifle"}
-- The game will prevent people from picking up this weapons if they already have them. Useful for weapons with infinite uses, preventing the player from picking up a weapon he doesn't need to, leaving the weapon for others.


VanillaWeapons = { "weapon_shotgun", "weapon_ar2","weapon_pistol", "weapon_crossbow", "weapon_physcannon","weapon_smg1","weapon_357"}
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

femaletaunts={
"vo/npc/female01/gethellout.wav",
"vo/npc/female01/watchout.wav",
"vo/npc/female01/combine01.wav",
"vo/npc/female01/combine02.wav",
"vo/npc/female01/headsup01.wav",
"vo/npc/female01/headsup02.wav",
"vo/npc/female01/overhere01.wav",
}

maletaunts={
"vo/npc/male01/gethellout.wav",
"vo/npc/male01/hacks01.wav",
"vo/npc/male01/incoming02.wav",
"vo/npc/male01/letsgo02.wav",
"vo/npc/male01/squad_approach04.wav",
"vo/npc/male01/upthere01.wav",
"vo/npc/male01/thehacks01.wav",
"vo/npc/male01/watchout.wav",
}


malewin={
"vo/npc/male01/yeah02.wav",
"vo/npc/male01/likethat.wav",
"vo/npc/male01/fantastic01.wav",
"vo/npc/male01/ohno.wav",
"vo/npc/male01/oneforme.wav",
"vo/npc/male01/whoops01.wav",
}
femalewin={
"vo/npc/female01/likethat.wav",
"vo/npc/female01/yeah02.wav",
"vo/npc/female01/fantastic01.wav",
"vo/npc/female01/ohno.wav",
"vo/npc/female01/oneforme.wav",
"vo/npc/female01/whoops01.wav",
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



-- Weapons mix
STALKER_SWEPS ={
"stalker_deagle","stalker_ak74_u","stalker_usp","stalker_p220","stalker_baretta_dual","stalker_dragunov","stalker_ak74","stalker_p99","stalker_gauss","stalker_eliminator","stalker_pkm","stalker_ots","stalker_lr300","stalker_rpg","stalker_f2000","stalker_winchester","stalker_sg550","stalker_abaton","stalker_vintorez","stalker_baretta_single","stalker_makarov","stalker_val","stalker_spas","stalker_svu","stalker_knife","stalker_enfield","stalker_fort_12","stalker_colt","stalker_mp5","stalker_bulldog","stalker_g36","stalker_pb","stalker_browning"}

MR_PYROUS_SWEPS ={"pspak_benli_m4","pspak_ops_mac10","pspak_mr_96","pspak_cz_75","pspak_pp_bizon","pspak_hk_416","pspak_p228","pspak_benli_m3","pspak_fn_fal","pspak_hk_g36c","pspak_waltr_2000","pspak_moss_590","pspak_tact_mp5k","pspak_sg_552","pspak_m4a1","pspak_irq_ak47","pspak_ris_ar15","pspak_m60"}

MAD_COWS_SWEPS ={"weapon_mad_alyxgun","weapon_mad_dual","weapon_mad_grenade","weapon_mad_p228","weapon_mad_xm1014","weapon_mad_usp_match","weapon_mad_mac10","weapon_mad_ump","weapon_mad_incendiary","weapon_mad_sg552","weapon_mad_spas","weapon_mad_ar2","weapon_mad_57","weapon_mad_glock","weapon_mad_armor","weapon_mad_tmp","weapon_mad_knife","weapon_mad_auto_glock","weapon_mad_mp7","weapon_mad_shield","weapon_mad_famas","weapon_mad_sg550","weapon_mad_scout","weapon_mad_charge","weapon_mad_awm","weapon_mad_m249","weapon_mad_rpg","weapon_mad_p90","weapon_mad_357","weapon_mad_g3","weapon_mad_mp5","weapon_mad_combinepistol","weapon_mad_mine","weapon_mad_galil","weapon_mad_medic","weapon_mad_m4","weapon_mad_magnade","weapon_mad_deagle","weapon_mad_usp","weapon_mad_flare","weapon_mad_m47","weapon_mad_engineer","weapon_mad_gnome","weapon_mad_crowbar","weapon_mad_c4","weapon_mad_aug","weapon_mad_grenadelauncher","weapon_mad_ak47","weapon_mad_crossbow","weapon_mad_m3","weapon_mad_smoke"}

M9K_SPECIALITIES={"m9k_nerve_gas","m9k_damascus","m9k_milkormgl","m9k_sticky_grenade","m9k_suicide_bomb","m9k_rpg7","m9k_proxy_mine","m9k_fists","m9k_knife","m9k_m202","m9k_ied_detonator","m9k_orbital_strike","m9k_m79gl","flechette_gun","m9k_nitro","m9k_machete","m9k_ex41","m9k_matador","m9k_davy_crockett","m9k_harpoon","m9k_m61_frag"}

M9K_ASSAULT_RIFLES={"m9k_winchester73","m9k_acr","m9k_ak47","m9k_ak74","m9k_amd65","m9k_an94","m9k_val","m9k_f2000","m9k_famas","m9k_fal","m9k_g36","m9k_m416","m9k_g3a3","m9k_l85","m9k_m14sp","m9k_m16a4_acog","m9k_m4a1","m9k_scar","m9k_vikhr","m9k_auga3","m9k_tar21"}

FAS={"fas2_ak12","fas2_ak47","fas2_ak74","fas2_an94","fas2_dv2","fas2_famas","fas2_g36c","fas2_g3","fas2_glock20","fas2_deagle","fas2_galil","fas2_uzi","fas2_ifak","fas2_ks23","fas2_mac11","fas2_m14","fas2_m1911","fas2_m21","fas2_m24","fas2_m3s90","fas2_m4a1","fas2_m67","fas2_m79","fas2_m82","fas2_machete","fas2_mp5a5","fas2_mp5k","fas2_mp5sd6","fas2_ots33","fas2_p226","fas2_pp19","fas2_ragingbull","fas2_rem870","fas2_rpk","fas2_rk95","fas2_sg550","fas2_sg552","fas2_sks","fas2_sr25","fas2_toz34"}
Customizable_Weaponry={"cw_ak74","cw_ar15","cw_g3a3","cw_mp5","cw_deagle","cw_mr96"}

VANILLA_WEAPONS = { "weapon_crossbow","weapon_frag","weapon_pistol","weapon_physcannon","weapon_smg1","weapon_slam","item_healthvial","weapon_shotgun"}

MHs_Super_Battle_Pack_PART_II ={"acid_sprayer_minds","acidball_minds","alienblasterx_minds","sniperrifle_minds","autoshot_lua","handcannon_minds","crazygbombgun_minds","crazyheligun_minds","crazymelongun_minds","cutter_minds","demoniccarsg_minds","fireball_minds","flamethrower_minds","frostball_minds","gbomb_minds","grapplinggun_minds","grapplinghook_minds","grenader_minds","heligrenade_minds","airboatgun_minds","laser_minds","ln2_sprayer_minds","melongrenade_minds","mrproper_minds","physautomat_minds","rifle_minds","nrocket_launcher_minds"}



spastiks_toybox={"bakker's blaster","gabriel","gretchen","henderson","lil' jim","murphy's law","the aerosol ar","the anti-rifle","the backscratcher","the bfhmg","the camper's choice","the coiled snake","the commander's compact","the doorman","the eleventh hour","the fire hazard","the fodder buster","the gambler","the grand prize","the greaser","the guerilla","the hammerhead","the hide n' seek advanced","the hometown slugger","the junkmaster","the kilroy warhammer","the lawnmower","the lobotomizer","the morning hail","the night light","the panther fist","the pea shooter","the penguinade","the pepper grinder","the quadruple agent","the rainmaker","the reanimated rocket rifle","the rusted bangstick","the salvaged sidearm","the secret carbine","the segundo pocket pistol","the sleeping pill","the spastik special","the special delivery","the straight razor","the swiss hellbringer","the trash compactor","the turbo lover","the waiting game"}

