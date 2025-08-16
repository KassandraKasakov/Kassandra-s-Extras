SMODS.ConsumableType { --Def of Astrological Type
    key = 'astrological',
    shader = 'tarot',
    primary_colour = HEX('735e15'),
    secondary_colour = HEX('735e15'),
    collection_rows = { 6, 6 },
    shop_rate = 1,
    cards = {
        ['c_mycustom_aquarius'] = true,
        ['c_mycustom_aries'] = true,
        ['c_mycustom_cancer'] = true,
        ['c_mycustom_capricorn'] = true,
        ['c_mycustom_gemini'] = true,
        ['c_mycustom_leo'] = true,
        ['c_mycustom_libra'] = true,
        ['c_mycustom_pisces'] = true,
        ['c_mycustom_sagittarius'] = true,
        ['c_mycustom_scorpio'] = true,
        ['c_mycustom_taurus'] = true,
        ['c_mycustom_virgo'] = true
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
        name = 'Aries',
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
    pos = { x = 2, y = 1 },
    loc_txt = {
        name = 'Taurus',
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
    pos = { x = 4, y = 0 },
    loc_txt = {
        name = 'Gemini',
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
    pos = { x = 2, y = 0 },
    loc_txt = {
        name = 'Cancer',
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
        name = 'Leo',
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
    pos = { x = 3, y = 1 },
    loc_txt = {
        name = 'Virgo',
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
    pos = { x = 6, y = 0 },
    loc_txt = {
        name = 'Libra',
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
    pos = { x = 0, y = 1 },
    loc_txt = {
        name = 'Scorpio',
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
    pos = { x = 9, y = 0 },
    loc_txt = {
        name = 'Sagittarius',
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
    pos = { x = 3, y = 0 },
    loc_txt = {
        name = 'Capricorn',
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
    pos = { x = 0, y = 0 },
    loc_txt = {
        name = 'Aquarius',
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
    pos = { x = 8, y = 0 },
    loc_txt = {
        name = 'Pisces',
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