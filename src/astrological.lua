SMODS.ConsumableType { --Def of Astrological Type
    key = 'astrological',
    primary_colour = G.KASSANDRA.C.astro_light,
    secondary_colour = G.KASSANDRA.C.astro_dark,
    collection_rows = { 6, 6 },
    shop_rate = 4,
    cards = {
        ['c_kassandra_andromeda'] = true,
        ['c_kassandra_centaurus'] = true,
        ['c_kassandra_crater'] = true,
        ['c_kassandra_crux'] = true,
        ['c_kassandra_hercules'] = true,
        ['c_kassandra_lynx'] = true,
        ['c_kassandra_orion'] = true,
        ['c_kassandra_serpens'] = true,
        ['c_kassandra_sextan'] = true,
        ['c_kassandra_triangulum'] = true,
        ['c_kassandra_ursa_major'] = true,
        ['c_kassandra_ursa_minor'] = true
    },
    loc_txt = {
        name = "Astrological",
        collection = "Astrological Cards",
    }
}

-- ALL CONSUMABLES HERE 

SMODS.Consumable {
    key = 'andromeda',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Andromeda',
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


SMODS.Consumable {
    key = 'centaurus',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Centaurus',
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


SMODS.Consumable {
    key = 'crater',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Crater',
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


SMODS.Consumable {
    key = 'crux',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Crux',
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


SMODS.Consumable {
    key = 'hercules',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Hercules',
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


SMODS.Consumable {
    key = 'ursa_major',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 0 },
    soul_pos = { x = 6, y = 1 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Ursa Major',
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


SMODS.Consumable {
    key = 'lynx',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 1, y = 2 },
    soul_pos = { x = 1, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Lynx',
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


SMODS.Consumable {
    key = 'orion',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 2, y = 2 },
    soul_pos = { x = 2, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Orion',
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


SMODS.Consumable {
    key = 'serpens',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 3, y = 2 },
    soul_pos = { x = 3, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Serpens',
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


SMODS.Consumable {
    key = 'sextan',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 4, y = 2 },
    soul_pos = { x = 4, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Sextan',
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


SMODS.Consumable {
    key = 'triangulum',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 5, y = 2 },
    soul_pos = { x = 5, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Triangulum',
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


SMODS.Consumable {
    key = 'ursa_minor',
    set = 'astrological',
    atlas = 'Astrological',
    pos = { x = 6, y = 2 },
    soul_pos = { x = 6, y = 3 },
    pixel_size = { h = 63 },
    loc_txt = {
        name = 'Ursa Minor',
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