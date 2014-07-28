include( "shared.lua" )
include( "config.lua" )

hook.Add( "HUDPaint", "HelloThere", function() 
	draw.DrawText( HUDTEXT, "TargetID", ScrW() * 0.92, ScrH() * 0.85, HUDCOLOR, TEXT_ALIGN_RIGHT )
end )
HUDTEXT = ""
HUDCOLOR = Color(255,0,0,150)


net.Receive( "Spotted", function( length, client )
     --   print( "I got it!" )
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
end )


net.Receive( "Hidden", function( length, client )
   --     print( "I got it!" )
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
	if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" || v:GetClass() == "weapon_rpg" then
	if v:Health() > 0 then
        effects.halo.Add( {v}, Color( 84,2,2 ), 1, 1, 1, true, true )
	end
	end
	if v:GetClass() == "npc_tripmine" || v:GetClass() == "npc_satchel"  then
        effects.halo.Add( {v}, Color( 247,255,3 ), 1, 1, 1, true, false )
	end
	if v:GetClass() == "item_healthcharger" && LocalPlayer():Health() < HEALTHELP then
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
