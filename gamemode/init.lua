AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("resources.lua")
AddCSLuaFile("testhud.lua")
AddCSLuaFile("dash.lua")
AddCSLuaFile("map_handling.lua")

include("shared.lua")
include("resources.lua")
include("dash.lua")
include("weapon_handling.lua")
include("map_handling.lua")

--[[sound.Add( {
	name = "villainSound",
	channel = CHAN_STATIC,
	volume = 1.0,
	level = 80,
	pitch = { 95, 110 },
	sound = "doomed.mp3"
} )--]]

function GM:PlayerInitialSpawn(ply)
	-- Do on initial spawn
end

function GM:GetFallDamage( ply, speed )
	return false
end

function GM:PlayerSpawn(ply)
	ply:SetGravity(.8)
	ply:SetMaxHealth(100)
	ply:SetRunSpeed(430)
	ply:SetWalkSpeed(430)
	ply:Give("weapon_crowbar")
	ply:Give("weapon_357")
	ply:GiveAmmo(999, "357");
	--ply:Give("weapon_smg1")
	--ply:GiveAmmo(999, "smg1");
	--ply:Give("weapon_ar2")
	--ply:Give("bb_awp_alt")
	--ply:Give("gidzco_shrekzooka")
	if ply:CanUseFlashlight() == false then
		ply:SetModel( "models/player/breen.mdl" )
		ply:SetupHands()
	end
	--ply:Give("bb_awp_alt")
	--ply:AllowFlashlight(false)
	--if ply:CanUseFlashlight() == false then
		--PrintMessage( HUD_PRINTTALK, "check" )
	--end
end

function GM:PlayerGiveSWEP( ply, class, swep )
	return false
end

function startMessage()
	PrintMessage( HUD_PRINTTALK, "Round has started! The first one to have 20 Kills wins." )
	PrintMessage( HUD_PRINTTALK, "If the villain makes a kill, it counts x3." )
	PrintMessage( HUD_PRINTTALK, "So make sure to kill him quick ;)" )
	PrintMessage( HUD_PRINTTALK, "When the villain dies, another villain is selected at random." )
	PrintMessage( HUD_PRINTTALK, "The first villain will be selected after the first death." )
end
hook.Add("PlayerInitialSpawn", "startMessage", startMessage)

--[[
util.AddNetworkString("ServerMsg")
--]]

hook.Add("PlayerDeath","DoStuffPlayerDeath",function(victim, inflictor, attacker)
			
			-- CONSECUTIVE VILLAINS

			--SUICIDE WIN sollte gefixed sein--
			if (victim == attacker) then
				attacker:AddFrags( -4 )
				--PrintMessage( HUD_PRINTTALK, " x3" )
			end
			
           if (attacker:CanUseFlashlight() == true) and (victim ~= attacker) then
				attacker:AddFrags( 2 )
				--PrintMessage( HUD_PRINTTALK, " x3" )
			end
			
			if (victim:CanUseFlashlight() == true) and (victim ~= attacker) then
				attacker:AddFrags( 2 )
				--PrintMessage( HUD_PRINTTALK, " x3" )
			end		
			
			if ( attacker:Frags() >= 20 ) then
					PrintMessage( HUD_PRINTTALK, attacker:Name() .. " has won the round!" )
					PrintMessage( HUD_PRINTTALK, attacker:Name() .. " has won the round!" )
					PrintMessage( HUD_PRINTTALK, attacker:Name() .. " has won the round!" )
					PrintMessage( HUD_PRINTTALK, attacker:Name() .. " has won the round!" )
					PrintMessage( HUD_PRINTTALK, attacker:Name() .. " has won the round!" )
					timer.Simple( 3, function() RunConsoleCommand( "changelevel",  game.GetMap() ) end )
			end
			
			if victim:CanUseFlashlight() then
				--[[for k, v in pairs ( player.GetAll() ) do
					if (v:CanUseFlashlight()) then
						v:AllowFlashlight(false);
						--v:StopSound( "villainSound" )
						v:SetModel( "models/player/breen.mdl" )
						v:SetupHands()
					end
				end--]]
				victim:AllowFlashlight(false);
				--victim:StopSound( "villainSound" )
				victim:SetModel( "models/player/breen.mdl" )
				victim:SetupHands()
			
				local randomply = player.GetAll()[math.random(1,#player.GetAll())]
				PrintMessage( HUD_PRINTTALK, randomply:Name() .. " is the villain!" )
				randomply:AllowFlashlight(true)
				--randomply:EmitSound( "villainSound" )
				randomply:SetModel( "models/hitler.mdl" )
				welcheBoyAlarm(randomply)
				randomply:SetupHands()
	
				--[[
				-- https://www.youtube.com/watch?v=jREbAopWqKU&t=5s
				net.Start ("ServerMsg")
				net.WriteBool(false)
				net.Send( randomply )
				--]]
			end
			
			-- FIRST VILLAIN

			function villainExists()
				local count = 0;
	
				for k, v in pairs( player.GetAll() ) do
					if( v:CanUseFlashlight() )then
						count = count + 1;
					end
				end
	
			return count;
			end
			
			if villainExists() == 0 then
				--[[for k, v in pairs ( player.GetAll() ) do
					if (v:CanUseFlashlight()) then
						v:AllowFlashlight(false);
					end
				end--]]
			
				local randomply = player.GetAll()[math.random(1,#player.GetAll())]
				PrintMessage( HUD_PRINTTALK, randomply:Name() .. " is the villain!" )
				randomply:AllowFlashlight(true)
				--randomply:EmitSound( "villainSound" )
				randomply:SetModel( "models/hitler.mdl" )
				welcheBoyAlarm(randomply)
				randomply:SetupHands()
			end
			
end)