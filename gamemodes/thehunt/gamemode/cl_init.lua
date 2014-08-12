include( "shared.lua" )
include( "config.lua" )



darkencolor = Color(255,0,0)
HUDTEXT = "Hidden"
HUDCOLOR = Color(0,255,0)
light_above_limit = 3
LIGHTEXT = 'Visible'
LIGHTCOLOR = Color(255,0,0)
lightcol = 0
CLDARKNESS = 0


net.Receive( "NotVisible", function( length, client )
	LIGHTEXT = 'Not Visible'
	LIGHTCOLOR = Color(0,255,0) 
end )


net.Receive( "Visible", function( length, client )
	LIGHTEXT = 'Visible'
	LIGHTCOLOR = Color(255,255,0)
end )


net.Receive( "Spotted", function( length, client )
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
end )


net.Receive( "Hidden", function( length, client )
	HUDTEXT = 'Safe'
	HUDCOLOR=Color(0,255,0)
end )


hook.Add( "HUDPaint", "HuntHud", function()

if GetConVarNumber("h_hudleft") == 0 then

	draw.RoundedBox(6 , ScrW()*0.885, ScrH() * 0.90, 140, 67, Color(255,255,255,20))
	draw.DrawText( "Illumination: "..math.Round(lightcol,1).."", "TargetID", ScrW() * 0.89, ScrH() * 0.93, darkencolor, TEXT_ALIGN_LEFT )
	draw.DrawText( LIGHTEXT, "TargetID", ScrW() * 0.89, ScrH() * 0.91, LIGHTCOLOR, TEXT_ALIGN_LEFT )
	draw.DrawText( HUDTEXT, "TargetID", ScrW() * 0.89, ScrH() * 0.95, HUDCOLOR, TEXT_ALIGN_LEFT )
else
	draw.RoundedBox(6 , ScrW()*0.025, ScrH() * 0.83, 140, 67, Color(255,255,255,20))
	draw.DrawText( "Illumination: "..math.Round(lightcol,1).."", "TargetID", ScrW() * 0.03, ScrH() * 0.86, darkencolor, TEXT_ALIGN_LEFT )
	draw.DrawText( LIGHTEXT, "TargetID", ScrW() * 0.03, ScrH() * 0.84, LIGHTCOLOR, TEXT_ALIGN_LEFT )
	draw.DrawText( HUDTEXT, "TargetID", ScrW() * 0.03, ScrH() * 0.88, HUDCOLOR, TEXT_ALIGN_LEFT )
end
end)


hook.Add( "PreDrawHalos", "AddHalos", function()
if GetConVarNumber("h_halos") == 1 && LocalPlayer():Alive() then
	--for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), 1000)) do

	for k, v in pairs(ents.FindInSphere(LocalPlayer():GetEyeTraceNoCursor().HitPos, 2000)) do
	if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
		if v:IsValid() then
				--combine=combine+1
				halo.Add( {v}, Color( 84,2,2 ), 1, 1, 1, true, true )
		end
	end
	if v:GetClass() == "npc_tripmine" || v:GetClass() == "npc_satchel"  then
 halo.Add( {v}, Color( 247,255,3 ), 1, 1, 1, true, false )
	end
	if v:GetClass() == "item_healthcharger" and LocalPlayer():Health() < GetConVarNumber("h_min_health_help")
 and LocalPlayer():Health() > 0 then
         halo.Add( {v}, Color( 0,204,255 ), 1, 1, 1, true, true )
	end
	
	if v:IsPlayer() then
	if v:Health() > 1 then
         halo.Add( {v}, Color( 18,176,0 ), 1, 1, 3, true, true )
	end
	end
end
end
end)

function GM:PostDrawViewModel( vm, ply, weapon )

	if ( weapon.UseHands || !weapon:IsScripted() ) then

		local hands = LocalPlayer():GetHands()
		if ( IsValid( hands ) ) then hands:DrawModel() end

	end
end


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




function stealthsystemchecker()
if GetConVarNumber("h_light_stealth") == 1 then
print("Light based system ok")
timer.Simple( 1, light )
lightcol = 0
end
end


function light()
timer.Simple( 0.2, light )
lightcol = (render.GetLightColor(LocalPlayer():GetPos())*Vector(100,100,100)):Length()
if LocalPlayer():Health() > 0 then
table.foreach(DARK_WEAPONS, function(key,value)
if LocalPlayer():GetActiveWeapon():GetClass() != value then lightcol=lightcol+1 end
end)
table.foreach(TOO_BRIGHT_WEAPONS, function(key,value)
if LocalPlayer():GetActiveWeapon():GetClass() == value then lightcol=lightcol+1 end
end)
if LocalPlayer():Crouching() then lightcol=lightcol-1 end
if LocalPlayer():FlashlightIsOn() then if lightcol < 20 then lightcol = lightcol+30 end end
end
lightcol=lightcol-CLDARKNESS
if lightcol <= 2 then
	if light_above_limit != 0 then
	darkencolor = Color(0,255,0)
		if LocalPlayer():GetVelocity():Length() < 40 then
		if LocalPlayer():Alive() then
		light_above_limit=0
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
	light_above_limit=1
	net.Start("light_above_limit")
	net.SendToServer()
	end
	end
end
end

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
timer.Simple ( 2, stealthsystemchecker)