
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_loot/raycast_chest/detection_success","color":"light_purple"}]

# --- Cancel further search attempts
scoreboard players set .b_chest_found pln.util.process_chest 1

execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Marking .b_chest_found as true to prevent additional searches.","color":"aqua"}]

# --- Success tracer
execute if score .show_raycast_tracers pln.util.process_chest matches 1.. \
    positioned ^ ^ ^ run particle minecraft:dust{color:[0,1,1],scale:4} ~ ~ ~ 0 0 0 0 1 force

# --- Scan for old markers
scoreboard players set .b_old_marker_found pln.util.process_chest 0

execute unless score .b_dont_spawn_marker pln.util.process_chest matches 1.. \
    align xyz positioned ~.5 ~.5 ~.5 as @e[type=marker,distance=..0.01,tag=pln_chest_marker] run \
        tag @s add pln_old_marker

execute as @n[distance=..2,tag=pln_old_marker] run scoreboard players set .b_old_marker_found pln.util.process_chest 1

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Searching for existing marker identies.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_old_marker_found pln.util.process_chest matches 1 run tellraw @a \
        [{"text":"-Existing marker found.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_old_marker_found pln.util.process_chest matches 0 run tellraw @a \
        [{"text":"-No existing marker found.  Spawning a new one.","color":"aqua"}]

# --- Summon marker entity if one isn't found
execute unless score .b_dont_spawn_marker pln.util.process_chest matches 1.. \
    align xyz positioned ~.5 ~.5 ~.5 if score .b_old_marker_found pln.util.process_chest matches 0 run \
        function pln:util/on_loot/spawn_marker

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_loot/raycast_chest/detection_success","color":"red"}]