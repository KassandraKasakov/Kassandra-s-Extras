SMODS.Joker{ --Crown
    key = "crown",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Crown',
        ['text'] = {
            [1] = 'Each {C:attention}Jack{} held in hand becomes a {C:attention}King{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  and not context.blueprint then
            if context.other_card:get_id() == 11 then
                return {
                    func = function()
                assert(SMODS.change_base(context.other_card, nil, "King"))
                    end,
                    message = "Card Modified!"
                }
            end
        end
    end
}