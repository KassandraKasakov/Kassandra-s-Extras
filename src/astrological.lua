SMODS.ConsumableType { --Def of Astrological Type
    key = 'astrological',
    shader = 'tarot',
    primary_colour = HEX('757cdc'),
    secondary_colour = HEX('757cdc'),
    collection_rows = { 6, 6 },
    shop_rate = 4,
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
        name = "Astrological",
        collection = "Astrological Cards",
    }
}


SMODS.Consumable { --Aries
    key = 'aries',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'I - Aries',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Taurus
    key = 'taurus',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'II - Taurus',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Gemini
    key = 'gemini',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = 'III - Gemini',
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
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'IV - Cancer',
        text = {
        [1] = '888888'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Leo
    key = 'leo',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'V - Leo',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Virgo
    key = 'virgo',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'VI - Virgo',
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
                        G.hand.highlighted[i]:set_ability(G.P_CENTERS['m_kassandra_blank_card'])
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
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = 'VII - Libra',
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
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 1 },
    loc_txt = {
        name = 'VIII - Scorpio',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Sagittarius
    key = 'sagittarius',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 1 },
    loc_txt = {
        name = 'IX - Sagittarius',
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
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 1 },
    loc_txt = {
        name = 'X - Capricorn',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Aquarius
    key = 'aquarius',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 1 },
    loc_txt = {
        name = 'XI - Aquarius',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Pisces
    key = 'pisces',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 1 },
    loc_txt = {
        name = 'XII - Pisces',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}