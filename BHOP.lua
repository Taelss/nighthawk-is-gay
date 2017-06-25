if CLIENT then
	concommand.Add("+bhop",function()
		hook.Add("Think","hook",function()
			RunConsoleCommand(((LocalPlayer():IsOnGround() or LocalPlayer():WaterLevel() > 0) and "+" or "-").."jump")
		end)
	end)

	concommand.Add("-bhop",function()
		RunConsoleCommand("-jump")
		hook.Remove("Think","hook")
	end)
end