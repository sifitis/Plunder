
# args: [loot_table]

execute store result entity @s data.plunder.id int 1.0 run scoreboard players get .next_marker_index pln.globalvar
$data modify entity @s data.plunder.loot_table set value "$(loot_table)"
execute if predicate {"condition":"entity_properties","entity":"this","predicate":{"location":{"dimension":"minecraft:overworld"}}} run data modify entity @s data.plunder.dim set value 0
execute if predicate {"condition":"entity_properties","entity":"this","predicate":{"location":{"dimension":"minecraft:the_nether"}}} run data modify entity @s data.plunder.dim set value 1
execute if predicate {"condition":"entity_properties","entity":"this","predicate":{"location":{"dimension":"minecraft:the_end"}}} run data modify entity @s data.plunder.dim set value 2

scoreboard players add .next_marker_index pln.globalvar 1

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
scoreboard players operation .mature_time pln.util.process_chest += .restock_time pln.globalvar.settings

data modify storage pln:data root.compose.new.id set from entity @s data.plunder.id
data modify storage pln:data root.compose.new.dim set from entity @s data.plunder.dim
data modify storage pln:data root.compose.new.loot_table set from entity @s data.plunder.loot_table
execute store result storage pln:data root.compose.new.pos_x int 1.0 run data get entity @s Pos[0]
execute store result storage pln:data root.compose.new.pos_y int 1.0 run data get entity @s Pos[1]
execute store result storage pln:data root.compose.new.pos_z int 1.0 run data get entity @s Pos[2]
execute store result storage pln:data root.compose.new.mature_time int 1.0 run scoreboard players get .mature_time pln.util.process_chest
data modify storage pln:data root.compose.new.rep set value 0

data modify storage pln:data root.manifest.live.entries append from storage pln:data root.compose.new
data remove storage pln:data root.compose

tag @s remove new