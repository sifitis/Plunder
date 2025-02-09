
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/run_restock/restock_single_chest/process_marker","color":"light_purple"}]

#executed by marker entity

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if data block ~ ~ ~ Items[0] run tellraw @a \
        [{"text":"-Old items found in chest; moving current contents of the chests Items field to the marker data.plunder.old_item_sets array:","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 unless data block ~ ~ ~ Items[0] run tellraw @a \
        [{"text":"-No old items found in the chest.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if data block ~ ~ ~ Items[0] run tellraw @a \
        [{"nbt":"Items","block":"~ ~ ~","color":"green"}]

# If any old items remain, copy them into a backup dataset in the entity
execute if data block ~ ~ ~ Items[0] run \
    data modify entity @s data.plunder.old_item_sets append from block ~ ~ ~ Items

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if data block ~ ~ ~ Items[0] run tellraw @a \
        [{"text":"-Clearing chest contents.","color":"aqua"}]

# Clear old items
data modify block ~ ~ ~ Items set value []

# --- Iterate the rep counter
execute store result score .i_marker_rep pln.util.restock run data get entity @s data.plunder.rep 1.0
scoreboard players add .i_marker_rep pln.util.restock 1
execute store result entity @s data.plunder.rep int 1.0 run scoreboard players get .i_marker_rep pln.util.restock

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Number of times this chest has been restocked updated to [","color":"aqua"},\
        {"score":{"name":".i_marker_rep","objective":"pln.util.restock"},"color":"green"},\
        {"text":"]","color":"aqua"}]

# If no chest exists and no old item sets remain, kill the marker
execute unless block ~ ~ ~ #pln:loot_table_container run \
    kill @s

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 unless block ~ ~ ~ #pln:loot_table_container run tellraw @a \
        [{"text":"-No chest present. Deleting marker.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/run_restock/restock_single_chest/process_marker","color":"red"}]