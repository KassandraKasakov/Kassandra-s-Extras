SMODS.Joker{ --Two-faces Odd
    key = "multi_odd",
    config = {
        extra = {
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Two-faces Odd',
        ['text'] = {
            [1] = 'Retrigger all cards with {C:attention}odd {}rank {C:attention}1{} additional times',
            [2] = '{s:0.8}(A, 9, 7, 5, 3){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 3,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}