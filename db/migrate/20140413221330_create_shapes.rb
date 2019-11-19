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

## Shapes ##
## Allows us to populate the shapes within the applet ##
## These shapes shouldn't change ##
## id | bail_type | name | code | price | created_at | updated_at ##
class CreateShapes < ActiveRecord::Migration::Current

  ###########################################
  ###########################################

  # => Decs
  @@table = :shapes

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.integer :bail_type,     default: 0
      t.integer :shape_type_id, default: 0
      t.string  :name
      t.decimal :price, precision: 10, scale: 2

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:bail_type, :shape_type_id, :name], unique: true, name: 'bail_shop_name_unique_index'
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
