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
* Refer to this template for the content of the function [here](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/data/durability_multiplier/functions/v1.0/signal_received_template.mcfunction).



## How to use
1. Install [LanternLoad](https://github.com/LanternMC/load) in your data pack
2. Copy the `data/durability_multiplier` folder into your data pack
3. Merge the contents of `DurabilityMultiplier/data/load/tags/functions/load.json` and your own `data/load/tags/functions/load.json`
3. Merge the contents of `DurabilityMultiplier/data/minecraft/tags/functions/tick.json` and your own `data/minecraft/tags/functions/tick.json`
4. Implement the API as described above.

