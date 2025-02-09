
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/village/village_savanna_house","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/village/village_savanna_house
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/village/village_savanna_house"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/village/village_savanna_house","color":"red"}]