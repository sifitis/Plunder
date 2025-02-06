
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:debug/force_first_entry_mature [ID: ","color":"light_purple"},\
        {"nbt":"root.manifest.live.entries[0].id","storage":"pln:data","color":"green"},\
        {"text":"]","color":"light_purple"}\
        ]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Setting maturation time to game minute 0.","color":"aqua"}]

data modify storage pln:data root.manifest.live.entries[0].mature_time set value 0

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:debug/force_first_entry_mature","color":"red"}]