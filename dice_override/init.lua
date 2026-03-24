core.override_item("scifi_nodes:Doom_door_closed", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:Doom_door_opened", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:Doom_door_closed_top", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:Doom_door_opened_top", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:blue_door_closed", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:blue_door_opened", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:blue_door_closed_top", {use_texture_alpha = "clip"})
core.override_item("scifi_nodes:blue_door_opened_top", {use_texture_alpha = "clip"})
angledstairs.register_angled_stair_and_angled_slab("_white_baked_clay", "bakedclay:white",
		{cracky = 3},
		{"baked_clay_white.png"},
		"White Baked Clay Stair",
		"White Baked Clay Slab",
		default.node_sound_stone_defaults())
