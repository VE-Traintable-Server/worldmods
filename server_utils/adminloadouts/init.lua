minetest.register_chatcommand("as", {
   params = "",
   description = "[Admin Set] of tools.",
   privs = {areas = true, worldedit = true,},
   func = function(name, param)
      for i=1,32,1 do
         local loadout = {
            "worldedit:wand",
            "maptools:pick_admin",
            "screwdriver:screwdriver",
            "replacer:replacer"
         }
         minetest.get_inventory({type="player",name=name}):set_stack("main",i,ItemStack(loadout[i])) 
      end
   end,
})

minetest.register_chatcommand("at", {
   params = "",
   description = "[AdvTrains] Admin Set of tools.",
   privs = {track_builder = true, interlocking = true, },
   func = function(name, param)
      for i=1,32,1 do
         local loadout = {
            "advtrains:copytool",
            "bike:painter",
            "advtrains:trackworker",
            "advtrains_interlocking:tool",
            "advtrains:dtrack_placer"
         }
         minetest.get_inventory({type="player",name=name}):set_stack("main",i,ItemStack(loadout[i])) 
      end
   end,
})

minetest.register_chatcommand("ad", {
   params = "",
   description = "[Advtrains Dxl] Admin Set of tools.",
   privs = {train_operator = true,},
   func = function(name, param)
      for i=1,32,1 do
         local loadout = {
            "dlxtrains:age_selector",
            "dlxtrains:wagon_updater",
            "dlxtrains:livery_selector",
         }
         minetest.get_inventory({type="player",name=name}):set_stack("main",i,ItemStack(loadout[i])) 
      end
   end,
})

