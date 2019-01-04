--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      (c) Copyright 1998-2019 by Joris Dauphin, Jimmy Salmon and Andrettin
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

-- For documentation see stratagus/doc/ccl/ccl.html

--  Declare some unit types used in spells. This is quite accetable, the other
--  way would be to define can-cast-spell outside unit definitions, not much of an improvement.
DefineUnitType("unit-revealer", {})
DefineUnitType("unit-ethereal-revealer", {})

DefineSpell("spell-blessing",
	"showname", "Blessing",
	"manacost", 50,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Blessing = 1000, Wither = 0}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Blessing", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-blessing",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only"}}
)

DefineSpell("spell-far-sight",
	"showname", "Far Sight",
	"manacost", 70,
	"range", "infinite",
	"target", "position",
	"stackable", false,
	"action", {
		{"summon", "unit-type", "unit-ethereal-revealer", "time-to-live", 50},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-far-sight"
)

DefineSpell("spell-healing",
	"showname", "Healing",
	"manacost", 2,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-vitals", "hit-points", 1, "max-multi-cast", 4},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-healing",
	"autocast", {"range", 6, "condition", {"alliance", "only", "HitPoints", {MaxValuePercent = 90}}},
	"ai-cast", {"range", 6, "condition", {"alliance", "only", "HitPoints", {MaxValuePercent = 90}}}
)

DefineSpell("spell-herbal-cure",
	"showname", "Herbal Cure",
	"manacost", 1,
	"range", 1,
	"target", "unit",
	"action", {
		{"adjust-vitals", "hit-points", 1, "max-multi-cast", 4},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Building", "false",
		"HitPoints", {MaxValuePercent = 100}
	},
	"sound-when-cast", "foraging",
	"autocast", {"range", 6, "condition", {"alliance", "only", "HitPoints", {MaxValuePercent = 90}}},
	"ai-cast", {"range", 6, "condition", {"alliance", "only", "HitPoints", {MaxValuePercent = 90}}}
)

DefineSpell("spell-inspire",
	"showname", "Inspire",
	"manacost", 25,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Inspire = 1000, Wither = 0}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Inspire", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-inspire",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only", "Blessing", {ExactValue = 0}}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only", "Blessing", {ExactValue = 0}}}
)

DefineSpell("spell-portent",
	"showname", "Portent",
	"manacost", 70,
	"range", "infinite",
	"target", "position",
	"action", {
		{"summon", "unit-type", "unit-revealer", "time-to-live", 50},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-portent"
)

DefineSpell("spell-precision",
	"showname", "Precision",
	"manacost", 50,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Precision = 1000}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Precision", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-precision",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "alliance", "only"}}
)

DefineSpell("spell-shocking-grasp",
	"showname", "Shocking Grasp",
	"manacost", 50,
	"range", 1,
	"target", "unit",
	"action", {
		{"adjust-variable", {Stun = 200}},
		{"spawn-missile", "missile", "missile-impact-lightning", "start-point", {"base", "target"}},
		{"spawn-missile", "missile", "missile-always-hits", "start-point", {"base", "target"}, "lightning-damage", 7}
	},
	"condition", {
		"Building", "false"
	},
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Stun", {ExactValue = 0}}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Stun", {ExactValue = 0}}},
	"depend-upgrade", "upgrade-shocking-grasp"
)

DefineSpell("spell-slow",
	"showname", "Slow",
	"manacost", 50,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Slow = 1000, Haste = 0}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Building", "false",
		"Slow", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-slow-ability",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}}
)

DefineSpell("spell-terror",
	"showname", "Terror",
	"manacost", 50,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Terror = 200}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Terror", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-terror",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}}
)

DefineSpell("spell-wither",
	"showname", "Wither",
	"manacost", 50,
	"range", 6,
	"target", "unit",
	"action", {
		{"adjust-variable", {Wither = 1000, Blessing = 0, Inspire = 0}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}}
	},
	"condition", {
		"Organic", "only",
		"Wither", {ExactValue = 0}
	},
	"sound-when-cast", "magic-holy",
	"depend-upgrade", "upgrade-wither",
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}}
)

DefineSpell("spell-war-machine-spear-attack",
	"showname", "war machine spear attack",
	"manacost", 0,
	"range", 1,
	"target", "unit",
	"action", {
		{"demolish", "range", 1, "basic-damage", 9, "damage-self", false, "damage-friendly", false, "damage-terrain", false, "pierce-damage", true},
	},
	"condition", {
		"alliance", "false",
		"opponent", "only",
		"AirUnit", "false"
	},
	"autocast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}},
	"ai-cast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}}
)

