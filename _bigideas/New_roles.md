---
layout: bigidea
authors: [Demo, aosdict, Grasshopper, Tarmunora, jonadab, ais523, FIQ, Chris_ANG, NeroOneTrueKing, Luxidream, K2, greqrg, flump]
title: "New roles"
---

### Bard
Bards are pretty well-defined as being a music player who is most powerful with allies around to boost. That being said, there are many different takes on how to translate this to NetHack.
* The bard and healer cannot both be focused around petmongering, so one of them would have to change. Most likely the healer, as the bard's traditional abilities are only good on pets.
* Instead of the standard little dog or kitten, the bard starts with a "party" of 3-4 player monsters, who are randomly chosen from other roles.
  * This would make the primary strategy focused on having the party do the fighting for you, letting them level up, providing them with weapons and equipment, and not letting them die.
  * Healers and archeologists, and possibly tourists, don't make very good additions to the party, and so should perhaps be ineligible.
  * Party roles could be randomly chosen from distinct sets of "strong melee fighter" (Bar or Cav or Kni or Val), "ranged combat" (Ran or Rog or Sam or possibly Tou), and "spellcaster/cleric" (possibly Hea or Mon or Pri or Wiz).
  * The party will not start with the full starting inventory of their respective roles. They will generally have the same weapons and armor, but will probably not have any of the scrolls, rings, wands they normally start with, and starting spellbooks should be either eliminated or unrandomized.
