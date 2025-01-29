
scoreboard players set .b_is_entry pln.util.restock 0
execute if data storage pln:data root.manifest.matured.entries[0] run \
    scoreboard players set .b_is_entry pln.util.restock 1

execute if score .b_is_entry pln.util.restock matches 1 run \
    function pln:util/on_restock/run_restock/restock_single_chest with storage pln:data root.manifest.matured.entries[0]

execute if score .b_is_entry pln.util.restock matches 0 run \
    function pln:util/on_restock/end_restock