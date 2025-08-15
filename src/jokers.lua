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
            [1] = 'Earn {C:money}$10{} when',
            [2] = '{C:attention}boss blind{} is defeated'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    atlas = 'Jokers',
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
            [1] = 'Gives {X:chips,C:white}X0.05{} Chips',
            [2] = 'for each {C:attention}Steel Card{}',
            [3] = 'in your {C:attention}full deck{}',
            [4] = '{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
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

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.steelcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)()) * 0.05}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    x_chips = card.ability.extra.steelcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_steel') then count = count + 1 end end; return count end)()) * 0.05
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
            [1] = 'Retrigger all cards with',
            [2] = '{C:attention}even {}rank {C:attention}2{} additional times',
            [3] = '{C:inactive}(10, 8, 6, 4, 2){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
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
            [1] = 'Retrigger all cards with',
            [2] = '{C:attention}odd {}rank {C:attention}1{} additional times',
            [3] = '{C:inactive}(A, 9, 7, 5, 3){}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
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
            [1] = 'Each {C:attention}Jack{} held in hand',
            [2] = 'becomes a {C:attention}King{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
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


SMODS.Joker{ --Blank Joker
    key = "blank_joker",
    config = {
        extra = {
            emult = 1.1
        }
    },
    loc_txt = {
        ['name'] = 'Blank Joker',
        ['text'] = {
            [1] = 'Played {C:attention}blank {}cards',
            [2] = 'give {X:mult,C:white}X5{} Mult',
            [3] = 'when scored'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_kassandra_blank_card"] == true then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}


SMODS.Joker{ --Time Capsule
    key = "time_capsule",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Time Capsule',
        ['text'] = {
            [1] = '{C:attention}+1{} voucher in shop',
            [2] = '{C:attention}+1{} booster pack in shop'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 6,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(1)
        SMODS.change_booster_limit(1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_voucher_limit(-1)
        SMODS.change_booster_limit(-1)
    end
}


SMODS.Joker{ --Sadey Face
    key = "sadey_face",
    config = {
        extra = {
            mult = 2,
            mult2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Sadey Face',
        ['text'] = {
            [1] = 'Played {C:orange}non-face{} cards',
            [2] = 'give {C:mult}+2{} Mult',
            [3] = 'when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 4 or context.other_card:get_id() == 6 or context.other_card:get_id() == 8 or context.other_card:get_id() == 10) then
                return {
                    mult = card.ability.extra.mult
                }
            elseif (context.other_card:get_id() == 14 or context.other_card:get_id() == 3 or context.other_card:get_id() == 5 or context.other_card:get_id() == 7 or context.other_card:get_id() == 9) then
                return {
                    mult = card.ability.extra.mult2
                }
            end
        end
    end
}


SMODS.Joker{ --Oops! All 9s
    key = "oops_all_9s",
    config = {
        extra = {
            mod_probability = 2,
            denominator = 0
        }
    },
    loc_txt = {
        ['name'] = 'Oops! All 9s',
        ['text'] = {
            [1] = 'Halves all {C:attention}listed{}',
            [2] = '{C:green}probabilities{}',
            [3] = '(ex: {C:green}1 in 3{} -> {C:green}1 in 6{})'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 0
    },
    cost = 4,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
          if context.mod_probability  then
          local numerator, denominator = context.numerator, context.denominator
                  denominator = denominator * card.ability.extra.mod_probability
        return {
          numerator = numerator, 
          denominator = denominator
        }
          end
    end
}

SMODS.Joker{ --Ghost Joker
    key = "ghostjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Ghost Joker',
        ['text'] = {
            [1] = 'Adds one {C:attention}Ghost {}card',
            [2] = 'to deck when',
            [3] = '{C:attention}Blind {}is skipped'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 9,
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
        if context.skip_blind  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_mycustom_ghost_card
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                return {
                    func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end,
                    message = "Added Card!"
                }
        end
    end
}