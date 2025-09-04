SMODS.ConsumableType { --Def of Astrological Type
    key = 'astrological',
    primary_colour = G.KASSANDRA.C.astro_light,
    secondary_colour = G.KASSANDRA.C.astro_dark,
    collection_rows = { 6, 6 },
    shop_rate = 1,
    cards = {
        ['c_kassandra_andromeda'] = true,
        ['c_kassandra_centaurus'] = true,
        ['c_kassandra_crater'] = true,
        ['c_kassandra_crux'] = true,
        ['c_kassandra_hercules'] = true,
        ['c_kassandra_lynx'] = true,
        ['c_kassandra_orion'] = true,
        ['c_kassandra_serpens'] = true,
        ['c_kassandra_sextan'] = true,
        ['c_kassandra_triangulum'] = true,
        ['c_kassandra_ursa_major'] = true,
        ['c_kassandra_ursa_minor'] = true
    },
    loc_txt = {
        name = "Astrological",
        collection = "Astrological Cards",
    }
}

-- ALL CONSUMABLES HERE 

SMODS.Consumable { --Andromeda
    key = 'andromeda',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        copy_amount = 1
    } },
    loc_txt = {
        name = 'Andromeda',
        text = {
        [1] = 'Create a {C:attention}copy {}of',
        [2] = 'a {C:attention}random {}Joker'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            local jokers_to_copy = {}
            local available_jokers = {}
            
            for _, joker in pairs(G.jokers.cards) do
                if joker.ability.set == 'Joker' then
                    available_jokers[#available_jokers + 1] = joker
                end
            end
            
            if #available_jokers > 0 then
                local temp_jokers = {}
                for _, joker in ipairs(available_jokers) do 
                    temp_jokers[#temp_jokers + 1] = joker 
                end
                
                pseudoshuffle(temp_jokers, 54321)
                
                for i = 1, math.min(card.ability.extra.copy_amount, #temp_jokers, G.jokers.config.card_limit - #G.jokers.cards) do
                    jokers_to_copy[#jokers_to_copy + 1] = temp_jokers[i]
                end
            end

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            local _first_materialize = nil
            for _, joker_to_copy in pairs(jokers_to_copy) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        local copied_joker = copy_card(joker_to_copy, nil, nil, nil, false)
                        copied_joker:start_materialize(nil, _first_materialize)
                        copied_joker:add_to_deck()
                        G.jokers:emplace(copied_joker)
                        _first_materialize = true
                        copied_joker:set_edition(nil, true)
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


SMODS.Consumable { --Centaurus
    key = 'centaurus',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        joker_slots_value = 1
    } },
    loc_txt = {
        name = 'Centaurus',
        text = {
        [1] = '{C:attention}+1{} Joker Slot'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(1).." Joker Slot", colour = G.C.DARK_EDITION})
                    G.jokers.config.card_limit = G.jokers.config.card_limit + 1
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Crater
    key = 'crater',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        levels = 1
    } },
    loc_txt = {
        name = 'Crater',
        text = {
        [1] = 'Upgrade {C:attention}3{} random',
        [2] = '{C:attention}poker hands{} by {C:attention}1{} level'
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            level_up_hand(card, random_hand, true, 1)
            
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize(random_hand, 'poker_hands'), 
                 chips = G.GAME.hands[random_hand].chips, 
                 mult = G.GAME.hands[random_hand].mult, 
                 level=G.GAME.hands[random_hand].level})
            delay(1.3)
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            level_up_hand(card, random_hand, true, 1)
            
            update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, 
                {handname=localize(random_hand, 'poker_hands'), 
                 chips = G.GAME.hands[random_hand].chips, 
                 mult = G.GAME.hands[random_hand].mult, 
                 level=G.GAME.hands[random_hand].level})
            delay(1.3)
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(1) })
            delay(1.3)
            
            local hand_pool = {}
            for hand_key, _ in pairs(G.GAME.hands) do
                table.insert(hand_pool, hand_key)
            end
            local random_hand = pseudorandom_element(hand_pool, 'random_hand_levelup')
            level_up_hand(card, random_hand, true, 1)
            
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


SMODS.Consumable { --Crux
    key = 'crux',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Crux',
        text = {
        [1] = '{C:attention}Destroy {}as {C:attention}many {}',
        [2] = '{C:attention}selected cards{}',
        [3] = 'as you want'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted >= 1 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('tarot1')
                    used_card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    SMODS.destroy_cards(G.hand.highlighted)
                    return true
                end
            }))
            delay(0.3)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted >= 1)
    end
}


