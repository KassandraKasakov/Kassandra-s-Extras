SMODS.Enhancement { --Blank Card
    key = 'blank_card',
    atlas = 'Enhancements',
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Blank Card',
        text = {
        [1] = 'Do {C:attention}nothing{}',
        [2] = 'No rank or suit'
    }
    },
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
    key = 'ghost_card',
    atlas = 'Enhancements',
    pos = { x = 1, y = 0 },
    config = {
        bonus = 15,
        mult = 4
    },
    loc_txt = {
        name = 'Ghost Card',
        text = {
        [1] = '{C:blue}+15{} Chips',
        [2] = '{C:red}+2{} Mult',
        [3] = 'Disappear if {C:attention}discarded {}',
        [4] = 'or if {C:attention}played{}'
    }
    },
    any_suit = false,
    shatters = true,
    replace_base_card = false,
    no_rank = false,
    no_suit = true,
    always_scores = false,
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