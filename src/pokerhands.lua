-- Triple Pair
SMODS.PokerHand {
    key = "triple_pair",
    mult = 5,
    chips = 30,
    l_mult = 1,
    l_chips = 15,
    loc_txt = {
        name = 'Triple Pair',
        text = {
        [1] = '3 pairs of cards with different ranks'
    }
    },
    example = {
        { 'H_A', true },
        { 'D_A', true },
        { 'C_Q', true },
        { 'H_4', true },
        { 'C_4', true },
        { 'S_T', true },
        { 'D_T', true }
    },
    evaluate = function(parts, hand)
        return #parts._2 >= 3 and parts._all_pairs or {}
    end
}
