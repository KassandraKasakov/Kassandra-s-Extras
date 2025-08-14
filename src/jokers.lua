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
            [1] = 'Gives {X:chips,C:white}X0.1{} Chips',
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
    key = "blankjoker",
    config = {
        extra = {
            stonecardsindeck = 1
        }
    },
    loc_txt = {
        ['name'] = 'Blank Joker',
        ['text'] = {
            [1] = 'Gives {X:mult,C:white}X0.75{} Mult for',
            [2] = 'each {C:attention}Blank Card{}',
            [3] = 'in your {C:attention}full deck{}',
            [4] = '{C:inactive}(Currently{} {X:mult,C:white}X#1#{} {C:inactive}Mult){}'
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
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    in_pool = function(self, args)
        return args.source ~= 'sho'
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.stonecardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)()) * 0.75}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    Xmult = card.ability.extra.stonecardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_stone') then count = count + 1 end end; return count end)()) * 0.75
                }
        end
    end
}


SMODS.Joker{ --Time Capsule
    key = "time_capsule",
    config = {
        extra = {
            levels = 1,
            odds = 4,
            levels2 = 1,
            most = 0
        }
    },
    loc_txt = {
        ['name'] = 'Time Capsule',
        ['text'] = {
            [1] = 'When {C:attention}Blind {}is skipped',
            [2] = 'upgrade a random {C:attention}poker hand{}',
            [3] = '{C:green}1 in 4{} chance to upgrade',
            [4] = 'level of your most',
            [5] = 'played {C:attention}poker hand{}'
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
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.skip_blind  then
            if true then
                available_hands = {}
        for hand, value in pairs(G.GAME.hands) do
          if value.visible and value.level >= to_big(1) then
            table.insert(available_hands, hand)
          end
        end
        target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                return {
                    level_up = card.ability.extra.levels,
      level_up_hand = target_hand,
                    message = localize('k_level_up_ex')
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_8ba5381e', 1, card.ability.extra.odds, 'j_modprefix_time_capsule') then
                      temp_played = 0
        temp_order = math.huge
        for hand, value in pairs(G.GAME.hands) do 
          if value.played > temp_played and value.visible then
            temp_played = value.played
            temp_order = value.order
            target_hand2 = hand
          else if value.played == temp_played and value.visible then
            if value.order < temp_order then
              temp_order = value.order
              target_hand2 = hand
            end
          end
          end
        end
                        SMODS.calculate_effect({level_up = card.ability.extra.levels2,
      level_up_hand = target_hand2}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
                  end
                        return true
                    end
                }
            end
        end
    end
}

SMODS.Joker{ --Sadey Face
    key = "sadey_face",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Sadey Face',
        ['text'] = {
            [1] = 'Hands played without a',
            [2] = '{C:attention}face {}card give',
            [3] = '{C:red}+6{} Mult when scored'
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
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:is_face() then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 0
end)() then
            end
        end
    end
}