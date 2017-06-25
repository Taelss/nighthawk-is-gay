// print in chat that the cheat loaded

chat.AddText( Color( 255, 200, 255 ), ply, "[sploits] ", Color(255,100,50), "Loaded Sucessfully")
surface.PlaySound ("UI/buttonclick.wav")

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






// --- bhop ---

CreateClientConVar("sploits_bhop", "1", true , false)

hook.Add("Think", "asd", function()

	if (input.IsKeyDown( KEY_SPACE ) ) then
        hook.Add("Think","bhop",function()
			RunConsoleCommand(((LocalPlayer():IsOnGround() or LocalPlayer():WaterLevel() > 0) and "+" or "-").."jump")
		end)

        else RunConsoleCommand("-jump") hook.Remove("Think","hook") end

end)




// --- weapon dupe ---

concommand.Add("sploits_dupe", function()
	

	timer.Simple( 0.4744, function() 
		RunConsoleCommand("say", "/drop")  
	end)
	
	timer.Simple( 1.4135, function() 
		RunConsoleCommand("say", "/sleep")  
	end)
	
	timer.Simple( 7, function() 
		RunConsoleCommand("say", "/sleep")  
	end)
	
end)










