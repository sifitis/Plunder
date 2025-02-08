
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock/restock_single_chest/restock_chest/call","color":"dark_purple"}]

function pln:util/on_restock/run_restock/restock_single_chest/restock_chest with storage pln:data root.manifest.matured.entries[0]