SMODS.Consumable { --Hercules
    key = 'hercules',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        hands_value = 2,
        discards_value = 2
    } },
    loc_txt = {
        name = 'Hercules',
        text = {
        [1] = '{C:attention}+2{} hands this round',
        [2] = '{C:attention}+2{} discards this round'
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
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Hand", colour = G.C.GREEN})
                    G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 2
                    return true
                end
            }))
            delay(0.6)
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(2).." Discard", colour = G.C.ORANGE})
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left + 2
                    return true
                end
            }))
            delay(0.6)
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Ursa Major
    key = 'ursa_major',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 0 },
    soul_pos = { x = 6, y = 1 },
    pixel_size = { h = 63 },
    config = { extra = {
        levels = 2
    } },
    loc_txt = {
        name = 'Ursa Major',
        text = {
        [1] = 'Upgrade {C:attention}every {}',
        [2] = 'poker hand',
        [3] = 'by {C:attention}2{} level',
        [4] = '{C:inactive}(Ursa Minor required){}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if (function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_kassandra_ursa_minor" then
            count = count + 1
        end
    end
    return count == 1
end)() then
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
                { handname = localize('k_all_hands'), chips = '...', mult = '...', level = '' })
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
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.9, delay = 0 }, { level = '+'..tostring(2) })
            delay(1.3)
            for poker_hand_key, _ in pairs(G.GAME.hands) do
                level_up_hand(card, poker_hand_key, true, 2)
            end
            update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
                { mult = 0, chips = 0, handname = '', level = '' })
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == "astrological" and consumable.config.center.key == "c_kassandra_ursa_minor" then
                    table.insert(target_cards, consumable)
                end
            end
            if #target_cards > 0 then
                local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_to_destroy:start_dissolve()
                        return true
                    end
                }))
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
            end
        end
    end,
    can_use = function(self, card)
        return ((function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_kassandra_ursa_minor" then
            count = count + 1
        end
    end
    return count == 1
end)())
    end
}


SMODS.Consumable { --Lynx
    key = 'lynx',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 2 },
    soul_pos = { x = 1, y = 3 },
    pixel_size = { h = 63 },
    config = { extra = {
        consumable_count = 1
    } },
    loc_txt = {
        name = 'Lynx',
        text = {
        [1] = 'Create a random {C:planet}Astrological{} Card'
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
                            SMODS.add_card({ set = 'astrological' })
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


SMODS.Consumable { --Orion
    key = 'orion',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 2 },
    soul_pos = { x = 2, y = 3 },
    pixel_size = { h = 63 },
    config = { extra = {
        hand_size_value = 5
    } },
    loc_txt = {
        name = 'Orion',
        text = {
        [1] = 'Draw {C:attention}5{} cards',
        [2] = 'to hand'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
            if G.GAME.blind.in_blind then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(5).." Cards Drawn", colour = G.C.BLUE})
                SMODS.draw_cards(5)
                return true
            end
        }))
        delay(0.6)
      end
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Serpens
    key = 'serpens',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 2 },
    soul_pos = { x = 3, y = 3 },
    pixel_size = { h = 63 },
    config = { extra = {
        discards_value = 2
    } },
    loc_txt = {
        name = 'Serpens',
        text = {
        [1] = 'Increases rank of',
        [2] = 'up to {C:attention}4{} selected',
        [3] = 'cards by {C:attention}1{}',
        [4] = '{C:red}-2{} discards this round'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if #G.hand.highlighted <= 4 then
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
                        assert(SMODS.modify_rank(G.hand.highlighted[i], 1))
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
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "-"..tostring(2).." Discard", colour = G.C.RED})
                    G.GAME.current_round.discards_left = G.GAME.current_round.discards_left - 2
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return (#G.hand.highlighted <= 4)
    end
}


SMODS.Consumable { --Sextan
    key = 'sextan',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 2 },
    soul_pos = { x = 4, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Sextan',
        text = {
        [1] = 'Reroll {C:attention}Boss Blind{}'
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
                    local tag = Tag("tag_boss")
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


SMODS.Consumable { --Triangulum
    key = 'triangulum',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 2 },
    soul_pos = { x = 5, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Triangulum',
        text = {
        [1] = 'Add {C:dark_edition}Cosmic{} effect to',
        [2] = '{C:attention}1{} selected card in hand'
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
                        G.hand.highlighted[i]:set_edition({ kassandra_cosmic = true }, true)
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


SMODS.Consumable { --Ursa Minor
    key = 'ursa_minor',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 2 },
    soul_pos = { x = 6, y = 3 },
    pixel_size = { h = 63 },
    config = { extra = {
        dollars_value = 100
    } },
    loc_txt = {
        name = 'Ursa Minor',
        text = {
        [1] = '{C:money}+$100{}',
        [2] = '{C:inactive}(Ursa Major required){}'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        local used_card = copier or card
        if (function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_kassandra_ursa_major" then
            count = count + 1
        end
    end
    return count == 1
end)() then
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == "astrological" and consumable.config.center.key == "c_kassandra_ursa_major" then
                    table.insert(target_cards, consumable)
                end
            end
            if #target_cards > 0 then
                local card_to_destroy = pseudorandom_element(target_cards, pseudoseed('destroy_consumable'))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_to_destroy:start_dissolve()
                        return true
                    end
                }))
                card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "Destroyed Consumable!", colour = G.C.RED})
            end
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    card_eval_status_text(used_card, 'extra', nil, nil, nil, {message = "+"..tostring(100).." $", colour = G.C.MONEY})
                    ease_dollars(100, true)
                    return true
                end
            }))
            delay(0.6)
        end
    end,
    can_use = function(self, card)
        return ((function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_kassandra_ursa_major" then
            count = count + 1
        end
    end
    return count == 1
end)())
    end
}