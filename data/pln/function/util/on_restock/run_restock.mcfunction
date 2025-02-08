
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock [ID: ","color":"light_purple"},\
        {"nbt":"root.manifest.matured.entries[0].id","storage":"pln:data","color":"green"},\
        {"text":"]","color":"light_purple"}\
        ]

scoreboard players set .b_is_entry pln.util.restock 0
execute if data storage pln:data root.manifest.matured.entries[0] run \
    scoreboard players set .b_is_entry pln.util.restock 1

# --- Restock scheduled chests
execute if score .b_is_entry pln.util.restock matches 1 run \
    function pln:util/on_restock/run_restock/restock_single_chest with storage pln:data root.manifest.matured.entries[0]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_is_entry pln.util.restock matches 0 run tellraw @a \
        [{"text":"-No additional records exist. Ending restock.","color":"aqua"}]

# --- End Restock
execute if score .b_is_entry pln.util.restock matches 0 run \
    function pln:util/on_restock/end_restock

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/run_restock","color":"red"}]