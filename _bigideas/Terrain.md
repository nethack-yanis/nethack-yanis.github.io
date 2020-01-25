---
layout: bigidea
authors: [aosdict, AmyBSOD, bug_sniper, jonadab, NeroOneTrueKing, statuesurfer, FIQ, stenno, Chris_ANG]
---

### Fire terrain

Fire terrain is a square that is on fire. It displays as an orange period. (Depending on how nasty this will be to non-color players, the glyph should perhaps be changed.)
* Fire terrain has a certain amount of burning wood material on it.
* Standing next to or on fire terrain grants cold resistance, but standing on top of fire terrain has the same effect as a fire trap whenever you end your turn on it.
* The fire eventually burns out and reverts to normal floor, the duration determined by the total weight of the burning objects.
* Killing a wood golem with fire or burning more than a certain weight of objects on a square creates fire terrain on that space.
* Throwing burnables onto a fire trap may make them spontaneously combust and produce fire terrain.
* Fire terrain can be used to cook corpses.
* You can create fire terrain by applying a lit candle to a space with burnables on it
* You can also create it by applying a tinderbox to a space, which is a chargeable non-magical tool. Archeologists and Rangers start with one.
* Fires provide a light source of radius 3, but cannot be moved. Monster AI will not travel over fire if the monster is not resistant.

### Air terrain

Extend air terrain to be used outside the Plane of Air, representing a chasm or abyss. If you step on air without levitation or flying, you fall to your death ("killed by gravity"), unless you're on the Plane of Air (where there is no gravity). The obvious glyph is a blank space, but this is problematic because players are used to thinking of it as rock. It could work as a blank space by being used only on levels which don't contain any rock and always giving the player a warning when they are about to step into open air. Other possibilities for its glyph are white ~ or white #.

### Grass terrain

Ideas for making grass terrain (a green period or comma) be an interesting piece of terrain:
* Dies and turns to normal floor if hit by fire or have a death ray zapped over it
* Turns into fire terrain if hit by fire and can spread to nearby grass
* You can plant trees on them, whereas you cannot do this on normal floor.
* Small monsters that are capable of hiding under objects can hide in grass.

### Other new terrain types
* A new type of "fence" terrain that is like wooden iron bars: it cannot normally be moved onto but it can be burnt or kicked down, and it does not block line of sight.
* Slope terrain, which is a terrain that appears like walls but does not block line-of-sight. It blocks movement unless levitating or flying, and cannot be dug down on or into. If you somehow get onto slope terrain (such as by stopping levitation while on it), you can move off it in any unblocked direction. This would allow interesting level designs like pyramids and switchbacks. Is still a bit problematic, since for things like a large pyramid, you would be able to see straight over the top of the pyramid and down the back side.

### De-crowding the # glyph
* Iron bars and fences render as cyan or brown wall glyphs.
* Sinks render as white or blue \\.
* Closed drawbridges render as some color of + which is not used by many spellbooks - perhaps red or orange.
* Corridors could be moved to a period glyph but this would probably be very unpopular and make levels look a lot worse.
* Trees could be green +, or possibly green \\ to avoid spellbook confusion.
* Clouds could set the background color of a space and not change the foreground color, and could possibly be rendered with a blank space character, but this would probably have issues on non-color terminals.

