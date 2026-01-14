While it has not actually happened yet, it's conceivable that at some point
someone might submit YANIs to this repo via a pull request. This file documents
guidelines for style and format that are useful for both external contributions
and internal maintenance.

This is a curated repository. Please do not take offense if ideas you submit get
edited or rejected.

### File organization

For each idea you want to add, first check that it actually deserves a new
entry. If it falls into any of the categories listed on the site's main page for
not being added, don't bother with it.

Next, ensure there is not some other very similar idea in the archive already.
If it *adds* to an idea already in the archive, the proper thing to do is edit
that idea's file and list any new contributing authors. If it is very similar to
an existing idea and *doesn't* add anything new, nothing should be done. Not
even listing new authors on the existing idea.

When you're satisfied something does deserve a file, find the largest numbered
file in `_yanis` and create a new file named the next highest number - or just
use `new_ideas.sh` to create the appropriate file and populate it with a
template automatically. Do *not* try to fill holes in the index where there are
missing numbers (typically the results of deduplicating or merging similar
ideas); that will just break the intuitive assumption that the ideas were added
in chronological order.

### Front matter

Each YANI has a Jekyll front matter section with several YAML fields.

#### Layout

"layout" is always `singleidea`.

#### Authors

"authors" is everyone who substantially contributed to the idea itself.
Examples:
- Alice was talking about events in her NetHack game. Bob proposed an idea based
  on those events, and Carl argued against an aspect of the idea and proposed a
  slightly different implementation. The idea should be credited to Bob and
  Carl. Alice does not get credit unless she actually took part in discussing
  game design.
- Alice proposed an idea. Bob and Carl made comments like "wow that's a great
  idea". Alice should be the only one credited, because Bob and Carl didn't add
  anything that's going to be written up in the YANI.
- Alice proposed an idea, Bob asked a clarifying question, prompting Alice to
  provide more details. Alice and Bob typically both get credit.
- Alice proposed an idea, and Bob pointed out a flaw in that idea which Alice
  suggested a fix for. This is kind of a gray area because Bob did contribute to
  the design discussion, but his objection may not end up written in the idea.
  Use your best judgment.

#### Category

"category" refers to the variant or variants the idea is directed at. (It is
technically a comma separated list, though very few ideas name more than one
variant or patch.) This is NOT supposed to be an exhaustive list of every
variant the idea could theoretically pertain to. One of the main rules here is:
if the idea could be implemented in vanilla NetHack as-is, it must be marked
"vanilla"; it doesn't matter what variant was being discussed. If it can't be
implemented in vanilla NetHack, generally just use the variant that was being
discussed, though if you notice it fits into a well-known patch or feature set
that variant happens to implement, you can also tag it with that patch.
Examples:
- A design discussion about adding a new dragon to the D class in SpliceHack.
  It's a pretty straightforward "cool new monster proposal" and has nothing
  tying it to SpliceHack. This should be categorized as "vanilla".
- A design discussion about adding a new dragon to the D class in SpliceHack
  with a specific plan to put it in the Dragon Rider quest, where the attributes
  of the dragon are tailored towards that use. This should be categorized as
  "SpliceHack".
- A design discussion about adding a special property of mithril-material
  objects in SpliceHack. There is nothing tying it to SpliceHack *specifically*,
  but vanilla NetHack does not have object materials, so it can't be put in
  "vanilla" either. This should be categorized as "object materials patch", a
  feature set that multiple variants have in common, but "SpliceHack" would also
  be OK.
- Someone proposed a feature for EvilHack. The author of EvilHack immediately
  said "I am not going to do this" in response. The idea should still get
  listed, and categorized as EvilHack.

Another convention if describing a multi-variant feature not widely known as its
own patch, is to tag it as "vanilla" but preface the text with "For variants
which implement X:" Possibly at some point these should be recategorized as
something that's not "vanilla", but it's the existing convention.

#### Tags

