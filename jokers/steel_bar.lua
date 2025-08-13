SMODS.Joker{ --Steel Bar
    key = "steel_bar",
    config = {
        extra = {
            steelcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Steel Bar',
        ['text'] = {
            [1] = 'Gives {X:chips,C:white}X0.1{} Chips for each {C:attention}Steel Card{} in your {C:attention}full deck{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)()) * 0.1
                }
        end
    end
}