
# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" > pln:util/on_check/run_check/pass_entry","color":"light_purple"}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":"-Entry passed.  Record transferred to storage pln:data root.manifest.matured.entries.","color":"aqua"}]

$data modify storage pln:data root.manifest.matured.entries append from storage pln:data root.manifest.live.entries[{id:$(id)}]
$data remove storage pln:data root.manifest.live.entries[{id:$(id)}]

# Log Output
execute if score .log_output pln.globalvar.settings matches 1 run tellraw @a \
        [{"text":" < pln:util/on_check/run_check/pass_entry","color":"red"}]