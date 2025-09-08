SMODS.Consumable { -- Space (Nothing)
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


SMODS.Consumable { -- Stone (Cliff)
    key = 'stone_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        hand_type = 'kassandra_cliff',
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


SMODS.Consumable { -- Glacio (Triple Pair)
    key = 'glacio_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 2,
        y = 0
    },
    config = {
        hand_type = 'kassandra_triple_pair',
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


SMODS.Consumable { -- Vesania (Flush Triple Pair)
    key = 'vesania_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 3,
        y = 0
    },
    config = {
        hand_type = 'kassandra_flush_triple_pair',
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


SMODS.Consumable { -- Volcana (Double Three of a Kind)
    key = 'volcana_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 4,
        y = 0
    },
    config = {
        hand_type = 'kassandra_double_three_of_a_kind',
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


SMODS.Consumable { -- Holo (Flush Double Three of a Kind)
    key = 'holo_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 5,
        y = 0
    },
    config = {
        hand_type = 'kassandra_flush_double_three_of_a_kind',
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


SMODS.Consumable { -- Calidor (Six of a Kind)
    key = 'calidor_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 6,
        y = 0
    },
    config = {
        hand_type = 'kassandra_six_of_a_kind',
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


SMODS.Consumable { -- Crimson (Flush Six)
    key = 'crimson_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 0,
        y = 1
    },
    config = {
        hand_type = 'kassandra_flush_six',
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


SMODS.Consumable { -- Cholgan (Full Manor)
    key = 'cholgan_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 1,
        y = 1
    },
    config = {
        hand_type = 'kassandra_full_manor',
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


SMODS.Consumable { -- Anaxes (Full Manor)
    key = 'anaxes_planet',
    set = 'Planet',
    atlas = 'Planets',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        hand_type = 'kassandra_flush_manor',
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