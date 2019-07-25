##########################################
##########################################
##########################################
##	 			_____               _     		##
##			/  ___|             | |    			##
##			\ `--.  ___  ___  __| |___ 			##
##			 `--. \/ _ \/ _ \/ _` / __|			##
##			/\__/ /  __/  __/ (_| \__ \			##
##			\____/ \___|\___|\__,_|___/			##
##																			##
##########################################
##########################################
##########################################

## Shapes ##
## These have to be pre-defined because they don't exist in the store ##
shapes = {
  "loop" => {
    "circle" => {
      "CL1" => 39,
      "CL2" => 36,
      "CL3" => 33
    },
    "rectangle" => {
      "RL1" => 39,
      "RL2" => 39,
      "RL3" => 39,
      "RL4" => 39,
      "RL5" => 36,
      "RL6" => 36,
      "RL7" => 36
    },
    "square" => {
      "SL1" => 36,
      "SL2" => 33
    },
    "oval" => {
      "OL1" => 36,
      "OL2" => 33
    },
    "teardrop" => {
      "TL1" => 33
    },
    "puzzle" => {
      "PL1" => 30
    },
    "hunch_shell" => {
      "HL1" => 33,
      "HL2" => 30
    }
  },
  "regular" => {
    "circle" => {
      "CD1" => 36,
      "CD2" => 33,
      "CD3" => 33,
      "CD4" => 33,
      "CD5" => 30,
      "CD6" => 30,
      "CS1" => 33,
      "CS2" => 33,
      "CS3" => 30,
      "CS4" => 30,
      "CS5" => 30,
      "CF"  => 33
    },
    "square" => {
      "S1" => 36,
      "S2" => 33,
      "SF" => 33
    },
    "oval" => {
      "O1" => 36,
      "O2" => 33,
      "O3" => 33,
      "O4" => 30
    },
    "teardrop" => {
      "T1" => 33,
      "T2" => 30
    },
    "heart" => {
      "H1" => 36,
      "H2" => 33,
      "H3" => 30
    }
  }
}

## Loop ##
## Cycles the hash above and creates the appropriate listings ##
shapes.each do |bail_type,shapes| # => loop/regular
  shapes.each do |shape_type,models|  # => circle/square/oval/teardrop etc
    models.each do |name, price|
      Shape.upsert({bail_type: Shape.bail_types[bail_type], shape_type: Shape.shape_types[shape_type], name: name, price: price}, unique_by: :bail_shop_name_unique_index)
    end
  end
end

##########################################
##########################################

