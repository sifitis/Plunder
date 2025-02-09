
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/woodland_mansion","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/woodland_mansion
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/woodland_mansion"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/woodland_mansion","color":"red"}]