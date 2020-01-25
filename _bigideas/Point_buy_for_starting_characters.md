---
layout: bigidea
authors: [ais523, jonadab, aosdict, Tarmunora, FIQ]
title: "Point buy for starting characters"
---

Point buy is an idea originally from ais523 that is intended to address startscumming by unrandomizing starting stats and inventory and letting the user spend points on stats and equipment however they like. dtsund's class overhaul proposal also addresses unrandomization of starting inventory by simply removing all the random chances to get items, but it doesn't involve point buy.

### Starting stats
* Any point buy for stats is likely to involve a tedious interface. Developers could get around this by making it options-only, perhaps in a way that allows the user to say "buy to get my Strength up to 10, and my Int up to 9, and randomly pick the rest", but specifying it per-role could get annoying.
* It's important to allow people who want to start and splat games rapid-fire to do so, and it would be preferable if new players didn't have to learn the complexities of a new interface.
* The rc file must allow the user to specify starting stats per-role in this case, or specify that they want random stats.
* "Dump stats" like Cha, and Int and Wis for non-spellcasters, allow people to buff their important stats at the expense of unimportant stats, which may indicate some underlying balance issues with these stats or that the stats can have too wide of a starting range.

### Starting inventory
* Even in a non-point-buy system, for starting inventory in cases like for Monk and Wizard where the player gets a random spellbook with equal weight among the possible choices, the player should be able to select which.
* Any point buy system for inventory should probably be options-only, since designing an interface to do so would be complicated.
* Naturally, items like magic markers and rings of polymorph control cost lots of points, whereas things like apples and oil lamps cost only a few.
* Some items should probably have maximums.
* This would come at the expense of players who actually want different nonrandom starting inventories and don't want to have to edit their rc file every time.
* If the player's options leave some or all of the available points free, the game will randomly buy items until there are no points left.
* Unspent points should probably convert into a certain amount of gold.
* Possibly the default items are expressed as a list which consumes most or all of the points and is sorted from highest priority to lowest, and ones the user specifies get moved to the beginning of the list, which will push the low-priority items into the range of not being able to be purchased.
* Certain items, like the knight's lance and probably most armor, should not be purchasable, and the character always gets them.
* FIQ proposed a system in which you can specify one item, and the game will try to reroll your starting inventory many times until it gets that item. Since this is effectively built-in tool-assisted startscumming, it gets tracked as a conduct.
