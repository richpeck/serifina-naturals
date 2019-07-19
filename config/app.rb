require 'sinatra/shopify-sinatra-app' # => Shopify App
require 'sinatra/asset_pipeline'      # => Sinatra Asset Piepline
require 'haml'                        # => Haml

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

  # => App
  # => This is a simple example that fetches some products
  # => From Shopify and displays them inside your app
  get '/' do
    shopify_session do |shop_name|
      @shop = ShopifyAPI::Shop.current
      @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
      erb :home
    end
  end

  ##########################################################
  ##########################################################

  # this endpoint recieves the uninstall webhook
  # and cleans up data, add to this endpoint as your app
  # stores more data.
  post '/uninstall' do
    shopify_webhook do |shop_name, params|
      Shop.find_by(name: shop_name).destroy
    end
  end

  ##########################################################
  ##########################################################

  private

  # This method gets called when your app is installed.
  # setup any webhooks or services you need on Shopify
  # inside here.
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
  end
end

##########################################################
##########################################################
