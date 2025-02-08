
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock/restock_single_chest","color":"light_purple"}]

# Log Output
$execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Chest being restocked: [ID: ","color":"aqua"},\
        {"text":"$(id)","color":"green"},\
        {"text":"] at position [","color":"aqua"},\
        {"text":"$(pos_x), $(pos_y), $(pos_z)","color":"gold","clickEvent":{"action":"suggest_command","value":"/tp @s $(pos_x) $(pos_y) $(pos_z)"}},\
        {"text":"]","color":"aqua"}]

$execute store result score .b_chunk_preloaded pln.util.restock run forceload query $(pos_x) $(pos_z)

execute if score .b_chunk_preloaded pln.util.restock matches 0 run \
    schedule function pln:util/on_restock/run_restock/restock_single_chest/forceload_for_restock/call 1t

# Slight delay to give the chunk time to load
schedule function pln:util/on_restock/run_restock/restock_single_chest/restock_chest/call 5t

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/run_restock/restock_single_chest","color":"red"}]