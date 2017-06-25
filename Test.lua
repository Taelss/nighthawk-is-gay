
hook.Add("PlayerSay" , "say" , testing)

chat.AddText( Color( 255, 200, 255 ), ply, "[Cunts] ", Color(255,100,50), "Loaded Sucessfully")

function hud() 
local health = LocalPlayer():Health()
draw.RoundedBox(0, 500, ScrH() - 0 -70, health, 25, Color(0,255,0,255))
draw.SimpleText(health, "default", 500, ScrH() - 55 - 40, Color(0,0,255,255))
end 
hook.Add("HUDPaint", "NigsHud", hud) 