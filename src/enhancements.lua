SMODS.Enhancement { --Blank Card
    key = 'blank',
    atlas = 'Enhancements',
    pos = { x = 0, y = 0 },
    any_suit = false,
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    unlocked = true,
    discovered = true,
    no_collection = false
}

SMODS.Enhancement { --Ghost Card
    key = 'ghost',
    atlas = 'Enhancements',
    pos = { x = 1, y = 0 },
    config = {
        bonus = 15,
        mult = 4
    },
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    weight = 0,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
        end
        if context.discard and context.other_card == card  then
            return { remove = true }
        end
    end
}


SMODS.Enhancement { --Soap Card
    key = 'soap',
    atlas = 'Enhancements',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            handsremaining = 0,
            discardsremaining = 0
        }
    },
    any_suit = false,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    unlocked = true,
    discovered = true,
    no_collection = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {((G.GAME.current_round.hands_left or 0)) * 10, (G.GAME.current_round.discards_left or 0)}}
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.hand and context.main_scoring then
            return { chips = (G.GAME.current_round.hands_left) * 10, mult = G.GAME.current_round.discards_left }
        end
    end
}


SMODS.Enhancement { -- Dollar Card
    key = 'dollar',
    atlas = 'Enhancements',
    pos = { x = 3, y = 0 },
    config = {
        extra = {
            dollars = 1
        }
    },
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = false,
    always_scores = false,
    weight = 0,
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            return { remove = true }
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
            SMODS.calculate_effect({dollars = -lenient_bignum(card.ability.extra.dollars)}, card)
        end
    end
}

-- Future addition : Cardboard