AddCSLuaFile( "shared.lua" )
include( "shared.lua" )
noticeable={}
darkencolor = Color(255,0,0)
HUDTEXT = "Hidden"
HUDCOLOR = Color(0,255,0)
light_above_limit = 3
LIGHTEXT = 'Visible'
LIGHTCOLOR = Color(255,0,0)
lightcol = 0
vlight=0
CLDARKNESS = 0
score_color=Color(150,150,150)
vdarkencolor = Color(0,255,0)

if !ConVarExists("h_outline_radius") then
	CreateClientConVar( "h_outline_radius", "1000", true, false )
end

if !ConVarExists("h_hud_left") then
	CreateClientConVar( "h_hud_left", "1", true, false )
end

net.Receive( "NotVisible", function( length, client )
	LIGHTEXT = 'Not Visible'
	LIGHTCOLOR = Color(0,255,0) 
end )

net.Receive( "Visible", function( length, client )
	LIGHTEXT = 'Visible'
	LIGHTCOLOR = Color(255,255,0)
end )



net.Receive( "ShowHUDScoreboard", function( len, ply )
	ShowScoreboard=true
	timer.Simple(2, function() ShowScoreboard=false end)
end)

net.Receive( "HideHUDScoreboard", function( len, ply )
end)


net.Receive( "PlayerKillNotice", function( len, ply )
	GAMEMODE:AddDeathNotice(net.ReadString(), 0, net.ReadString(), net.ReadString(), 1001)
end)


net.Receive( "PlayerKillNotice", function( len, ply )
	GAMEMODE:AddDeathNotice(net.ReadString(), 0, net.ReadString(), net.ReadString(), 1001)
end)

net.Receive( "Spotted", function( length, client )
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
end )

net.Receive( "Hidden", function( length, client )
	HUDTEXT = 'Safe'
	HUDCOLOR=Color(0,255,0)
end )

hook.Add( "HUDPaint", "HuntHud", function()
	if LocalPlayer():Alive() and LocalPlayer():IsValid() then
		draw.RoundedBox(6 , ScrW()*0.027, ScrH() * 0.82, 140, 84, Color(255,255,255,20))
		draw.DrawText( "Score: "..LocalPlayer():GetNWInt("Score").."", "TargetID", ScrW() * 0.03, ScrH() * 0.82, score_color, TEXT_ALIGN_LEFT )
		draw.DrawText( LIGHTEXT, "TargetID", ScrW() * 0.03, ScrH() * 0.84, LIGHTCOLOR, TEXT_ALIGN_LEFT )
		draw.DrawText( "Illumination: "..math.Round(lightcol,1).."", "TargetID", ScrW() * 0.03, ScrH() * 0.86, darkencolor, TEXT_ALIGN_LEFT )
		draw.DrawText( HUDTEXT, "TargetID", ScrW() * 0.03, ScrH() * 0.88, HUDCOLOR, TEXT_ALIGN_LEFT )
		if ShowScoreboard==true then
			draw.DrawText( "Kills: "..LocalPlayer():GetNWInt("Kills").."", "TargetID", ScrW() * 0.03, ScrH() * 0.74, Color(0,255,0), TEXT_ALIGN_LEFT )
			draw.DrawText( "Silent Kills: "..LocalPlayer():GetNWInt("SilentKills").."", "TargetID", ScrW() * 0.03, ScrH() * 0.76, Color(0,255,0), TEXT_ALIGN_LEFT )
			draw.DrawText( "Deaths: "..LocalPlayer():GetNWInt("Deaths").."", "TargetID", ScrW() * 0.03, ScrH() * 0.78, Color(0,255,0), TEXT_ALIGN_LEFT )
		end
			if (input.IsKeyDown(32)) then
				draw.DrawText( "Lighting: "..math.Round(vlight,1).."", "TargetID", ScrW() * 0.5, ScrH() * 0.52, vdarkencolor, TEXT_ALIGN_CENTER )
		end
		
	end
end)


hook.Add( "PreDrawHalos", "AddHalos", function()
	if LocalPlayer():Alive() and LocalPlayer():GetPos() then
		for k, v in pairs(ents.FindInSphere(LocalPlayer():GetEyeTraceNoCursor().HitPos, GetConVarNumber("h_outline_radius"))) do
			if v:GetClass() == "npc_combine_s" or v:GetClass() == "npc_metropolice" or v:GetClass() == "npc_hunter" then
				if v:IsValid() then
						halo.Add( {v}, Color( 84,2,2 ), 1, 1, 1, true, true )
				end
			end
			if v:GetClass() == "item_healthcharger" and LocalPlayer():Health() < 40 and LocalPlayer():Health() > 0 then
				halo.Add( {v}, Color( 0,204,255 ), 1, 1, 1, true, true )
			end
			if v:IsPlayer() then
				if v:Health() > 0 then
					halo.Add( {v}, Color( 18,176,0 ), 1, 1, 3, true, true )
				end
			end
			if table.HasValue(noticeable, v:EntIndex()) then
			halo.Add( {v}, Color( 0,0,255 ), 1, 1, 1, true, true ) end
		end
		for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), 300)) do
			if v:GetClass() == "npc_tripmine" and LocalPlayer():Health() then
				halo.Add( {v}, Color( 255,255,0 ), 1, 1, 1, true, true )
			end

		end
		
	end
end)


function CombineBootsWalk()
	if LocalPlayer() then
		for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(),900)) do
			if v then
				if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
					if v:GetVelocity():Length() > 50 && v:GetVelocity():Length() < 75 then 
						sound.Play( table.Random(CombineBootSound), v:GetPos(), 75, 100, 0.5 )
					end
				end	
			end
		end
	end
end

