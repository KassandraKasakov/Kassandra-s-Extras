SMODS.Seal { -- Turquoise
    key = 'turquoise',
    atlas = 'Seals',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('58E0F2'),
   loc_txt = {
        name = 'Turquoise Seal',
        label = 'Turquoise Seal',
        text = {
        [1] = 'Balance {C:blue}Chips{} and',
        [2] = '{C:red}Mult{} while this card',
        [3] = 'stays in hand'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return { balance = true }
        end
    end
}

SMODS.Seal { -- Orange
    key = 'orange',
    atlas = 'Seals',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
            card_draw = 2
        }
    },
    badge_colour = HEX('d68538'),
   loc_txt = {
        name = 'Orange Seal',
        label = 'Orange Seal',
        text = {
        [1] = 'Draw {C:attention}2 {}cards when discarded'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.discard and context.other_card == card then
            if G.GAME.blind.in_blind then
    SMODS.draw_cards(card.ability.seal.extra.card_draw)
  end
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.seal.extra.card_draw).." Cards Drawn", colour = G.C.BLUE})
        end
    end
}


SMODS.Seal { -- Golden Star
    key = 'golden_star',
    atlas = 'Seals',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            lowestrankinhand = 0,
            odds = 3
        }
    },
    badge_colour = G.C.GOLD,
   loc_txt = {
        name = 'Golden Star',
        label = 'Golden Star',
        text = {
        [1] = '{C:green}1 in 3{} chance to',
        [2] = 'give {C:money}$ lowest rank{}',
        [3] = 'when {C:attention}held in hand{}'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            if SMODS.pseudorandom_probability(card, 'group_0_68237b19', 1, card.ability.seal.extra.odds, 'm_modprefix') then
                SMODS.calculate_effect({dollars = lenient_bignum((function() local min = 14; for _, card in ipairs(G.hand and G.hand.cards or {}) do if card.base.id < min then min = card.base.id end end; return min end)())}, card)
            end
        end
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end
}


SMODS.Seal { -- Rainbow
    key = 'rainbow',
    atlas = 'Seals',
    pos = { x = 3, y = 0 },
    badge_colour = HEX('EE82EE'),
   loc_txt = {
        name = 'Rainbow Seal',
        label = 'Rainbow Seal',
        text = {
        [1] = 'Swap {C:blue}Chips {}and {C:red}Mult {}',
        [2] = 'when this card is played and scores'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            return { swap = true }
        end
    end,
    draw = function(self, card, layer)
        if (layer == 'card' or layer == 'both') and card.sprite_facing == 'front' then
            G.shared_seals[card.seal].role.draw_major = card
            G.shared_seals[card.seal]:draw_shader('dissolve', nil, nil, nil, card.children.center)
            G.shared_seals[card.seal]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
        end
    end
}