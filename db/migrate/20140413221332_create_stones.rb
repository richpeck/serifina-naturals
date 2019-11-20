############################################
############################################
##      ____ _                            ##
##    /  ___| |                           ##
##    \ `--.| |_ ___  _ __   ___  ___     ##
##     `--. \ __/ _ \| '_ \ / _ \/ __|    ##
##    /\__/ / || (_) | | | |  __/\__ \    ##
##    \____/ \__\___/|_| |_|\___||___/    ##
##                                        ##
############################################
############################################

## Stones ##
## Allows us to populate the shapes within the applet ##
## id | stone_type | name | price | created_at | updated_at ##
class CreateStones < ActiveRecord::Migration::Current

  ###########################################
  ###########################################

  # => Decs
  @@table = :stones

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.integer :stone_type_id,  default: 0
      t.string  :name
      t.integer :price, precision: 10, scale: 2

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:stone_type_id, :name], unique: true, name: 'stone_type_name_index'
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
