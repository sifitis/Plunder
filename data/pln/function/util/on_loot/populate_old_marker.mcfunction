
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/populate_old_marker","color":"light_purple"}]

# args: [loot_table]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-A loot table was resolved in a chest with an existing marker.  Creating a new record for future restocking.","color":"aqua"}]

$data modify entity @s data.plunder.loot_table set value "$(loot_table)"

# Format of manifest entry:
#{
#   id: <integer> The numerical ID of the chest marker.
#   loot_table: <string> The id of the loot table.
#   dim: <integer> The numerical code for the dimension the chest is in.
#   pos_x: <integer> The X coordinate of the chest.
#   pos_y: <integer> The Y coordinate of the chest.
#   pos_z: <integer> The Z coordinate of the chest.
#   mature_time: <integer> The timestamp, in minutes, when the chest should be restocked.
#   rep: <integer> The number of times this chest has been restocked.
#}

execute store result storage pln:data root.compose.game_mins int 0.00083333333333333 run time query gametime
execute store result score .mature_time pln.util.process_chest run data get storage pln:data root.compose.game_mins
scoreboard players operation .mature_time pln.util.process_chest += .mature_time pln.globalvar.settings

data modify storage pln:data root.compose.new.id set from entity @s data.plunder.id
data modify storage pln:data root.compose.new.dim set from entity @s data.plunder.dim
data modify storage pln:data root.compose.new.loot_table set from entity @s data.plunder.loot_table
execute store result storage pln:data root.compose.new.pos_x int 1.0 run data get entity @s Pos[0]
execute store result storage pln:data root.compose.new.pos_y int 1.0 run data get entity @s Pos[1]
execute store result storage pln:data root.compose.new.pos_z int 1.0 run data get entity @s Pos[2]
execute store result storage pln:data root.compose.new.mature_time int 1.0 run scoreboard players get .mature_time pln.util.process_chest
data modify storage pln:data root.compose.new.rep set from entity @s data.plunder.rep

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-New record added to storage pln:data root.manifest.live.entries: ","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"nbt":"root.compose.new","storage":"pln:data","color":"green"}]

data modify storage pln:data root.manifest.live.entries append from storage pln:data root.compose.new
data remove storage pln:data root.compose

tag @s remove pln_old_marker

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/populate_old_marker","color":"red"}]