
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/bastion_other","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/bastion_other
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/bastion_other"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/bastion_other","color":"red"}]