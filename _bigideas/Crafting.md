---
layout: bigidea
authors: [aosdict, ais523, jonadab, mtf, ChrisE]
---

Adding a crafting system to NetHack is a very frequently suggested idea. Technically, crafting systems already exist in the game (such as alchemy crafting potions into other potions, or combining a blank scroll with a magic marker to make magic scrolls), but there is clear interest in a more fully-featured system.

### Craftsmen's Guild
* Populated with master craftsmen who work on the principle of "valuable junk items + very large sums of gold = desirable items". They can also do some things available to the player, like increasing weapon enchantment, without needing the specific consumables needed for the player to do it.
* Would serve as a replacement or stand-in for the black market. Resolves some of the problems with balancing black market shopkeepers: if you kill the black market staff, you can have every item in the market, so black market staff must be insanely powerful. If you kill a master craftsman, however, you don't get anything of value. Therefore, master craftsmen don't have to be insanely powerful, or even good fighters.
* Not as good as wishes; there are some things they cannot make for you, like magic lamps, and many magical tools. You cannot specify enchantment or blessing either. For items for which enchantment doesn't matter, the material cost will be higher.
* The interface works by #chatting to them. They will ask you what you want to create, and you enter it (using the wish parser logic to extract the proper object class), and then they will tell you the items and gold they will need for it. These could either be randomized or use certain fixed ingredients with some randomization or use completely fixed recipes; if randomized it will be deterministic for that item for that craftsman in that game. You are then prompted to select the items from your inventory.
* For gold and other balance reasons, this would probably work better the farther it is into the game; maybe it could even be found deep into Gehennom. Maybe you even have to liberate it from a demon lord.
* Craftsmen might include:
  * Metalworkers (see below)
  * Wandmakers (produce wands)
  * Scribes (produce scrolls and spellbooks)
  * Alchemists (produce potions)
  * Toolsmiths (produce mundane and some magical tools)
  * Jewelers (produce rings and amulets)
  * Sculptor (produce statues and figurines)
  * Leatherworkers (produce leather items and saddles)
  * Chefs (produce food)
  * Arcanologists (transfer charges/enchantments from one item into another, consumes only gold and not items)

### Metalworking
Probably the most important sort of craftsman for many characters. There could be multiple types, each specializing in one type of metal, or just one type that does everything.
* Silvering items (or gilding, or copper-coating) should require you to use up junk silver items equal to some amount of weight proportional to the weight of the new item. The zorkmid cost of silvering should be very high.
* A forge room type (probably containing lava and maybe some junk items like iron chains) could be added which has one or more smiths in it (silversmiths, goldsmiths, blacksmiths).
  * Goldsmiths seem rather pointless right now, since there is only one gold item (the ring). They would be more useful if gold equipment existed and conferred some benefit.
  * Blacksmiths don't have much to do as far as turning items into iron goes, but they could produce iron weapons of a type the player wants, or repair and improve iron weapons and armor (increasing its enchantment).

### Player crafting
ais523 has pointed out that if there's a craftsmen's guild or even scattered craftsmen, the process of traveling back and forth to and from it might become busywork. So if players could craft things on their own, that might be better.
* Would probably need properly flavored terrain for workstations, like a furnace or smelter, for certain crafts, otherwise flavor is too weird.
* Fixed, non-simple recipes (e.g. existing scroll crafting is a simple recipe) are a heavy spoiler tax and should be avoided.
* This could be simple for certain types of items, as in requiring some silver or gold and a diamond to craft a diamond ring, but doesn't explain where any magical effects come from, and also might weirdly tie crafting recipes to randomized appearances which have previously been meaningless.
* Probably requires a few more "base" crafting materials, some source of leather, some source of wood, etc.
  * Corpses could decay into bones, which disappear themselves with a longer timeout, but in the meantime can be used to craft bone stuff
