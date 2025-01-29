
$execute if score .game_mins pln.util.check_maturity matches $(mature_time).. run function pln:util/on_check/run_check/pass_entry with storage pln:data root.check_maturity.entries[0]

data remove storage pln:data root.check_maturity.entries[0]