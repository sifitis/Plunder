
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/spawn_marker","color":"light_purple"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-New marker spawned.","color":"aqua"}]

summon minecraft:marker ~ ~ ~ {Tags:["pln_chest_marker","new"]}

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/spawn_marker","color":"red"}]