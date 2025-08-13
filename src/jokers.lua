SMODS.Joker{ --Golden Bar
    key = "golden_bar",
    config = {
        extra = {
            dollars = 10
        }
    },
    loc_txt = {
        ['name'] = 'Golden Bar',
        ['text'] = {
            [1] = 'Earn {C:money}$10{} when {C:attention}boss blind{} is defeated'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = false,
    discovered = false,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    dollars = card.ability.extra.dollars
                }
        end
    end
}


SMODS.Joker{ --Steel Bar
    key = "steel_bar",
    config = {
        extra = {
            steelcardsindeck = 1
        }
    },
    loc_txt = {
        ['name'] = 'Steel Bar',
        ['text'] = {
            [1] = 'Gives {X:chips,C:white}X0.1{} Chips for each {C:attention}Steel Card{} in your {C:attention}full deck{}',
            [2] = '{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1   ,
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.steelcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)()) * 0.1}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.steelcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)()) * 0.1
                }
        end
    end
}


SMODS.Joker{ --Three-faces Even
    key = "multi_even",
    config = {
        extra = {
            repetitions = 2
        }
    },
    loc_txt = {
        ['name'] = 'Three-faces Even',
        ['text'] = {
            [1] = 'Retrigger all cards with {C:attention}even {}rank {C:attention}2{} additional times',
            [2] = '{C:inactive}(10, 8, 6, 4, 2){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = false,
    atlas = 'Jokers',

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}


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
            [2] = '{C:inactive}(A, 9, 7, 5, 3){}{}'
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
    atlas = 'Jokers',

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