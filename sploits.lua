// print in chat that the cheat loaded

chat.AddText( Color( 255, 200, 255 ), ply, "[sploits] ", Color(255,100,50), "Loaded Sucessfully")
surface.PlaySound ("UI/buttonclick.wav")

// --- cool watermark ---
p
hook.Add("PostDrawHUD", "", function()
	surface.SetFont("DermaLarge");
	surface.SetTextColor(65, 255, 65);
	surface.SetTextPos(5, 5);
	surface.DrawText("sploits - discord.gg/J3pxPVe");
	
endp



// --- wallhack ---

function ESP()

	local ply = LocalPlayer()

	

	for id , target in pairs(ents.FindByClass("Player")) do

		local name = tostring(target:Nick())

		local targetPos = target:GetPos() + Vector(0,0,62)

		local targetDistance = math.floor((ply:GetPos():Distance( targetPos )) / 40)

		local targetScreenpos = targetPos:ToScreen()

		surface.SetTextColor( 100, 255, 100, 255 )
		surface.SetFont("BudgetLabel")
		surface.SetTextPos( tonumber( targetScreenpos.x ),tonumber(targetScreenpos.y))
		surface.DrawText(name)

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

        else RunConsoleCommand("-jump") hook.Remove("Think","bhop") end

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


// --- chams ---

local chamsmat = CreateMaterial("chamsmat", "VertexLitGeneric", {
	["$ignorez"] = 0,
	["$model"] = 1,
	["$basetexture"] = "models/debug/debugwhite",
});




local chams = CreateClientConVar("sploits_chams", 1);

hook.Add("RenderScreenspaceEffects", "", function()
	if(!chams:GetBool()) then return; end
	cam.Start3D();
	render.MaterialOverride(chamsmat)
	for k,v in next, player.GetAll() do
		if(v:Health() < 1 || v:IsDormant()) then continue end
		if(v:Team() == 1) then
			render.SetColorModulation(1, 0, 0);
		else
			render.SetColorModulation(20 / 255, 100 / 255, 1)
		end

		v:DrawModel()

		local wep = v:GetActiveWeapon()

		if(wep && wep:IsValid()) then
			render.SetColorModulation(1, 1, 1)
			wep:DrawModel()
		end
	end
	cam.End3D()
end)



// --- no spread ---

local function NoSpread()    
if GetConVarNumber("sploits_nospread") == 1 and LocalPlayer().GetActiveWeapon != nil then
local wep = LocalPlayer():GetActiveWeapon()
if wep.data then
wep.data.Recoil = 0
wep.data.Cone = 0
wep.data.Spread = 0
end
if wep.Primary then
wep.Primary.Recoil = 0
wep.Primary.Cone = 0
wep.Primary.Spread = 0
end
end
end
hook.Add("Tick", "NoSpread", NoSpread)

CreateClientConVar( "sploits_nospread", 0, true, false)




