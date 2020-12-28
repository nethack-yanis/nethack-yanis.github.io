---
layout: bigidea
authors: [ais523, FIQ, jonadab, aosdict, bezaban]
---

The main idea here is to make the identification game less regimented. Currently, a rational spoiled player (who will not take the risks associated with direct use-ID) is restricted to indirect use-ID (and monster use-ID) of most objects until such time as they can find a general, book, or scroll shop, at which point they can price-ID the scroll of identify and other items. Once identify is known (and could be blessed), the good items (as determined by price ID) can be fully identified. This is problematic because it's not at all a gradual process, and it feels like it should be.

Some ideas have been floated to remove price ID outright (presumably, a shopkeeper would pay the same amount for each item of an object class as they currently do with amulets). This has some advantages; price ID is tedious, encourages stashing to some extent (because stashing near a shop where you can ID new things is good), and roguelike players who don't primarily play NetHack tend to hate its price ID system. In this case, either the scroll of identify should start out identified for all characters, so that identification doesn't take forever to get off the ground, or some other mechanic should be added so identify is easy to pick out for spoiled players (such as retaining price-ID for only that scroll).

If price ID is not to be changed, it should become less regimented and predictable, and less necessary of a strategy. The entire idea of price tiers doesn't appear to be based on anything much, and having items organized into tiers makes it easy to disregard entire classes of items once their base prices are known. Ideas include:
* Change price ID so that each item is assigned to a "band" of possible prices. There are four price bands, and each item class has its base price randomized based on its band. The price bands show up on unidentified items, e.g. "an expensive scroll labeled KIRJE". Some items might fall into more than one price band.
* Implement price tiers (e.g. all scrolls cost either 100, 150, 200, or 300), and items are placed into 1-3 possible tiers at the start of the game.
* Fuzz the prices of items so that it's not possible to definitively say what an item is, only that it's cheap or expensive.
  * One way to do this is to scatter the base price of each previously tiered item each game on an interval so that it overlaps with the intervals from other previous tiers, perhaps a random number from 1/2 the original price to 2x the original price.
  * Or fuzzing is done on a per-shopkeeper basis. Each shopkeeper sees each type of object as having a different base cost, based on hashing their monster ID. Asidonhopo sells a scroll of fire with a base cost of 86; Enniscorthy sells it with a base cost of 103.
  * Or, do away with tiers entirely and simply scatter the base costs permanently. A ring of free action might be 240 or 260 base, because it's on the higher end of usefulness in the former 200 tier. Some fuzzing would probably be needed here to keep things from being unambiguously identified.

Other ideas to reduce the reliance on shops:
* Reduce the potential consequences of use-testing items so it's not as terrible of an idea, such as giving a warning for reading way out of depth spellbooks.
* Make scrolls and spellbooks in particular partially identifiable outside of a shop without having to formally identify them or guess based on frequency (which are currently the ''only'' ways to identify them outside of a shop):
  * Higher level spellbooks could be heavier. D&D does this. However, unless the game shows the weights of items to the player, it will be tedious for the player to figure out the exact weight of a book by picking up and dropping items of known weights.
  * Make spellbook appearances more complex based on level. A simple color indicates a 1-2 level book, an unusual color or appearance indicates a 3-4 level book, a very odd or ridiculous appearance or material indicates a 5-6 level book, and a completely over-the-top appearance indicates a level 7+ book. (Example: "red", "steel", "bone", "jewel-encrusted"). Shuffling of the random appearances would need to be changed so that the books retain an appearance in their original bracket.
  * Make scroll label length (or, more complicated, its number of syllables) roughly correlate to its cost. The correlation could be fuzzed a bit, so MAPIRO MAHAMA DIROMAT is probably a 300 zorkmid scroll, but is certainly no less than 200, and NR 9 is probably something really cheap, but might be 100 zorkmid.
  * When you read a spellbook, you are given a menu with three options:
    * Give the book a cursory glance-over. This can fail with low Int/XL but is fairly unlikely and has very minor failure effects. If successful, it identifies the spell level of the book. Takes 1/10 the usual spell study time.
    * Briefly study the book but don't try to learn its spell. This can fail with mediocre Int/XL but will be reliable at high ones. Moderate failure effects. If successful, it identifies the spell contained in the book. Takes 1/3 the regular spell study time.
    * Study the book normally with normal failure effects and normal spell study time. Learns the spell if successful.

### List of existing informal ID mechanics
* Weapons: don't usually need to type-ID since there aren't randomized descriptions. Currently there is no way to learn enchantment like there is for armor.
* Armor: most of it doesn't have randomized descriptions, but for those items that do, there is basically only wear-testing and price-ID. Wear-testing is fine assuming the player is able to check for curses, but only on armor types that don't have autocursing gotchas (a rare uncursed helm of opposite alignment or dunce cap).
* Amulets: price-ID doesn't even work; the player has to use-test (safe enough assuming they can verify it isn't cursed or remove its curse, since none of the bad ones autocurse).
* Scrolls: mainly price-ID; monster use will eventually identify several
* Potions: monster use identifies most of the beneficial potions (with the notable exception of gain energy), but this is a slow process. Dip-testing identifies the potions of polymorph and sickness, and a few other harmful potions can be dip-tested with a unicorn horn. However, there are still some bad potions (paralysis) that remain unidentified by these processes, so quaff-IDing is only safe if the player has identified the bad ones already.
* Spellbooks: only price-ID
* Rings: sink-ID is pretty unambiguous, but the chance of losing the ring makes it unhelpful unless you have duplicates, which isn't very likely until later in the game.
* Wands: engrave-ID (and fallback on zap-ID) seems sufficient.
* Tools: not many are randomized, but none of the ones that are have debilitating use-IDs, so use-ID seems sufficient.
* Gems: touchstones and unicorns, seems sufficient.

### Set of possible items
Items (perhaps only heavily randomized object classes, so NOT armor) can be inspected somehow, or else come pre-inspected, and your character is able to conclude that the item is one of a small set of possible things from that object class. The number of these possible things can depend on role, and the "fakes" are randomized every game. This approach is very similar to the one used in the roguelike Golden Krone Hotel.

Example: a character inspects a potion and confirms that it is either healing, acid, or sleeping. All potions with this appearance will provide the same three possibilities. It's actually acid, but without other identification methods, or ruling out healing and sleeping, it can't be discerned which of the three it is.

Has some problems with the interface; a character shouldn't inspect everything and then have to type-name it. Perhaps this could be automated somehow.
