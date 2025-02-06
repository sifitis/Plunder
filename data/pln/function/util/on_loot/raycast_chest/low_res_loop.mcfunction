
# # Log Output
# execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
#         [{"text":" > pln:util/on_loot/raycast_chest/low_res_loop","color":"light_purple"}]

# Iterate
scoreboard players remove .i_rc_steps_remaining pln.util.process_chest 1

# If found
execute anchored eyes positioned ^ ^ ^ if block ~ ~ ~ chest run function pln:util/on_loot/raycast_chest/detection_success

# Loop
execute if score .b_chest_found pln.util.process_chest matches 0 \
    if score .i_rc_steps_remaining pln.util.process_chest matches 1.. \
        positioned ^ ^ ^0.5 run function pln:util/on_loot/raycast_chest/low_res_loop


# Raycast tracers
execute if score .b_chest_found pln.util.process_chest matches 0 \
    if score .show_raycast_tracers pln.util.process_chest matches 1 \
        anchored eyes positioned ^ ^ ^ run particle minecraft:dust{color:[1,0,0],scale:1} ~ ~ ~ 0 0 0 0 1 force

execute if score .b_chest_found pln.util.process_chest matches 1 \
    if score .show_raycast_tracers pln.util.process_chest matches 1 \
        anchored eyes positioned ^ ^ ^ run particle minecraft:dust{color:[0,1,0],scale:1} ~ ~ ~ 0 0 0 0 1 force