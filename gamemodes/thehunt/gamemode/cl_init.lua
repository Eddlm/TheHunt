include( "shared.lua" )
include( "config.lua" )

timer.Simple(4,function()
hook.Add( "HUDPaint", "HelloThere", function()
	draw.DrawText( HUDTEXT, "TargetID", ScrW() * 0.92, ScrH() * 0.85, HUDCOLOR, TEXT_ALIGN_RIGHT )
	if LIGHT_BASED_STEALTH_SYSTEM == 1 then

	draw.DrawText( "Illumination: "..math.Round(lightcol,1).."", "TargetID", ScrW() * 0.92, ScrH() * 0.87, darkencolor, TEXT_ALIGN_RIGHT )
	--draw.DrawText( darken, "TargetID", ScrW() * 0.92, ScrH() * 0.83, darkencolor, TEXT_ALIGN_RIGHT )
	--draw.RoundedBox(4,ScrW() * 0.92, ScrH() * 0.83,20,20,darkencolor)
end
end )
end)

darken = "Loading module..."
darkencolor = Color(255,0,0,150)
HUDTEXT = ""
HUDCOLOR = Color(255,0,0,150)
light_above_limit = 3


function GM:Initialize()
end


/*
tabletrace ={
}

tabletrace.start = LocalPlayer():GetPos()
tabletrace.endpos = LocalPlayer():GetAimVector()*2
tabletrace.filter = LocalPlayer()

*/
net.Receive( "Spotted", function( length, client )
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
end )


net.Receive( "Hidden", function( length, client )
	HUDTEXT='Hidden'
	HUDCOLOR=Color(51,255,0)
end )

hook.Add( "PreDrawHalos", "AddHalos", function()
if HALOS == 1 then
	for k, v in pairs(ents.FindByClass("player"))  do
	if v:Health() > 1 then
        effects.halo.Add( {v}, Color( 18,176,0 ), 1, 1, 3, true, true )
	end
	end

	for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(),2000)) do
	if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
	if v:IsValid() then
        effects.halo.Add( {v}, Color( 84,2,2 ), 1, 1, 1, true, true )
	end
	end
	if v:GetClass() == "npc_tripmine" || v:GetClass() == "npc_satchel"  then
        effects.halo.Add( {v}, Color( 247,255,3 ), 1, 1, 1, true, false )
	end
	if v:GetClass() == "item_healthcharger" && LocalPlayer():Health() < HEALTHELP and LocalPlayer():Health() > 0 then
        effects.halo.Add( {v}, Color( 0,204,255 ), 1, 1, 1, true, true )
	end
	end
end
end )


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
function StatusChecker()
timer.Create( "StatusChecker", 1, 1, StatusChecker ) 
	if LocalPlayer():GetNWInt("status") == "spotted" then
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
	else
	HUDTEXT='Hidden'
	HUDCOLOR=Color(51,255,0)
	end
end
-- timer.Create( "StatusChecker", 1, 1, StatusChecker ) 

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

timer.Simple ( 5, CombineBoots)


function PerceivedLuminance(colorvec)
return (0.299*colorvec.x + 0.587*colorvec.y + 0.114*colorvec.z)
end



function light()
timer.Create( "Light", 0.1, 1, light )
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


--if lightcol < 0 then lightcol = 0 end
--print(lightcol)
--print(util.TraceLine(tabletrace).Entity)

if lightcol <= 2 then
	if light_above_limit != 0 then
	darken = "dark place"
	darkencolor = Color(5,54,0,255)
		if LocalPlayer():GetVelocity():Length() < 40 then

		light_above_limit=0
		net.Start("light_below_limit")
		net.SendToServer()

		end

end
end

if lightcol > 2 then
	if  lightcol >= 2 and lightcol < 10 then
	darken = "mid-light  place"
	darkencolor = Color(117,117,117,255)
	end
	if lightcol > 10 then
	darken = "light place"
	darkencolor = Color(255,255,255,255)
	end
	if light_above_limit != 1 then
	light_above_limit=1
	net.Start("light_above_limit")
	net.SendToServer()
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

if LIGHT_BASED_STEALTH_SYSTEM == 1 then
timer.Create( "Light", 2, 1, light )
lightcol = 0
end

