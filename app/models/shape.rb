############################################
############################################
##    _____ _                             ##
##   /  ___| |                            ##
##   \ `--.| |__   __ _ _ __   ___  ___   ##
##    `--. \ '_ \ / _` | '_ \ / _ \/ __|  ##
##   /\__/ / | | | (_| | |_) |  __/\__ \  ##
##   \____/|_| |_|\__,_| .__/ \___||___/  ##
##                     | |                ##
##                     |_|                ##
##                                        ##
############################################
############################################
## Class used to provide list of available shapes + their prices
## Whilst we could put this into Shopify, it will be better to just list the prices
## and update the store as required
############################################
############################################

## Shape ##
## Dependent on bail type (loop / regular) ##
## Loop: Circles, Rectangles, Squares, Ovals, Teardrops, Puzzle, Hunch Shell | Regular: Circles, Squares, Ovals, Teardrop, Hearts ##
## -- ##
## id | bail_type | shape_type_id | name | code | price | created_at | updated_at ##
class Shape < ActiveRecord::Base

  # => Types
  # => Allows us to differentiate between the various items
  enum bail_type: %i[loop regular]

  # => Shape Types
  belongs_to :shape_type, required: true

  # => Delegate
  delegate :name, to: :shape_type, prefix: true

  # => Associations
  # => Gives us the ability to associate different objects
  # => EG @shop.shapes.find(1).charms
  has_many :associations, as: :associatiable, dependent: :destroy
  has_many :charms, through: :associations, source: :associated, source_type: "Charm"

end

############################################
############################################
