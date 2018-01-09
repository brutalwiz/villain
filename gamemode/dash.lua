local delay = 0
local spd = 2000
local jump = true
local jumpDelay = 0
local dashDelay = 0
function delayed()
	jumpDelayed()
	delay = CurTime() + 0.5
	print("Speed = "..spd)
end

function jumpDelayed()
	jumpDelay = CurTime() + 0.005
	print("JUMP DELAYED EXEC")
end

function dashDelayed()
	dashDelay = CurTime() + 0.005
	print("DashDelayed")
end

hook.Add("KeyPress","DASH_BACKWARDS",function(ply,key)
	spd = 1500
	if (CurTime() < delay) or (CurTime() < delay and (CurTime() < dashDelay)) then 
		print("Dela yed".. delay)
		return 
	end
	--Setting Vel for different ply pos
	if key == IN_JUMP then
		spd = spd/4
		--Space spam doent lead to not being able to dash forever
		dashDelayed()
	else
		if key == IN_SPEED and not ply:KeyDown(IN_JUMP) and ply:OnGround() then
			spd = 1500
		end
	end
	-- Testing, if player can jump again
	if key == IN_JUMP and jump == true then
		if CurTime() < jumpDelay then 
			print("Return Jump delay")
			return 
		else
			ply:SetJumpPower(200)
			print("reset jump power to 200")
		end
	elseif key == IN_JUMP and jump == false then 
		ply:SetJumpPower(0)
		print("SetJumpPowerto0")
		jump = true
	end
			
	--setspeed if player is in air
	if not ply:OnGround() then
		spd = spd / 4
	end


	if key == IN_SPEED and ply:KeyDown(IN_BACK) then
		jump = false
		ply:SetVelocity((ply:GetForward() * -1) * spd);
		ply:ViewPunch(Angle(-2,0,0)) -- Added "Punch" animation for smoother feel
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_FORWARD) then
		jump = false
		ply:SetVelocity((ply:GetForward() * 1) * spd);
		ply:ViewPunch(Angle(2,0,0))
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_MOVELEFT) then
		jump = false
		ply:SetVelocity((ply:GetRight() * -1) * spd);
		ply:ViewPunch(Angle(0,0,-2))
		delayed()
	elseif key == IN_SPEED and ply:KeyDown(IN_MOVERIGHT) then
		jump = false
		ply:SetVelocity((ply:GetRight() * 1) * spd);
		ply:ViewPunch(Angle(0,0,2))	
		delayed()
	end	
end)