"tags" is a list of tags that can be used to look up the idea. The
`list-tags.sh` script can be used to view all the tags currently in use. There
is some subjectivity in whether an idea deserves a tag or not, but the most
important rule of thumb is: Is the idea *inherently about* the tag subject, or
does it just *involve* the tag subject? Examples:
- YANI #97: "You can jump over swimming monsters in water, and over tiny
  monsters." Water is a specific part of this idea, so "water terrain" is an
  appropriate tag. "monster size" for the other case is a little iffier, but
  err on the side of tagging it here.
- YANI #54: "More monsters should be locked to the grid and can only move
  orthogonally, like grid bugs." Tagging this "orthogonal movement" is correct,
  but tagging it "grid bug" is NOT correct since the idea does not suggest
  changing grid bugs - they are only present as a shorthand for what the desired
  behavior looks like.
- YANI #258: "Levitation cast at Expert skill, or a blessed potion of
  levitation, should grant flight instead of levitation." This should get tagged
  "spell of levitation" and "potion of levitation" and "flying", but NOT
  "levitation" since it proposes to *remove* that as an effect in certain
  circumstances.
- YANI #318: add a scroll of polymorph and describe its effects for each
  beatitude. This does NOT get tagged "blessed behavior" or "cursed behavior"
  because although it does describe those, the idea's about a new item that
  doesn't have existing blessed or cursed behavior to modify.
- A YANI that describes a general nerf to teleportation wands and mentions the
  motivation for the change is making the Astral Plane tougher. Unless the wands
  would be *specifically* nerfed only on the Astral Plane, the idea should not
  be tagged "astral plane".

It can help to write the full text of the idea out and then write the tags.

### Text of a YANI

#### Phrasing styles

There are 3 valid styles for writing an idea:

1. Describing what should be done, as if making a recommendation to a game
   developer. For example, *Crystal balls should weigh 50 aum, not 150.*
2. Imperative tense, as if instructing a game developer what to change. For
   example, *Change the weight of crystal balls to 50.*
3. Stating a new thing that clearly does not exist in the game, and describing
   it. For example, *A wand of apples. When it's zapped, it creates and flings
   an apple in the direction of the zap.* This style is somewhat discouraged
   compared to the other two; use it mainly if prefixing the idea with "Add this
   thing" or "There should be a thing" gets too clunky.

Styles that are used on older ideas, which are not considered good anymore, and
which will eventually get cleaned up at some point, include:

1. Describing in present tense how the game would work if the YANI were to be
   implemented. For example, *Crystal balls weigh 50.* This is not good because
   it reads like a statement about the present state of the game.

When in doubt, use "should".

#### Describing existing behavior

It's not required for the idea to contrast the proposed change with existing
behavior, but if it can be done succinctly it's a good idea, in case the
existing behavior gets changed. However, it's easy to go overboard, so don't
turn the idea into an exhaustive description of current behavior that belongs on
NetHackWiki.

Assume that readers are familiar with existing behavior. If the idea is
categorized as a variant or patch, you can assume the reader is familiar with
the variant. Either way, you don't typically need to reexplain stuff that
already exists in it that the idea does not propose to change, unless it's
really obscure.

#### Player vs character separation

When referring to things the out-of-game human player does, use "player". When
referring to things the in-game character does, use "hero" (this is preferred
over "player character").

Writing the idea in second person using "you" is also used in many ideas, and is
generally fine to use to refer to both the player and their character as long as
it doesn't get ambiguous. An example of ambiguity to avoid would be "you can use
your intelligence to beat this monster" where it's not clear if it means the
Intelligence stat or the player's own intelligence.

#### Incomplete ideas

While there is some minimum of fleshing out an idea must have in order to appear
on the site, it's not necessary for ideas to provide all the details of their
implementation. The typical convention when big detail is missing is to mention
them as "not specified" or "unspecified".

#### Formatting

The text of the idea should be wrapped to 80 characters wide. (This does not
affect the rendered HTML). Note that this does NOT apply to the front matter;
the tags, authors, and category should remain on one line no matter how long it
is.

Use redundancy when using a `<span>` element with the nhsym class, for
accessiblity. For instance, `The Wizard of Yendor appears as a magenta
<span class="nhsym clr-magenta">@</span>`.
