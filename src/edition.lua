SMODS.Edition {
    key = 'astral',
    loc_txt = {
        name = 'Cosmic',
        text = {
            '{C:purple}+#1#{} Score',
        },
        label = 'Cosmic',
    },
    shader = 'astral',
    weight = 16,
    in_shop = true,
    extra_cost = 4,

    apply_to_float = true,
    badge_colour = HEX('263F61'),
    disable_shadow = false,
    disable_base_shader = false,
    unlocked = true,
    discovered = true,
    no_collection = false,

	config = {
		score = 800,
        active = false,
    },

    loc_vars = function(self, info_queue, center)
		return {
			vars = {self.config.score, self.config.active}
		}
	end,

    calculate = function(self, card, context)
        if context.post_joker and not context.repetition then
            self.config.active = true
        end
        if context.after and self.config.active == true then
			G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,
				func = function() 
					G.GAME.chips = (to_big(G.GAME.chips))+(to_big(self.config.score))
					G.HUD:get_UIE_by_ID('chip_UI_count'):juice_up(0.3, 0.3)
					play_sound('gong')
                    self.config.active = false
					return true
				end,
			}))
            return {
				message = "X" .. tostring(self.config.score),
				colour = G.C.PURPLE
			}
        end
	end
}