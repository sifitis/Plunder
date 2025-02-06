
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_check/end_check","color":"light_purple"}]

scoreboard players set .is_checking pln.globalvar 0
scoreboard objectives remove pln.util.check_maturity
data remove storage pln:data root.check_maturity

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Disabled checking flag.","color":"aqua"}]

schedule function pln:util/on_restock/begin_restock 10t

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_check/end_check","color":"red"}]