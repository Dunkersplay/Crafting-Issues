--TODO: POPULATE CRAFTING ITEMS AND RECIPES
PLUGIN.name = "Crafting"
PLUGIN.author = "ZeMysticalTaco"
PLUGIN.desc = "Replacing the business menu with crafting because that's a more sensible thing to do."
STORED_RECIPES = {}

function PLUGIN:AddRecipe(name, model, desc, requirements, results, id, skill, blueprint, guns, entity, category)
	if type(name) ~= "table" then
		local RECIPE = {}
		RECIPE["id"] = id --Unique ID of the recipe.
		RECIPE["name"] = name -- Name of the recipe.
		RECIPE["model"] = model -- Model it uses in the menu.
		RECIPE["desc"] = desc -- Description of what it is.
		RECIPE["req"] = requirements --Requirements to craft it(use item id's)
		RECIPE["results"] = results --Results of the craft (use item id's)
		RECIPE["blueprint"] = blueprint or false
		RECIPE["guns"] = guns or false
		RECIPE["entity"] = entity or false
		RECIPE["category"] = category or "Miscellaneous"

		if skill then
			RECIPE["skill"] = skill
		end

		STORED_RECIPES[id] = RECIPE
	else
		for k, v in pairs(name) do
		RECIPE["id"] = k --Unique ID of the recipe.
		RECIPE["name"] = v.name -- Name of the recipe.
		RECIPE["model"] = v.model -- Model it uses in the menu.
		RECIPE["desc"] = v.desc -- Description of what it is.
		RECIPE["req"] = v.requirements --Requirements to craft it(use item id's)
		RECIPE["results"] = v.results --Results of the craft (use item id's)
		RECIPE["blueprint"] = v.blueprint or false --Whether or not it uses a blueprint
		RECIPE["guns"] = v.guns or false --Whether or not it will level up your gunsmithing skill.
		RECIPE["entity"] = v.entity or false --FUTURE: Whether or not it will use an entity.
		RECIPE["category"] = v.category or "Miscellaneous" --FUTURE: The Category

		end
	end
end
--[[-------------------------------------------------------------------------
TODO: For release, demonstrate full capacity of plugin.
---------------------------------------------------------------------------]]
local NEW_RECIPES = {
	["lowlife"] = {
		["name"] = "Weapon: Lowlife",
		["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
		["desc"] = "Repair a previously broken pistol.",
		["requirements"] = {["broken_lowlife"] = 1, ["metal"] = 2, ["weapon_parts"] = 1, ["normal_screwdriver"] = 1, ["repair_kit"] = 1},
		["results"] = {["lowlife"] = 1},
		["category"] = "Weapons"
	},
	["bastard"] = {
		["name"] = "Weapon: Bastard",
		["model"] = "models/devcon/mrp/weapons/w_bastard.mdl",
		["desc"] = "Repair a previously broken SMG.",
		["requirements"] = {["broken_bastard"] = 1, ["metal"] = 3, ["weapon_parts"] = 1, ["normal_screwdriver"] = 1, ["repair_kit"] = 1},
		["results"] = {["bastard"] = 1},
		["category"] = "Weapons",
	},
	["duplet"] = {
		["name"] = "Weapon: Duplet",
		["model"] = "models/kali/weapons/metro 2033/duplet.mdl",
		["desc"] = "Repair a previously broken shotgun.",
		["requirements"] = {["broken_duplet"] = 1, ["metal"] = 2, ["weapon_parts"] = 1, ["normal_screwdriver"] = 1, ["repair_kit"] = 1},
		["results"] = {["doublet"] = 1},
		["category"] = "Weapons",
	},
	["flashlight"] = {
		["name"] = "Utilities: Flashlight",
		["model"] = "models/lagmite/lagmite.mdl",
		["desc"] = "Repair a previously broken flashlight.",
		["requirements"] = {["broken_flashlight"] = 1, ["battery"] = 1, ["normal_screwdriver"] = 1},
		["results"] = {["flashlight"] = 1},
		["category"] = "Utilities",
	},
	["handradio"] = {
		["name"] = "Utilities: Handheld Radio",
		["model"] = "models/deadbodies/dead_male_civilian_radio.mdl",
		["desc"] = "Repair a previously broken flashlight.",
		["requirements"] = {["broken_radio"] = 1, ["normal_screwdriver"] = 1, ["tape"] = 1, ["battery"] = 1, ["electronics"] = 1},
		["results"] = {["handheld_radio"] = 1},
		["category"] = "Utilities",
	},
	["paper_porn"] = {
		["name"] = "Materials: Pieces of paper",
		["model"] = "models/kek1ch/notes_document_case_3.mdl",
		["desc"] = "Get a nice pieces of paper for writing on from a porno magazine.",
		["requirements"] = {["porn"] = 1, ["normal_sciss"] = 1},
		["results"] = {["paper"] = 3},
		["category"] = "Materials",
	},
	["paper_newspaper"] = {
		["name"] = "Materials: Pieces of paper",
		["model"] = "models/kek1ch/notes_document_case_3.mdl",
		["desc"] = "Get a nice pieces of paper for writing on from a newspaper.",
		["requirements"] = {["newspaper"] = 1, ["normal_sciss"] = 1},
		["results"] = {["paper"] = 4},
		["category"] = "Materials",
	},
	["bandage"] = {
		["name"] = "Medicine: Bandage",
		["model"] = "models/props_wasteland/prison_toiletchunk01f.mdl",
		["desc"] = "Clean the cloth from dirt and pack it in a tampon.",
		["requirements"] = {["newspaper"] = 1, ["mushroom_vodka"] = 1},
		["results"] = {["bandage"] = 1},
		["category"] = "Medicine",
	},
	["porn"] = {
		["name"] = "Other: Porn magazine",
		["model"] = "models/kek1ch/notes_writing_book_2.mdl",
		["desc"] = "Haha! You really just need it, man.",
		["requirements"] = {["paper"] = 12, ["tape"] = 1},
		["results"] = {["porn"] = 1},
		["category"] = "Materials",
	}
}

for k, v in pairs(NEW_RECIPES) do
	PLUGIN:AddRecipe(v.name, v.model, v.desc, v.requirements, v.results, k, v.skill or nil, v.blueprint or nil, v.guns or nil, v.entity or nil, v.category or "Miscellaneous")
end

--[[-------------------------------------------------------------------------
Tying in with the 'Citizen Production Plugin', adding schematics for study.
---------------------------------------------------------------------------]]
for k, v in pairs(ix.item.list) do
	if v.category == "Schematics" then
		local tbl = v.requirements
		local tbl2 = v.result
		local req_table_empty = {}
		local res_table_empty = {}
		for k2, v2 in pairs(tbl) do
			req_table_empty[v2[1]] = v2[2]
		end
		for k3,v3 in pairs(tbl2) do
			if v3[1] != "manufacturing_ticket" then
				res_table_empty[v3[1]] = v3[2]
			end
		end
		PLUGIN:AddRecipe(v.name, v.model, v.description .. "\nYou studied this blueprint from the factories.", req_table_empty, res_table_empty, v.uniqueID, false, v.uniqueID)
	end
end

ix.util.Include("cl_plugin.lua")
ix.util.Include("sv_plugin.lua")
ix.util.Include("sh_items.lua")

ix.command.Add("BlueprintGive", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if not table.HasValue(data, blueprint) then
			table.insert(data, blueprint)
		else
			client:Notify(target:GetName() .. " already has this blueprint.")

			return
		end

		target:SetData("blueprints", data)
		client:Notify("You have given " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have been given the blueprint " .. blueprint .. " by " .. client:Name())
	end
})

ix.command.Add("BlueprintRemove", {
	description = "Give a blueprint to a player.",
	adminOnly = true,
	arguments = {ix.type.character, ix.type.string},
	OnRun = function(self, client, target, blueprint)
		local data = target:GetData("blueprints", {})

		if table.HasValue(data, blueprint) then
			table.RemoveByValue(data, blueprint)
		else
			client:Notify(target:GetName() .. " does not have this blueprint.")
		end

		target:SetData("blueprints", data)
		client:Notify("You have taken " .. target:GetName() .. " the blueprint " .. blueprint .. ".")
		target.player:Notify("You have had the blueprint " .. blueprint .. " taken from you by " .. client:Name())
	end
})

local charMeta = ix.meta.character

function charMeta:GiveBlueprint(blueprint)
	local data = self:GetData("blueprints", {})

	if not table.HasValue(data, blueprint) then
		table.insert(data, blueprint)
	end

	self:SetData("blueprints", data)
end

function charMeta:RemoveBlueprint(blueprint)
	local data = target:GetData("blueprints", {})

	if table.HasValue(data, blueprint) then
		table.RemoveByValue(data, blueprint)
	end

	target:SetData("blueprints", data)
end