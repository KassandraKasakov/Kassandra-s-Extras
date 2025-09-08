SMODS.PokerHandPart {
    key = '6',
    func = function(hand)
        return get_X_same(6, hand)
    end
}


SMODS.PokerHandPart {
    key = '6_flush',
    func = function(hand)
        if G.STAGE == G.STAGES.RUN and G.hand.config.highlighted_limit >= 6 then

            local ret = {}
            local four_fingers = SMODS.four_fingers('flush') + 1
            local suits = SMODS.Suit.obj_buffer
            if #hand < four_fingers then
                return ret
            else
                for j = 1, #suits do
                    local t = {}
                    local suit = suits[j]
                    local flush_count = 0
                    for i = 1, #hand do
                        if hand[i]:is_suit(suit, nil, true) then
                            flush_count = flush_count + 1; t[#t + 1] = hand[i]
                        end
                    end
                    if flush_count >= four_fingers then
                        table.insert(ret, t)
                        return ret
                    end
                end
                return {}
            end
        end
    end
}


SMODS.PokerHandPart {
    key = '6_straight',
    func = function(hand)
        if G.STAGE == G.STAGES.RUN and G.hand.config.highlighted_limit >= 6 then
            return get_straight(hand, SMODS.four_fingers('straight') + 1, SMODS.shortcut(), SMODS.wrap_around_straight())
        end
    end
}





SMODS.PokerHand { -- Triple Pair
    key = "triple_pair",
    mult = 5,
    chips = 30,
    l_mult = 1,
    l_chips = 15,
    loc_txt = {
        name = 'Triple Pair',
        description = {
        [1] = '3 pairs of cards with different ranks',
        [2] = '6 cards required'
    }
    },
    example = {
        { 'H_A', true },
        { 'D_A', true },
        { 'H_4', true },
        { 'C_4', true },
        { 'S_T', true },
        { 'D_T', true }
    },
    evaluate = function(parts, hand)
        return #parts._2 >= 3 and parts._all_pairs or {}
    end
} -- Planet : Glacio


SMODS.PokerHand { -- Flush Triple Pair
    key = 'flush_triple_pair',
    mult = 14,
    chips = 150,
    l_mult = 3,
    l_chips = 30,
    loc_txt = {
        name = 'Flush Triple Pair',
        description = {
        [1] = '3 pairs of cards with different ranks but same suit',
        [2] = '6 cards required'
    }
    },
    example = {

        { 'S_K', true },
        { 'S_K', true },
        { 'S_9', true },
        { 'S_9', true },
        { 'S_6', true },
        { 'S_6', true }

    },
    evaluate = function(parts, hand)
        return #parts._2 == 3 and next(parts.kassandra_6_flush) and
            { SMODS.merge_lists(parts._all_pairs, parts.kassandra_6_flush) } or {}
    end
} -- Planet : Vesania


SMODS.PokerHand { -- Double Three of a Kind
    key = 'double_three_of_a_kind',
    mult = 6,
    chips = 55,
    l_mult = 2,
    l_chips = 20,
    loc_txt = {
        name = 'Double Three of a Kind',
        description = {
        [1] = '2 three of a kind with different ranks',
        [2] = '6 cards required'
    }
    },
    example = {
        { 'C_3', true },
        { 'D_3', true },
        { 'H_3', true },
        { 'S_K', true },
        { 'S_K', true },
        { 'D_K', true }
    },
    evaluate = function(parts, hand)
        return #parts._3 >= 2 and parts._all_pairs or {}
    end
} -- Planet : Volcana


SMODS.PokerHand { -- Flush Double Three of a Kind
    key = 'flush_double_three_of_a_kind',
    mult = 16,
    chips = 170,
    l_mult = 4,
    l_chips = 50,
    loc_txt = {
        name = 'Flush Double Three of a Kind',
        description = {
        [1] = '2 three of a kind with different ranks but same suit',
        [2] = '6 cards required'
    }
    },
    example = {

        { 'S_K', true },
        { 'S_K', true },
        { 'S_K', true },
        { 'S_9', true },
        { 'S_9', true },
        { 'S_9', true }

    },
    evaluate = function(parts, hand)
        return #parts._3 >= 2 and next(parts.kassandra_6_flush)
            and { SMODS.merge_lists(parts._all_pairs, parts.kassandra_6_flush) } or {}
    end
} -- Planet : Holo


SMODS.PokerHand { -- Six of a Kind
    key = 'six_of_a_kind',
    mult = 18,
    chips = 180,
    l_mult = 4,
    l_chips = 40,
    loc_txt = {
        name = 'Six of a Kind',
        description = {
        [1] = '6 cards with the same rank',
        [2] = '6 cards required'
    }
    },
    example = {
        { 'C_5', true },
        { 'H_5', true },
        { 'H_5', true },
        { 'S_5', true },
        { 'C_5', true },
        { 'D_5', true }
    },
    evaluate = function(parts, hand)
        return next(parts.kassandra_6) and parts.kassandra_6 or {}
    end
} -- Planet : Calidor


SMODS.PokerHand { -- Flush Six
    key = 'flush_six',
    mult = 22,
    chips = 220,
    l_mult = 5,
    l_chips = 50,
    loc_txt = {
        name = 'Flush Six',
        description = {
        [1] = '6 cards with the same rank and suit',
        [2] = '6 cards required'
    }
    },
    example = {

        { 'S_2', true },
        { 'S_2', true },
        { 'S_2', true },
        { 'S_2', true },
        { 'S_2', true },
        { 'S_2', true }

    },
    evaluate = function(parts, hand)
        return next(parts.kassandra_6) and next(parts.kassandra_6_flush)
            and { SMODS.merge_lists(parts.kassandra_6, parts.kassandra_6_flush) } or {}
    end
} -- Planet : Crimson


SMODS.PokerHand { -- Full Manor
    key = 'full_manor',
    mult = 8,
    chips = 70,
    l_mult = 3,
    l_chips = 40,
    loc_txt = {
        name = 'Full Manor',
        description = {
        [1] = 'A Four of a Kind and a Pair',
        [2] = '6 cards required'
    }
    },
    example = {
        { 'C_T', true },
        { 'S_T', true },
        { 'H_7', true },
        { 'S_7', true },
        { 'C_7', true },
        { 'D_7', true }
    },
    evaluate = function(parts, hand)
        if #parts._4 < 1 or #parts._2 < 2 then return {} end
        return #hand >= 6 and next(parts._2) and next(parts._4) and
            { SMODS.merge_lists(parts._all_pairs) } or {}
    end
} -- Planet : Cholgan


SMODS.PokerHand { -- Flush Manor
    key = 'flush_manor',
    mult = 16,
    chips = 180,
    l_mult = 4,
    l_chips = 50,
    loc_txt = {
        name = 'Flush Manor',
        description = {
        [1] = 'A Four of a Kind and a Pair',
        [2] = '6 cards required'
    }
    },
    example = {
        { 'S_T', true },
        { 'S_T', true },
        { 'S_7', true },
        { 'S_7', true },
        { 'S_7', true },
        { 'S_7', true }
    },
    evaluate = function(parts, hand)
        if #parts._4 < 1 or #parts._2 < 2 then return {} end
        return #hand >= 6 and next(parts._2) and next(parts._4) and next(parts.kassandra_6_flush)
            and { SMODS.merge_lists(parts._all_pairs, parts.kassandra_6_flush) } or {}
    end
} -- Planet : Anaxes


SMODS.PokerHand { -- Cliff
    key = 'cliff',
    mult = 5,
    chips = 25,
    l_mult = 1,
    l_chips = 20,
    loc_txt = {
        name = 'Cliff',
        description = {
        [1] = 'Five Stone cards',
    }
    },
    example = {
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
		{ "S_A", true, enhancement = "m_stone" },
    },
    evaluate = function (parts, hand)
        local _stone = {}
        for _, card in ipairs(hand) do
            if SMODS.has_enhancement(card, 'm_stone') then
                _stone[#_stone+1] = card
            end
        end
        if #_stone >= 5 then return { _stone } end
    end
} -- Planet : Stone


SMODS.PokerHand { -- Nothing
    key = 'nothing',
    mult = 7,
    chips = 65,
    l_mult = 3,
    l_chips = 65,
    loc_txt = {
        name = 'Nothing',
        description = {
        [1] = 'Five Blank cards',
    }
    },
    example = {
		{ "S_A", true, enhancement = "m_kassandra_blank" },
		{ "S_A", true, enhancement = "m_kassandra_blank" },
		{ "S_A", true, enhancement = "m_kassandra_blank" },
		{ "S_A", true, enhancement = "m_kassandra_blank" },
		{ "S_A", true, enhancement = "m_kassandra_blank" },
    },
    evaluate = function (parts, hand)
        local _blank = {}
        for _, card in ipairs(hand) do
            if SMODS.has_enhancement(card, 'm_kassandra_blank') then
                _blank[#_blank+1] = card
            end
        end
        if #_blank >= 5 then return { _blank } end
    end
} -- Planet : Space