SMODS.Joker{ --Golden Bar
    key = "golden_bar",
    config = {
        extra = {
            dollars = 10
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
            Xmult = 5
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
    key = "ghost_joker",
    config = {
        extra = {
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
            blind_size = 0.5,
            blind_size2 = 2,
            blind_size3 = 2
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
     calculate = function(self, card, context)
        if context.setting_blind  then
            if (G.GAME.blind.boss and G.GAME.round_resets.ante <= 8) then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
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
            CoinChips = 0,
            odds = 2
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_modprefix_wallet') 
        return {vars = {card.ability.extra.DollarMult, card.ability.extra.CoinChips, new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
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
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_71f70325', 1, card.ability.extra.odds, 'j_modprefix_wallet') then
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
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                  end
                if SMODS.pseudorandom_probability(card, 'group_1_5e2291f8', 1, card.ability.extra.odds, 'j_modprefix_wallet') then
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
                        SMODS.calculate_effect({func = function()
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        return true
                    end
                }))
                draw_card(G.play, G.deck, 90, 'up')
                SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Added Card!", colour = G.C.GREEN})
                  end
            end
        end
    end
}


SMODS.Joker{ --Nobody
    key = "nobody",
    config = {
        extra = {
            blankcardsindeck = 1
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 1,
        y = 2
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.blankcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_kassandra_blank') then count = count + 1 end end; return count end)()) * 0.1}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    e_mult = card.ability.extra.blankcardsindeck + ((function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if SMODS.has_enhancement(card, 'm_kassandra_blank') then count = count + 1 end end; return count end)()) * 0.1
                }
        end
    end
}


SMODS.Joker{ --STOP Sign
    key = "stop",
    config = {
        extra = {
            discard_change = 0,
            blind_size = 0.75
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 2,
        y = 2
    },
    pixel_size = { h = 71 },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if G.GAME.blind.boss then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "X"..tostring(card.ability.extra.blind_size).." Blind Size", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end
                }
            end
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.original_discards = G.GAME.round_resets.discards
        G.GAME.round_resets.discards = card.ability.extra.discard_change
    end,

    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.original_discards then
            G.GAME.round_resets.discards = card.ability.extra.original_discards
        end
    end
}


SMODS.Joker{ --Hanging Chad
    key = "ballot2",
    config = {
        extra = {
            repetitions = 2
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 3,
        y = 2
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card == context.scoring_hand[#context.scoring_hand] then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
    end
}


SMODS.Joker{ --Ancient Clock
    key = "clock",
    config = {
        extra = {
            currentseconds = 0
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 4,
        y = 2
    },
    soul_pos = {
        x = 4,
        y = 3
    },
    pixel_size = { w = 65, h = 65 },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return {vars = {(os.date("*t", os.time()).sec) * 3}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = (os.date("*t", os.time()).sec) * 3
                }
        end
    end
}


SMODS.Joker{ --AstroloJoker
    key = "astrolojoker",
    config = {
        extra = {
            astrological = 0
        }
    },
    atlas = 'Jokers',
    pos = {
        x = 5,
        y = 2
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,

    calculate = function(self, card, context)
        if context.setting_blind  then
                return {
                    func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card{set = 'astrological', key = nil, key_append = 'joker_forge_astrological'}
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_consumable'), colour = G.C.PURPLE})
                    end
                    return true
                end
                }
        end
    end
}


SMODS.Joker{ --Extra Hand
    key = "extra_hand",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Extra Hand',
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
        x = 6,
        y = 2
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

-- Future addition : Some cardboard themed jokers