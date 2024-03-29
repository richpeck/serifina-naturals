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

## Charms ##
## Allows us to populate the shapes within the applet ##
## id | charm_type | name | price | created_at | updated_at ##
class CreateCharms < ActiveRecord::Migration::Current

  ###########################################
  ###########################################

  # => Decs
  @@table = :charms

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.integer :charm_type_id
      t.string  :name
      t.integer :price, precision: 10, scale: 2

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:charm_type_id, :name], unique: true, name: 'charm_type_id_name_index'
    end
  end

  ###########################################
  ###########################################

  ## Down ##
  def down
    drop_table @@table, if_exists: true
  end

  ###########################################
  ###########################################

end

############################################################
############################################################
