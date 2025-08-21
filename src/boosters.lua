SMODS.Booster { -- Astro
    key = 'astro_pack',
    loc_txt = {
        name = "Astro Pack",
        text = {
            "Choose 1 of up to",
            "3 Astrological cards to",
            "be used immediately"
        },
        group_name = "Astro Pack"
    },
    config = { extra = 3, choose = 1 },
    atlas = "Booster",
    pos = { x = 0, y = 0 },
    draw_hand = false,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "astrological",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "kassandra_astro_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("000000"))
        ease_background_colour({ new_colour = HEX('000000'), special_colour = HEX("cad696"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster { -- JUMBO Astro
    key = 'jumbo_astro_pack',
    loc_txt = {
        name = "Jumbo Astro Pack",
        text = {
            "Choose 1 of up to",
            "5 Astrological cards to",
            "be used immediately"
        },
        group_name = "Jumbo Astro Pack"
    },
    config = { extra = 5, choose = 1 },
    cost = 6,
    atlas = "Booster",
    pos = { x = 1, y = 0 },
    draw_hand = false,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "astrological",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "kassandra_jumbo_astro_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("e38ee1"))
        ease_background_colour({ new_colour = HEX('e38ee1'), special_colour = HEX("7eded7"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}


SMODS.Booster { -- MEGA Astro
    key = 'mega_astro_pack',
    loc_txt = {
        name = "Mega Astro Pack",
        text = {
            "Choose 2 of up to",
            "5 Astrological cards to",
            "be used immediately"
        },
        group_name = "Mega Astro Pack"
    },
    config = { extra = 5, choose = 2 },
    cost = 8,
    weight = 0.25,
    atlas = "Booster",
    pos = { x = 2, y = 0 },
    draw_hand = false,
    select_card = "consumeables",
    discovered = true,
    loc_vars = function(self, info_queue, card)
        local cfg = (card and card.ability) or self.config
        return {
            vars = { cfg.choose, cfg.extra }
        }
    end,
    create_card = function(self, card, i)
        return {
        set = "astrological",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
            key_append = "kassandra_mega_astro_pack"
        }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, HEX("07032b"))
        ease_background_colour({ new_colour = HEX('07032b'), special_colour = HEX("5d9dda"), contrast = 2 })
    end,
    particles = function(self)
        G.booster_pack_sparkles = Particles(1, 1, 0, 0, {
            timer = 0.015,
            scale = 0.2,
            initialize = true,
            lifespan = 1,
            speed = 1.1,
            padding = -1,
            attach = G.ROOM_ATTACH,
            colours = { G.C.WHITE, lighten(G.C.PURPLE, 0.4), lighten(G.C.PURPLE, 0.2), lighten(G.C.GOLD, 0.2) },
            fill = true
        })
        G.booster_pack_sparkles.fade_alpha = 1
        G.booster_pack_sparkles:fade(1, 0)
    end,
}
