
$say Chest ID: $(id) at [$(pos_x),$(pos_y),$(pos_z)] was restocked.

$execute store result score .b_chunk_preloaded pln.util.restock run forceload query $(pos_x) $(pos_z)

execute if score .b_chunk_preloaded pln.util.restock matches 0 run \
    schedule function pln:util/on_restock/run_restock/restock_single_chest/forceload_for_restock/call 1t

schedule function pln:util/on_restock/run_restock/restock_single_chest/restock_chest/call 5t