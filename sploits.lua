// print in chat that the cheat loaded

chat.AddText( Color( 255, 200, 255 ), ply, "[sploits] ", Color(255,100,50), "Loaded Sucessfully")


// --- wallhack ---

function ESP()

	local ply = LocalPlayer()

	

	for id , target in pairs(ents.FindByClass("Player")) do

		local name = tostring(target:Nick())

		local targetPos = target:GetPos() + Vector(0,0,32)

		local targetDistance = math.floor((ply:GetPos():Distance( targetPos )) / 40)

		local targetScreenpos = targetPos:ToScreen()

		surface.SetTextColor( 200, 25, 25, 255 )
		surface.SetFont("Trebuchet18")
		surface.SetTextPos( tonumber( targetScreenpos.x ),tonumber(targetScreenpos.y))
		surface.DrawText("Name: ".. name)


end
end

hook.Add("HUDPaint", "ESP", ESP)





















