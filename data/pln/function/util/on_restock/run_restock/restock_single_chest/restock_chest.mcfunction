
say hoowee

$execute positioned $(pos_x) $(pos_y) $(pos_z) align xyz positioned ~0.5 ~0.5 ~0.5 as @n[type=marker,distance=..0.1,tag=pln_chest_marker] at @s run \
    function pln:util/on_restock/run_restock/restock_single_chest/process_marker

$execute positioned $(pos_x) $(pos_y) $(pos_z) align xyz positioned ~0.5 ~0.5 ~0.5 as @n[type=marker,distance=..0.1,tag=pln_chest_marker] at @s run \
    setblock ~ ~1 ~ red_stained_glass

$data modify block $(pos_x) $(pos_y) $(pos_z) LootTable set value "$(loot_table)"

$execute if score .b_chunk_preloaded pln.util.restock matches 0 run \
    forceload remove $(pos_x) $(pos_z)

$data modify storage pln:data root.manifest.expired.entries append from storage pln:data root.manifest.matured.entries[{id:$(id)}]
data remove storage pln:data root.manifest.matured.entries[0]