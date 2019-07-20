############################################################
############################################################
##        _____              _            _               ##
##       | ___ \            | |          | |              ##
##       | |_/ / __ ___   __| |_   _  ___| |_ ___         ##
##       |  __/ '__/ _ \ / _` | | | |/ __| __/ __|        ##
##       | |  | | | (_) | (_| | |_| | (__| |_\__ \        ##
##       \_|  |_|  \___/ \__,_|\__,_|\___|\__|___/        ##
##                                                        ##
############################################################
############################################################

## Products ##
## Allows us to populate the products within the store ##
class CreateProducts < ActiveRecord::Migration::Current

  ###########################################
  ###########################################
  
  # => Decs
  @@table = :products

  ###########################################
  ###########################################

  ## Up ##
  def up
    create_table @@table do |t|
      t.integer :product_id
      t.string  :product_type
      t.string  :title
      t.string  :vendor
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
