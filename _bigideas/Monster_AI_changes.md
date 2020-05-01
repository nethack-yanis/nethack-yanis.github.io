---
layout: bigidea
authors: [jonadab, FIQ, aosdict, flump, mtf, Chris_ANG, xyzyxx, Pavel]
title: "Monster AI changes"
---

Monster intelligence and AI strategies should be much more fleshed out than the current definition of "having hands and being neither mindless nor an animal". A clear way to do this is to implement different degrees of intelligence or even just an Int stat for monsters, which affects their strategy for doing certain actions like fleeing (do they flee intelligently like monkeys do, or in a random direction?) and using items (a dumb monster might try to read a scroll of fire and burn itself to death).

### Smart monster attack strategy
Very intelligent monsters calculate whether it is more advantageous in terms of damaging the enemy versus taking damage themselves to pursue a target in melee, keep a safe distance and attack from range, or flee. Complex solutions would involve the monster storing lots of data about which attacks it has seen its opponents perform; however, this might get memory-intensive and expand save files quite a bit. A possible algorithm that relies only on game state and is based on FIQhack's dragon AI algorithm is as follows:
 If able to attack at range (spit/breathe/shoot missiles/use items/etc):
   If the target is in range but not adjacent:
     Attack at range.
   Else if the target is adjacent, and is at least as fast as the monster:
     Attack in melee, or use ranged attacks point blank.
   Otherwise:
     Try to move somewhere aligned with the target, as far away as possible while still being in range.
 Else if the monster is unable to attack at range but will be able to soon (dragon):
   Stay out of line with the target.
 Otherwise:
    Close to melee range.

### Group AI
Monsters that spawn in groups are currently completely individualistic and try nothing more complex than charging towards the player and hitting in melee once they get there. This makes it easy for the player to cheese what would otherwise be tough battles, e.g. by standing in a doorway and killing them one by one, or by kiting them. There are some proposals for smarter AI:
* If a single monster in a group is next to the player, try to pull back until allies can get next to the player.
* Avoid doorways and narrow corridors; if you are in an open space, stay there unless you decide to move to another open space, and hang back from the doorway where the hero is, forcing them to enter the room in order to pass.
* Groups of intelligent monsters also try to stay out of the way of ranged fire if possible.
* If the current strategy is to defend a certain area, form ranks to block the player from reaching it.
* Pincer maneuvers; some monsters of a group will split up and try to get behind the hero or attack from another side. If the pincering group hasn't gotten in position yet, the other group will fall back until they catch up.
* Group "leaders" (loosely defined as a M2_LORD or M2_PRINCE monster in a group of monsters of the same monster class) will try to put the group between them and the player. The presence of a leader could also buff the strategy or intelligence of the group it is in.
* Wolf pack: the monster of the class with the highest level, or failing that the highest max HP, "leads" the pack, and all other members key in on this leader and follow it. This means if you get the leader to flee, the rest of the pack will flee as well.
* The Yendorian Army can form a phalanx, which is an ordered rectangle of soldiers. Will stick to wide open areas, try to stay out of the range of ranged attacks until they can swarm around you. Enemies forming a phalanx could receive to-hit and AC boosts.

### Golem AI
Golem AI/strategy could be selected from a set of possible directives when the monster is created. They follow this directive completely and literally, which may result in some interesting behaviors. The player can #chat to the golem to have it mumble its directive.
* _Kill all humans_ - golem attacks the nearest human it can find, not necessarily the player.
* _Gather gold_ - golem pathfinds to the nearest gold on the level. If that happens to be carried by a monster, attack it.
* _Build a castle_ - golem seeks out boulders and tries to pick them up and pile them into one small collection of spaces on the level. If you destroy or move them, it becomes hostile.
* _Get corpses_ - golem tries to collect corpses, but will not hesitate to make more if there aren't any more on the level.
* _Build more of myself_ - golem tries to collect things made out of the material it's made of. It attaches these to its body, increasing its HP and maximum HP; when its maxHP is high enough, it splits into two golems like a blue jelly.

Golem AI strategies would probably require a general AI overhaul.

### Miscellaneous strategies
* Default: Monster roams aimlessly unless they can see hostiles, in which case they beeline towards those hostiles. Smarter monsters might remember the last place they saw a hostile and beeline towards that square when the hostile goes out of sight.
* Lure: Active only when a monster is fleeing and knows about a trap in the vicinity. It tries to get the trap between itself and you.
* Blocking: Monster tries to get between the player and a certain space. Won't work well when there's only one of it, but will do nicely in small or large groups.
* Zombie resurrection: If zombies can resurrect each other through physical contact, living zombies will try to move towards zombie corpses they can see.
* Throw weapon versus wielding it: Mostly useful for things like daggers or knives. Most monsters should be smart enough not to throw away their last melee weapon when they know they can hit for more damage with it. They will, however, unwield weapons and hit you with fists if their only weapon left is grossly unfit for melee (i.e. crossbow).
* Darkness: Try not to move out of darkness / into darkness unless there's no other choice. If in the wrong one and doing nothing special, beeline towards the nearest visible way out of it. Most useful for gremlins who want to stay in darkness.
* Passwall: if monsters cannot take physical items with them when they phase through walls, they will not actually pass through walls while carrying any items they care about, unless they are fleeing, in which case they will abandon the items.
* Food smells: If the hero is carrying a lot of food in open inventory, monster AI may be more effective at tracking the player, depending on if the food is anything the monsters like to eat. Carrying around lots of fleshy food like tripe rations or meatballs helps carnivorous monsters track, carrying around produce helps herbivorous monsters track, tins don't have any scent or effect, inediate pets get no tracking bonus.
* Hero displacement: Monsters often attack each other because they think the hero is displaced where another monster is. The smarter a monster is, the more chances it should have to re-roll this displacement roll as long as it keeps landing on other monsters. Or else, if there's only one displaced image, smart monsters should conclude it's not where the other monster is and lash out randomly at empty space.
* Bones ghost AI: camp on the bones pile, guarding it, never chase the hero away from it.
* Insects returning to the hive: bees periodically path back to their hive unless they're actively chasing or combatting something. Ants do this too, and even pick up and bring back food items.
* Swarming AI (bees and possibly other insects): before moving, they calculate if they can see any others of the same monster, and if so, they are disincentivized for moving into a space where they would lose sight of all such monsters. This should keep swarms actually cohesive but still able to move along corridors and pursue the player.
* No reason to move: the monster doesn't move, or moves infrequently and randomly, unless it sees you as an enemy. It can have a normal speed and doesn't need to be sleeping or peaceful or anything. If it no longer detects you, it may return to its state of not pursuing you.
