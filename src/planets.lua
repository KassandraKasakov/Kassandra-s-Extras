--[[
    You can add a card from this ConsumableType just like you would do a normal consumable using
    `SMODS.add_card{set = "vremade_Planet"}
--]]

-- Mercury
SMODS.Consumable {
        key = 'space_planet',
        set = 'Planet',
        atlas = 'Planets',
        pos = {
            x = 0,
            y = 0
        },
        config = {
            hand_type = 'kassandra_nothing',
        },
        cost = 4,
        loc_vars = function(self, info_queue, center)
            return {
                vars =
                {
                    G.GAME.hands[center.ability.hand_type].level,
                    localize(center.ability.hand_type, "poker_hands"),
                    G.GAME.hands[center.ability.hand_type].l_mult,
                    G.GAME.hands[center.ability.hand_type].l_chips,
                    colours = {
                        (G.GAME.hands[center.ability.hand_type].level == 1 and G.C.UI.TEXT_DARK or G.C.HAND_LEVELS[math.min(7, G.GAME.hands[center.ability.hand_type].level)])
                    }
                },
            }
        end,
        in_pool = function(self, args)
            if (G.GAME and G.GAME.starting_params.play_limit >= 6) then
                return true
            end

            return false
        end
    }