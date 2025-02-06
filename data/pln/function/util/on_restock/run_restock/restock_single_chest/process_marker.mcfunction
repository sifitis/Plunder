
#executed by marker entity

say I am here!

# If any old items remain, copy them into a backup dataset in the entity
execute if data block ~ ~ ~ Items[0] run \
    data modify entity @s data.plunder.old_item_sets append from block ~ ~ ~ Items

# Clear old items
data modify block ~ ~ ~ Items set value []

# --- Iterate the rep counter
execute store result score .i_marker_rep pln.util.restock run data get entity @s data.plunder.rep 1.0
scoreboard players add .i_marker_rep pln.util.restock 1
execute store result entity @s data.plunder.rep int 1.0 run scoreboard players get .i_marker_rep pln.util.restock

# If no chest exists and no old item sets remain, kill the marker
execute unless block ~ ~ ~ #pln:loot_table_container run \
    kill @s