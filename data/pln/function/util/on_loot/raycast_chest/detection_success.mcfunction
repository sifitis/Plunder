
# Cancel further search attempts
scoreboard players set .b_chest_found pln.util.process_chest 1

# Success tracer
execute if score .show_raycast_tracers pln.util.process_chest matches 1.. \
    positioned ^ ^ ^ run particle minecraft:dust{color:[0,1,1],scale:4} ~ ~ ~ 0 0 0 0 1 force

# Summon marker entity
execute unless score .b_dont_spawn_marker pln.util.process_chest matches 1.. \
    align xyz positioned ~.5 ~.5 ~.5 unless entity @e[type=marker,distance=..0.01,tag=pln_chest_marker] run \
        function pln:util/on_loot/spawn_marker

# Store ID of marker if there already is one
execute unless score .b_dont_spawn_marker pln.util.process_chest matches 1.. \
    align xyz positioned ~.5 ~.5 ~.5 if entity @e[type=marker,distance=..0.01,tag=pln_chest_marker] \
        store result score .i_existing_marker_id pln.util.process_chest run \
            data get entity @n[type=marker,distance=..0.01,tag=pln_chest_marker] data.plunder.id 1