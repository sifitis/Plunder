scoreboard objectives add pln.util.process_chest dummy

scoreboard players set .show_raycast_tracers pln.globalvar.settings 1

# Find chest with raycast
scoreboard players set .b_chest_found pln.util.process_chest 0
scoreboard players set .i_rc_steps_remaining pln.util.process_chest 200
scoreboard players set .b_dont_spawn_marker pln.util.process_chest 1

execute if score .b_chest_found pln.util.process_chest matches 0 run function pln:util/on_loot/raycast_chest/high_res_loop

scoreboard players set .b_dont_spawn_marker pln.util.process_chest 0