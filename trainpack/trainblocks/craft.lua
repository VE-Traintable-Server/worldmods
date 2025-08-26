-- trainblocks/craft.lua
-- Crafting recipes for trainblocks
--[[
  Copyright (C) 2018  maxx, LuLa, gpcf
  Copyright (C) 2024  1F616EMO

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU Affero General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU Affero General Public License for more details.

  You should have received a copy of the GNU Affero General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]

-- Switch between modern station blocks
core.register_craft({
	type = 'shapeless',
	output = 'trainblocks:station_block_modern',
	recipe = { 'trainblocks:station_block' }
})

core.register_craft({
	type = 'shapeless',
	recipe = { 'trainblocks:station_block_modern' },
	output = 'trainblocks:station_block'
})

-- Switch betwen modern station direction signs and older style
-- from https://github.com/Montandalar/trainblocks/commit/4f4f6004e1e5067969fcc0efd8785a55ef36a6e2

core.register_craft({
	type = "shapeless",
	output = 'trainblocks:stationsignR_modern',
	recipe = { 'trainblocks:stationsignR' }
})
core.register_craft({
	type = "shapeless",
	output = 'trainblocks:stationsignL_modern',
	recipe = { 'trainblocks:stationsignL' }
})
core.register_craft({
	type = "shapeless",
	recipe = { 'trainblocks:stationsignR_modern' },
	output = 'trainblocks:stationsignR'
})
core.register_craft({
	type = "shapeless",
	recipe = { 'trainblocks:stationsignL_modern' },
	output = 'trainblocks:stationsignL'
})

if not core.global_exists("xcompat") then return end

local materials = xcompat.materials

core.register_craft({
	output = 'trainblocks:subwayblock',
	recipe = {
		{ '',                  materials.dye_blue, '' },
		{ materials.dye_white, materials.glass,    materials.dye_white },
		{ '',                  materials.dye_blue, '' },
	}
})

core.register_craft({
	output = 'trainblocks:sbahnblock',
	recipe = {
		{ '',                  materials.dye_green, '' },
		{ materials.dye_white, materials.glass,     materials.dye_white },
		{ '',                  materials.dye_green, '' },
	}
})

-- lineblocks from 1 to 10
-- gray -> grey from https://github.com/Montandalar/trainblocks/commit/5e6f906f7d5716127a4b760df8bc6ea1f61c84ea
-- Bonus: Line 0
local dyes1 = { "blue", "blue", "red", "violet", "green", "orange", "yellow", "grey", "magenta", "cyan", "black" }
local dyes2 = { "blue", "white", "white", "white", "white", "white", "black", "white", "white", "white", "white" }

for count = 0, 10, 1 do
	local dye1 = materials["dye_" .. dyes1[count + 1]]
	local dye2 = materials["dye_" .. dyes2[count + 1]]
	core.register_craft({
		output = "trainblocks:line" .. count .. " 4",
		recipe = {
			{ '',   dye1,            '' },
			{ dye2, materials.glass, '' },
		}
	})
end



--subway direction signs

core.register_craft({
	output = 'trainblocks:subwaysignL 2',
	recipe = {
		{ materials.dye_white, materials.glass, materials.dye_blue }
	}
})

core.register_craft({
	output = 'trainblocks:subwaysignR 2',
	recipe = {
		{ materials.dye_blue, materials.glass, materials.dye_white },
	}
})

--sbahn direction signs

core.register_craft({
	output = 'trainblocks:sbahnsignL 2',
	recipe = {
		{ materials.dye_white, materials.glass, materials.dye_green },
	}
})

core.register_craft({
	output = 'trainblocks:sbahnsignR 2',
	recipe = {
		{ materials.dye_blue, materials.glass, materials.dye_green },
	}
})

-- modern direction sign

core.register_craft({
	output = 'trainblocks:stationsignL_modern 2',
	recipe = {
		{ materials.dye_white, materials.glass, materials.dye_black },
	}
})

core.register_craft({
	output = 'trainblocks:stationsignR_modern 2',
	recipe = {
		{ materials.dye_black, materials.glass, materials.dye_white },
	}
})

-- Platform signs 0-10
-- from https://github.com/Montandalar/trainblocks/commit/f5e86f18f437ba3cb3337369d0b009e94dd5a8f5

core.register_craft({
	output = "trainblocks:platformsign0",
	recipe = {
		{ materials.dye_blue, materials.glass,     '' },
		{ '',                 materials.dye_white, '' },
	}
})

core.register_craft({
	output = "trainblocks:platformsign1",
	recipe = {
		{ materials.dye_blue, materials.glass, materials.dye_white },
		{ '',                 '',              materials.dye_white },
		{ '',                 '',              materials.dye_white }
	}
})

core.register_craft({
	output = "trainblocks:platformsign2",
	recipe = {
		{ materials.dye_blue,  materials.glass,     '' },
		{ materials.dye_white, materials.dye_white, '' },
	}
})

core.register_craft({
	output = "trainblocks:platformsign3",
	recipe = {
		{ materials.dye_blue,  materials.glass,     '' },
		{ materials.dye_white, materials.dye_white, materials.dye_white },
	}
})

core.register_craft({
	output = "trainblocks:platformsign4",
	recipe = {
		{ materials.dye_blue,  materials.glass,     '' },
		{ materials.dye_white, materials.dye_white, '' },
		{ materials.dye_white, materials.dye_white, '' }
	}
})

core.register_craft({
	output = "trainblocks:platformsign5",
	recipe = {
		{ materials.dye_blue,  materials.glass,     '' },
		{ materials.dye_white, materials.dye_white, materials.dye_white },
		{ materials.dye_white, materials.dye_white, '' }
	}
})

core.register_craft({
	output = "trainblocks:platformsign6",
	recipe = {
		{ materials.dye_blue,  materials.glass,     '' },
		{ materials.dye_white, materials.dye_white, materials.dye_white },
		{ materials.dye_white, materials.dye_white, materials.dye_white }
	}
})

core.register_craft({
	output = "trainblocks:platformsign7",
	recipe = {
		{ materials.dye_blue, materials.glass,     materials.dye_white },
		{ '',                 '',                  materials.dye_white },
		{ '',                 materials.dye_white, '' }
	}
})

core.register_craft({
	output = "trainblocks:platformsign8",
	recipe = {
		{ materials.dye_blue,  materials.glass,     materials.dye_white },
		{ materials.dye_white, '',                  materials.dye_white },
		{ materials.dye_white, materials.dye_white, materials.dye_white }
	}
})

core.register_craft({
	output = "trainblocks:platformsign9",
	recipe = {
		{ materials.dye_blue, materials.glass,     materials.dye_white },
		{ '',                 materials.dye_white, materials.dye_white },
		{ '',                 '',                  materials.dye_white }
	}
})

core.register_craft({
	output = "trainblocks:platformsign10",
	recipe = {
		{ materials.dye_blue,  materials.glass, '' },
		{ materials.dye_white, '',              '' },
		{ materials.dye_white, '',              materials.dye_white }
	}
})

-- Recipies for (modern) station blocks
-- from https://github.com/Montandalar/trainblocks/commit/735e61288ad55317d4fffcdb4e58b5feebc419d0

core.register_craft({
	output = 'trainblocks:station_block',
	recipe = {
		{ '',                  materials.dye_black, '' },
		{ materials.dye_white, materials.glass,     materials.dye_white },
		{ '',                  materials.dye_black, '' },
	}
})

-- Mountain Railway

core.register_craft({
	output = 'trainblocks:mr',
	recipe = {
		{ '',                  materials.dye_cyan, '' },
		{ materials.dye_yellow, materials.glass,     materials.dye_green },
		{ '',                  materials.dye_dark_green, '' },
	}
})

-- no_pedestrians signs

core.register_craft({
	type = 'shapeless',
	recipe = {
		materials.dye_red, materials.dye_white,
		materials.dye_black, materials.glass,
	},
	output = "trainblocks:no_pedestrians"
})

core.register_craft({
	type = 'shapeless',
	recipe = {
		materials.dye_red, materials.dye_yellow,
		materials.dye_black, materials.glass,
	},
	output = "trainblocks:durchgang_verboten"
})
