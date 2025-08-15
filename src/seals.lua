SMODS.Seal { -- Turquoise
    key = 'turquoise_seal',
    atlas = 'Jokers',
    pos = { x = 0, y = 0 },
    badge_colour = HEX('58E0F2'),
   loc_txt = {
        name = 'Turquoise Seal',
        label = 'Turquoise Seal',
        text = {
        [1] = 'Balance {C:blue}Chips{} and',
        [2] = '{C:red}Mult{} when this',
        [3] = 'card is played',
        [4] = 'and scores'
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