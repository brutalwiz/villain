hook.Add("KeyPress","DASH_BACKWARDS",function(ply,key)
			if ply:OnGround() and key == IN_SPEED and ply:KeyDown(IN_BACK) then
				ply:SetVelocity((ply:GetForward() * -0.75) * 2000);
				ply:ViewPunch(Angle(-2,0,0)) --Added "Punch" animation for smoother feel
			elseif ply:OnGround() and key == IN_SPEED and ply:KeyDown(IN_FORWARD) then
				ply:SetVelocity((ply:GetForward() * 0.75) * 2000);
				ply:ViewPunch(Angle(2,0,0))
			elseif ply:OnGround() and key == IN_SPEED and ply:KeyDown(IN_MOVELEFT) then
				ply:SetVelocity((ply:GetRight() * -0.75) * 2000);
				ply:ViewPunch(Angle(0,0,-2))
			elseif ply:OnGround() and key == IN_SPEED and ply:KeyDown(IN_MOVERIGHT) then
				ply:SetVelocity((ply:GetRight() * 0.75) * 2000);
				ply:ViewPunch(Angle(0,0,2))	
			end
			if not ply:OnGround() then
				return
			end		
end)