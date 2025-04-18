--Made by AlcesAlces and Elefant, thanks you two!
--based on the advtrains_train_japan code by orwell
local S = attrans

advtrains.register_wagon("class_810", {
	mesh="class_810.b3d",
	textures = {"class_810.png"},
	drives_on={default=true},
	max_speed=15,
	seats = {
		{
			name=S("Driver stand"),
			attach_offset={x=0, y=1, z=27},
			view_offset={x=0, y=0, z=25},
			group="dstand",
		},
		{
			name="1",
			attach_offset={x=-4, y=1, z=0},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="2",
			attach_offset={x=4, y=1, z=0},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="3",
			attach_offset={x=-4, y=1, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
		{
			name="4",
			attach_offset={x=4, y=1, z=-8},
			view_offset={x=0, y=0, z=0},
			group="pass",
		},
	},
	seat_groups = {
		dstand={
			name = "Driver Stand",
			access_to = {"pass"},
			require_doors_open=true,
			driving_ctrl_access=true,
		},
		pass={
			name = "Passenger area",
			access_to = {"dstand"},
			require_doors_open=true,
		},
	},
	assign_to_seat_group = {"dstand", "pass"},
	doors={
		open={
			[-1]={frames={x=0, y=20}, time=1},
			[1]={frames={x=40, y=60}, time=1}
		},
		close={
			[-1]={frames={x=20, y=40}, time=1},
			[1]={frames={x=60, y=80}, time=1}
		}
	},
	door_entry={-1,1},
	visual_size = {x=1, y=1},
	wagon_span=3,
	is_locomotive=true,
	collisionbox = {-1.0,-0.5,-2.5, 1.0,2.5,2.5},
	drops={"default:steelblock 4"},
	horn_sound = "810_horn",
}, S("CS Class 810"), "class_810_inv.png")