DefineSpell("spell-axe-twirl",
	"showname", "Axe Twirl",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"force-use-animation",
	"action", {
		{"demolish", "range", 1, "basic-damage", 9, "damage-self", false, "damage-friendly", false, "damage-terrain", false}
--		{"spawn-missile", "missile", "missile-axe-twirl", "start-point", {"base", "caster"}}
	},
--	"condition", {
--		"alliance", "false",
--		"opponent", "only",
--		"AirUnit", "false"
--	},
	"autocast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}},
	"ai-cast", {"range", 1, "condition", {"alliance", "false", "opponent", "only", "AirUnit", "false"}}
)

DefineSpell("spell-stun",
	"showname", "Stun",
	"manacost", 50,
	"range", 1,
	"target", "unit",
	"action", {
		{"adjust-variable", {Stun = 200}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"spawn-missile", "missile", "missile-always-hits", "start-point", {"base", "target"}, "use-unit-var"}
	},
	"condition", {
		"Organic", "only",
		"Building", "false"
	},
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Stun", {ExactValue = 0}}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Stun", {ExactValue = 0}}},
	"depend-upgrade", "upgrade-stun"
)

DefineSpell("spell-precise-shot",
	"showname", "Precise Shot",
	"manacost", 50,
	"range", 5,
	"target", "unit",
	"action", {
--		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"spawn-missile", "missile", "missile-none", "start-point", {"base", "caster"}, "use-unit-var", "always-critical"}
	},
	"condition", {
		"Organic", "only",
		"Building", "false"
	},
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only"}},
	"depend-upgrade", "upgrade-precise-shot"
)

DefineSpell("spell-puncture",
	"showname", "Puncture",
	"manacost", 50,
	"range", 1,
	"target", "unit",
	"action", {
		{"adjust-variable", {Bleeding = 1000}},
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"spawn-missile", "missile", "missile-always-hits", "start-point", {"base", "target"}, "use-unit-var"}
	},
	"condition", {
		"Organic", "only",
		"Building", "false",
		"thrusting-weapon", "only"
	},
	"autocast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Bleeding", {ExactValue = 0}}},
	"ai-cast", {"range", 6, "combat", "only", "condition", {"Coward", "false", "opponent", "only", "Bleeding", {ExactValue = 0}}},
	"depend-upgrade", "upgrade-puncture"
)

-- scroll/book spells

DefineSpell("spell-forgetfulness",
	"showname", "Forgetfulness",
	"description", "Allows the unit to repick its experience upgrades",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"retrain"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-retraining",
	"showname", "Retraining",
	"description", "Allows the unit to repick its experience upgrades",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"retrain"}
	},
	"item-spell", "book",
	"sound-when-cast", "magic-holy"
)

-- spells to change units to their faction equivalents
DefineSpell("spell-acthnic-allegiance",
	"showname", "Acthnic Allegiance",
	"description", "Changes the unit's type into its Acthnic faction-specific equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"faction-equivalent", "acthnic-tribe"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "gnome", "faction", "acthnic-tribe"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-anglo-saxon-allegiance",
	"showname", "Anglo-Saxon Allegiance",
	"description", "Changes the unit's type into its Anglo-Saxon equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "anglo-saxon"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "anglo-saxon"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-frank-allegiance",
	"showname", "Frankish Allegiance",
	"description", "Changes the unit's type into its Frankish equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "frankish"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "frankish"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-goth-allegiance",
	"showname", "Gothic Allegiance",
	"description", "Changes the unit's type into its Gothic equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "goth"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "goth"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-norse-allegiance",
	"showname", "Norse Allegiance",
	"description", "Changes the unit's type into its Norse equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "norse"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "norse"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-suebi-allegiance",
	"showname", "Suebi Allegiance",
	"description", "Changes the unit's type into its Suebi equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "suebi"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "suebi"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-teuton-allegiance",
	"showname", "Teuton Allegiance",
	"description", "Changes the unit's type into its Teuton equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"civilization-equivalent", "teuton"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "teuton"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"

)

DefineSpell("spell-detachment",
	"showname", "Detachment",
	"description", "Changes the unit's type, if it is faction-specific, to the corresponding standard type for its civilization",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"faction-unit", "only"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "detachment"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

DefineSpell("spell-joruvellir-allegiance",
	"showname", "Joruvellir Allegiance",
	"description", "Changes the unit's type into its Joruvellir equivalent",
	"manacost", 0,
	"range", 0,
	"target", "self",
	"condition", {
		"Organic", "only",
		"Building", "false",
		"faction-equivalent", "goldhoof-clan"
	},
	"action", {
		{"spawn-missile", "missile", "missile-magic-effect", "start-point", {"base", "target"}},
		{"polymorph", "civilization", "dwarf", "faction", "goldhoof-clan"}
	},
	"item-spell", "scroll",
	"sound-when-cast", "magic-holy"
)

