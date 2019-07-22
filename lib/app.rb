##########################################################
##########################################################
##           ____ _             _                       ##
##         /  ___(_)           | |                      ##
##         \ `--. _ _ __   __ _| |_ _ __ __ _           ##
##          `--. \ | '_ \ / _` | __| '__/ _` |          ##
##         /\__/ / | | | | (_| | |_| | | (_| |          ##
##         \____/|_|_| |_|\__,_|\__|_|  \__,_|          ##
##                                                      ##
##########################################################
##########################################################
##              Main Sinatra app.rb file                ##
## Allows us to define, manage and serve various routes ##
##########################################################
##########################################################

# => Extras
# => Gives us ability to adapt functionality as appropriate
require 'haml'             # => Haml
require 'net/https'        # => URL::HTTPS core (for creating URL out of naked domain)
require "addressable/uri"  # => Addressable::URI (break down URL into components // for request.referrer - https://github.com/sporkmonger/addressable#example-usage)
require 'sass/plugin/rack' # => SASS plugin for asset pipeline (https://stackoverflow.com/q/47406294/1143732)
require 'require_all'      # => Require_All (allows us to call an entire directory)

# => Libs
# => Allows us to call various dependencies
require 'sinatra/shopify-sinatra-app' # => Shopify App
require 'sinatra/asset_pipeline'      # => Sinatra Asset Piepline
require 'sinatra/cors'                # => Sinatra CORS
require 'sinatra/contrib'             # => Sinatra Respond To (Sinatra Contrib)
require 'sinatra/sprockets-helpers'   # => Sprockets Helpers (Asset Pipeline -> https://stackoverflow.com/q/47406294/1143732)

# => App
# => Cycle through other files we've made and include them
require_all 'app' # => requires the entire "app" directory (https://medium.com/@ellishim/understanding-require-vs-require-relative-vs-require-all-80e3b26d89e6)

##########################################################
##########################################################

## Sinatra ##
## Based on - https://github.com/kevinhughes27/shopify-sinatra-app ##
class SinatraApp < Sinatra::Base
  register Sinatra::Shopify
  #register Sinatra::AssetPipeline
  register Sinatra::Sprockets::Helpers
  register Sinatra::RespondWith # => http://sinatrarb.com/contrib/respond_with

  configure :development do
    register Sinatra::Reloader  # => http://sinatrarb.com/contrib/reloader
  end

  ##########################################################
  ##########################################################

  # => Asset Pipeline
  # => Allows us to precompile assets as you would in Rails
  # => https://github.com/kalasjocke/sinatra-asset-pipeline#customization
  set :assets_precompile, %w(app.js app.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  set :sprockets, Sprockets::Environment.new('app')
  set :assets_prefix, '/assets'
  set :digest_assets, true
  set :assets_css_compressor, :sass

  register Sinatra::AssetPipeline

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    sprockets.append_path File.join('app', 'assets', 'stylesheets')
  end

  ##########################################################
  ##########################################################

  # => Shopify
  # => Set the scope that your app needs, read more here:
  # => http://docs.shopify.com/api/tutorials/oauth
  set :scope, 'read_products, read_orders'

  ##########################################################
  ##########################################################

  ## Definitions ##
  ## Any variables defined here ##
  domain   = ENV.fetch('DOMAIN', 'serifinanaturals.com') ## used for CORS and other funtionality -- ENV var gives flexibility
  debug    = ENV.fetch("DEBUG", false) != false ## this needs to be evaluated this way because each ENV variable returns a string ##

  ##########################################################
  ##########################################################

  # => General
  # => Allows us to determine various specifications inside the app
  set :logger, Logger.new(STDOUT) ## logger
  set :haml, layout: :'layouts/application' ## https://github.com/kevinhughes27/shopify-sinatra-app/blob/996fa378324ab6d15bb54438be2605067f956428/lib/sinatra/shopify-sinatra-app.rb#L164

  ##########################################################
  ##########################################################

  ## CORS ##
  ## Only allow requests from domain ##
  set :allow_origin,   URI::HTTPS.build(host: domain).to_s
  set :allow_methods,  "POST"
  set :allow_headers,  "content-type,if-modified-since"
  set :expose_headers, "location,link"

  ##########################################################
  ##########################################################

  # => App
  # => This is a simple example that fetches some products
  # => From Shopify and displays them inside your app
  get '/' do

    # => Shopify Session
    # => Required to give us access to the information we need
    shopify_session do |shop_name|
      @shop     = Shop.find_by name: shop_name
      @products = Product.all

      # => Response
      # => Bundled inside Sinatra
      respond_to do |format|
        format.json { @products.to_json }
        format.html { haml :home }
      end ## response
    end ## shopify

  end ## get

  ##########################################################
  ##########################################################

  # => Uninstall
  # => This endpoint recieves the uninstall webhook
  # => and cleans up data, add to this endpoint as your app
  # => stores more data.
  post '/uninstall' do
    shopify_webhook do |shop_name, params|
      Shop.find_by(name: shop_name).destroy # => should destroy products too
    end
  end

  ##########################################################
  ##########################################################

  private

  # => Post Install/Uninstall
  # => This method gets called when your app is installed.
  # => setup any webhooks or services you need on Shopify
  # => inside here.
  def after_shopify_auth
    shopify_session do |shop_name| # => Shopify hook

      # => Uninstall Webhook
      # => Allows us to remove the app from the db when it's installed from shopify
      begin
        ShopifyAPI::Webhook.create(
          topic: 'app/uninstalled',
          address: "#{base_url}/uninstall",
          format: 'json'
        )
      rescue => e
        raise unless uninstall_webhook.persisted?
      end

      # => Populate Products
      # => Download the products to the local DB and allocate conflict information etc
      @products = ShopifyAPI::Product.find :all
      @shop     = Shop.find_by name: shop_name

      # => Create intermediary local variable
      # => This gives us the ability to manipulate the data as required
      products = JSON.parse(@products.to_json)

      # => Populate new products
      # => This allows us to store the products locally
      old_logger = ActiveRecord::Base.logger
      ActiveRecord::Base.logger = nil

      @shop.products.upsert_all products.map {|p|
        p["product_id"] = p.delete("id")
        p.merge!({ "shop_id" => @shop.id, "sku" => p["variants"][0]["sku"], "image" => p["images"][0]["src"] }) # => @shop.products doesn't populate the shop_id
        p.keep_if { |k,_| Product.column_names.include? k }
      }, unique_by: :shop_products_unique_index # => needs converting into object or hash etc

      # => Set the logger again
      ActiveRecord::Base.logger = old_logger

    end ## session
  end ## auth
end ## app.rb

##########################################################
##########################################################