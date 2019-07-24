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
require 'rack-flash'       # => Flash for Rack based apps
require 'padrino-helpers'  # => Padrino Helpers (required for number_to_currency)
require 'titleize'         # => Appends titleize method to strings in Ruby (https://github.com/granth/titleize)

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

  ##########################################################
  ##########################################################

  # => Register
  # => This allows us to call the various extensions for the system
  register Sinatra::Shopify
  register Sinatra::Cors                # => Protects from unauthorized domain activity
  register Padrino::Helpers             # => number_to_currency (https://github.com/padrino/padrino-framework/blob/master/padrino-helpers/lib/padrino-helpers.rb#L22)
  register Sinatra::Sprockets::Helpers  # => Asset Pipeline
  register Sinatra::RespondWith         # => http://sinatrarb.com/contrib/respond_with
  helpers Sinatra::RequiredParams       # => Required Parameters (ensures we have certain params for different routes)

  ##########################################################
  ##########################################################

  # => Development
  # => Ensures we're only loading in development environment
  configure :development do
    register Sinatra::Reloader  # => http://sinatrarb.com/contrib/reloader
  end

  ##########################################################
  ##########################################################

  ## Definitions ##
  ## Any variables defined here ##
  domain   = ENV.fetch('DOMAIN', 'www.serifinanaturals.com') ## used for CORS and other funtionality -- ENV var gives flexibility
  debug    = ENV.fetch("DEBUG", false) != false ## this needs to be evaluated this way because each ENV variable returns a string ##

  ##########################################################
  ##########################################################

  # => General
  # => Allows us to determine various specifications inside the app
  set :logger, Logger.new(STDOUT)                    ## logger
  set :root,   File.dirname(__FILE__)                ## required to get views working (esp. with HAML) -- http://sinatrarb.com/configuration.html
  set :views,  Proc.new { File.join(root, "views") } ## views

  ##########################################################
  ##########################################################

  # => Asset Pipeline
  # => Allows us to precompile assets as you would in Rails
  # => https://github.com/kalasjocke/sinatra-asset-pipeline#customization
  set :assets_precompile, %w[javascripts/app.js stylesheets/app.sass] # *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2
  register Sinatra::AssetPipeline

  ##########################################################
  ##########################################################

  # => Sprockets
  # => This is for the layout (calling sprockets helpers etc)
  # => https://github.com/petebrowne/sprockets-helpers#setup
  configure do
    # Setup Sprockets
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.join(root, 'assets', 'images')

    # Configure Sprockets::Helpers (if necessary)
    Sprockets::Helpers.configure do |config|
      config.environment = sprockets
      config.public_path = public_folder
    end
  end

  ##########################################################
  ##########################################################

  # => Shopify
  # => Set the scope that your app needs, read more here:
  # => http://docs.shopify.com/api/tutorials/oauth
  set :scope, 'read_products, write_draft_orders'

  ##########################################################
  ##########################################################

  ## CORS ##
  ## Only allow requests from domain ##
  set :allow_origin,   URI::HTTPS.build(host: domain).to_s
  set :allow_methods,  "GET,POST"
  set :allow_headers,  "accept,content-type,if-modified-since"
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
      @products = @shop.products

      # => Response
      # => Bundled inside Sinatra
      respond_to do |format|
        format.html { haml :home }
        format.json { @products.to_json }
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

  # => Protection
  # => This is used to protect the method from non-accepted routes
  before '/select' do
    halt 403 if !request.accept.map{ |item| item.to_s }.include?("application/json") && request.get? # => Cross origin domain cuts out XHR headers (need to justify against accept headers instead)
  end

  ##########################################################
  ##########################################################

  # => Select
  # => Allows us to receive XHR requests
  # => This is used to build the custom order in the Shopify area
  # => https://stackoverflow.com/questions/8225689/creating-a-route-with-sinatra-to-only-accept-a-certain-content-type
  get '/select' do

    # => Params
    # => Ensures we have *at least* the "bail_type" params present
    required_params :bail_type # => This ensures we have "bail_type" set in the params querystring

    # => Vars
    # => Allows us to identify the various variables for the system
    @shape  = Shape.find_by(id: params[:shape])
    @charms = @shape.try(:charms)

    # => Build out response object
    # => This is designed to provide the user with a series of pieces of information
    # => which gives them the ability to add certain products to their cart
    @items = {
      shapes: Shape.send(params[:bail_type]),
      charms: @charms,
      stones: @charms.try(:find, params[:charm]).try(:stones)
    }

    # => Response
    # => Send back the hash of what you've built
    respond_to do |format|
      format.json { @items.to_json }
    end

  end

  ##########################################################
  ##########################################################

  # => Draft Order
  # => Allows us to create new orders for custom products
  post '/select' do

    # => Required Params
    # => Ensures we are passing the right data to the method
    required_params :shop, :bail_type, :shape #, :charm, :stones

    # => Items
    @shop    = Shop.find_by name: params[:shop]
    @shape   = Shape.find params[:shape]

    # => Session
    # => Because we're registering/logging in on behalf of the store, we need to ensure we are using their store
    @session = ShopifyAPI::Session.new(domain: @shop.name, token: @shop.token, api_version: '2019-07')
    ShopifyAPI::Base.activate_session(@session)

    # => Shopify API
    # => Engages with store
    @order = ShopifyAPI::DraftOrder.create({

      "line_items" => [{

        # => Stones
        "title": @shape.shape_type.titleize,
        "price": "",
        "quantity":   1,

      }]

    }) # => Create draft order

    @order.send_draft_invoice

    # => Response
    # => Send back the hash of what you've built
    respond_to do |format|
      format.json { @order.to_json }
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

    ##################################################
    ##################################################

      #######################
      ## Uninstall Webhook ##
      #######################

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

    ##################################################
    ##################################################

      #######################
      ## Populate Products ##
      #######################

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

    ##################################################
    ##################################################

    end ## session
  end ## auth
end ## app.rb

##########################################################
##########################################################
