############################################
############################################
##    ____ _                 _  __        ##
##  /  ___| |               (_)/ _|       ##
##  \ `--.| |__   ___  _ __  _| |_ _   _  ##
##   `--. \ '_ \ / _ \| '_ \| |  _| | | | ##
##  /\__/ / | | | (_) | |_) | | | | |_| | ##
##  \____/|_| |_|\___/| .__/|_|_|  \__, | ##
##                    | |           __/ | ##
##                    |_|          |___/  ##
##                                        ##
############################################
############################################
## This was added by the ShopifyApp gem
## It stores any new "stores" linked to the app via the Shopify oAuth process
############################################
############################################

## Shop ##
## id | shop_id | name | created_at | updated_at ##
class Shop < ActiveRecord::Base
  def self.secret
    @secret ||= ENV['SECRET']
  end

  attr_encrypted :token,
    key: secret,
    attribute: 'token_encrypted',
    mode: :single_iv_and_salt,
    algorithm: 'aes-256-cbc',
    insecure_mode: true

  validates_presence_of :name
  validates_presence_of :token, on: :create

  # => Associations
  has_many :products, dependent: :delete_all
end

############################################
############################################
