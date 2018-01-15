if !ConVarExists("sv_geileboys") then
    CreateConVar("sv_geileboys", '1', FCVAR_NOTIFY)
end

--- https://wiki.garrysmod.com/page/Global/CreateSound ---
local LoadedSounds
if CLIENT then
	LoadedSounds = {} -- this table caches existing CSoundPatches
end

local function ReadSound( FileName ) 
	local sound
	local filter
	if SERVER then
		filter = RecipientFilter()
		filter:AddAllPlayers()
	end
	if SERVER or !LoadedSounds[FileName] then
		-- The sound is always re-created serverside because of the RecipientFilter.
		sound = CreateSound( game.GetWorld(), FileName, filter ) -- create the new sound, parented to the worldspawn ( which always exists )
		if sound then
			sound:SetSoundLevel( 0 ) -- play everywhere
			if CLIENT then
				LoadedSounds[FileName] = { sound, filter } -- cache the CSoundPatch
			end
		end
	else
		sound = LoadedSounds[FileName][1]
		filter = LoadedSounds[FileName][2]
	end
	if sound then
		if CLIENT then
			sound:Stop() -- it won't play again otherwise
		end
		sound:Play()
	end
	return sound -- useful if you want to stop the sound yourself
end
--- /// ---

function welcheBoyAlarm(ply)
	if (GetConVarNumber("sv_geileboys") == 1) then
		if ply:SteamID() == "STEAM_0:0:64912419" --[[ PS --]] then
			ReadSound("ps.mp3")
		end
		if ply:SteamID() == "STEAM_0:1:32816605" --[[ N --]] then
			ReadSound("n.mp3")
		end
		if ply:SteamID() == "STEAM_0:0:35756073" --[[ L --]] then
			ReadSound("l.mp3")
		end
		if ply:SteamID() == "STEAM_0:0:43369543" --[[ V --]] then
			ReadSound("v.mp3")
		end
		if ply:SteamID() == "STEAM_0:1:36763534" --[[ M --]] then
			ReadSound("m.mp3")
		end
	end
end

--[[ CUSTOM PLAYERMODELS --]]

function customModelForTheBoys(ply)
	if ply:SteamID() == "STEAM_0:0:64912419" --[[ PS --]] then
		ply:SetModel( "models/t37/papaj.mdl" )
	end
	if ply:SteamID() == "STEAM_0:1:32816605" --[[ N --]] then
		--ply:SetModel( "models/player/breen.mdl" )
	end
	if ply:SteamID() == "STEAM_0:0:35756073" --[[ L --]] then
		ply:SetModel( "models/player/voikanaa/snoop_dogg.mdl" )
	end
	if ply:SteamID() == "STEAM_0:0:43369543" --[[ V --]] then
		ply:SetModel( "models/player/overwatch/genji.mdl" )
	end
	if ply:SteamID() == "STEAM_0:1:36763534" --[[ M --]] then
		ply:SetModel( "models/rottweiler/morganfreeman.mdl" )
	end
end