### Translations
* [English](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/README.md)
* [Française](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/README.fr.md)


# 📖 Durability Multiplier
A Minecraft data pack library for handling custom durability on every damageable item (vanilla, custom, and modded items).
* This custom durability is done by simulating a kind of unbreaking enchantment on the item.
* For example, if you have an item with a durability of 100, and you apply a durability multiplier of 2.0, the item will have 50% chance to really lose durability. So you will use this item 2x as if it had 200 durability.
* This library provide you a totally configurable multiplier for every specific item depending on its id and its nbt tag.
* This system is compatible with unbreaking and mending enchantments.

This is an embedded library, so you package it inside your datapack as opposed to having a separate download. Requires [LanternLoad](https://github.com/LanternMC/load) to operate.


## Differences between this library and Smithed Custom Durability
* This library is not a replacement for Smithed Custom Durability, it can be used together.
* You can directly repair items in an anvil.
* You don't have to add special nbt to your items.
* You can use this library with any item that can lose durability, including items from mods.
* We do not use a custom lore for the item to show the custom durability.
* If you item lose multiple durability at once, the value it divided by the multiplier.



## Function Tag
Function tag is called by the library to inform you an event has happened, and to allow you to make changes to the event.
* To use this call, you must add a function to the tag list located in `data/durability_multiplier/tags/functions/v1/durability_changed.json`.
* Refer to this template for the content of the function [here](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/data/durability_multiplier/functions/v1.3/signal_received_template.mcfunction).
```mcfunction
##Should be called by function tag #durability_multiplier:v1/durability_changed
##Set the durability multiplier compared to vanilla durability
##Keep in mind that your multiplier should be >= 1000, or else there is no effect.
##E.g. if you want to multiply durability by a x4.5 factor
##You'll need to put #multiplier score to 4500 (4500 divided by 1000 = 4.5)

#Example taken from SimplEnergy data pack
#Custom durability for Simplunium Armor & Tools (x7 leather armor & x1.2 diamond tools)
#Offhand durability here is useless because no diamond tools can be used in offhand
	scoreboard players set #multiplier durability_multiplier.data 7000
	execute if score #head_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main head{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/head
	execute if score #chest_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main chest{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/chest
	execute if score #legs_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main legs{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/legs
	execute if score #feet_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main feet{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/feet
	scoreboard players set #multiplier durability_multiplier.data 1200
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/mainhand
	#execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand{tag:{simplenergy:{simplunium:1b}}} run function #durability_multiplier:event/offhand

#Example that multiply every elytra durability on the server by 2
	scoreboard players set #multiplier durability_multiplier.data 2000
	execute if score #chest_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main chest{id:"minecraft:elytra"} run function #durability_multiplier:event/chest
	##If a multiplier has been applied on a slot, you can't run it again on the same slot so this command will never run.
	execute if score #chest_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main chest{id:"minecraft:elytra",tag:{custom_elytra:1b}} run function #durability_multiplier:event/chest

#Example with some fishing rod and shield (x3.14) and different syntaxes
	scoreboard players set #multiplier durability_multiplier.data 3140
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand{tag:{ctc:{id:"diamond_fishing_rod",from:"a_certain_pack"}}} run function #durability_multiplier:event/mainhand
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand.tag.ctc{id:"diamond_fishing_rod",from:"a_certain_pack"} run function #durability_multiplier:event/offhand
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand.tag.some_private_nbt.diamond_shield run function #durability_multiplier:event/mainhand
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand.tag.some_private_nbt{diamond_shield:1b} run function #durability_multiplier:event/offhand

#Example for every item having lore "Almost Unbreakable" with different syntaxes
	scoreboard players set #multiplier durability_multiplier.data 2147483647
	execute if score #head_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main head.tag.display{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']} run function #durability_multiplier:event/head
	execute if score #chest_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main chest.tag{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}} run function #durability_multiplier:event/chest
	execute if score #legs_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main legs{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/legs
	execute if score #feet_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main feet{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/feet
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/mainhand
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/offhand
```


## How to use
1. Use a datapack merger: [Mitochrondria Online](https://mito.thenuclearnexus.live/)
2. Implement the API as described above.

OR

1. Install [LanternLoad](https://github.com/LanternMC/load) in your data pack
2. Copy the `data/durability_multiplier` folder into your data pack
3. Merge the contents of `DurabilityMultiplier/data/load/tags/functions/load.json` and your own `data/load/tags/functions/load.json`
4. Implement the API as described above.

