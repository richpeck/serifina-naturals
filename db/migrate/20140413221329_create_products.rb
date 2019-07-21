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
      t.references :shop, null: false
      t.integer :product_id, limit: 8
      t.string  :product_type
      t.string  :title
      t.string  :vendor
      t.string  :sku
      t.string  :image
      t.decimal :price, precision: 10, scale: 2
      t.timestamps

      # => Index
      # => Required for upsert_all (ActiveRecord 6+)
      t.index [:shop_id, :product_id], unique: true, name: 'shop_products_unique_index'
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
