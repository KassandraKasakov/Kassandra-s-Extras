G.KASSANDRA = {}
G.KASSANDRA.C = {}
G.KASSANDRA.FUNCS = {}
G.KASSANDRA.C.astro_light = HEX("637676")
G.KASSANDRA.C.astro_dark = HEX("2f4746")

--[[ don't work

local lc = loc_colour
function loc_colour(_c, _default)
    if not G.ARGS.LOC_COLOURS then
        lc()
    end
	G.ARGS.LOC_COLOURS.astro = HEX('46605f')
    return lc(_c, _default)
end
]]




-- ModIcon atlas
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
}):register()



-- Zodiac atlas
SMODS.Atlas({
    key = "Zodiac", 
    path = "zodiac.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Astrological atlas
SMODS.Atlas({
    key = "Astrological", 
    path = "astrological.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Booster atlas
SMODS.Atlas({
    key = "Booster", 
    path = "boosters.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Enhancements atlas
SMODS.Atlas({
    key = "Enhancements", 
    path = "enhanced.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Jokers atlas
SMODS.Atlas({
    key = "Jokers", 
    path = "jokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Seals atlas
SMODS.Atlas({
    key = "Seals", 
    path = "seals.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Spectral atlas
SMODS.Atlas({
    key = "Spectral", 
    path = "spectral.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Consumables atlas
SMODS.Atlas({
    key = "Consumables", 
    path = "consumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


-- Planet atlas
SMODS.Atlas({
    key = "Planets", 
    path = "planets.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()



-- Shaders
--SMODS.Shader({ key = 'anaglyphic', path = 'anaglyphic.fs' })
--SMODS.Shader({ key = 'fluorescent', path = 'fluorescent.fs' })
--SMODS.Shader({ key = 'greyscale', path = 'greyscale.fs' })
--SMODS.Shader({ key = 'laminated', path = 'laminated.fs' })
--SMODS.Shader({ key = 'monochrome', path = 'monochrome.fs' })

-- From Cryptid
SMODS.Shader({ key = 'cosmic', path = 'cosmic.fs' })
--SMODS.Shader({ key = 'glitched_b', path = 'glitched_b.fs' })


-- Load all files

assert(SMODS.load_file("src/astrological.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()
assert(SMODS.load_file("src/edition.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/planets.lua"))()
assert(SMODS.load_file("src/pokerhands.lua"))()
assert(SMODS.load_file("src/seals.lua"))()
assert(SMODS.load_file("src/sound.lua"))()
assert(SMODS.load_file("src/spectrals.lua"))()
assert(SMODS.load_file("src/tarots.lua"))()
assert(SMODS.load_file("src/zodiac.lua"))()


SMODS.Joker{ --Hand
    key = "hand",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Hand',
        ['text'] = {
            [1] = 'You can {C:attention}select {}',
            [2] = '{C:attention}one {}more card'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(1)
        SMODS.change_discard_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-1)
        SMODS.change_discard_limit(-1)
    end
}