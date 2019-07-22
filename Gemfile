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
gem 'shopify-sinatra-app', '~> 0.8.0'                                                        # => Allows us to create a shopify store with Sinatra (https://github.com/kevinhughes27/shopify-sinatra-app)
gem 'sinatra-activerecord', '~> 2.0', '>= 2.0.13', github: 'richpeck/sinatra-activerecord'   # => Integrates ActiveRecord into Sinatra apps (I changed for AR6+)
gem 'sinatra-asset-pipeline', '~> 2.2', gthub: 'richpeck/sinatra-asset-pipeline'             # => Asset Pipeline (for CSS/JS) (I changed lib/asset-pipeline/task.rb#14 to use ::Sinatra:Manifest)
gem 'sinatra-contrib', '~> 2.0', '>= 2.0.5'                                                  # => Allows us to add "contrib" library to Sinatra app (respond_with) -> http://sinatrarb.com/contrib/
gem 'sinatra-cors', '~> 1.1'                                                                 # => Protect app via CORS

# => Database
# => Allows us to determine exactly which db we're using
# => To get the staging/production environments recognized by Heroku, set the "BUNDLE_WITHOUT" env var as explained here: https://devcenter.heroku.com/articles/bundler#specifying-gems-and-groups
gem 'sqlite3', group: :development
gem 'pg',      groups: [:staging, :production]

# => Server
# => Runs puma in development/staging/production
gem 'puma' # => web server

###########################################
###########################################

####################
#     Backend      #
####################

# => General
# => Included by Sinatra-Shopify-App
gem 'rack-flash3', require: 'rack-flash'    # => Flash messages for Rack apps
gem 'foreman', group: :development          # => Allows us to run the app in development/testing
gem 'byebug', groups: [:development, :test] # => Debug tool for Ruby

# => Extra
# => Added to help us manage data structures in app
gem 'addressable', '~> 2.6'                 # => Break down the various components of a domain
gem 'activerecord', '~> 6.0.0.rc1'          # => Allows us to use AR 6.0.0.rc1+ as opposed to 5.2.x (will need to keep up to date)
gem 'require_all', '~> 2.0'                 # => Require an entire directory and include in an app

###########################################
###########################################

####################
#     Frontend     #
####################

gem 'haml', '~> 5.1', '>= 5.1.1' # => HAML

###########################################
###########################################
