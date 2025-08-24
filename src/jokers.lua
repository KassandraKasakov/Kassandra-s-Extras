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
    pixel_size = { w = 49 },
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
            [3] = 'in your {C:attention} full deck{}',
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
    pixel_size = { w = 49 },
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
            if SMODS.get_enhancements(context.other_card)["m_kassandra_blank"] == true then
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
    blueprint_compat = false,
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
    soul_pos = {
        x = 9,
        y = 1
    },
    pixel_size = { h = 74 },
    cost = 7,
    rarity = 3,
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
                center = G.P_CENTERS.m_kassandra_ghos
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


SMODS.Joker{ --Random Boss Blind
    key = "boss_blind",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Random Boss Blind',
        ['text'] = {
            [1] = 'Disable {C:attention}Boss Blind{} when',
            [2] = 'a {C:green}probability {}{C:attention}failed{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 0,
        y = 1
    },
    soul_pos = {
        x = 0,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.pseudorandom_result  then
            if not context.result then
                return {
                    func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('ph_boss_disabled'), colour = G.C.GREEN})
            end
                    return true
                end
                }
            end
        end
    end
}


SMODS.Joker{ --Tiny Boss
    key = "tiny_boss",
    config = {
        extra = {
            blind_size = 2,
            blind_size2 = 2,
            blind_size3 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Tiny Boss',
        ['text'] = {
            [1] = 'Up to ante {C:red}8{}',
            [2] = '{C:red}X2 {}{C:attention}Small {}and {C:attention}Big Blind{} Size',
            [3] = '{C:red}X0.5{} {C:attention}Boss Blind{} size'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 1,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
          return (
          not args 
            
          or args.source == 'sho' or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
    ,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if (G.GAME.blind.boss and G.GAME.round_resets.ante <= 8) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "/"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips / card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            elseif (G.GAME.blind:get_type() == 'Small' and G.GAME.round_resets.ante <= 8) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size2).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size2
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            elseif (G.GAME.blind:get_type() == 'Big' and G.GAME.round_resets.ante <= 8) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size3).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size3
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            end
        end
    end
}


SMODS.Joker{ --Discard Trash Bin
    key = "trash_bin_discard",
    config = {
        extra = {
            BoosterSkipped = 0,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Discard Trash Bin',
        ['text'] = {
            [1] = 'Add 1 {C:attention}discard{} for',
            [2] = 'next round when any',
            [3] = '{C:attention}Booster Pack{} is skipped',
            [4] = '{C:inactive}(Currently{} {C:attention}+#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 2,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.BoosterSkipped}}
    end,

    calculate = function(self, card, context)
        if context.skipping_booster  then
                return {
                    func = function()
                    card.ability.extra.BoosterSkipped = (card.ability.extra.BoosterSkipped) + 1
                    return true
                end
                }
        end
        if context.setting_blind  then
                local BoosterSkipped_value = card.ability.extra.BoosterSkipped
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(BoosterSkipped_value).." Discard", colour = G.C.ORANGE})
                G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + BoosterSkipped_value
                return true
            end,
                    extra = {
                        func = function()
                    card.ability.extra.BoosterSkipped = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
    end
}


SMODS.Joker{ --Hand Trash Bin
    key = "trash_bin_hand",
    config = {
        extra = {
            BoosterSkipped = 0,
            round = 0
        }
    },
    loc_txt = {
        ['name'] = 'Hand Trash Bin',
        ['text'] = {
            [1] = 'Add 1 {C:attention}hand {}for',
            [2] = 'next round when any',
            [3] = '{C:attention}Booster Pack{} is skipped',
            [4] = '{C:inactive}(Currently{} {C:attention}+#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 3,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.BoosterSkipped}}
    end,

    calculate = function(self, card, context)
        if context.skipping_booster  then
                return {
                    func = function()
                    card.ability.extra.BoosterSkipped = (card.ability.extra.BoosterSkipped) + 1
                    return true
                end
                }
        end
        if context.setting_blind  then
                local BoosterSkipped_value = card.ability.extra.BoosterSkipped
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(BoosterSkipped_value).." Hand", colour = G.C.GREEN})
                G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + BoosterSkipped_value
                return true
            end,
                    extra = {
                        func = function()
                    card.ability.extra.BoosterSkipped = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
        end
    end
}


SMODS.Joker{ --Outline
    key = "outline",
    config = {
        extra = {
            blankcardsindeck = 0
        }
    },
    loc_txt = {
        ['name'] = 'Outline',
        ['text'] = {
            [1] = 'Gives {C:blue}+100{} Chips for each',
            [2] = '{C:attention}Blank Card{} in your full deck',
            [3] = '{C:inactive}(Currently {C:blue}+#1#{} Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 4,
        y = 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_kassandra_blank') then count = count + 1 end end; return count end)()) * 100}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_kassandra_blank') then count = count + 1 end end; return count end)()) * 100
                }
        end
    end
}


SMODS.Joker{ --VHS Tape
    key = "vhs",
    config = {
        extra = {
            ante_value = 1
        }
    },
    loc_txt = {
        ['name'] = 'VHS Tape',
        ['text'] = {
            [1] = 'If Game Over, prevents Death',
            [2] = '{C:attention}-1{} ante',
            [3] = '{C:red}self destructs{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 1
    },
    pixel_size = { w = 67 },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over and context.main_eval  then
                return {
                    saved = true,
                    message = "Rewind!",
                    extra = {
                        func = function()
                    local mod = -card.ability.extra.ante_value
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante + mod
				return true
			end,
		}))
                    return true
                end,
                            message = "Ante -" .. card.ability.extra.ante_value,
                        colour = G.C.FILTER,
                        extra = {
                            func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Broken!",
                            colour = G.C.RED
                        }
                        }
                }
        end
    end
}


SMODS.Joker{ --Vecnas House
    key = "mansion",
    config = {
        extra = {
            odds = 2,
            odds2 = 2
        }
    },
    loc_txt = {
        ['name'] = 'Vecnas House',
        ['text'] = {
            [1] = '{C:green}1 in 2{} chance to',
            [2] = 'create copies of {C:attention}Ghost',
            [3] = '{}cards when {C:attention}scored{} / {C:attention}discarded{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 6,
        y = 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_kassandra_ghost"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_27ee9c9c', 1, card.ability.extra.odds, 'j_modprefix_mansion') then
                      G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                copied_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                G.deck:emplace(copied_card)
                table.insert(G.playing_cards, copied_card)
                playing_card_joker_effects({true})
                
                G.E_MANAGER:add_event(Event({
                    func = function() 
                        copied_card:start_materialize()
                        return true
                    end
                }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Card!", colour = G.C.GREEN})
                  end
            end
        end
        if context.discard  then
            if SMODS.get_enhancements(context.other_card)["m_kassandra_ghost"] == true then
                if SMODS.pseudorandom_probability(card, 'group_0_1cff10a6', 1, card.ability.extra.odds, 'j_modprefix_mansion') then
                      SMODS.calculate_effect({func = function()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                        copied_card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        G.deck:emplace(copied_card)
                        table.insert(G.playing_cards, copied_card)
                        playing_card_joker_effects({true})
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                copied_card:start_materialize()
                                return true
                            end
                        }))
                    end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Copied Card!", colour = G.C.GREEN})
                  end
            end
        end
    end
}


SMODS.Joker{ --Showerhead
    key = "showerhead",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Showerhead',
        ['text'] = {
            [1] = 'All played {C:attention}Stone{} cards',
            [2] = 'become {C:attention}Soap {}cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 7,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                context.other_card:set_ability(G.P_CENTERS.m_kassandra_soap)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}


SMODS.Joker{ --Wallet
    key = "wallet",
    config = {
        extra = {
            DollarMult = 0,
            CoinChips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Wallet',
        ['text'] = {
            [1] = 'When shop is entered',
            [2] = 'add {C:attention}1 Dollar{} card and',
            [3] = '{C:attention}1 Coin seal{} card in deck',
            [4] = '{C:red}+1{} Mult for each scored {C:attention}Dollar{} card',
            [5] = '{C:blue}+2{} Chips for each scored {C:attention}Coin seal{}',
            [6] = '{C:inactive}(Curently{} {C:red}+#1#{} {C:inactive}Mult and{} {C:blue}+#2#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 8,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.DollarMult, card.ability.extra.CoinChips}}
    end,

    calculate = function(self, card, context)
        if context.starting_shop  then
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.m_kassandra_dollar
            }, G.discard, true, false, nil, true)
            
            G.E_MANAGER:add_event(Event({
                func = function()
                    new_card:start_materialize()
                    G.play:emplace(new_card)
                    return true
                end
            }))
                local card_front = pseudorandom_element(G.P_CARDS, pseudoseed('add_card'))
            local new_card = create_playing_card({
                front = card_front,
                center = G.P_CENTERS.c_base
            }, G.discard, true, false, nil, true)
            new_card:set_seal("kassandra_coin", true)
            
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
                    message = "Added Card!",
                    extra = {
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
                            message = "Added Card!",
                        colour = G.C.GREEN
                        }
                }
        end
        if context.destroy_card and context.destroy_card.should_destroy  then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.should_destroy = false
            if SMODS.get_enhancements(context.other_card)["m_kassandra_dollar"] == true then
                context.other_card.should_destroy = true
                card.ability.extra.DollarMult = (card.ability.extra.DollarMult) + 1
                return {
                    message = "Destroyed!"
                }
            elseif context.other_card.seal == "Kassandra_coin" then
                context.other_card.should_destroy = true
                card.ability.extra.CoinChips = (card.ability.extra.CoinChips) + 2
                return {
                    message = "Destroyed!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.CoinChips,
                    extra = {
                        mult = card.ability.extra.DollarMult
                        }
                }
        end
    end
}