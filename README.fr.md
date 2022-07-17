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



## Comment l'utiliser ?
1. Installez [LanternLoad](https://github.com/LanternMC/load) dans votre data pack
2. Copiez le dossier `data/durability_multiplier` dans votre data pack
3. Fusionnez le contenu de `DurabilityMultiplier/data/load/tags/functions/load.json` et votre `data/load/tags/functions/load.json`
4. Implémentez l'API comme décrit ci-dessus.

