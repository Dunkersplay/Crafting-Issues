
local PLUGIN = PLUGIN

PLUGIN.spawner = PLUGIN.spawner or {}
PLUGIN.items = PLUGIN.items or {}
PLUGIN.spawner.positions = PLUGIN.spawner.positions or {}

PLUGIN.items.common = {
	"broken_flashlight"
	"flashlight"
	"tape"
	"battery"
	"gunpowder"
	"newspaper"
	"porn"
	"normal_saw"
	"normal_sciss"
	"normal_screwdriver"
	"normal_clipper"
	"normal_wrench"	
	"doll"
	"milk_carton"
	"canned_soup"
	"baked_beans"
	"coffee"
	"mushroom_vodka"
	"ashot"
	"bandage"
	"melon"
	"vodka"
	"water"
	"zip_tie"
}
PLUGIN.items.rare = {
	"broken_bastard"
	"broken_duplet"
	"broken_lowlife"
	"repair_kit"
	"electronics"
	"normal_hammer"
	"rifle_shells"
	"shotgun_shells"
	"weapon_parts"
	"repair_kit"
	"broken_radio"
	"tihar"
	"saiga"
	"uboinik"
	"lowlife"
	"grenade"
	"357"
	"doublet"
	"bastard"
	"kalash"
	"kalash_special"
	"vsv"
	"guitar"
}

util.AddNetworkString("ixItemSpawnerManager")
util.AddNetworkString("ixItemSpawnerDelete")
util.AddNetworkString("ixItemSpawnerEdit")
util.AddNetworkString("ixItemSpawnerGoto")
util.AddNetworkString("ixItemSpawnerSpawn")
util.AddNetworkString("ixItemSpawnerChanges")

function PLUGIN:LoadData()
	PLUGIN.spawner.positions = self:GetData() or {}
end

function PLUGIN:SaveData()
	self:SetData(PLUGIN.spawner.positions)
end

function PLUGIN:AddSpawner(client, position, title)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local respawnTime = ix.config.Get("spawnerRespawnTime", 600)
	local offsetTime  = ix.config.Get("spawnerOffsetTime", 100)
	if (respawnTime < offsetTime) then
		offsetTime = respawnTime - 60
	end

	table.insert(PLUGIN.spawner.positions, {
		["ID"] = os.time(),
		["title"] = title,
		["delay"] = math.random(respawnTime - offsetTime, respawnTime + offsetTime),
		["lastSpawned"] = os.time(),
		["author"] = client:SteamID64(),
		["position"] = position,
		["rarity"] = ix.config.Get("spawnerRareItemChance", 0)
	})

end

function PLUGIN:RemoveSpawner(client, title)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.title:lower() == title:lower()) then
			table.remove(PLUGIN.spawner.positions, k)
			return true
		end
	end
	return false
end

function PLUGIN:ForceSpawn(client, spawner)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end
	if !(ix.config.Get("spawnerActive")) then return end

	spawner.lastSpawned = os.time()
	local rareChance = math.random(100)
	if (rareChance > tonumber(spawner.rarity)) then
		ix.item.Spawn(table.Random(PLUGIN.items.common), spawner.position)
	else
		ix.item.Spawn(table.Random(PLUGIN.items.rare), spawner.position)
	end
end

function PLUGIN:Think()
	if (table.IsEmpty(PLUGIN.spawner.positions) or !(ix.config.Get("spawnerActive", false))) then return end

	for k, v in pairs(PLUGIN.spawner.positions) do
		if (v.lastSpawned + (v.delay * 60) < os.time()) then
			v.lastSpawned = os.time()
			local rareChance = math.random(100)
			if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
				ix.item.Spawn(table.Random(PLUGIN.items.rare), v.position)
			else
				ix.item.Spawn(table.Random(PLUGIN.items.common), v.position)
			end
		end
	end
end

net.Receive("ixItemSpawnerDelete", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadString()
	PLUGIN:RemoveSpawner(client, item)
end)

net.Receive("ixItemSpawnerGoto", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local position = net.ReadVector()
	client:SetPos(position)
end)

net.Receive("ixItemSpawnerSpawn", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadTable()
	PLUGIN:ForceSpawn(client, item)
end)

net.Receive("ixItemSpawnerChanges", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local changes = net.ReadTable()

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.ID == changes[1]) then
			v.title = changes[2]
			v.delay = math.Clamp(changes[3], 1, 10000)
			v.rarity  = math.Clamp(changes[4], 0, 100)
		end
	end

end)
