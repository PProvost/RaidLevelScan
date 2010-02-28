-- This is a sample of what will be produced by this module
local raidResults = {
	["Quaiche-Dragonblight"] = {
		["name"] = "Quaiche",
		["class"] = "Druid",
		["spec"] = "0/60/11",

		["HEADSLOT"] = {
			iLevel = 160,
			quality = 2, -- 2 is green
			itemLink = "itemlink",
			enchantLink = "enchantItemLink",
			gemLinks = {
				[0] = "gemItemLink",
				[1] = "gemItemLink",
				[2] = "EMPTY",
			}
		},

		["SHOULDERSLOT"] = {
			iLevel = 200,
			quality = 4, -- 4 is epic
			itemLink = "itemLink",
			enchantLink = "enchantItemLink",
			gemLinks = {
				[0] = "EMPTY",
				[1] = "EMPTY",
			},
		},

		-- etc
	},
}
