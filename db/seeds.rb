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
shapes.each do |bail_type,shapes| # => loop/regular
  shapes.each do |shape_type,models|  # => circle/square/oval/teardrop etc
    models.each do |name, price|
      Shape.upsert({bail_type: bail_type.to_sym, shape_type: shape_type.to_sym, name: name, price: price}, unique_by: :bail_shop_name_unique_index)
    end
  end
end

##########################################
##########################################
##########################################
