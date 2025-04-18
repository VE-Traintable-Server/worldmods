lib = filterpp_lib

local reviewers = {}

minetest.register_privilege("filter++_reviewer",
{
	description = "players with this privilege will get reports about violations whenever they happen",
	give_to_admin = true,

	on_grant = function(name, granter_name)
		table.insert(reviewers, name)
	end,

	on_revoke = function(name, granter_name)
		local idx = table.indexof(reviewers, name)

		table.remove(reviewers, idx)
	end
})

minetest.register_on_joinplayer(function(player)
	if minetest.check_player_privs(player:get_player_name(), "filter++_reviewer") then
		table.insert(reviewers, player:get_player_name())
	end
end)

minetest.register_on_chat_message(function(name, message)
	local should_censor, bad_words = lib.filter_text(message)

	if should_censor then
		local censored_message = ""
		local last_badword_idx = 1

		for _, wordinfo in pairs(bad_words) do
			if wordinfo[1] ~= 1 then
				censored_message = censored_message .. message:sub(last_badword_idx, wordinfo[1] - 1)
			end
			censored_message = censored_message .. string.rep("*", wordinfo[2] - wordinfo[1] + 1)
			last_badword_idx = wordinfo[2] + 1
		end

		censored_message = censored_message .. message:sub(last_badword_idx)

		--minetest.chat_send_all(minetest.colorize("red", "!!!") .. "(" .. name .. ") " .. censored_message)
		minetest.kick_player(name, "You have been kicked for using word/s we do not allow on here.")
		lib.report_violation(name, message, bad_words)

		return true
	end
end)

lib.register_on_violation(function(name, message, bad_words)
	local report_message = minetest.colorize("yellow", name .. " said illegal words:")
	local _, whole_bad_words = lib.filter_text(message, true)

	for i = 1, #bad_words do
		local range = whole_bad_words[i]
		if range then  -- Ensure range exists
			local start_idx, end_idx = unpack(range)
			if start_idx and end_idx then  -- Ensure both indices exist before using them
				report_message = report_message .. string.format(
					' "%s" (Detected: "%s")',
					minetest.colorize("yellow", message:sub(start_idx, end_idx)),
					message:sub(start_idx, end_idx)
				)
			end
		end
	end	

	-- Only send the report if bad words were actually detected
	if #bad_words > 0 then
		for _, reviewer_name in pairs(reviewers) do
			minetest.chat_send_player(reviewer_name, report_message)
		end

		if minetest.get_modpath("warn") then
			warn_system.give_warn(name, "swore")
		end
	end
end)

