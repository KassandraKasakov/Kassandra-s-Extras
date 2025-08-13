SMODS.Joker{ --Crown
    key = "crown",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Crown',
        ['text'] = {
            [1] = 'Each {C:attention}#1#{} held in hand becomes {C:attention}Kings{}',
            [2] = 'Rank changes every round'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
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
    atlas = 'Jokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {localize((G.GAME.current_round.rankvar_card or {}).rank or 'Ace', 'ranks')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.rankvar_card = { rank = '2', id = 2 }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  and not context.blueprint then
                if G.playing_cards then
                        local valid_rankvar_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_rankvar_cards[#valid_rankvar_cards + 1] = v
                            end
                        end
                        if valid_rankvar_cards[1] then
                            local rankvar_card = pseudorandom_element(valid_rankvar_cards, pseudoseed('rankvar' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.rankvar_card.rank = rankvar_card.base.value
                            G.GAME.current_round.rankvar_card.id = rankvar_card.base.id
                        end
                    end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  and not context.blueprint then
            if context.other_card:get_id() == G.GAME.current_round.rankvar_card.id then
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