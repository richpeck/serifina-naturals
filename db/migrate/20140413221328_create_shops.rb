############################################################
############################################################
##          ____ _                 _  __                  ##
##        /  ___| |               (_)/ _|                 ##
##        \ `--.| |__   ___  _ __  _| |_ _   _            ##
##         `--. \ '_ \ / _ \| '_ \| |  _| | | |           ##
##        /\__/ / | | | (_) | |_) | | | | |_| |           ##
##        \____/|_| |_|\___/| .__/|_|_|  \__, |           ##
##                          | |           __/ |           ##
##                          |_|          |___/            ##
##                                                        ##
############################################################
############################################################

## Shops ##
## Allows us to populate connected Shopify stores in our DB ##
class CreateShops < ActiveRecord::Migration::Current

  ## Up ##
  def up

    ## Table ##
    create_table :shops do |t|
      t.string :name
      t.string :token_encrypted
      t.index  :name, unique: true
    end

  end

  ## Down ##
  def down
    drop_table :shops, if_exists: true
  end

end

############################################################
############################################################
