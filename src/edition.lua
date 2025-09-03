SMODS.Edition {
    key = 'cosmic',
    loc_txt = {
        name = 'Cosmic',
        text = {
            '{C:purple}+#1#{} Score',
        },
        label = 'Cosmic',
    },
    shader = 'cosmic',
    weight = 5,
    in_shop = true,
    extra_cost = 5,

    sound = { sound = "kassandra_e_cosmic", per = 1.2, vol = 0.7 },

    apply_to_float = true,
    disable_shadow = false,
    disable_base_shader = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

	config = {
		score = 1000,
        active = false,
    },

    loc_vars = function(self, info_queue, center)
		return {
			vars = {self.config.score}
		}
	end,

    calculate = function(self, card, context)
        if context.after == true then
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,
				func = function() 
					G.GAME.chips = (to_big(G.GAME.chips))+(to_big(self.config.score))
					G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)
					play_sound('kassandra_score')
					return true
				end,
			}))
            return {
				message = "+" .. tostring(self.config.score),
				colour = G.C.PURPLE
			}
        end
	end
}