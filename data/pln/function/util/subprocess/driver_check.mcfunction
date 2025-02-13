$schedule function pln:util/subprocess/driver_check/call $(check_interval)s

execute unless score .is_checking pln.globalvar matches 1 run function pln:util/on_check/begin_check