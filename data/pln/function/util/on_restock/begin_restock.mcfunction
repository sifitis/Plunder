
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Restocking Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_restock/begin_restock","color":"light_purple"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Enabled restocking flag.","color":"aqua"}]

scoreboard players set .is_restocking pln.globalvar 1
scoreboard objectives add pln.util.restock dummy

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_restock/begin_restock","color":"red"}]