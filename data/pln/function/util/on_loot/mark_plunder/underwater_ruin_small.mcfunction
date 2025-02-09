
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/underwater_ruin_small","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/underwater_ruin_small
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/underwater_ruin_small"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/underwater_ruin_small","color":"red"}]