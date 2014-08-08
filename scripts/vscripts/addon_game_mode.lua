-- Generated from template

require('kaolin_football_stone_placer')

if KaolinFootball == nil then
	print ( '[KaolinFootball] Creating Kaolin Football game mode' )
		KaolinFootball = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
		PrecacheUnitByNameSync('npc_dota_hero_earth_spirit', context)
		PrecacheResource( "soundfile", "*.vsndevts", context )
    	PrecacheResource( "particle_folder", context )
		PrecacheUnitByNameSync('npc_precache_everything', context)
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = KaolinFootball()
	GameRules.AddonTemplate:InitGameMode()
end

function KaolinFootball:InitGameMode()
	print( "Kaolin Football is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
end

-- Evaluate the state of the game
function KaolinFootball:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end