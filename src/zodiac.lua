SMODS.ConsumableType { --Def of Zodiac Type
    key = 'zodiac',
    primary_colour = G.KASSANDRA.C.astro_light,
    secondary_colour = G.KASSANDRA.C.astro_dark,
    collection_rows = { 6, 6 },
    shop_rate = 1,
    cards = {
        ['c_kassandra_aquarius'] = true,
        ['c_kassandra_aries'] = true,
        ['c_kassandra_cancer'] = true,
        ['c_kassandra_capricorn'] = true,
        ['c_kassandra_gemini'] = true,
        ['c_kassandra_leo'] = true,
        ['c_kassandra_libra'] = true,
        ['c_kassandra_pisces'] = true,
        ['c_kassandra_sagittarius'] = true,
        ['c_kassandra_scorpio'] = true,
        ['c_kassandra_taurus'] = true,
        ['c_kassandra_virgo'] = true
    },
    loc_txt = {
        name = "Zodiac",
        collection = "Zodiac Cards",
    }
}


-- ALL CONSUMABLES HERE 

SMODS.Consumable { --Aries
    key = 'aries',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Aries',
        text = {
        [1] = 'Gives {C:money}$Hand Size{}',
        [2] = '{C:inactive}(Currently{} {C:money}$#1#{}{C:inactive}){}'
    }
    },
    config = { extra = {
        currenthandsize = 0
    } },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {((G.hand and G.hand.config.card_limit or 0) or 0)}}
    end,
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring((G.hand and G.hand.config.card_limit or 0)).." $", colour = G.C.MONEY})
                    ease_dollars((G.hand and G.hand.config.card_limit or 0), true)
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Taurus
    key = 'taurus',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Taurus',
        text = {
        [1] = 'Create a random {C:dark_edition}negative {}common {C:attention}Joker{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.4,
                  func = function()
                      play_sound('timpani')
                      local new_joker = SMODS.add_card({ set = 'Joker', rarity = 'Common' })
                      if new_joker then
                          new_joker:set_edition({ negative = true }, true)
                      end
                      used_card:juice_up(0.3, 0.5)
                      return true
                  end
              }))
              delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}

