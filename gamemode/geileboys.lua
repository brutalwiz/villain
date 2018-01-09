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
			ReadSound("ps.wav")
		end
		if ply:SteamID() == "STEAM_0:1:32816605" --[[ N --]] then
			ReadSound("n.wav")
		end
		if ply:SteamID() == "STEAM_0:0:35756073" --[[ L --]] then
			ReadSound("l.wav")
		end
		if ply:SteamID() == "STEAM_0:0:43369543" --[[ V --]] then
			ReadSound("v.wav")
		end
		if ply:SteamID() == "STEAM_0:0:43369543" --[[ M --]] then
			ReadSound("m.wav")
		end
	end
end