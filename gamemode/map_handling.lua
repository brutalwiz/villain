--[[if game.GetMap() == "desolation" then
	hook.Add( "InitPostEntity", "weaponsDesolation", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( -1316.40, 258.30, 661.96 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( 928.87, 1215.75, 1120.03 ) )
		spawnSMG:Spawn()
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( -977.36, -412.67, 964.03 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( -381.53, -283.34, 2336.03 ) )
		spawnAWP:Spawn()
	end )
end--]]

if game.GetMap() == "dm_mario" then
	hook.Add( "InitPostEntity", "weaponsOther", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( 0, 0, 64.03 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( 0, 208.02, 320.03 ) )
		spawnSMG:Spawn()
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( 0, -208.020, 320.03 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( -155, -208.020, 316.03 ) )
		spawnAWP:Spawn()
	end )
end	

if game.GetMap() == "dm_cubical" then
	hook.Add( "InitPostEntity", "weaponsOther", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( -5.80, -7.82, 256.03 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( -1487.976, -1487.97, -415.97 ) )
		spawnSMG:Spawn()
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( 1487.97, -1487.97, -415.97 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( 1487.976, 1487.97, -415.97 ) )
		spawnAWP:Spawn()
	end )
end	

if game.GetMap() == "dm_arena_4way" then
	hook.Add( "InitPostEntity", "weaponsOther", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( 706.5, -129.3, -319 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( -368.3, 361.7, 64.0 ) )
		spawnSMG:Spawn()
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( 380.4, -380.1, 64 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( 1.9, 2.5, 289 ) )
		spawnAWP:Spawn()
	end )
end	

if game.GetMap() == "vl_der_fuerst" then
	hook.Add( "InitPostEntity", "weaponsOther", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( 1547.05, -1537.34, 704.03 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		--[[local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( -368.3, 361.7, 64.0 ) )
		spawnSMG:Spawn()--]]
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( -1486.68, -1559.86, 704.03 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( -1459.11, 1581.08, 704 ) )
		spawnAWP:Spawn()
	end )
end

if game.GetMap() == "vl_der_hurensohn" then
	hook.Add( "InitPostEntity", "weaponsOther", function()
		-- Shrekzooka
		local spawnShrekzooka = ents.Create( "gidzco_shrekzooka" )
		spawnShrekzooka:SetPos( Vector( 1007.05, 4.95, 128.03 ) )
		spawnShrekzooka:Spawn()
		
		-- SMG
		--[[local spawnSMG = ents.Create( "weapon_smg1" )
		spawnSMG:SetPos( Vector( -368.3, 361.7, 64.0 ) )
		spawnSMG:Spawn()--]]
		
		-- Assault Rifle
		local spawnAR = ents.Create( "weapon_ar2" )
		spawnAR:SetPos( Vector( 2944.92, 1819.55, 128.03 ) )
		spawnAR:Spawn()
		
		-- AWP
		local spawnAWP = ents.Create( "bb_awp_alt" )
		spawnAWP:SetPos( Vector( -925.38, -1959.75, 128.03 ) )
		spawnAWP:Spawn()
	end )
end	