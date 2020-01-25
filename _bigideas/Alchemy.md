---
layout: bigidea
authors: [FIQ, ais523, jonadab, aosdict, Chris_ANG]
---

NetHack's alchemy system is balanced around the assumption that the player will _not_ hold onto nearly every potion in the game, turn them to water, and polypile them into alchemy ingredients; however, this is not hard to do. Should the player do this, they can amass hundreds of hit points worth of full healing potions, or all the gain ability potions required to max out every stat, or get dozens of potions of holy water.

For most potions in the game, diluting for holy water or alchemizing/polypiling for alchemizing is their ultimate fate, and there are enough potions so that the player never really has to agonize over what to do with a potion. One solution to this would be to make more potions than just acid effective for throwing at monsters.

The color alchemy and gem alchemy patches are unsatisfactory, as is any system that ties alchemy recipes to the random appearance of potions. This is because it makes the game choose at the beginning whether powerful potions can be produced out of junk potions/gems, or out of expensive potions/gems, or not at all &mdash; all before the player gets a chance to learn how alchemy will work in this game. It has a large impact on overall strategy that the player can't discover until probably the midgame. At the same time, having hardcoded alchemy rules is unsatisfactory because it's inflexible and carries a heavy spoiler requirement.

Random alchemy is also odd: dipping the same potions in the same way can yield different potion results.

### 1 + 1 = 2
A radically different system from how alchemy currently works: no matter how many potions are in the stacks being dipped, only one from each stack is consumed, and two alchemized potions are always produced.
* Intended as a balance fix for the player's current ability to make stacks and stacks of full healing, gain ability, or gain level potions, and promote use of found potions instead of diluting them.
* Significantly, potions of holy water mostly work like they do now - the holy water does not mix with anything and is consumed, while the dipped item becomes blessed - but you can only dip a singular item into the holy water, including other potions. This loss of the ability to mass-produce holy water creates a significant balance change.
  * Or it could sometimes make two holy waters, but be biased against it, and allow both waters to become uncursed in the process.
  * Still unbalanced, since holy water can otherwise be mass produced through water prayers and blessed confused remove curse.
* Undiluted potions can be duplicated by dipping them in normal water, e.g. one potion of gain level + one water = 2 diluted potions of gain level.
  * Diluted potions may need to have weaker effects to compensate for this, or undiluted potions stronger effects.
  * Or potions in general should become rarer, and possibly generate diluted.

### Sink alchemy
Allow sinks to be catalysts for alchemizing things. (Or possibly add a "cauldron" as a new piece of dungeon furniture, but that's iffier.)
* You can dip potions into sinks to pour them down the drain, experiencing the vapor effects in a safe way. (Pouring polymorph down the sink of course polymorphs the sink.) This requires vapor effects to be implemented for many of the potions that don't currently have any.
* If you don't pour the potion down the drain, you instead mix it with the fluid from the tap, which is usually water but can already be a random potion.
* Possibly, doing alchemy in/on a sink is more efficient. There are many possible forms this could take, such as:
  * Potions not diluting when you mix them.
  * Reduced or zero chance of an alchemic blast.
  * You can get results from mixing potions that you can't otherwise. (Flavor for this is weak. Is the character heating them somehow with the hot water?)

### New alchemical objects
* Flask, holds multiple quaffs of a single potion type (so that holy water can't be mass-created but other potions can)
* Mortar and pestle, can grind gems / other things into dust which can be used to make potions
* Alembic, can distill potions from things in the dungeon such as corpses.
* Recipe books/scrolls, which tell the reader how to create a certain potion through alchemy, and identifies the result potion or even all potions involved.

### Alchemy skill
Non-weapon skill that has various effects on alchemy: make alchemical blasts less common (or zero at high skill), and increase the probability that mixing certain potions yields the right result.
