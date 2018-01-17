function buffFast(ply)
	ply:SetRunSpeed(800)
	ply:SetWalkSpeed(800)
	print("buffFast")
end

function buffSuperJump(ply)
	ply:SetJumpPower(640)
	print("buffSuperJump")
end


function buffSlow(ply)
	ply:SetRunSpeed(215)
	ply:SetWalkSpeed(215)
	print("buffSlow")
end

function buffGraivty(ply)
	ply:SetGravity(.4)
	print("buffGravity")
end

function selectBuff(ply)
	local random = math.Round( math.Rand( 1, 4 ) )
	if random == 1 then
		buffFast(ply)
	end
	if random == 2 then
		buffSuperJump(ply)
	end
	if random == 3 then
		buffSlow(ply)
	end
	if random == 4 then
		buffGraivty(ply)
	end
end