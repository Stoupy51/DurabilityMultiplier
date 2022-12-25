
advancement revoke @s only durability_multiplier:v1.3/item_durability_changed
execute if score DurabilityMultiplier load.status matches 13 if entity @s[tag=!durability_multiplier.durability_changed] run function durability_multiplier:v1.3/advancements/update_scores
