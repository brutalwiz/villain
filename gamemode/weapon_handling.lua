hook.Add("KeyPress","DropMyWeapon",function(ply,key)
	if key == IN_USE then
		if ply:HasWeapon("weapon_ar2") then
			ply:DropNamedWeapon("weapon_ar2")
		end
		
		if ply:HasWeapon("weapon_smg1") then
			ply:DropNamedWeapon("weapon_smg1")
		end
		
		if ply:HasWeapon("bb_awp_alt") then
			ply:DropNamedWeapon("bb_awp_alt")
		end
		
		if ply:HasWeapon("gidzco_shrekzooka") then
			ply:DropNamedWeapon("gidzco_shrekzooka")
		end
	end
end)

hook.Add( "PlayerCanPickupWeapon", "canPickup", function( ply, wep )
	if (wep:GetClass() == "weapon_ar2" ) then 
		if ply:HasWeapon("weapon_smg1") then
			return false
		end
		if ply:HasWeapon("bb_awp_alt") then
			return false
		end
		if ply:HasWeapon("gidzco_shrekzooka") then
			return false
		end
	end
	
	if (wep:GetClass() == "weapon_smg1" ) then 
		if ply:HasWeapon("weapon_ar2") then
				ply:DropNamedWeapon("weapon_ar2")
				ply:SetActiveWeapon(wep:GetName())
			return true
		end
		if ply:HasWeapon("bb_awp_alt") then
			return false
		end
		if ply:HasWeapon("gidzco_shrekzooka") then
			return false
		end
	end
	
	if (wep:GetClass() == "bb_awp_alt" ) then 
		if ply:HasWeapon("weapon_ar2") then
			ply:DropNamedWeapon("weapon_ar2")
			ply:SetActiveWeapon(wep:GetName())
			return true
		end
		if ply:HasWeapon("weapon_smg1") then
			ply:DropNamedWeapon("weapon_smg1")
			ply:SetActiveWeapon(wep:GetName())
			return true
		end
		if ply:HasWeapon("gidzco_shrekzooka") then
			return false
		end
	end
	
	if (wep:GetClass() == "gidzco_shrekzooka" ) then 
		if ply:HasWeapon("weapon_ar2") then
			ply:DropNamedWeapon("weapon_ar2")
			ply:SetActiveWeapon(wep:GetName())
			return true
		end
		if ply:HasWeapon("weapon_smg1") then
			ply:DropNamedWeapon("weapon_smg1")
			ply:SetActiveWeapon(wep:GetName())
			return true
		end
		if ply:HasWeapon("bb_awp_alt") then
			ply:DropNamedWeapon("bb_awp_alt")
			ply:SetActiveWeapon(wep:GetName())
			return true
		end
	end
	
	ply:SetActiveWeapon(wep:GetName())
end )

hook.Add("DoPlayerDeath","DoStuffDoPlayerDeath",function(victim, inflictor, attacker)
			victim:DropNamedWeapon("gidzco_shrekzooka")
			victim:DropNamedWeapon("weapon_smg1")
			victim:DropNamedWeapon("weapon_ar2")
			victim:DropNamedWeapon("bb_awp_alt")
end)