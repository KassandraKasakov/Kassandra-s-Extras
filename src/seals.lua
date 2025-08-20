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


SMODS.Seal {
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