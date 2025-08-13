-- ModIcon atlas
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
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

-- Blank rank atlas
SMODS.Atlas({
    key = "BlankRank", 
    path = "blank_rank.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()


assert(SMODS.load_file("src/jokers.lua"))()
assert(SMODS.load_file("src/ranks.lua"))()