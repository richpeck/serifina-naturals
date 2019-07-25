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
## id | stone_type | name | price | created_at | updated_at ##
class Stone < ActiveRecord::Base
  enum stone_type: %i[chakra synergy12]
end

############################################
############################################