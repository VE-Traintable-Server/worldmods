ju75={}
ju75.gravity = tonumber(minetest.settings:get("movement_gravity")) or 9.8
ju75.wing_angle_of_attack = 0.8
ju75.min_speed = 4
ju75.max_speed = 24 --9
ju75.max_engine_acc = 18 --8
ju75.lift = 2.6 --8 --12
ju75.trunk_slots = 50

ju75.colors ={
    black='#2b2b2b',
    blue='#0063b0',
    brown='#8c5922',
    cyan='#07B6BC',
    dark_green='#567a42',
    dark_grey='#6d6d6d',
    green='#4ee34c',
    grey='#9f9f9f',
    magenta='#ff0098',
    orange='#ff8b0e',
    pink='#ff62c6',
    red='#dc1818',
    violet='#a437ff',
    white='#FFFFFF',
    yellow='#ffe400',
}

ju75.skin_texture = "ju75_painting.png"
ju75.textures = {
    "ju75_metal.png", --bequilha
    "ju75_brown.png", --assentos pilotos
    "ju75_brown.png", --assentos passageiros
    "ju75_brown.png", --assentos passageiros
    "ju75_brown.png", --assentos passageiros
    "ju75_brown.png", --assentos passageiros
    "ju75_brown.png", --assentos passageiros
    ju75.skin_texture, --proteção motor
    "ju75_metal.png", "ju75_black.png", --escapamento
    ju75.skin_texture, --superficies controle
    "ju75_compass.png", --bussola
    "ju75_white.png", --ponteiros
    "ju75_metal.png", "ju75_black.png", --manetes potencia
    "ju75_glass.png", --vidro porta
    "ju75_bege.png", --interno porta
    "ju75_compass_plan.png", --indicador ADF
    "ju75_engine.png", "ju75_black.png", --motor
    "ju75_engine.png", "ju75_black.png", --motores
    ju75.skin_texture, --fuselagem
    "ju75_black.png", -- aros mostradores
    "ju75_climber.png", --climbers
    "ju75_speed.png", --indicadores de velocidade
    "ju75_altimeter.png", --altimetros
    "ju75_fuel.png", --combustivel
    "ju75_compass_ind.png", --indicador da bussola
    "ju75_glass.png", -- vidros laterais
    ju75.skin_texture, -- estabilizador horizontal
    "ju75_bege.png", -- interior
    "ju75_metal.png", "ju75_black.png", --assoalho
    "ju75_metal.png", -- interno cabine - pes
    "ju75_bege.png", -- interior cauda
    ju75.skin_texture, --trem de pouso
    "ju75_panel_color.png", "ju75_black.png", --painel
    "ju75_panel_color.png", "ju75_black.png", --console de manetes
    "ju75_black.png", "ju75_metal.png", --pneu da bequilha
    ju75.skin_texture, --estabilizador vertical
    "ju75_black.png", "ju75_metal.png", --pneus do trem principal
    "ju75_glass.png", "ju75_metal.png", -- vidros parabrisa
    ju75.skin_texture, --asas
    --"ju75_red.png", --
    --"ju75_white.png", --asas
}


dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_global_definitions.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_crafts.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_control.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_fuel_management.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_custom_physics.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_utilities.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_entities.lua")
dofile(minetest.get_modpath("ju75") .. DIR_DELIM .. "ju75_forms.lua")

--
-- helpers and co.
--

--
-- items
--

-- add chatcommand to eject from demoiselle

minetest.register_chatcommand("ju75_eject", {
	params = "",
	description = "Ejects from ju75",
	privs = {interact = true},
	func = function(name, param)
        local colorstring = core.colorize('#ff0000', " >>> you are not inside your ju75")
        local player = minetest.get_player_by_name(name)
        local attached_to = player:get_attach()

		if attached_to ~= nil then
            local parent = attached_to:get_attach()
            if parent ~= nil then
                local entity = parent:get_luaentity()
                if entity.driver_name == name and entity.name == "ju75:ju75" then
                    ju75.dettachPlayer(entity, player)
                else
			        minetest.chat_send_player(name,colorstring)
                end
            end
		else
			minetest.chat_send_player(name,colorstring)
		end
	end
})


