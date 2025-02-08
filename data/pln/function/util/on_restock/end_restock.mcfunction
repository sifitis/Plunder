
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/end_restock","color":"light_purple"}]

scoreboard players set .is_restocking pln.globalvar 0
#scoreboard objectives remove pln.util.restock

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Disabled restocking flag.","color":"aqua"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/end_restock","color":"red"}]