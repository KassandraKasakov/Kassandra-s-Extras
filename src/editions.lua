SMODS.Edition({ -- Anaglyphic
    key = "anaglyphic",
    loc_txt = {
        name = "Anaglyphic",
        label = "Anaglyphic",
        text = {
            "{C:green}Retrigger{} this card"
        }
    },
    shader = 'anaglyphic',
    discovered = true,
    unlocked = true,
    config = { repetitions = 1 },
    in_shop = true,
    weight = 8,
    extra_cost = 4,
    apply_to_float = true,
    loc_vars = function(self)
        return {}
    end
})


SMODS.Edition({
    key = "fluorescent",
    loc_txt = {
        name = "Fluorescent",
        label = "Fluorescent",
        text = {
            "Earn {C:money}$#1#{} when this",
            "card is scored"
        }
    },
    discovered = true,
    unlocked = true,
    shader = 'fluorescent',
    config = { p_dollars = 3 },
    in_shop = true,
    weight = 8,
    extra_cost = 4,
    apply_to_float = true,
    loc_vars = function(self)
        return { vars = { self.config.p_dollars } }
    end
})