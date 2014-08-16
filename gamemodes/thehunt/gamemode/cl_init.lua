AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "config.lua" )
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
MenuOpen = 0

if !ConVarExists("h_outline_radius") then
CreateClientConVar( "outline_radius", "1000", true, false )
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


net.Receive( "Spotted", function( length, client )
	HUDTEXT = 'Spotted'
	HUDCOLOR=Color(255,8,8)
end )

hook.Add( "ChatText", "ChatTextHook", playerhelp );
hook.Add( "KeyPress", "KeyPressedHook", MakeMenu)

--function GM:KeyPress(player,key)
--if key == IN_USE then
--if MenuOpen == 0 then

--function playerhelp()
function GM:OnPlayerChat( ply, strText, bTeamOnly, bPlayerIsDead )
if strText == "!help" then
if MenuOpen == 0 then
MenuOpen = 1
local Form = vgui.Create( "DFrame" )
Form:SetPos( ScrW() * 0.25, ScrH() * 0.25) -- or Form:Center()  
Form:SetSize( ScrW() * 0.5, ScrH() * 0.5 )
Form:SetTitle( "If you go asking for a question that's answered here, I'll kill you." ) -- or Form:SetTitle( " " ) to have noname windows : )
Form:SetVisible( true )
Form:SetDraggable( true )
Form:ShowCloseButton( true )
Form:MakePopup()
Form.OnRemove = function() MenuOpen = 0 end

--Form.Paint = function() -- To paint your form with RoundedBox or other ... 
--end

local label = vgui.Create( "DLabel", Form )
label:SetText( "Read this carefully before playing, or you will end up frustrated by the game mechanics. Type !help on the chat to open this again." ) -- Set Label text
label:SetPos(10,30) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- While safe, you can hide in dark places, but only if you're crouched and carrying the crowbar. Other weapons add luminosity to your player." ) -- Set Label text
label:SetPos(10,60) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- The combine can hear gunshots and props breaking, although props breaking don't cause them to alarm, only come." ) -- Set Label text
label:SetPos(10,80) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- Combine Soldiers near the place you're aiming at will be outlined in red for your convenience." ) -- Set Label text
label:SetPos(10,100) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content
local label = vgui.Create( "DLabel", Form )
label:SetText( "Slow computers can have performance problems with this feature. Set the cvar h_outline_radius to 500 or less to fix it." ) -- Set Label text
label:SetPos(10,115) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content


local label = vgui.Create( "DLabel", Form )
label:SetText( "- There are always plenty of weapons for you and your friends. Search around tables and crates." ) -- Set Label text
label:SetPos(10,135) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- Choose stealth over standard combat. The combine outnumber and outgun you and will kill you in no time if you give them the chance." ) -- Set Label text
label:SetPos(10,155) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content


local label = vgui.Create( "DLabel", Form )
label:SetText( "- If you find a Ceiling Turret, you can destroy it with an explosion or disable it with a Combine Control Panel." ) -- Set Label text
label:SetPos(10,175) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- Snipers can be killed by an explosion or the crossbow." ) -- Set Label text
label:SetPos(10,195) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- Only the Helicopter and the Combine Soldiers call for help when they see you. Tipped turrets can attract combine, too." ) -- Set Label text
label:SetPos(10,215) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

local label = vgui.Create( "DLabel", Form )
label:SetText( "- If you kill every comine that saw you, you can hide before more soldiers arrive." ) -- Set Label text
label:SetPos(10,235) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content
local label = vgui.Create( "DLabel", Form )
label:SetText( "- You can use h_hud_left (0,1) to change the Visible/Spotted hud position." ) -- Set Label text
label:SetPos(10,255) -- or Form:Center()
label:SizeToContents() -- Size Label aligned on into content


local label = vgui.Create( "DLabel", Form )
label:SetText( "- The best strategy here is to lure the combine into traps. You know they are attracted to gunshots and suspicious sounds. Use that information." ) -- Set Label text
label:SetPos(10,275) -- or Form:Center()  
label:SizeToContents() -- Size Label aligned on into content

		end
				return true

		end
		end

		net.Receive( "Hidden", function( length, client )
	HUDTEXT = 'Safe'
	HUDCOLOR=Color(0,255,0)
end )

hook.Add( "HUDPaint", "HuntHud", function()
if GetConVarNumber("h_hud_left") == 0 then

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
if LocalPlayer():Alive() and LocalPlayer():GetPos() then
	--for k, v in pairs(ents.FindInSphere(LocalPlayer():GetPos(), 1000)) do
	for k, v in pairs(ents.FindInSphere(LocalPlayer():GetEyeTraceNoCursor().HitPos, GetConVarNumber("outline_radius"))) do
	if v:GetClass() == "npc_combine_s" || v:GetClass() == "npc_metropolice" then
		if v:IsValid() then
				halo.Add( {v}, Color( 84,2,2 ), 1, 1, 1, true, true )
		end
	end

	if v:GetClass() == "item_healthcharger" and LocalPlayer():Health() < 40
 and LocalPlayer():Health() > 0 then
         halo.Add( {v}, Color( 0,204,255 ), 1, 1, 1, true, true )
	end
	
	if v:IsPlayer() then
	if v:Health() > 0 then
         halo.Add( {v}, Color( 18,176,0 ), 1, 1, 3, true, true )
	end
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




function light()
timer.Simple( 0.2, light )

if LocalPlayer():Alive() then
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
		if LocalPlayer():GetVelocity():Length() < 240 then
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
end
timer.Simple( 2, light )

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
hook.Add( "PlayerInitialSpawn", "playerInitialSpawn", light )
