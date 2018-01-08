include("shared.lua")
include("testhud.lua")

--[[sound.Add( {
	name = "villainSound",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = { 95, 110 },
	sound = "doomed.mp3"
} )

net.Receive ("ServerMsg", function(len)
	local str = net.ReadBool()
	if (bool == false) then
		self:EmitSound( "villainSound" )
		PrintMessage( HUD_PRINTTALK, "test!" )
	end
end)--]]

--[[function SWEP.DrawCrosshair()
	return true
end--]]

--[[function SWEP:DoDrawCrosshair( x, y )
	surface.SetDrawColor( 0, 250, 255, 255 )
	surface.DrawOutlinedRect( x - 32, y - 32, 64, 64 )
	return true
end--]]

hook.Add( "HUDPaint", "CustomHUD", function()
	local center = Vector( ScrW() / 2, ScrH() / 2, 0 )
	local scale = 11
	surface.SetDrawColor( 255, 255, 255, 255 )
	surface.DrawLine(ScrW()/2, ScrH()/2+scale, ScrW()/2, ScrH()/2-scale) -- VERTICAL
	surface.DrawLine(ScrW()/2+scale, ScrH()/2, ScrW()/2-scale, ScrH()/2) -- HORIZONTAL
	
	surface.DrawLine(ScrW()/2-1, ScrH()/2+scale, ScrW()/2-1, ScrH()/2-scale) -- V
	surface.DrawLine(ScrW()/2+scale, ScrH()/2-1, ScrW()/2-scale, ScrH()/2-1) -- H
	
	surface.DrawLine(ScrW()/2+1, ScrH()/2+scale, ScrW()/2+1, ScrH()/2-scale) -- V
	surface.DrawLine(ScrW()/2+scale, ScrH()/2+1, ScrW()/2-scale, ScrH()/2+1) -- H
end )

function GM:HUDDrawTargetID()
	return false
end

function GM:SpawnMenuOpen()
    return false
end

function GM:PlayerNoClip(ply)
	return false
end

function GM:ContextMenuOpen()
	return false
end