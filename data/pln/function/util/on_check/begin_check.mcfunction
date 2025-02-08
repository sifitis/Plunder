
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" >>> Checking Operation","color":"dark_blue"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_check/begin_check","color":"light_purple"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Enabled checking flag.","color":"aqua"}]

scoreboard players set .is_checking pln.globalvar 1
scoreboard objectives add pln.util.check_maturity dummy
data modify storage pln:data root.check_maturity.entries set from storage pln:data root.manifest.live.entries

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_check/begin_check","color":"red"}]