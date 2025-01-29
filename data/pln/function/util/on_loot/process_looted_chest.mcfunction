
# The steps are as follows:
#
#   Send out a low resolution raycast to find the chest
#       If found and no marker exists, place a marker there
#       If found and a marker exists, store the ID for processing
#       If not found, send out a higher resolution raycast
#
#   If a new marker, populate it with useful data
#       generate a new manifest entry from the data
#
#   If an existing marker, update it
#       update manifest entry from new data


scoreboard objectives add pln.util.process_chest dummy

scoreboard players operation .show_raycast_tracers pln.util.process_chest = .show_raycast_tracers pln.globalvar.settings
scoreboard players set .b_dont_spawn_marker pln.util.process_chest 0
scoreboard players set .i_existing_marker_id pln.util.process_chest 0

# Find chest with raycast
scoreboard players set .b_chest_found pln.util.process_chest 0

# Attempt at low resolution
scoreboard players set .i_rc_steps_remaining pln.util.process_chest 20
execute if score .b_chest_found pln.util.process_chest matches 0 run function pln:util/on_loot/raycast_chest/low_res_loop

# Attempt at high resolution
scoreboard players set .i_rc_steps_remaining pln.util.process_chest 200
execute if score .b_chest_found pln.util.process_chest matches 0 run function pln:util/on_loot/raycast_chest/high_res_loop

# Handle new marker
$execute if score .b_chest_found pln.util.process_chest matches 1 \
    unless score .i_existing_marker_id pln.util.process_chest matches 1.. \
        as @n[distance=..10,type=marker,tag=pln_chest_marker,tag=new] at @s \
            run function pln:util/on_loot/populate_new_marker {loot_table:"$(loot_table)"}

# Handle existing marker
# execute if score .b_chest_found pln.util.process_chest matches 1 \
#     if score .i_existing_marker_id pln.util.process_chest matches 1.. \
#         run function pln:util/on_loot/populate_new_marker

#scoreboard objectives remove pln.util.process_chest