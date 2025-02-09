
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/jungle_temple","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/jungle_temple
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/jungle_temple"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/jungle_temple","color":"red"}]