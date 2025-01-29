schedule function pln:util/subprocess/driver_restock 10t

execute if score .is_restocking pln.globalvar matches 1 run \
    function pln:util/on_restock/run_restock