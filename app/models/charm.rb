############################################
############################################
##   ____ _                               ##
## /  __ \ |                              ##
## | /  \/ |__   __ _ _ __ _ __ ___  ___  ##
## | |   | '_ \ / _` | '__| '_ ` _ \/ __| ##
## | \__/\ | | | (_| | |  | | | | | \__ \ ##
##  \____/_| |_|\__,_|_|  |_| |_| |_|___/ ##
##                                        ##
############################################
############################################
## Allows us to call charms and link them with the
## various shapes, stones etc
############################################
############################################

## Charm ##
## id | charm_type | name | price | created_at | updated_at ##
class Charm < ActiveRecord::Base
  enum charm_type: %i[dream_catcher ohms paisley steampunk_gear tree_of_life peace feather hamsa lotu chakra heart mini_heart_&_arrow lock_and_key owl paw_print tear_drop cross words starfish seahorse anchor turtle dolphin premium_mini seashells request_shape sm_med_or_large shark_teeth]
end


############################################
############################################
