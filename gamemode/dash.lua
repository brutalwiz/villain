local delay = 0
local spd = 2000

function delayed()
	delay = CurTime() + 2
	print("Delayed".. delay)
end

hook.Add("KeyPress","DASH_BACKWARDS",function(ply,key)
	if CurTime() < delay then return end
	spd = 2000
	if not ply:OnGround() then
		spd = spd / 4
	end 
	if key == IN_SPEED and ply:KeyDown(IN_BACK) then
		ply:SetVelocity((ply:GetForward() * -0.75) * spd);
		ply:ViewPunch(Angle(-2,0,0)) --Added "Punch" animation for smoother feel
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_FORWARD) then
		ply:SetVelocity((ply:GetForward() * 0.75) * spd);
		ply:ViewPunch(Angle(2,0,0))
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_MOVELEFT) then
		ply:SetVelocity((ply:GetRight() * -0.75) * spd);
		ply:ViewPunch(Angle(0,0,-2))
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_MOVERIGHT) then
		ply:SetVelocity((ply:GetRight() * 0.75) * spd);
		ply:ViewPunch(Angle(0,0,2))	
		delayed()
	end	
end)