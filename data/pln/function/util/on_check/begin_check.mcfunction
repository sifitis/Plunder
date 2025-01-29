
scoreboard players set .is_checking pln.globalvar 1
scoreboard objectives add pln.util.check_maturity dummy
data modify storage pln:data root.check_maturity.entries set from storage pln:data root.manifest.live.entries