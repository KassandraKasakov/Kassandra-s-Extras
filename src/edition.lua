SMODS.Edition {
    key = 'cosmic',
    shader = 'astral',
    in_shop = true,
    weight = 0.25,
    extra_cost = 4,
    apply_to_float = true,
    badge_colour = HEX('263F61'),
    disable_shadow = false,
    disable_base_shader = false,
    loc_txt = {
        name = 'Cosmic',
        label = 'Cosmic',
        text = {
        [1] = 'A {C:blue}custom{} edition with {C:red}unique{} effects.'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    get_weight = function(self)
        return G.GAME.edition_rate * self.weight
    end,
  
}