## Charms ##
## These have to be pre-defined because they don't exist in the store ##
charms = {
  "dream_catchers" => {
    "dream_catcher":          1,
    "gunmetal_dream_catcher": 4
  },
  "ohms" => {
    "solid_bronze":         0,
    "bronze":               0,
    "silver":               0,
    "gold":                 0
  },
  "paisley" => {
    "gunmetal":             0,
    "bronze":               0,
    "silver":               0,
    "blue":                 0
  },
  "steampunk_gears" => {
    "lg_gears":             0,
    "sm_gears":             0,
    "moon":                 0,
    "stars":                0,
    "moon_&_stars":         0,
    "sun":                  0,
    "moon_fairy":           1
  },
  "tree_of_life" => {
    "silver_solid":        0,
    "lg_bronze":           1,
    "lg_silver":           1,
    "tree_e":              0,
    "tree_f":              0,
    "direction_compass":   0,
    "compass_gold_plated": 3,
    "arrow":               0
  },
  "peace" => {
    "thin":                0,
    "silver":              0,
    "bronze":              0
  },
  "feather" => {
    "gold_peacock":        0,
    "silver_peacock":      0,
    "bronze_peacock":      0,
    "silver":              0,
    "bronze":              0,
    "wrapped_silver":      0,
    "blue":                0
  },
  "hamsa" => {
    "silver":              0,
    "gunmetal":            0,
    "solid_bronze":        0,
    "blue":                0
  },
  "lotus" => {
    "gold":                0,
    "silver":              0,
    "silver_deep":         0,
    "rose_gold_plated":    3,
    "silver_plated":       3,
    "gold_plated":         3,
    "ohm_lotus":           1,
    "yoga_lotus":          1
  },
  "chakras" => {
    "crown_lg":           2,
    "third_eye_lg":       2,
    "throat_lg":          2,
    "heart_lg":           2,
    "solar_plexus_lg":    2,
    "sacral_lg":          2,
    "root_lg":            2,
    "crown_sm":           2,
    "third_eye_sm":       2,
    "throat_sm":          2,
    "heart_sm":           2,
    "solar_plexus_sm":    2,
    "sacral_sm":          2,
    "root_sm":            2
  },
  "hearts" => {
    "silver":             0,
    "infinity":           0,
    "mini_silver":        0,
    "mini_gold":          0,
    "mini_rose_gold":     0,
    "double":             0
  },
  "mini_heart_&_arrow" => {
    "rose_gold":          2,
    "silver":             2,
    "gold":               2
  },
  "lock_and_key" => {
    "silver":             0,
    "gold":               0,
    "bronze":             0,
    "lucky_coin":         0,
    "fotune_cookie":      0,
    "butterfly":          0
  },
  "owl" => {
    "lg":                 0,
    "sm":                 0
  },
  "paw_prints" => {
    "paw_print":          0,
    "lg_paw_print":       0,
    "heart_paws":         0,
    "lg_dog_bone":        0,
    "pineapple":          0,
    "gold_plated":        0,
    "dragon":             0,
    "silver_plated":      0,
    "rainbow_unicorn":    0,
    "light_bulb":         0,
    "seed_of_life":       0
  },
  "tear_drops" => {
    "mini_drop_silver":   1,
    "mini_drop_gold":     1,
    "four_leaf_clover":   0,
    "bike":               1,
    "eiffel_tower":       0,
    "fireman_hat":        1,
    "pa_symbol":          1,
    "stylist":            1,
    "justice_scales":     1
  },
  "cross" => {
    "lg":                 0,
    "sm":                 0,
    "snowflake":          0,
    "pumpkin":            0
  },
  "words" => {
    "love":               0,
    "travel":             0,
    "no_365":             0,
    "story":              0,
    "wish":               0,
    "lucky":              0,
    "noted":              0,
    "wander":             0,
    "found":              0,
    "love_script":        1
  },
  "starfish" => {
    "a_bronze":           0,
    "a_gold":             0,
    "a_gunmetal":         0,
    "b_bronze":           0,
    "b_silver":           0,
    "b_gold":             0,
    "b_gunmetal":         0,
    "c_starfish":         0,
    "d_starfish":         0,
    "e_starfish":         0,
    "f_starfish":         0
  },
  "seahorse" => {
    "silver":             0,
    "blue":               1,
    "lighthouse":         3
  },
  "anchors" => {
    "anchor":             0,
    "anchor_b":           1,
    "anchor_c":           1,
    "anchor_d":           1,
    "anchor_e":           1,
    "anchor_f":           1
  },
  "turtles" => {
    "sm_silver":          0,
    "lg_silver":          0,
    "mini_silver":        0,
    "blue":               1,
    "turtle_e":           1,
    "turtle_f":           1,
    "fish":               1
  },
  "dolphins" => {
    "dolphin":                 0,
    "dolphins_silver_plated":  4,
    "palm_tree_silver_plated": 3,
    "helm":                    1,
    "love_helm":               1,
    "fish_hook":               2,
    "sail":                    0,
    "boat_a":                  1,
    "boat_b":                  1,
    "boat_c":                  1
  },
  "premium_minis" => {
    "silver_starfish":         3,
    "silver_crab":             3,
    "silver_anchor":           3,
    "silver_seahorse":         3,
    "silver_shell":            3,
    "bronze_starfish":         3,
    "bronze_crab":             3,
    "bronze_anchor":           3,
    "bronze_seahorse":         3,
    "bronze_shell":            3
  },
  "seashells" => {
    "clam":                    0
  },
  "request_shape" => {
    "coquin":                  0
  },
  "sm_med_or_large" => {
    "cone":                    0,
    "tulip":                   0,
    "spiral":                  0,
    "sharkeye":                0,
    "lg_shell_a":              0,
    "lg_shell_b":              0,
    "pectin_decato_shell":     1,
    "mini_abalone":            3,
    "green_limpet_shell":      1
  },
  "shark_teeth" => {
    "shark_tooth":             3,
    "mini_shark_tooth":        3,
  },
  "starfish" => {
    "starfish":                6,
    "mini_starfish":           3,
    "sand_dollar":             3,
    "ammonite_fossil":         20
  }
}


##########################################
##########################################

## Stones ##
## Pre-defined inside applet ##
stones = {}

##########################################
##########################################
##########################################
