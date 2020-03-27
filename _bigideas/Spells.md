---
layout: bigidea
authors: [ais523, FIQ, Chris_ANG, aosdict, jonadab, NeroOneTrueKing, stenno, K2, mtf, Demo, Novel]
---

### Charm monster nerfs
Most people agree charm monster is too powerful, too low-level, and needs to be nerfed.
* It only works if you're not wearing any armor. (This is apparently how D&D does it.) Alternatively, its chance of successfully charming is reduced the more armor you're wearing.
* Make it more reliable than it is now, but it always fails if you have other pets. (You can then only have one pet at a time without using scrolls of taming.)
* It only tames one monster at a time. (Make it a directional beam with a maximum range of 1.)
* It only pacifies monsters, and can't be used to tame an always-hostile monster.
* Make it do what the temporary pet code in the Bard patch does: the monster remains tame for a fairly short amount of time and then reverts to whatever it was originally.
* Split into three spells: pacify monster (peaceful for charisma\*2 turns), charm monster (tame for Charisma\*2 turns), and dominate monster (tame permanently or for a long time).
* It only works on _monsters_, and doesn't work on intelligent beings.
* It can't directly tame a hostile monster; it can only pacify it. Peaceful monsters can then be tamed by subsequent casts, but attempting to tame a peaceful intelligent monster may anger it instead. The pacification step is dependent only on monster MR, but the taming depends on the player's level relative to the target. The scroll of taming should remain comparatively powerful.
* Scale with skill: unskilled attempts to pacify one adjacent monster, basic to pacify all adjacent, skilled to tame one adjacent, and expert to tame all adjacent. All of these are subject to normal monster MR checks.
* Whatever nerfs do get applied, they should ensure that the scroll of taming is more powerful and reliable than the spell.

### Making utility spell failure matter
The problem: casting utility spells at high failure rate, such as identify at 95% fail, is a mere inconvenience to players, since they can sit in a closet with a stack of food and wait for their Pw to recharge until they succeed. This is not really a problem with combat spells, since the penalty for failing to cast the spell correctly is a disadvantage in combat, where time matters.
* Large penalties for failing to cast a spell, like a 1% memory loss and 50 hunger.
* Failing to cast a spell locks it for a certain period of time. It would be hard to make this not turn into an even slower grind for utility spells, since the lockout period could just be waited out.
* Make spells never actualy _failable_, but Pw cost is increased proportional to the failure rate, specifically: <code>real Pw = base Pw / success rate</code>. Under this formula, a 15 Pw spell at 95% fail becomes a 300 Pw spell at 0% fail. This means the Pw cost should be exposed in the spellcasting menu rather than failure rate, even though failure rate still needs to be calculated. Maybe use different colors in the spellcasting menu to denote spells you can cast now, spells you can cast by waiting to recover more Pw, spells you can't cast even at your current maximum Pw, and forgotten spells.

### Changes to advanced spell forms
Advanced spell forms are slightly problematic. Certain spells (fireball and cone of cold) which have advanced versions automatically kick in when the player is Skilled or above, and can't be cast using the lesser form even if the player wants to.
* Some variants give you the choice of casting the basic or advanced form, but this suffers from an interface annoyance (an extra y/n prompt) and the fact that the advanced form counts as the same spell level so it is not actually any more difficult or expensive to cast.
* Advanced forms are castable even at Basic skill, but have a higher failure rate.
* The advanced form appears in the Z menu once you are Skilled.
* The advanced forms are implemented as higher-level never-generated spellbooks, e.g. "fire storm" and "frost storm". Reading the basic spellbook automatically teaches you the advanced spell as well.
  * This allows you to balance them separately; in the case of fireball and cone of cold, the lesser spells could be dropped to level 3 or so and the advanced forms elevated to level 6.
* The advanced forms are broken out into completely separate spellbooks that must be discovered and learned separately.
  * This makes the balance of spellbooks a concern, since it would add more books of a certain school.
  * Both of the ideas that involve higher level spellbooks may create a problem with the Z menu only allowing 52 different spells if more advanced forms come along, not that that can't be worked around.
* Skilled+ casting does nothing to the actual spell effects, but allows you to cast the spell mentally.

### One-time-use spellbooks
Instead of books having spestudied charges which leads to a lot of issues with polypiling, you read them once and they disappear, but you get 3 times the spell memory.
* This is intended to remove spellbook micromanagement.
* Spellbooks would need to be considerably more common than they are in vanilla. In FIQhack, where this was originally discussed (and later implemented), spellcasters generate with books, and the level of dropped spellbooks scales well as the game progresses since more dangerous monsters carry higher-level books.
* This addresses polypiling by allowing the player to polypile the book as much as they want, but they can only read it once.
* Slight nerf for people who finish their games in under 60,000 turns, since they can't use a spell for free confusion.
* Also a problem for people who play very long games, because they will need to find or write replacement spellbooks; however, this was sort of already the case.
* May make polypiling unknown spellbooks too popular, since an unknown spellbook is likely not to be the one you want, or you have price-IDed it and know it's something you will never use, and you can now poly without consequence. Perhaps address this by giving polymorphed spellbooks an elevated chance to become blank, and blank spellbooks do not poly into anything else.

