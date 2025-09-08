return {
    descriptions = {
        Edition = {
            e_kassandra_cosmic = {
                name = "Cosmic",
                text = {
                    "{C:purple}+#1#{} Score",
                }
            },
        },



        Enhanced = {
            m_kassandra_blank = {
                name = "Blank Card",
                text = {
                    "Do {C:attention}nothing{}",
                    "No rank or suit"
                }
            },
            m_kassandra_ghost = {
                name = "Ghost Card",
                text = {
                    "{C:blue}+15{} Chips",
                    "{C:red}+2{} Mult",
                    "Disappear if {C:attention}discarded {}",
                    "or if {C:attention}played{}"
                }
            },
            m_kassandra_soap = {
                name = "Soap Card",
                text = {
                    "{C:blue}+10 X Hands{} Chips",
                    "{C:red}+Discards{} Mult",
                    "while this card stays in hand",
                    "{C:inactive}(Currently{} {C:blue}+#1#{} {C:inactive}Chips and{} {C:red}+#2#{} {C:inactive}Mult){}"
                }
            },
            m_kassandra_dollar = {
                name = "Dollar",
                text = {
                    "{C:money}-$1{} when played",
                    "and scored",
                    "Add {C:red}+1{} Mult to {C:attention}Wallet{}"
                }
            },
        },



        Joker = {
            j_kassandra_golden_bar = {
                name = "Golden Bar",
                text = {
                    "Earn {C:money}$10{} when",
                    "{C:attention}boss blind{} is defeated"
                },
            },
            j_kassandra_steel_bar = {
                name = "Steel Bar",
                text = {
                    "Gives {X:chips,C:white}X0.05{} Chips",
                    "for each {C:attention}Steel Card{}",
                    "in your {C:attention} full deck{}",
                    "{C:inactive}(Currently{} {X:chips,C:white}X#1#{} {C:inactive}Chips){}"
                },
            },
            j_kassandra_multi_even = {
                name = "Three-faces Even",
                text = {
                    "Retrigger all cards with",
                    "{C:attention}even {}rank {C:attention}2{} additional times",
                    "{C:inactive}(10, 8, 6, 4, 2){}{}"
                },
            },
            j_kassandra_multi_odd = {
                name = "Two-faces Odd",
                text = {
                    "Retrigger all cards with",
                    "{C:attention}odd {}rank {C:attention}1{} additional times",
                    "{C:inactive}(A, 9, 7, 5, 3){}{}"
                },
            },
            j_kassandra_crown = {
                name = "Crown",
                text = {
                    "Each {C:attention}Jack{} held in hand",
                    "becomes a {C:attention}King{}"
                },
            },
            j_kassandra_blank_joker = {
                name = "Blank Joker",
                text = {
                    "Played {C:attention}blank {}cards",
                    "give {X:mult,C:white}X5{} Mult",
                    "when scored"
                },
            },
            j_kassandra_time_capsule = {
                name = "Time Capsule",
                text = {
                    "{C:attention}+1{} voucher in shop",
                    "{C:attention}+1{} booster pack in shop"
                },
            },
            j_kassandra_sadey_face = {
                name = "Sadey Face",
                text = {
                    "Played {C:orange}non-face{} cards",
                    "give {C:mult}+2{} Mult",
                    "when scored"
                },
            },
            j_kassandra_oops_all_9s = {
                name = "Oops! All 9s",
                text = {
                    "Halves all {C:attention}listed{}",
                    "{C:green}probabilities{}",
                    "{C:inactive}(ex:{} {C:green}1 in 3{} {C:inactive}->{} {C:green}1 in 6{}{C:inactive}){}"
                },
            },
            j_kassandra_ghost_joker = {
                name = "Ghost",
                text = {
                    "Adds one {C:attention}Ghost {}card",
                    "to deck when",
                    "{C:attention}Blind {}is skipped"
                },
            },
            j_kassandra_boss_blind = {
                name = "Random Boss Blind",
                text = {
                    "Disable {C:attention}Boss Blind{} when",
                    "a {C:green}probability {}{C:attention}failed{}"
                },
            },
            j_kassandra_tiny_boss = {
                name = "Ghost",
                text = {
                    "Up to ante {C:red}8{}",
                    "{C:red}X2 {}{C:attention}Small {}and {C:attention}Big Blind{} Size",
                    "{C:red}X0.5{} {C:attention}Boss Blind{} size"
                },
            },
            j_kassandra_trash_bin_discard = {
                name = "Discard Trash Bin",
                text = {
                    "Add 1 {C:attention}discard{} for",
                    "next round when any",
                    "{C:attention}Booster Pack{} is skipped",
                    "{C:inactive}(Currently{} {C:attention}+#1#{}{C:inactive}){}"
                },
            },
            j_kassandra_trash_bin_hand = {
                name = "Hand Trash Bin",
                text = {
                    "Add 1 {C:attention}hand{} for",
                    "next round when any",
                    "{C:attention}Booster Pack{} is skipped",
                    "{C:inactive}(Currently{} {C:attention}+#1#{}{C:inactive}){}"
                },
            },
            j_kassandra_outline = {
                name = "Outline",
                text = {
                    "Gives {C:blue}+100{} Chips for each",
                    "{C:attention}Blank Card{} in your full deck",
                    "{C:inactive}(Currently {C:blue}+#1#{} Chips){}"
                },
            },
            j_kassandra_vhs = {
                name = "VHS Tape",
                text = {
                    "If Game Over, prevents Death",
                    "{C:attention}-1{} ante",
                    "{C:red}self destructs{}"
                },
            },
            j_kassandra_mansion = {
                name = "Vecnas House",
                text = {
                    "{C:green}1 in 2{} chance to",
                    "create copies of {C:attention}Ghost",
                    "{}cards when {C:attention}scored{} / {C:attention}discarded{}"
                },
            },
            j_kassandra_showerhead = {
                name = "Showerhead",
                text = {
                    "All played {C:attention}Stone{} cards",
                    "become {C:attention}Soap {}cards"
                },
            },
            j_kassandra_wallet = {
                name = "Wallet",
                text = {
                    "When {C:attention}Boss {}Blind is defeated",
                    "{C:green}1 in 2{} chance to add",
                    "{C:attention}1 Dollar{} card and",
                    "{C:attention}1 Coin seal{} card in deck",
                    "{C:red}+1{} Mult for each scored {C:attention}Dollar{} card",
                    "{C:blue}+2{} Chips for each scored {C:attention}Coin seal{}",
                    "{C:inactive}(Curently{} {C:red}+#1#{} {C:inactive}Mult and{} {C:blue}+#2#{} {C:inactive}Chips){}"
                },
            },
            j_kassandra_nobody = {
                name = "Nobody",
                text = {
                    "Gives {C:red}^0.1{} Mult for each",
                    "{C:attention}Blank Card{} in your full deck",
                    "{C:inactive}(Currently {C:red}^#1#{} {C:inactive}Mult){}{}"
                },
            },
            j_kassandra_stop = {
                name = "STOP Sign",
                text = {
                    "{C:red}X0.75{} {C:attention}Boss Blind{} size",
                    "Play with {C:attention}0{} discards"
                },
            },
            j_kassandra_ballot2 = {
                name = "Hanging Chad",
                text = {
                    "Retrigger {C:attention}last{} played",
                    "card used in scoring",
                    "{C:attention}2{} additional times"
                },
            },
            j_kassandra_clock = {
                name = "Ancient Clock",
                text = {
                    "{C:blue}+3{} Chips per",
                    "{C:attention}real-time{} second",
                    "{C:inactive}(reset each minute){}",
                    "{C:inactive}(Curently{} {C:blue}+#1#{} {C:inactive}Chips){}"
                },
            },
            j_kassandra_astrolojoker = {
                name = "AstroloJoker",
                text = {
                    "Create an {C:planet}Astrological{} card",
                    "when {C:orange}Blind{} is selected",
                    "{C:inactive}(Must have room){}"
                },
            },
        },



        Spectral = {
            c_kassandra_seal = {
                name = "Seal",
                text = {
                    "Add a {C:attention}random{} Seal",
                    "up to 3 selected",
                    "card in your hand",
                },
            },
        },



        Tarot = {
            c_kassandra_space = {
                name = "Space",
                text = {
                    "Enhances {C:attention}2{} selected",
                    "cards into a",
                    "{C:attention}Blank Card{}",
                },
            },
            c_kassandra_soap = {
                name = "The Soap",
                text = {
                    "Enhances {C:attention}1{} selected card",
                    "into a {C:attention}Soap Card{}",
                },
            },
        },


        Planet = {
            c_kassandra_space_planet = {
                name = "Space",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_stone_planet = {
                name = "Stone",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_glacio_planet = {
                name = "Glacio",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_vesania_planet = {
                name = "Vesania",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_volcana_planet = {
                name = "Volcana",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_holo_planet = {
                name = "Holo",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_calidor_planet = {
                name = "Calidor",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_crimson_planet = {
                name = "Crimson",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_cholgan_planet = {
                name = "Cholgan",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
            c_kassandra_anaxes_planet = {
                name = "Anaxes",
                text = {
                    "{S:0.8}({S:0.8,V:1}lvl.#1#{S:0.8}){} Level up",
                    "{C:attention}#2#",
                    "{C:mult}+#3#{} Mult and",
                    "{C:chips}+#4#{} chips",
                },
            },
        },


        Other = {
            p_kassandra_astro_pack = {
                name = 'Astro Pack',
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}5{} {C:planet}Astrological{} cards",
                },
            },
            p_kassandra_jumbo_astro_pack = {
                name = 'Jumbo Astro Pack',
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}7{} {C:planet}Astrological{} cards",
                },
            },
            p_kassandra_mega_astro_pack = {
                name = 'Mega Astro Pack',
                text = {
                    "Choose {C:attention}2{} of up to",
                    "{C:attention}7{} {C:planet}Astrological{} cards",
                },
            },
            p_kassandra_zodiac_pack = {
                name = 'Zodiac Pack',
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}5{} {C:planet}Zodiac{} cards",
                },
            },
            p_kassandra_jumbo_zodiac_pack = {
                name = 'Jumbo Zodiac Pack',
                text = {
                    "Choose {C:attention}1{} of up to",
                    "{C:attention}7{} {C:planet}Zodiac{} cards",
                },
            },
            p_kassandra_mega_zodiac_pack = {
                name = 'Mega Zodiac Pack',
                text = {
                    "Choose {C:attention}2{} of up to",
                    "{C:attention}7{} {C:planet}Zodiac{} cards",
                },
            },
        }
    }
}