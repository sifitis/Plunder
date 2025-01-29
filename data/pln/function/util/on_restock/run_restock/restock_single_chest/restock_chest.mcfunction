

$data modify block $(pos_x) $(pos_y) $(pos_z) Items set value []
$data modify block $(pos_x) $(pos_y) $(pos_z) LootTable set value "$(loot_table)"

$execute if score .b_chunk_preloaded pln.util.restock matches 0 run \
    forceload remove $(pos_x) $(pos_z)

data remove storage pln:data root.manifest.matured.entries[0]