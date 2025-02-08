
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock/restock_single_chest/forceload_for_restock","color":"light_purple"}]

# Log Output
$execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Chunk forceloaded: [","color":"aqua"},{"text":"$(pos_x) by $(pos_z)","color":"green"},{"text":"]","color":"aqua"}]

$forceload add $(pos_x) $(pos_z)

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/run_restock/restock_single_chest/forceload_for_restock","color":"red"}]