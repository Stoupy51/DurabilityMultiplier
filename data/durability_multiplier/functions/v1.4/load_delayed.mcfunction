
execute in minecraft:overworld run setblock -30000000 14 1610 yellow_shulker_box
execute unless loaded -30000000 14 1611 run schedule function durability_multiplier:v1.4/load_delayed 2s

