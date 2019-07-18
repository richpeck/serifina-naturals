###########################################
###########################################
##   _____                 __ _ _        ##
##  |  __ \               / _(_) |       ##
##  | |  \/ ___ _ __ ___ | |_ _| | ___   ##
##  | | __ / _ \ '_ ` _ \|  _| | |/ _ \  ##
##  | |_\ \  __/ | | | | | | | | |  __/  ##
##  \_____/\___|_| |_| |_|_| |_|_|\___|  ##
##                                       ##
###########################################
###########################################

# => Sources
source 'https://rubygems.org'

###########################################
###########################################

# => Ruby
# => https://github.com/cantino/huginn/blob/master/Gemfile#L4
ruby [RUBY_VERSION, '2.6.3'].min

###########################################
###########################################

# => Sinatra
# => Not big enough for Rails
gem 'shopify-sinatra-app', '~> 0.8.0'     # => Allows us to create a shopify store with Sinatra (https://github.com/kevinhughes27/shopify-sinatra-app)
gem 'sinatra-activerecord'                # => Integrates ActiveRecord into Sinatra apps

# => Database
# => Allows us to determine exactly which db we're using
gem 'sqlite3', group: :development
gem 'pg',      groups: [:staging, :production]

###########################################
###########################################

####################
#     Backend      #
####################

gem 'rack-flash3', require: 'rack-flash'    # => Flash messages for Rack apps
gem 'foreman', group: :development          # => Allows us to use Procfile configuration in our app
gem 'byebug', groups: [:development, :test] # => Debug tool for Ruby

###########################################
###########################################