SMODS.Consumable { --Gemini
    key = 'gemini',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        copy_cards_amount = 2
    } },
    loc_txt = {
        name = 'Gemini',
        text = {
        [1] = 'Create {C:attention}2{} copies of {C:attention}1{} selected card'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local _first_materialize = nil
                    local new_cards = {}
                    
                    for _, selected_card in pairs(G.hand.highlighted) do
                        for i = 1, card.ability.extra.copy_cards_amount do
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local copied_card = copy_card(selected_card, nil, nil, G.playing_card)
                            copied_card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, copied_card)
                            G.hand:emplace(copied_card)
                            copied_card:start_materialize(nil, _first_materialize)
                            _first_materialize = true
                            new_cards[#new_cards + 1] = copied_card
                        end
                    end
                    
                    SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}


SMODS.Consumable { --Cancer
    key = 'cancer',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        odds = 4,
        perma_bonus_value = 5
    } },
    loc_txt = {
        name = 'Cancer',
        text = {
        [1] = 'Select {C:attention}1{} selected card',
        [2] = '{C:green}1 in 4{} chance to add {C:red}+5{} Mult'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            if SMODS.pseudorandom_probability(card, 'group_0_cb0df3bf', 1, card.ability.extra.odds, 'c_modprefix') then
                G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult or 0
                        G.hand.highlighted[i].ability.perma_mult = G.hand.highlighted[i].ability.perma_mult + 5
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            end
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}


SMODS.Consumable { --Leo
    key = 'leo',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        cards_amount = 5
    } },
    loc_txt = {
        name = 'Leo',
        text = {
        [1] = 'Converts {C:attention}5{} cards in hand',
        [2] = 'to a single random {C:attention}suit {}',
        [3] = 'and a random {C:attention}rank{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            local affected_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, math.min(card.ability.extra.cards_amount, #temp_hand) do 
                affected_cards[#affected_cards + 1] = temp_hand[i] 
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #affected_cards do
                local percent = 1.15 - (i - 0.999) / (#affected_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        affected_cards[i]:flip()
                        play_sound('card1', percent)
                        affected_cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #affected_cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local _suit = pseudorandom_element(SMODS.Suits, 'random_suit')
                        assert(SMODS.change_base(affected_cards[i], _suit.key))
                        return true
                    end
                }))
            end
            for i = 1, #affected_cards do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local _rank = pseudorandom_element(SMODS.Ranks, 'random_rank')
                        assert(SMODS.change_base(affected_cards[i], nil, _rank.key))
                        return true
                    end
                }))
            end
            for i = 1, #affected_cards do
                local percent = 0.85 + (i - 0.999) / (#affected_cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        affected_cards[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        affected_cards[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.5)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Virgo
    key = 'virgo',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 6, y = 0 },
    soul_pos = { x = 6, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Virgo',
        text = {
        [1] = 'Enhances {C:attention}2{} selected',
        [2] = 'cards into a',
        [3] = '{C:attention}Blank{} Card'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 2 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_kassandra_blank'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted <= 2)
    end
}


SMODS.Consumable { --Libra
    key = 'libra',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 1, y = 2 },
    soul_pos = { x = 1, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Libra',
        text = {
        [1] = 'Add a random {C:dark_edition}edition{}',
        [2] = 'to {C:attention}1{} selected card',
        [3] = 'Destroy {C:attention}1{} random card in hand'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local edition = poll_edition('random_edition', nil, true, true, 
                            { 'e_polychrome', 'e_holo', 'e_foil' })
                        G.hand.highlighted[i]:set_edition(edition, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
            local destroyed_cards = {}
            local temp_hand = {}

            for _, playing_card in ipairs(G.hand.cards) do temp_hand[#temp_hand + 1] = playing_card end
            table.sort(temp_hand,
                function(a, b)
                    return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card
                end
            )

            pseudoshuffle(temp_hand, 12345)

            for i = 1, 1 do destroyed_cards[#destroyed_cards + 1] = temp_hand[i] end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            SMODS.destroy_cards(destroyed_cards)

            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}


SMODS.Consumable { --Scorpio
    key = 'scorpio',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 2, y = 2 },
    soul_pos = { x = 2, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Scorpio',
        text = {
        [1] = '{C:attention}Remove{} all {C:enhanced}Enhancement{}',
        [2] = '{C:attention}Seal {}and {C:dark_edition}Edition {}up',
        [3] = 'to {C:attention}3{} selected cards'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 3 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS.c_base)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_seal(nil, nil, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_edition(nil, true)
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted <= 3)
    end
}


SMODS.Consumable { --Sagittarius
    key = 'sagittarius',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 3, y = 2 },
    soul_pos = { x = 3, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Sagittarius',
        text = {
        [1] = 'Upgrade a random',
        [2] = '{C:attention}poker hand{} by {C:attention}3{} level'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = '???', chips = '???', mult = '???', level = '' })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = true
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { mult = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    return true
                end
            }))
            update_hand_text({ delay = 0 }, { chips = '+', StatusText = true })
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.9,
                func = function()
                    play_sound('tarot1')
                    card:juice_up(0.8, 0.5)
                    G.TAROT_INTERRUPT_PULSE = nil
                    return true
                end
            }))
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(3) })
            delay(1.3)
            
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            level_up_hand(card, random_hand, true, 3)
            
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize(random_hand, 'poker_hands'), 
                 chips = G.GAME.hands[random_hand].chips, 
                 mult = G.GAME.hands[random_hand].mult, 
                 level=G.GAME.hands[random_hand].level})
            delay(1.3)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Capricorn
    key = 'capricorn',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 4, y = 2 },
    soul_pos = { x = 4, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Capricorn',
        text = {
        [1] = 'Create a {C:attention}random tag{}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                    local tag = Tag(selected_tag)
                    if tag.name == "Orbital Tag" then
                        local _poker_hands = {}
                        for k, v in pairs(G.GAME.hands) do
                            if v.visible then
                                _poker_hands[#_poker_hands + 1] = k
                            end
                        end
                        tag.ability.orbital_hand = pseudorandom_element(_poker_hands, "jokerforge_orbital")
                    end
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Aquarius
    key = 'aquarius',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 5, y = 2 },
    soul_pos = { x = 5, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Aquarius',
        text = {
        [1] = 'Enhances {C:attention}1{} selected card into a {C:attention}Ghost{} Card'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted == 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for i = 1, #G.hand.highlighted do
                local percent = 1.15 - (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('card1', percent)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for i = 1, #G.hand.highlighted do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.1,
                    func = function()
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_kassandra_ghost'])
                        return true
                    end
                }))
            end
            for i = 1, #G.hand.highlighted do
                local percent = 0.85 + (i - 0.999) / (#G.hand.highlighted - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.highlighted[i]:flip()
                        play_sound('tarot2', percent, 0.6)
                        G.hand.highlighted[i]:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.hand:unhighlight_all()
                    return true
                end
            }))
            delay(0.5)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted == 1)
    end
}


SMODS.Consumable { --Pisces
    key = 'pisces',
    set = 'zodiac',
    atlas = 'Zodiac',
    pos = { x = 6, y = 2 },
    soul_pos = { x = 6, y = 3 },
    pixel_size = { h = 63 },
    config = { extra = {
        consumable_count = 1
    } },
    loc_txt = {
        name = 'Pisces',
        text = {
        [1] = 'Create a random {C:planet}Zodiac{} Card'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        if G.consumeables.config.card_limit > #G.consumeables.cards then
                            play_sound('timpani')
                            SMODS.add_card({ set = 'zodiac' })
                            used_card:juice_up(0.3, 0.5)
                        end
                        return true
                    end
                }))
            end
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}