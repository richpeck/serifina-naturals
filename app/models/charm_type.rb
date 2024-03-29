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
## Charm Types - should be enum but may wish to change
############################################
############################################

## Libs ##
## Since this is not loaded at init (as it is with Rails), need to manually invoke Node ##
require_relative 'node'

############################################
############################################

## CharmType -> Node ##
## id | type | name | created_at | updated_at ##
class CharmType < Node

  ## Associations ##
  has_many :charms

end

############################################
############################################
