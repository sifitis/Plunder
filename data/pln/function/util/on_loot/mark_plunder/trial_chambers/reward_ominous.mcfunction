
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Looting Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/mark_plunder/trial_chambers/reward_ominous","color":"light_purple"}]

advancement revoke @s only pln:util/detect_table_gen/trial_chambers/reward_ominous
function pln:util/on_loot/process_looted_chest {loot_table:"minecraft:chests/trial_chambers/reward_ominous"}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/mark_plunder/trial_chambers/reward_ominous","color":"red"}]