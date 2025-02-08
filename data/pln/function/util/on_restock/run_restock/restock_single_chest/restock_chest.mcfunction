
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock/restock_single_chest/restock_chest","color":"light_purple"}]

$execute positioned $(pos_x) $(pos_y) $(pos_z) align xyz positioned ~0.5 ~0.5 ~0.5 as @n[type=marker,distance=..0.1,tag=pln_chest_marker] at @s run \
    function pln:util/on_restock/run_restock/restock_single_chest/process_marker

# Log Output
$execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Filling chest with loot table: ","color":"aqua"},{"text":"$(loot_table)","color":"green"}]

# --- Add loot table
$data modify block $(pos_x) $(pos_y) $(pos_z) LootTable set value "$(loot_table)"

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_chunk_preloaded pln.util.restock matches 0 run tellraw @a \
        [{"text":"-Chunk was not preloaded (.b_chunk_preloaded in pln.util.restock = 0); unloading chunk.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_chunk_preloaded pln.util.restock matches 1 run tellraw @a \
        [{"text":"-Chunk was preloaded (.b_chunk_preloaded in pln.util.restock = 1); leaving chunk loaded.","color":"aqua"}]

# --- Unload chunks that aren't preloaded
$execute if score .b_chunk_preloaded pln.util.restock matches 0 run \
    forceload remove $(pos_x) $(pos_z)

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"Record transferred to storage pln:data root.manifest.expired.entries.","color":"aqua"}]

# --- Move record to expired
$data modify storage pln:data root.manifest.expired.entries append from storage pln:data root.manifest.matured.entries[{id:$(id)}]
data remove storage pln:data root.manifest.matured.entries[0]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/run_restock/restock_single_chest/restock_chest","color":"red"}]