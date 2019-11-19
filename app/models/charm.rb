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
## id | charm_type_id | name | price | created_at | updated_at ##
class Charm < ActiveRecord::Base

  # => Charm Type
  # => Gives us the ability to determine type of the charm
  belongs_to :charm_type, required: true

  # => Delegations
  # => Allows us to call associative data
  delegate :name, to: :charm_type, prefix: true # => @charm.charm_type_name

  # => Associations
  # => Gives us the ability to associate different objects
  # => EG @shop.shapes.find(1).charms
  has_many :associations, as: :associated, dependent: :destroy
  has_many :shapes, through: :associations, source: :associatiable, source_type: "Shape"

end

############################################
############################################
