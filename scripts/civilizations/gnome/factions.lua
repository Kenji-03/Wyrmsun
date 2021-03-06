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
--      (c) Copyright 2016-2020 by Andrettin
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

DefineFaction("acthnic-tribe", { -- Source: Franz Hartmann, "Among the Gnomes", 1895, p. 158.
	Name = "Acthnic Tribe",
	Civilization = "gnome",
	Type = "tribe",
	Color = "red",
	FactionUpgrade = "upgrade-faction-acthnic-tribe",
	Description = "The Acthnic tribe lives deep underground, near the subterranean fires of their homelands. They're known for being dangerous and reckless, occasionally entering the territory of derros or goblins without invitation. Their sages are well-versed in the mysteries of lightning, but above all they are masters of the flame."
})

DefineFaction("cubital-tribe", { -- Source: Franz Hartmann, "Among the Gnomes", 1895, pp. 157-158.
	Name = "Cubital Tribe",
	Civilization = "gnome",
	Type = "tribe",
	Color = "brown",
	Description = "The Cubitals are a hard-working tribe of gnomes, being known for their muscular strength and their efficiency at stonecutting. They are also talented artistically, making Cubital products highly sought after by the gnomish upper classes. When engaging in warfare, the Cubitals are known to make heavy use of explosives. The tribe's priests strive to command the forces of the earth and the air."
})

DefineFaction("derro-tribe", {
	Name = "Derro Tribe",
	Civilization = "gnome",
	Type = "tribe",
	Color = "black",
	Playable = false,
	FactionUpgrade = "upgrade-faction-derro-tribe",
	Description = "The Derro are a cruel gnomish offshoot, which separated themselves from the rest of their kin aeons ago. They dwell in the dark depths of Nidavellir's tunnels, in caves isolated even from other underground denizens. These gnomish fiends think themselves uniquely gifted, being at the same time wary and disdainful of other peoples. They see individuals of other races trespassing on their territory as a great crime, and will gladly put them in their place with the most sadistic of measures."
})

DefineFaction("sagan-tribe", { -- Source: Franz Hartmann, "Among the Gnomes", 1895, p. 159.
	Name = "Sagan Tribe",
	Civilization = "gnome",
	Type = "tribe",
	Color = "green",
	FactionUpgrade = "upgrade-faction-sagan-tribe",
	Description = "Herbalists par excellence, the Sagans are devoted to tending to the body and soul of plants. The tribesfolk is known for being tall (for gnomes)."
})

DefineFaction("vulcan-tribe", { -- Source: Franz Hartmann, "Among the Gnomes", 1895, pp. 156-157.
	Name = "Vulcan Tribe",
	Civilization = "gnome",
	Type = "tribe",
	Color = "yellow",
	Description = "The Vulcans excel at mining and metallurgy. The tribe's sages are believed to possess power over fire and thunder."
})

DefineFaction("acthna", {
	Name = "Acthna",
	ParentFaction = "acthnic-tribe",
	Civilization = "gnome",
	Type = "polity",
	Color = "red",
	DefaultTier = "duchy",
	HistoricalCapitals = {
		-25000, "acthna"
	}
})

DefineFaction("untersberg", { -- Source: Franz Hartmann, "Among the Gnomes", 1895, pp. 1, 12-13.
	Name = "Untersberg",
	Civilization = "gnome",
	Type = "polity",
	Color = "blue", -- the king of Untersberg, Pypo, wore a steel-blue gown; Source: Franz Hartmann, "Among the Gnomes", 1895, pp. 12-13.
	DefaultTier = "kingdom",
	MinisterTitles = {
		"head-of-government", "none", "none", "none", "Grand Chancellor", -- Source: Franz Hartmann, "Among the Gnomes", 1895, pp. 201, 206.
		"education-minister", "none", "none", "none", "Superintendent of Public Schools" -- Source: Franz Hartmann, "Among the Gnomes", 1895, p. 201.
	},
	HistoricalCapitals = {
		-25000, "gnana"
	}
	-- Untersberg had an "Order of the Bullfrog" in Among the Gnomes (should be changed to an animal which exists in Nidavellir); Source: Franz Hartmann, "Among the Gnomes", 1895, p. 201.
})
