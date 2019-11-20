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
## This was added by the ShopifyApp gem
## It stores any new "stores" linked to the app via the Shopify oAuth process
############################################
############################################

## Stone ##
## id | stone_type_id | name | price | created_at | updated_at ##
class Stone < ActiveRecord::Base

  # => Stone Types
  belongs_to :stone_type, required: true

  # => Delegate
  delegate :name, to: :stone_type, prefix: true

end

############################################
############################################
