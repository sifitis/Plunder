
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_check/run_check [ID: ","color":"light_purple"},\
        {"nbt":"root.check_maturity.entries[0].id","storage":"pln:data","color":"green"},\
        {"text":"]","color":"light_purple"}\
        ]

execute store result storage pln:data root.check_maturity.game_mins int 0.00083333333333333 run time query gametime
execute store result score .game_mins pln.util.check_maturity run data get storage pln:data root.check_maturity.game_mins

scoreboard players set .b_is_entry pln.util.check_maturity 0
execute if data storage pln:data root.check_maturity.entries[0] run \
    scoreboard players set .b_is_entry pln.util.check_maturity 1

execute if score .b_is_entry pln.util.check_maturity matches 1 run \
    function pln:util/on_check/run_check/check_single_entry with storage pln:data root.check_maturity.entries[0]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 if score .b_is_entry pln.util.check_maturity matches 0 run tellraw @a \
        [{"text":"-No additional records exist. Ending check.","color":"aqua"}]

execute if score .b_is_entry pln.util.check_maturity matches 0 run \
    function pln:util/on_check/end_check

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_check/run_check","color":"red"}]