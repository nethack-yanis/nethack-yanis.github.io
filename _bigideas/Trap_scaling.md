---
layout: bigidea
authors: [aosdict, mtf, jonadab, FIQ, ais523, Chris, rumflump, firemonkey]
title: "Trap scaling"
---

Traps don't scale very much (floor traps' having minimum dungeon levels for random generation is about all there is), and this hurts their balance. Since a trap will have the same flat effect in all situations, it tends to become unthreatening to a player sooner or later, and then having it appear in the rest of the game is pointless. Conversely, some trap effects are too deadly to early characters. In Gehennom, the traps have probably literally been designed by demons, yet the only difference between Gehennom and the rest of the dungeon is the existence of fire traps.

### Floor traps
* Magic traps' blinding and summoning monsters effects should be split up, since both at once tends to make them much more fatal, especially to early players.
* Perhaps magic traps' summoned monsters have a lower maximum difficulty when being selected.
* Statue traps' summoned monsters should be generated with an increased difficulty. +5 was proposed for this, but this may be too high.
* Falling rock traps can dump multiple rocks onto you at once, up to (depth/4). Damage is taken for each rock. If a trap would drop 4 or more rocks on you, it may instead drop (rocks/4) boulders on your head instead. Helms should be less effective at reducing damage from falling rocks, and almost useless at reducing damage from falling houlders.
* Pits get deeper, which makes them deal more damage, might cause wounded legs with a chance that increases with depth, and take longer to escape from (or are so deep you can't climb out at all).
* Rust traps might target your pack instead of your armor or gear. Probably should be renamed to "water trap". On deeper levels, when the game would generate a rust trap, it has an increasing chance of replacing it with an acid trap. These deal corrosion and acid damage (and quite a bit of it, like having multiple potions of acid dumped on your head).
* Traps could trigger based on your weight. This makes the trap more likely to trigger on a heavily armored character or one who has collected a lot of loot. Would work nicely in the Gnomish Mines, since gnomes are light and don't tend to carry much stuff. Certain traps could also trigger to a lesser degree if you weigh enough to trigger it but not a whole ton.
* Anti-magic fields in Gehennom can attempt to cancel you or your gear. (Would work better in something like FIQHack where there's a cancelled status effect).

### Container traps
Container traps' effects also scale based on dungeon level (ideally on the level a container generated, not on the current level, so a player can't levelport a chest up to level 1 to make it use the weakest possible trap.)

In addition to adding some more effects, also add some effects which cosmetically are the same as other ones, but are more or less damaging. This would, however, make untrapping containers even more useless than it is now; perhaps a trap should stay armed even after you set it off. Another idea is to give certain traps an arming item, like a potion of oil for the fire effect and a land mine for the explosion effect. Successfully untrapping it will deposit the arming item into the container.

Also, make container traps independent of Luck, because currently they encourage the player to ignore containers until Luck is maximized.

Unsorted new trap ideas:
* A hand wielding a cream pie comes out and pies you in the face. Untrapping this will drop the cream pie into the container's inventory.
* The container hinges screech loudly, waking up sleeping monsters.

### Door traps
Instead of making all trapped doors explode and stun the player, add more varied door traps. The trap should be determined based on depth. It should also be selected deterministically based on the coordinates of the door (a convenience so that a trapped door will always have the same trap effect without having to store which trap it is.)

Additionally, new traps can also be used with more door states, rather than have all traps trigger by trying to open the door. Nondestructive traps could also remain on the door until the door is untrapped, rather than vanishing.

An interesting addition would be if doors were made restrictedly or completely untrappable, in order to prevent optimal strategy from being attempting to #untrap every door that the player comes across. Or possibly an attempt to open or close a door should do a cursory trap check.

List of door traps in rough order of minimum depth necessary to generate them:
* The hinges screech loudly when opened or closed, waking nearby monsters.
* Door closes and locks itself.
* Electric shock from the knob, dealing 1d(DL\*2) damage, that doesn't destroy items.
* Bucket of water falls on your head and causes water damage to several items in inventory.
* Your hand is stuck to the knob, causing you to be unable to move for the next few turns.
* Hingeless door: either falls on top of you and deals 1d(DL/2) damage, or (more likely) falls the other way and you fall over on top of it. Either way, you are stunned for a few turns. The door becomes "broken".
* A boxing glove swings out from behind the door and punches you, dealing damage and causing you to stagger/hurtle back a few steps.
* Object falls out of the ceiling on the player's head (copying an ADOM trap).
* Knob burns your hand for 1d(DL) damage and causes you to drop your weapon. Gloves reduce damage and prevent the drop.
* Door that explodes in a fireball: possibly no stunning, but burns inventory as it does in GruntHack.

### Magic traps
Based on the idea that magic trap effects specifically should scale based on level. Proposal by FIQ.

| Effect | Dungeon level or branch
|Magical explosion: HP damage, Pw increased to full, maxPw increase | Any (with fixed 25% chance)
|Odd feeling (using standard odd feeling messages, no effect) | Any (with fixed 25% chance)
|Grateful djinni, wish | 1 (with fixed 5% chance)
|Remove curse (like uncursed scroll) | Outside Gehennom
|Curse items (like harassment) | Within Gehennom
|Horizontal teleport | 1-6
|Blinds for 1d5+10 turns | 3-8
|Hostile magic whistle; summons monsters that already exist on the level to appear around the player | 5-10
|Gain 1 charisma and charm surrounding monsters | 7-12
|Create a stinking cloud on the space | 9-14
|Polymorph | 11-16
|Randomly bless and curse inventory (like confused blessed remove curse) | 13-18
|Do both the blinding and hostile whistling effects above | 15-20
|Level teleport | 17-22
|Surround the player with Z that are buffed by having intrinsic monster detection, being blinded so Elbereth won't work, and being hasted | 19+
|Surround the player with & that are buffed in the same way | Gehennom
|Surround with nasties (like harassment) | Gehennom
|Surround with nasties that are buffed as above. | Gehennom
