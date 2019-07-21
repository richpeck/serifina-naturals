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
## id | bail_type | shape_type | name | code | price | created_at | updated_at ##
class Shape < ActiveRecord::Base
  enum bail_type:  [:loop, :regular] # => 2 types of bail
  enum shape_type: [:square, :oval, :circle, :teardrop, :puzzle, :hunch_shell, :heart] # => 7 types of shape
end

############################################
############################################
