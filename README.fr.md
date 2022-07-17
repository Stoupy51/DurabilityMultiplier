### Translations
* [English](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/README.md)
* [Française](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/README.fr.md)


# 📖 Durability Multiplier
Librairie Minecraft sous forme de data pack pour gérer la durabilité custom sur tous les items abîmables (vanilla, custom, and moddé).
* Cette durabilité custom est crée en simulant une sorte d'enchantement unbreaking sur l'item.
* Par exemple, si vous avez un item avec une durabilité de 100, et que vous appliquez un multiplicateur de 2.0, l'item aura 50% de chance de vraiment perdre de la durabilité. Vous allez donc utiliser cet item 2x plus comme s'il avait 200 de durabilité.
* Cette librairie vous fournit un multiplicateur totalement configurable pour chaque item spécifique en fonction de son id et de son tag nbt.
* Ce système est entièrement compatible avec les enchantements unbreaking et mending.

Il s'agit d'une librairie intégrée que vous intégrez dans votre Datapack au lieu d'avoir à le télécharger séparément. Nécessite [LanternLoad](https://github.com/LanternMC/load) pour fonctionner.


## Différences entre cette librairie et Smithed Custom Durability
* Cette librairie ne remplace pas Smithed Custom Durability, elle peut être utilisée simultanément.
* Vous pouvez directement réparer les items dans une enclume.
* Vous n'avez pas besoin d'ajouter des nbt spécifiques à vos items.
* Vous pouvez utiliser cette librairie avec tous les items qui perdent de la durabilité, y compris les items provenant de mods.
* Nous n'utilisons pas de lore custom pour montrer la durabilité personnalisée.
* Si votre item perd plusieurs durabilités en même temps, la valeur qu'il perd est divisée par le multiplicateur.



## Function Tag
Le Function tag est un signal appelé par la librairie pour vous informer qu'un événement s'est produit, et vous permet d'apporter des modifications à cet événement.
* Pour utiliser ce signal, vous devez ajouter une fonction à la liste des tags située dans `data/durability_multiplier/tags/functions/v1/durability_changed.json`.
* Référez-vous à ce model pour le contenu de la fonction [ici](https://github.com/Stoupy51/DurabilityMultiplier/blob/main/data/durability_multiplier/functions/v1.1/signal_received_template.mcfunction)
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
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand.tag.ctc{id:"diamond_fishing_rod",from:"a_certain_pack"} run function #durability_multiplier:event/mainhand
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand.tag.some_private_nbt.diamond_shield run function #durability_multiplier:event/mainhand
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand.tag.some_private_nbt{diamond_shield:1b} run function #durability_multiplier:event/mainhand

#Example for every item having lore "Almost Unbreakable" with different syntaxes
	scoreboard players set #multiplier durability_multiplier.data 2147483647
	execute if score #head_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main head.tag.display{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']} run function #durability_multiplier:event/head
	execute if score #chest_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main chest.tag{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}} run function #durability_multiplier:event/chest
	execute if score #legs_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main legs{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/legs
	execute if score #feet_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main feet{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/feet
	execute if score #mainhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main mainhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/mainhand
	execute if score #offhand_valid durability_multiplier.data matches 1 if data storage durability_multiplier:main offhand{tag:{display:{Lore:['[{"text":"Almost Unbreakable","italic":false,"color":"red"}]']}}} run function #durability_multiplier:event/mainhand
```



## Comment l'utiliser ?
1. Installez [LanternLoad](https://github.com/LanternMC/load) dans votre data pack
2. Copiez le dossier `data/durability_multiplier` dans votre data pack
3. Fusionnez le contenu de `DurabilityMultiplier/data/load/tags/functions/load.json` et votre `data/load/tags/functions/load.json`
4. Implémentez l'API comme décrit ci-dessus.

