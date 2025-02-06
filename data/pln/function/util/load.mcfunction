
# # This is where all of the important stuff is done to start the datapack up

tellraw @a [{"text":"Plunder v1.0.0 loaded.","color":"#AA9944"}]

# # ================================================================================================ #
# #  Essential objectives  
# # ================================================================================================ #

scoreboard objectives add pln.globalvar dummy
execute unless score .next_marker_index pln.globalvar matches 0..2147483647 run \
     scoreboard players set .next_marker_index pln.globalvar 0

scoreboard objectives add pln.util.const dummy

execute unless score .is_checking pln.globalvar matches 0..1 run \
     scoreboard players set .is_checking pln.globalvar 0

execute unless score .is_restocking pln.globalvar matches 0..1 run \
     scoreboard players set .is_restocking pln.globalvar 0

# # ================================================================================================ #
# #  Global Settings  
# # ================================================================================================ #
scoreboard objectives add pln.globalvar.settings dummy

# # Defaults ---------------------------------------------------- #

# Should the datapack perform garbage collection on empty scoreboards
execute unless score .do_garbage_collection pln.globalvar.settings matches 0..1 run \
     scoreboard players set .do_garbage_collection pln.globalvar.settings 1

# Show particle tracers on raycasts
execute unless score .show_raycast_tracers pln.globalvar.settings matches 0..1 run \
     scoreboard players set .show_raycast_tracers pln.globalvar.settings 0

# Should the datapack perform garbage collection on empty scoreboards
execute unless score .log_output pln.globalvar.settings matches 0..1 run \
     scoreboard players set .log_output pln.globalvar.settings 0

# How long must a record exist before it matures
execute unless score .mature_time pln.globalvar.settings matches 0..2147483647 run \
     scoreboard players set .mature_time pln.globalvar.settings 10080

# How many seconds between checks
execute unless score .check_interval pln.globalvar.settings matches 0..2147483647 run \
     scoreboard players set .check_interval pln.globalvar.settings 600

# # ================================================================================================ #
# #  Player-specific variables 
# # ================================================================================================ #


#      Nothing here


# # ================================================================================================ #
# #  Command Storage Data 
# # ================================================================================================ #

execute unless data storage pln:data root.manifest run \
     data modify storage pln:data root.manifest set value {\
          live:{entries:[]},\
          matured:{entries:[]},\
          expired:{entries:[]},\
          failed:{entries:[]}\
     }

# # ================================================================================================ #
# #  Trigger Objectives 
# # ================================================================================================ #





# # ================================================================================================ #
# #  Constants 
# # ================================================================================================ #





# ================================================================================================ #
#  Start Subproceses
# ================================================================================================ #

schedule function pln:util/subprocess/driver_restock 10t
function pln:util/subprocess/driver_check/call