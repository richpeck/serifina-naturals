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
  "dream_catcher" => {
    "dream_catcher":          { price: 1, associations: %w(RL1 RL2	RL3	RL4) },
    "gunmetal_dream_catcher": { price: 4, associations: %w(RL1 RL2	RL3	RL4	RL6	OL1) }
  },
  "ohms" => {
    "solid_bronze":         { price: 0, associations: %w(CL1 CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze":               { price: 0, associations: %w(CL1 CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver":               { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "gold":                 { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "paisley" => {
    "gunmetal":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3 CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze":               { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver":               { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "blue":                 { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "steampunk_gear" => {
    "lg_gears":             { price: 0, associations: %w(RL1	RL2	RL3	SL1	OL1	CD1	O1	H1) },
    "sm_gears":             { price: 0, associations: %w(CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	CD1	CD2	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "moon":                 { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2) },
    "stars":                { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "moon_&_stars":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "sun":                  { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "moon_fairy":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CS1	S1	O1	O2	H1) }
  },
  "tree_of_life" => {
    "silver_solid":        { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "lg_bronze":           { price: 1, associations: %w(CL2	RL1	RL2	RL3	OL1	CD1	O1	H1) },
    "lg_silver":           { price: 1, associations: %w(CL2	RL1	RL2	RL3	OL1	CD1 O1	H1) },
    "tree_e":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	HL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	H1	H2) },
    "tree_f":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	HL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	H1	H2) },
    "direction_compass":   { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "compass_gold_plated": { price: 3, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	O1	H1	CD1	CD2	CD3	CS1	CS2	S1	S2	O1	O2	H1	H2) },
    "arrow":               { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "peace" => {
    "thin":                { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H3) },
    "silver":              { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "bronze":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1) }
  },
  "feather" => {
    "gold_peacock":        { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1) },
    "silver_peacock":      { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1) },
    "bronze_peacock":      { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1) },
    "silver":              { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	HL1	HL2	CD1	CS1	S1	S2	SF	O1	O2	O3	T1	H1) },
    "bronze":              { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	HL1	HL2	CD1	CS1	S1	S2	SF	O1	O2	O3	T1	H1) },
    "wrapped_silver":      { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	PL1	HL1	HL2	CD1	S1	S1	S2	SF	O1	O2	O3	T1	H1) },
    "blue":                { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "hamsa" => {
    "silver":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1	O1	O2	O3	T1) },
    "gunmetal":            { price: 0, associations: %w(CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1 O1	O2	O3	T1) },
    "solid_bronze":        { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1) },
    "blue":                { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1) }
  },
  "lotus" => {
    "gold":                { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "silver":              { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "silver_deep":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	O1	O2	O3	T1	H1	H2) },
    "rose_gold_plated":    { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "silver_plated":       { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "gold_plated":         { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "ohm_lotus":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1 HL1	CD1	CD2	CS1	S1	O1	O2	O3	H1	H2) },
    "yoga_lotus":          { price: 1, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	H1	H2) }
  },
  "chakra" => {
    "crown_lg":           { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "third_eye_lg":       { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	SL1	SL2	OL1	HL1	HL2	CD1	CD2	CS1	S1	O1	O2	O3	H1) },
    "throat_lg":          { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "heart_lg":           { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "solar_plexus_lg":    { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "sacral_lg":          { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "root_lg":            { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1 O1	H1) },
    "crown_sm":           { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "third_eye_sm":       { price: 2, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	X	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	O1	O2	O3	O4	H1) },
    "throat_sm":          { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3 T1	H1	H2) },
    "heart_sm":           { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "solar_plexus_sm":    { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "sacral_sm":          { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "root_sm":            { price: 2, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) }
  },
  "heart" => {
    "silver":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "solid":              { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "infinity":           { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	H1	H2	H3) },
    "mini_silver":        { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "mini_gold":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "mini_rose_gold":     { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "double":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CS1	CS2	S1	S2	O1	O2	H1	H2) }
  },
  "mini_heart_&_arrow" => {
    "rose_gold":          { price: 2, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver":             { price: 2, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "gold":               { price: 2, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "lock_and_key" => {
    "silver":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "gold":               { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "bronze":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "lucky_coin":         { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	O4	T1	H1	H2	H3) },
    "fotune_cookie":      { price: 0, associations: %w(CD1	CD2	CD3	CD4	CS1	CS2	CF	O1	O2	O3	H1) },
    "butterfly":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) }
  },
  "owl" => {
    "lg":                 { price: 0, associations: %w(CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1	O1	O2	H1) },
    "sm":                 { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "paw_print" => {
    "paw_print":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "lg_paw_print":       { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1 O1	H1) },
    "heart_paws":         { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD3	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "lg_dog_bone":        { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CD2	CS1	S1 O1	O2	O3	H1) },
    "pineapple":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	O1	O2	O3	O4	T1	H1	H2) },
    "gold_plated":        { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	O2	H1) },
    "dragon":             { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	O2	H1) },
    "silver_plated":      { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	CD1	CD2	CS1	S1	O1	O2	H1) },
    "rainbow_unicorn":    { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	CD1	CD2	CS1	S1	O1	O2	H1) },
    "light_bulb":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CS1	CS2	S1	S2	O1	O2	O3	T1	H1	H2) },
    "seed_of_life":       { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1 O1	H1) }
  },
  "tear_drop" => {
    "mini_drop_silver":   { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "mini_drop_gold":     { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "four_leaf_clover":   { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CS4	CF	S1	S2	SF	O1	O2	O3	O4	T1	H1	H2	H3) },
    "bike":               { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2 CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "eiffel_tower":       { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	CD1	CD2	CS1	S1	O1	O2	O3	T1	H1) },
    "fireman_hat":        { price: 1, associations: %w(RL2	CD1	CD2	CD3	CD4	CS1	CS2	O1	O2	H1) },
    "pa_symbol":          { price: 1, associations: %w(CL2	RL1	RL2	RL3	RL4	SL1	SL2	OL1	CD1	CD2	CS1	S1	S2	O1	H1	H2) },
    "stylist":            { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "justice_scales":     { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	CD1	CD2	CS1	S1	O1	O2	H1) }
  },
  "cross" => {
    "lg":                 { price: 0, associations: %w(CL2 CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	CD1	CD2	CD3	CS1	CS2	S1	S2	O1	O2	O3) },
    "sm":                 { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "snowflake":          { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1	H2) },
    "pumpkin":            { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3	T1	H1	H2) }
  },
  "word" => {
    "love":               { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "travel":             { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1 HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "no_365":             { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "story":              { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "wish":               { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "lucky":              { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1	S1	O1	O2	H1) },
    "noted":              { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1 S1	O1	O2	H1) },
    "wander":             { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1 S1	O1	O2	H1) },
    "found":              { price: 0, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	HL1	HL2	CD1	CS1 S1	O1	O2	H1) },
    "love_script":        { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "starfish" => {
    "a_bronze":           { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "a_gold":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "a_gunmetal":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "b_bronze":           { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "b_silver":           { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "b_gold":             { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "b_gunmetal":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "c_starfish":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "d_starfish":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "e_starfish":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "f_starfish":         { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "starfish":           { price: 6, associations: %w(RL1	RL2	SL1	CD1	S1 O1) },
    "mini_starfish":      { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CS3 CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "sand_dollar":        { price: 3, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	CD1	CD2	CD3	CS1	CS2	S1	S2	X	O1	O2	O3	H1) },
    "ammonite_fossil":    { price: 20, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	X	SL1	SL2	OL1	CD1	S1	O1	H1) }
  },
  "seahorse" => {
    "silver":             { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	CD1	CD2	CS1	S1	O1	O2	O3	T1	H1) },
    "blue":               { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	T1	H1	H2) },
    "lighthouse":         { price: 3, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	T1	H1	H2) }
  },
  "anchor" => {
    "anchor":             { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	T1	H1	H2) },
    "anchor_b":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "anchor_c":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1	O1	H1) },
    "anchor_d":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	T1	H1	H2) },
    "anchor_e":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3 T1	H1	H2) },
    "anchor_f":           { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) }
  },
  "turtle" => {
    "sm_silver":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "lg_silver":          { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "mini_silver":        { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "blue":               { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "turtle_e":           { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "turtle_f":           { price: 1, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2	H3) },
    "fish":               { price: 1, associations: %w(CL1	CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	CS2	S1	S2	O1	O2	O3 H1	H2) }
  },
  "dolphin" => {
    "dolphin":                 { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "dolphins_silver_plated":  { price: 4, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	OL1	CD1	CD2	CS1	S1 O1	H1) },
    "palm_tree_silver_plated": { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CS1	S1	S2	O1	O2	O3	T1	H1	H2) },
    "helm":                    { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "love_helm":               { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	HL1	CD1	CD2	CS1	S1	O1	H1) },
    "fish_hook":               { price: 2, associations: %w(RL1	RL2	RL3	RL4	RL6	SL	OL1	O1) },
    "sail":                    { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	CD1	CD3	CS1	S1	S2	SF	O1	O2	O3	H1	H2) },
    "boat_a":                  { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "boat_b":                  { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CS1	S1	O1	O2	O3	T1	H1) },
    "boat_c":                  { price: 1, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	CD1	CD2	CS1	S1	O1	O2	O3	H1) }
  },
  "premium_mini" => {
    "silver_starfish":         { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver_crab":             { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver_anchor":           { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver_seahorse":         { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "silver_shell":            { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze_starfish":         { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze_crab":             { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze_anchor":           { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze_seahorse":         { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "bronze_shell":            { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "seashell" => {
    "clam":                    { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "request_shape" => {
    "coquin":                  { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  },
  "sm_med_or_large" => {
    "cone":                    { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "tulip":                   { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "spiral":                  { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "sharkeye":                { price: 0, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) },
    "lg_shell_a":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "lg_shell_b":              { price: 0, associations: %w(CL2	CL3	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	HL1	HL2	CD1	CD2	CD3	CD4	CS1	CS2	CF	S1	S2	SF	O1	O2	O3	T1	H1	H2) },
    "pectin_decato_shell":     { price: 1, associations: %w(RL1	RL2	OL1	O1) },
    "mini_abalone":            { price: 3, associations: %w(RL1	RL2	RL3	RL4	OL1	O1	H1) },
    "green_limpet_shell":      { price: 1, associations: %w(CL2	CL3	RL1	RL	RL3	RL4	RL6	RL7	SL1	SL2	OL1	OL2	TL1	CD1	CD2	CS1	S1	O1	O2	O3	H1) }
  },
  "shark_teeth" => {
    "shark_tooth":             { price: 3, associations: %w(CL2	RL1	RL2	RL3	RL4	RL6	RL7	SL1	SL2	CD1	CD2	CS1	S1 O1	O2	O3	H1) },
    "mini_shark_tooth":        { price: 3, associations: %w(CL1	CL2	CL3	RL1	RL2	RL3	RL4	RL5	RL6	RL7	SL1	SL2	OL1	OL2	TL1	PL1	HL1	HL2	CD1	CD2	CD3	CD4	CD5	CD6	CS1	CS2	CS3	CS4	CS5	CF	S1	S2	SF	O1	O2	O3	O4	T1	T2	H1	H2	H3) }
  }
}

## Loop ##
## Cycles the hash above and creates the appropriate listings ##
charms.each do |charm_type,charms| # => starfish etc
  charms.each do |charm,item|  # => {price: 1, associations: x} etc
    charm  = Charm.upsert({charm_type: Charm.charm_types[charm_type], name: charm, price: item[:price]}, unique_by: :charm_type_name_index) # => doesn't return any id's - build the associations separately
  end
end

##########################################
##########################################

## Stones ##
## Pre-defined inside applet ##
stones = {
  "chakra" => {
    "quartz"       => 0,
    "amethyst"     => 0,
    "lapis_lazuli" => 0,
    "rose_quartz"  => 0,
    "angelite"     => 0,
    "citrine"      => 0,
    "carnelian"    => 0,
    "garnet"       => 0
  },
  "synergy12" => {
    "Synergy 12 Collection" => 80
  },
  "a_la_carte" => {
    "abalone_shell"     => 0,
    "agate"             => 0,
    "amazonite"         => 0,
    "amber"             => 1,
    "amethyst"          => 0,
    "ametrine"          => 0,
    "angelite"          => 1,
    "apache_tear"       => 0,
    "apatite"           => 1,
    "aragonite"         => 4,
    "astrophylite"      => 0,
    "australian_jasper" => 0,
    "azeztulite"        => 7,
    "azurite"           => 1,
    "bamboo_coral"      => 0,
    "black_kyanite"     => 2,
    "black_moonstone"   => 1,
    "black_onyx"        => 0,
    "black_tourmaline"  => 2,
    "blood_stone"       => 0,
    "blue_aventurine"   => 0,
    "blue_calcite"      => 0,
    "blue_feldpar"      => 0,
    "blue_kyanite"      => 2,
    "blue_lace_agate"   => 0,
    "blue_tiger_eye"    => 0,
    "botswana_agate"    => 0,
    "brasilian_agate"   => 0,
    "brookite"          => 11,
    "carnelian"         => 0,
    "celestite"         => 2,
    "champki_ruby"      => 0,
    "charcoal_pyrite"   => 0,
    "chlorite_phantom_tower" => 2,
    "chryscolla"        => 1,
    "chryscolla_&_wulfenite" => 5,
    "chrysoprase"       => 1,
    "citrine"           => 0,
    "corundum"          => 0,
    "crocodile_jasper"  => 0,
    "dalmatian_jasper"  => 0,
    "danburite"         => 8,
    "dessert_rose"      => 1,
    "dravite"           => 5,
    "dumortierite"      => 1,
    "emerald"           => 2,
    "epidote"           => 1,
    "feldspar"          => 0,
    "fire_agate"        => 0,
    "fluorite"          => 0,
    "fushite"           => 0,
    "garnet"            => 0,
    "green_aventurine"  => 0,
    "green_calcite"     => 0,
    "green_fluorite"    => 1,
    "green_kyanite"     => 2,
    "grey_agate"        => 0,
    "hematite"          => 0,
    "herderite"         => 11,
    "howlite"           => 0,
    "iolite"            => 1,
    "labradorite"       => 1,
    "lapis_lazuli"      => 0,
    "lepidolite"        => 1,
    "lodestone"         => 0,
    "magnesite"         => 0,
    "malachite"         => 2,
    "moldavite"         => 12,
    "mookaite_jasper"   => 0,
    "moss_agate"        => 0,
    "mother_of_pearl"   => 2,
    "natrolite"         => 6,
    "nephrite_jade"     => 1,
    "onyx"              => 0,
    "orange_calcite"    => 0,
    "peridot"           => 0,
    "petalite"          => 7,
    "petrified_wood"    => 0,
    "phenacite"         => 9,
    "prehnite"          => 1,
    "purple_fluorite"   => 0,
    "pyrite"            => 0,
    "quartz"            => 0,
    "quartzite"         => 0,
    "rainbow_jasper"    => 0,
    "rainbow_moonstone" => 1,
    "red_agate"         => 0,
    "red_tiger_eye"     => 0,
    "rhondonite"        => 0,
    "rose_quartz"       => 0,
    "ruby"              => 1,
    "sandstone"         => 0,
    "saphire"           => 2,
    "satyaloka_quartz"  => 5,
    "scolecite"         => 5,
    "selenite"          => 1,
    "septarian"         => 3,
    "serpentine"        => 3,
    "shiva_lingam"      => 3,
    "smokey_alligator_quartz" => 0,
    "smokey_quartz"     => 0,
    "snow_flake_obsidian" => 0,
    "snow_quartz"       => 0,
    "sodalite"          => 0,
    "spirit_quartz"     => 5,
    "star_mica"         => 3,
    "sugilite"          => 4,
    "sulpher"           => 1,
    "sper_7"            => 3,
    "talc"              => 1,
    "tangerine_aura_quartz" => 5,
    "tanzanite"         => 11,
    "tektite"           => 0,
    "tibetan_tektite"   => 6,
    "tiger_eye"         => 0,
    "tree_agate"        => 0,
    "turquoise"         => 0,
    "unakite"           => 0
  }
}

## Loop ##
## Cycles the hash above and creates the appropriate listings ##
stones.each do |stone_type,stones| # => starfish etc
  stones.each do |stone,price|  # => circle/square/oval/teardrop etc
    Stone.upsert({stone_type: Stone.stone_types[stone_type], name: stone, price: price}, unique_by: :stone_type_name_index)
  end
end

##########################################
##########################################

## Associations ##
## Allows us to build the various associations between charms & shapes ##
Charm.all.each do |charm|
  shapes = Shape.where name: charms[charm.charm_type][charm.name.to_sym][:associations]
  begin
    charm.shapes << shapes # => unique constraints
  rescue ActiveRecord::RecordNotUnique => e
    next # => skip to next value
  end
end

##########################################
##########################################
##########################################
