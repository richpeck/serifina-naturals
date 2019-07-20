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

# => Libs
# => Allows us to call various dependencies
require 'sinatra/shopify-sinatra-app' # => Shopify App
require 'sinatra/asset_pipeline'      # => Sinatra Asset Piepline
require 'sinatra/cors'                # => Sinatra CORS
require 'haml'                        # => Haml

# => Extra
# => Gives us ability to adapt functionality as appropriate
require 'net/https'       # => URL::HTTPS core (for creating URL out of naked domain)
require "addressable/uri" # => Addressable::URI (break down URL into components // for request.referrer - https://github.com/sporkmonger/addressable#example-usage)

##########################################################
##########################################################

## Sinatra ##
## Based on - https://github.com/kevinhughes27/shopify-sinatra-app ##
class SinatraApp < Sinatra::Base
  register Sinatra::Shopify
  register Sinatra::AssetPipeline

  ##########################################################
  ##########################################################

  # => Asset Pipeline
  # => Allows us to precompile assets as you would in Rails
  # => https://github.com/kalasjocke/sinatra-asset-pipeline#customization
  set :assets_precompile, %w(app.js app.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

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
    shopify_session do |shop_name|
      @shop = ShopifyAPI::Shop.current
      @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
      haml :home
    end
  end

  ##########################################################
  ##########################################################

  # => Uninstall
  # => This endpoint recieves the uninstall webhook
  # => and cleans up data, add to this endpoint as your app
  # => stores more data.
  post '/uninstall' do
    shopify_webhook do |shop_name, params|
      Shop.find_by(name: shop_name).destroy
    end
  end

  ##########################################################
  ##########################################################

  private

  # => Post Install
  # => This method gets called when your app is installed.
  # => setup any webhooks or services you need on Shopify
  # => inside here.
  def after_shopify_auth
    # shopify_session do
      # create an uninstall webhook, this webhook gets sent
      # when your app is uninstalled from a shop. It is good
      # practice to clean up any data from a shop when they
      # uninstall your app:

      # uninstall_webhook = ShopifyAPI::Webhook.new(
      #   topic: 'app/uninstalled',
      #   address: "#{base_url}/uninstall",
      #   format: 'json'
      # )
      # begin
      #   uninstall_webhook.save!
      # rescue => e
      #   raise unless uninstall_webhook.persisted?
      # end
    # end

    # => Populate products
    # => This pulls all the products from the newly added Shopify store
    # => And allows us to then build up relationships around each product (as per spreadsheet)
    shopify_session do
      logger.info("test")
    end

  end
end

##########################################################
##########################################################
