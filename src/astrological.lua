SMODS.ConsumableType { --Def of Astrological Type
    key = 'astrological',
    shader = 'tarot',
    primary_colour = HEX('757cdc'),
    secondary_colour = HEX('757cdc'),
    collection_rows = { 6, 6 },
    shop_rate = 4,
    cards = {
        ['c_kassandra_aquarius'] = true,
        ['c_kassandra_aries'] = true,
        ['c_kassandra_cancer'] = true,
        ['c_kassandra_capricorn'] = true,
        ['c_kassandra_gemini'] = true,
        ['c_kassandra_leo'] = true,
        ['c_kassandra_libra'] = true,
        ['c_kassandra_pisces'] = true,
        ['c_kassandra_sagittarius'] = true,
        ['c_kassandra_scorpio'] = true,
        ['c_kassandra_taurus'] = true,
        ['c_kassandra_virgo'] = true
    },
    loc_txt = {
        name = "Astrological",
        collection = "Astrological Cards",
    }
}


SMODS.Consumable { --Aries
    key = 'aries',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 0 },
    loc_txt = {
        name = 'I - Aries',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Taurus
    key = 'taurus',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'II - Taurus',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Gemini
    key = 'gemini',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = 'III - Gemini',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Cancer
    key = 'cancer',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'IV - Cancer',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Leo
    key = 'leo',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 0 },
    loc_txt = {
        name = 'V - Leo',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Virgo
    key = 'virgo',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'VI - Virgo',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Libra
    key = 'libra',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = 'VII - Libra',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Scorpio
    key = 'scorpio',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 1 },
    loc_txt = {
        name = 'VIII - Scorpio',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Sagittarius
    key = 'sagittarius',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 1 },
    loc_txt = {
        name = 'IX - Sagittarius',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Capricorn
    key = 'capricorn',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 1 },
    loc_txt = {
        name = 'X - Capricorn',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Aquarius
    key = 'aquarius',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 1 },
    loc_txt = {
        name = 'XI - Aquarius',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}


SMODS.Consumable { --Pisces
    key = 'pisces',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 1 },
    loc_txt = {
        name = 'XII - Pisces',
        text = {
        [1] = 'A {C:purple}custom{} consumable with {C:blue}unique{} effects.'
    }
    },
    cost = 3,
    unlocked = true,
    discovered = true,
    hidden = false,
    can_repeat_soul = false,
    use = function(self, card, area, copier)
        
    end,
    can_use = function(self, card)
        return true
    end
}