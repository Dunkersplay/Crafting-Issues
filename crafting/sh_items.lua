--To add a new item or remove an item, this is the file to do it.

local ITEMS = {}

ITEMS.broken_bastard = {
	["name"] = "Broken Bastard",
	["model"] = "models/devcon/mrp/weapons/w_bastard.mdl",
	["description"] = "It's broken, maybe jammed or something else, but it can still be repaired.",
	["width"] = 3,
	["height"] = 2,
	["chance"] = 30
}

ITEMS.broken_duplet = {
	["name"] = "Broken Duplet",
	["model"] = "models/kali/weapons/metro 2033/duplet.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 4,
	["height"] = 2,
	["chance"] = 20
}

ITEMS.broken_lowlife = {
	["name"] = "Broken Lowlife",
	["model"] = "models/kali/weapons/metro 2033/lolife.mdl",
	["description"] = "The mechanisms are badly damaged, you can’t shoot from it, but you can still fix it.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 45
}

ITEMS.broken_flashlight = {
	["name"] = "Broken Flashlight",
	["model"] = "models/lagmite/lagmite.mdl",
	["description"] = "Flashlight with broken glass and no batteries. However, it can still be fixed.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 80
}

ITEMS.metal = {
	["name"] = "Scrap metal",
	["model"] = "models/gibs/manhack_gib01.mdl",
	["description"] = "The basic material for creating anything is appreciated everywhere.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 60 --This is used for the 'item spawner plugin' this defines how many 'tickets' the item gets to spawn.
}

ITEMS.tape = {
	["name"] = "Insulating tape",
	["model"] = "models/props_junk/duct_tape.mdl",
	["description"] = "Insulating tape.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40 --This is used for the 'item spawner plugin' this defines how many 'tickets' the item gets to spawn.
}

ITEMS.battery = {
	["name"] = "Battery",
	["model"] = "models/hardbass/battery.mdl",
	["description"] = "A battery.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 17
}

ITEMS.gunpowder = {
	["name"] = "Gunpowder",
	["model"] = "models/hardbass/money_meshochek.mdl",
	["description"] = "Gunpowder in a pouch.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 11
}

ITEMS.rifle_shells = {
	["name"] = "5.45x39 mm shells",
	["model"] = "models/maver1k_xvii/stalker/props/weapons/ammo/wpn_mines_2.mdl",
	["description"] = "A bunch of shells.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 10
}

ITEMS.shotgun_shells = {
	["name"] = "12x70 mm shells",
	["model"] = "models/maver1k_xvii/stalker/props/weapons/ammo/wpn_mines_2.mdl",
	["description"] = "A bunch of shells.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 9
}

ITEMS.weapon_parts = {
	["name"] = "Weapon parts",
	["model"] = "models/props_lab/box01a.mdl",
	["description"] = "Old weapon parts.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 46
}

ITEMS.repair_kit = {
	["name"] = "Weapon parts",
	["model"] = "models/hardbass/safe_container.mdl",
	["description"] = "In this container are small mechanisms from different types of weapons that are capable or repairing other weapons.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 30,
	["tool"] = true
}

ITEMS.newspaper = {
	["name"] = "Pre-war newspaper",
	["model"] = "models/props_junk/garbage_newspaper001a.mdl",
	["description"] = "An old newspaper that went out before the war.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 25
}

ITEMS.broken_radio = {
	["name"] = "Broken Handheld Radio",
	["model"] = "models/deadbodies/dead_male_civilian_radio.mdl",
	["description"] = "A broken radio without batteries and some wires sticking out of it.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 19
}

ITEMS.doll = {
	["name"] = "Doll",
	["model"] = "models/props_c17/doll01.mdl",
	["description"] = "An old shabby doll.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 90
}

ITEMS.porn = {
	["name"] = "Porn magazine",
	["model"] = "models/props_lab/binderblue.mdl",
	["description"] = "Strongly appreciated among Metro residents.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 78
}

ITEMS.fabric = {
	["name"] = "Fabric",
	["model"] = "models/devcon/mrp/props/carpet_roll_2.mdl",
	["description"] = "There are many things you can do with it.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 40
}

ITEMS.electronics = {
	["name"] = "Electronics",
	["model"] = "models/props_lab/reciever01d.mdl",
	["description"] = "One of the important components for a lot of things.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 17
}

ITEMS.normal_hammer = {
	["name"] = "Hammer",
	["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
	["description"] = "A hammer devised of several tools.",
	["width"] = 1,
	["height"] = 2,
	["chance"] = 27,
	["tool"] = true
}

ITEMS.normal_saw = {
	["name"] = "Circular saw",
	["model"] = "models/props/cs_militia/circularsaw01.mdl",
	["description"] = "Heavy circular saw. You know what it's for.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 67,
	["tool"] = true
}

ITEMS.normal_sciss = {
	["name"] = "Scissors",
	["model"] = "models/Gibs/wood_gib01a.mdl",
	["description"] = "A very sharp tool.",
	["width"] = 1,
	["height"] = 1,
	["chance"] = 50,
	["tool"] = true
}

ITEMS.normal_screwdriver = {
	["name"] = "Screwdriver",
	["model"] = "models/props_c17/TrapPropeller_Lever.mdl",
	["description"] = "A full fledged screwdriver.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 80,
	["tool"] = true
}

ITEMS.normal_clipper = {
	["name"] = "Clippers",
	["model"] = "models/props_c17/tools_pliers01a.mdl",
	["description"] = "This seems like an useful thing.",
	["width"] = 1,
	["height"] = 2,
	["chance"] = 77,
	["tool"] = true
}

ITEMS.normal_wrench = {
	["name"] = "Wrench",
	["model"] = "models/props_c17/tools_wrench01a.mdl",
	["description"] = "A very uselful tool.",
	["width"] = 2,
	["height"] = 1,
	["chance"] = 53,
	["tool"] = true
}


for k, v in pairs(ITEMS) do
	local ITEM = ix.item.Register(k, nil, false, nil, true)
	ITEM.name = v.name
	ITEM.model = v.model
	ITEM.description = v.description
	ITEM.category = "Крафтинг"
	ITEM.width = v.width or 1
	ITEM.height = v.height or 1
	ITEM.chance = v.chance or 0
	ITEM.isTool = v.tool or false
end