function CombineBootsRun()
	if LocalPlayer() then
		for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(),900)) do
			if v then
				if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
					if v:GetVelocity():Length() > 80 then 
						sound.Play( table.Random(CombineBootSound), v:GetPos(), 75, 100, 0.5 )
					end
				end
			end
		end
	end
end

function CombineBoots()
	timer.Create( "CombineBootsWalk", 0.6, 0, CombineBootsWalk ) 
	timer.Create( "CombineBootsRun", 0.3, 0, CombineBootsRun )
end

CombineBootSound = {
"npc/combine_soldier/gear1.wav",
"npc/combine_soldier/gear2.wav",
"npc/combine_soldier/gear3.wav",
"npc/combine_soldier/gear4.wav",
"npc/combine_soldier/gear5.wav",
}



hook.Add("Tick", "KeyDown_Test", function()
	if (input.IsKeyDown(32)) then
		--print("Player is pressing V!")
			if LocalPlayer():Alive() then
			vlight = (render.GetLightColor(LocalPlayer():GetEyeTraceNoCursor().HitPos)*Vector(100,100,100)):Length()
			if LocalPlayer():Health() > 0 and LocalPlayer():GetActiveWeapon() != NULL then

				if table.HasValue(TOO_BRIGHT_WEAPONS, LocalPlayer():GetActiveWeapon():GetClass()) then
				vlight=vlight+1 end
				if LocalPlayer():Crouching() then vlight=vlight-1 end
				if LocalPlayer():FlashlightIsOn() then if vlight < 20 then vlight = vlight+30 end end
			end
			end

				if  vlight < 2 then vdarkencolor = Color(0,255,0) end
				if  vlight >= 2 and vlight < 10 then
					vdarkencolor = Color(190,100,0,255)
				end
				if vlight > 10 then
					vdarkencolor = Color(220,0,0,255)
				end
			
	end	
end)


function light()
	timer.Simple( 0.2, light )
	if LocalPlayer() then
		if LocalPlayer():Alive() then
			lightcol = (render.GetLightColor(LocalPlayer():GetPos())*Vector(100,100,100)):Length()
			if LocalPlayer():Health() > 0 and LocalPlayer():GetActiveWeapon() != NULL then
			--	table.foreach(DARK_WEAPONS, function(key,value)
			--		if LocalPlayer():GetActiveWeapon():GetClass() != value then lightcol=lightcol+1 end
			--	end)
				if table.HasValue(TOO_BRIGHT_WEAPONS, LocalPlayer():GetActiveWeapon():GetClass()) then
				lightcol=lightcol+1 end
				if LocalPlayer():Crouching() then lightcol=lightcol-1 end
				if LocalPlayer():FlashlightIsOn() then if lightcol < 20 then lightcol = lightcol+30 end end
			end
			if LocalPlayer():GetVelocity():Length() > 200 then lightcol=lightcol+2 end
			lightcol=lightcol-CLDARKNESS
			if lightcol <= 2 then
				if light_above_limit != 0 then
				darkencolor = Color(0,255,0)
					if LocalPlayer():GetVelocity():Length() < 240 then
						if LocalPlayer():Alive() then
							--light_above_limit=0
							net.Start("light_below_limit")
							net.SendToServer()
						end
					end
				end
			end	
			if lightcol > 2 then
				if  lightcol >= 2 and lightcol < 10 then
					darkencolor = Color(190,190,190,255)
				end
				if lightcol > 10 then
					darkencolor = Color(255,255,255,255)
				end
				if light_above_limit != 1 then
					if LocalPlayer():Alive() then
						--light_above_limit=1
						net.Start("light_above_limit")
						net.SendToServer()
					end
				end
			end
		end
	end
end
--timer.Simple( 2, light )

function GM:HUDDrawTargetID()
local tr = util.GetPlayerTrace( LocalPlayer() )
local trace = util.TraceLine( tr )
if (!trace.Hit) then return end
if (!trace.HitNonWorld) then return end

local text = "ERROR"
local font = "TargetID"

if (trace.Entity:IsPlayer()) then
	text = trace.Entity:Nick()
else
	text=""
end

surface.SetFont( font )
local w, h = surface.GetTextSize( text )
local MouseX, MouseY = gui.MousePos()

if ( MouseX == 0 && MouseY == 0 ) then
	MouseX = ScrW() / 2
	MouseY = ScrH() / 1.1
end

local x = MouseX
local y = MouseY

x = x - w / 2
y = y + 30

-- The fonts internal drop shadow looks lousy with AA on
draw.SimpleText( text, font, x+1, y+1, Color(0,0,0,120) )
draw.SimpleText( text, font, x+2, y+2, Color(0,0,0,50) )
draw.SimpleText( text, font, x, y, self:GetTeamColor( trace.Entity ) )

y = y + h + 5
if (trace.Entity:Health() > 0) then
	text = "Health: "..trace.Entity:Health().. ""
	font = "TargetIDSmall"
end

surface.SetFont( font )
local w, h = surface.GetTextSize( text )
local x = MouseX - w / 2

draw.SimpleText( text, font, x+1, y+1, Color(0,0,0,120) )
draw.SimpleText( text, font, x+2, y+2, Color(0,0,0,50) )
draw.SimpleText( text, font, x, y, self:GetTeamColor( trace.Entity ) )
end
timer.Simple ( 5, CombineBoots)


function ChatToWebsite(pl, text)
	if text == "!help" then
		if pl != LocalPlayer() then return true end
		gui.OpenURL("http://www.googledrive.com/host/0B02m1TcaLJ-vSlQ1bkpBVlJWcG8")
	return true
	end
end
hook.Add("OnPlayerChat", "ChatToWebsite", ChatToWebsite)
