-- ModIcon atlas
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
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


-- Load all files

assert(SMODS.load_file("src/astrological.lua"))()
assert(SMODS.load_file("src/boosters.lua"))()
assert(SMODS.load_file("src/enhancements.lua"))()
assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/seals.lua"))()
assert(SMODS.load_file("src/spectrals.lua"))()
assert(SMODS.load_file("src/tarots.lua"))()