### Wielding spellbooks
The wield slot is fairly underused among object classes, and there are a number of interesting bonuses we can add to spells if the corresponding spellbook is wielded.
* Decreases failure rate of the wielded spell (utility spells might need to be made higher-level/harder to cast to maintain balance).
* Or decreases Pw cost of the wielded spell.
* Allows you to cast the wielded spell even if completely forgotten.
* Allows you to cast the spell without knowing it already - the Z menu gets an additional "-" option to cast from the spellbook in hand if you don't know what that book is.
  * Casting from an unknown spellbook will immediately check for reading success as if you had read the book: if you succeed, it then moves on to other checks like whether you have enough power, etc and you may cast the spell. If you fail, you get a random failure effect appropriate to that spellbook.

### Ritual spells
More powerful and more expensive spells which have some esoteric effects you can't get otherwise. The main differences between ritual and normal spellcasting are that they consume valuable, hopefully non-renewable components, take a number of turns to cast instead of taking effect instantly, and may require you to be in or set up certain circumstances.

Various ritual spells that have been proposed:
* Ball spells which consume a gem as focus and create a ball of elemental power that hits surrounding squares but not you. (Long casting times would probably make rituals infeasible for combat though.)
* Temporarily increase your carry cap by a great amount. (Other new intrinsics as required.)
* Resurrect a corpse as a tame monster (necromancy).
* Grant temporary intrinsic life saving.
* Single controlled polymorph with a greatly increased duration.
* Summon a demon, demon lord, or demon prince. Requires 5 cursed candles and a marker (to draw the classic pentagram). If summoning a named demon lord, it's either random or there's some expensive way to control who shows up. The demon lord could be peaceful, but with current behavior this is useless. Possibly summoning them allows you to make a pact with them.
* Remove the graveyard status from a level (would need to be expensive, and perhaps involve the Book of the Dead, and multiple different headstones).
* Grow a tree. This consumes at least a piece of fruit. For anti-farming the tree should probably not produce fruit or bees when kicked.
* Create a portal between two levels of your choice (doesn't work with the Amulet obviously, but otherwise works)
* Create an artifact (that is, you somehow imbue an item with properties it can't normally get).
* Bless items. Consumes a blessed scroll of remove curse.
* Genocide a genocidable monster. Consumes a figurine of that monster plus other costly things.
* Reverse genocide a monster. The monster may or may not have to be normally reverse-genocidable. Consumes a figurine of that monster plus other moderately expensive things.
* Charge something. Requires a rare ingredient - perhaps a dilithium crystal.
* Summon tame elemental(s). Among other things, ingredients include: a potion of water, any beatitude (water); a rock (earth); lit candles, a lit oil lamp, or a lit potion of oil (fire); an amulet of magical breathing (air).
* Create a magic lamp. Needs an oil lamp (of course) and a figurine or mask of a djinni (or possibly a nearby live djinni).
* Make the current level non-teleport. Requires a scroll of teleportation and that the caster be standing on an anti-magic field at (?) either the start or the end of the ritual.
* Create a fountain. Requires a statue of a medium-sized or larger monster, which gets destroyed (by turning it into the centerpiece of the fountain). There may be potential for wishing abuse; perhaps the fountain should be flagged so that it can't produce a wish-granting water demon.
* Turn a regular knife into an athame. Components include other bladed weapons with positive enchantments adding up to 20 or something; all of these charges will be drained to +0 in the creation of the athame. The resulting athame is +0, regardless of the charges on the component weapons or original knife.
* Create a tame golem or golems. Requires a large amount of total weight of objects made out of the golem's material.

Ritual spells come in spellbooks like usual, but aren't stored in your spell list. Instead, reading the spellbook prompts you if you want to begin its ritual and tells you the necessary ingredients and circumstances you need to satisfy as preconditions. If you meet all the conditions and answer yes, you initiate the ritual. (For simplicity, this should probably burn up / expend all the components instantly.) You cannot begin a ritual while in the process of casting another ritual; this should probably be implemented as a precondition.

Apart from the component cost, rituals act as a constant drain on your Pw until the ritual is complete. If something distracts you in the middle of the ritual, you can go take care of it and then resume the ritual as long as you have the Pw left to finish it. (You could also drink gain energy during the ritual.) The only way for a ritual to fail, possibly backfiring with bad effects, is for you to run out of Pw while it is incomplete.

In addition to its preconditions, each ritual also has some postconditions: common to all rituals is that you have been casting the ritual for at least some length of time, but there may be others, such as standing on the square where you began the ritual, or have another item, or kill a monster, or something. There may also be other conditions such as "moving off the space where the ritual started breaks and halts the ritual".

Every time you stop casting a ritual (whether it succeeded or failed), it increments the spellbook's spestudied field; the book will eventually disintegrate after casting it a certain number of times.

### Miscellaneous
* Bump the spell of sleep up to level 3 or 4.
* Wielding a quarterstaff confers the same benefit as wearing a robe but does not stack with it (implemented in FIQHack).
* Wielding a wand of nothing confers the same benefit as wearing a robe but does not stack with it.
* Wielding an identified wand which matches a spell (wand of light -> spell of light, wand of death -> finger of death, etc) drastically reduces your failure rate when casting it. Perhaps casting the spell while wielding the matching unidentified wand should identify the wand.
* Add a spell of collect arrows: it magically retrieves all objects on the current level that you've thrown or fired at some point in the past. (Possibly limited to weapon class objects).