* YASI: the bard quest artifact gives party members the effects of their own quest artifacts.
* Healer strategy should shift away from petmongering - the easiest way to do this is change the protection formula in such a way that the protection racket doesn't exist; so that the player isn't incentivized to keep XL as low as possible until they can buy protection.
* Difficult for Healers to find a new niche. (Avoidance of combat is an option, but the [Class Overhaul Proposal](https://nethackwiki.com/wiki/User:Jonadab/ClassOverhaul) calls for Archeologists to fill that niche). Perhaps something that focuses on pacifying monsters by healing them, but this has issues: you shouldn't be able to ''tame'' by healing since that turns Healers back in the direction of acquiring lots of pets, and most monsters start at full HP and don't need any healing.
* Bards (and probably all players) should be able to equip their pets by #looting them, or a similar mechanism. (This would also apply to mounts.) Intelligent monsters will prefer player-given items above all others and will never willingly replace them for other gear. Possibly make this behavior dependent on options, because some players may want their pets to be pragmatic in their gear choices.
* Player monster pets should perhaps not be able to detect curses.
* Songbooks, + class items which contain a song that the bard can learn.
  * Balancing the songbook generation rate against spellbooks might be tricky, because although bards can still cast spells and other roles can play songs, each is not very likely to have that much use for the other set of books. Hardcoding different probabilities based on whether the character is a bard or not doesn't seem very clean.
  * Possibly the bard should be able to discover songs by trial and error, although simple brute forcing is definitely not the way to do it. Maybe all spellbooks start identified.
  * The bard could need to practice the song by using the songbook in order to restore "song memory". Song memory does not work quite like spell memory, it works essentially like direct success rate. There might be some mandatory delay between practices, meaning you can't take an unlearned song and practice it up to 100% immediately. Or there could be a possible failure of practice, maybe a dexterity penalty ("Dumb move! You strain your fingers.") to serve to prevent practice-spam. Playing a song would serve to
  * Songbooks do not eventually go blank, and can be used for practice indefinitely.
* The bard should possibly be able to sing some of their songs without requiring an instrument.

See also: [Bard implementations](https://nethackwiki.com/wiki/Bard).

### Alchemist
Would require overhauls of several systems, but it's at least fun to discuss what the mechanics of such a role would be, and it's now being more seriously considered for dNetHack (for up-to-date discussion, see [this etherpad](https://etherpad.mit.edu/p/dNethack_Alchemy)).
* The main form of combat is to create phials of potion (where 1 potion splits into many phials), which can be tossed at enemies to cause potion effects on them. The main potions used are things like acid, paralysis, (lit) oil, and confusion.
  * Phials come in all the same types as normal potions but have somewhat weaker effects.
  * You can dip a stack of empty phials into a potion to fill them with that potion (up to some maximum).
  * Thrown phials have the same exact splash damage effect on things as throwing the potion would produce, but drinking it is a small enough dose to only cause the splash damage effects to the drinker. Requires some balance so that splash damage is useful against monsters but not useful for the player to drink for beneficial phials.
  * Phials can be dipped into potions, but nothing can be dipped into phials.
* The quest artifact is the Philosopher's Stone.
  * The quest leader is Nicolas Flamel and the nemesis is an Avatar of Death (like Death, but weaker).
  * More fun possibilities here if you have the object materials patch.
  * Its base item type could be a ruby (but perhaps not because dnethack makes the Heart of Ahriman a ruby) or a garnet, based on its color in Harry Potter, or an opal.
* Can also create alchemic gizmos: smoke bombs from potions of blindness, firebombs from potions of oil, all lighter and more numerous and useful than the base potions.
* Start with all potions identified.
* Could start with an alchemy kit, which is a rare tool find for other roles. NeroOneTrueKing proposed a set of mechanics for an alchemy kit:
  * Has 3 compartments. The first accepts only potions/phials of polymorph (or perhaps it just has charges and you can recharge it by using potions of polymorph).
  * The other compartments must each only contain items of the same material.
  * A success chance is displayed based on the amount of polymorph potion available, the weight ratio of the two compartments, and the materials themselves (metal can transform into metal relatively easily).
  * A successful use swaps all of the materials of the two compartments.
* Needs mechanics such that in an Alchemist's hands, no potion is useless.

The invoke effect of the Philosopher's Stone is heavily debated.
* It creates potions of the Elixir of Life. This potion cures disease and restores lost attributes, but most importantly it grants temporary intrinsic lifesaving. If you die with intrinsic lifesaving, you lose the remaining time for the intrinsic.
* Creating potions is way too powerful since the player will be able to bank them, so nerf this: perhaps you can only get Elixir of Life by dipping the Stone into a potion of full healing, or something. Or Elixir goes bad after a while and reverts to water, making it usable for before a fight but not for stashing.
* The Elixir should not be _more_ powerful than a potion of full healing, or the invoke effect of the Staff of Aesculapius - healers should be the best at actual healing. Probably, getting lifesaved from intrinsic lifesaving will only restore enough HP to stay alive a little longer.
* The Elixir gives a large temporary boost to HP regeneration.
* No Elixir of Life; it instead turns potions of sickness into (extra? full?) healing.
* The Stone can turn metal objects into gold or can turn rocks into gold pieces when rubbed on them.
* When dipped into gain level or gain energy, transforms the potion into polymorph.

A really great Alchemist implementation would probably involve a full alchemy overhaul which adds herbs and fungi, harvesting ingredients from corpses, cooking, and interesting ways to combine everything. The challenge with making this is how to make it useful for other roles and not just the alchemist, and at the same time not overcomplicating the game with the new additions.

### Artificer
* Artificers can innately see charges on things and use wands at a higher skill level than everyone else.
* Starts with an inventory of consumables comparable to vanilla wizards', a scroll of charging, offensive wands, a magic marker, and random tools.
* Starts with all armors (magic and nonmagic) identified and all tools identified.
* Restricted in nearly all weapon skills like a monk, or can only reach Basic in a few ones like knife.
* Quest involves lots of golems.
* Quest artifact grants double damage with tools and gives blessed charging when invoked.
* Gnome is a playable race.
Also see [dtsund's proposed Tinker role](https://nethackwiki.com/wiki/User:Jonadab/ClassOverhaul#Item_User:_Tinker).

### Druid
Intended to be a more balanced form of SLASH'EM's doppelganger race, druids are highly attuned to nature and possess innate shapeshifting abilities.
* You begin the game with polymorph control and get polymorphitis at XL 5 or so.
* Possibly you start with a wand of polymorph, or potions of it.
* Inventory could be severely restricted, so you have to figure out how to do most things through polymorph.
* You have the power to change into a tree, which will make most monsters ignore you. While in tree form, you are immobile but regenerate HP and Pw faster. Orcs might attack you with axes, a la Tolkien.
* Without extrinsic polymorph control, your polymorph control limits you to changing into forms with the M1_ANIMAL flag.
* Possibly have limited access to #polyself outside of wizard mode, so they can change intentionally and not randomly. Would work best as an ability with a timeout, or cost Pw outside of wizard mode.
* Possibly, the monsters you can polymorph into must have a certain base level that's tied to your XL somehow (maybe XL/2). If their base level is too high, you can't polymorph into them.
* Your controlled polymorphs always succeed - you will never accidentally fail and "feel like a new woman" with the 20% chance that all other roles have.
* You are seriously bad at combat in your regular form, having very little weapon skill (nothing can be advanced to Expert, possibly not even to Skilled), and physically weak in your normal form. Combat in a polyform should be incentivized enough so that it isn't really worth it to wear any armor. Maybe you should get to-hit and damage bonuses while in a wild form?
* Diminishing returns on polymorph time limit that prevent you from reusing the same form(s) over and over and over again. (This may actually be applicable as a general YANI for polymorph control).
* The critical balance needed is to make polyselfing powerful and awesome to play with and use for typical combat, but simultaneously polyselfing needs enough restrictions that it doesn't just turn into Master Mind Flayer: The Game.
  * One proposed restriction: you can only turn into monsters you have already encountered, or if that is too lax, into peaceful or tame monsters adjacent to you at the time. The druid should be able to pacify most animalistic monsters to take advantage of this (temporarily?)
* The starting pet is a woodchuck (or wolf). Pantheon is probably drawn from Celtic mythology, though hopefully not overlapping with Knights.
* Some heavy polymorph / monster / player as monster tweaking is probably required, in the sense that there should, ideally, be valid reasons to exist in any given polymorphable form.
