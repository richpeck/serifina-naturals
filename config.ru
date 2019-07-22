if Gem::Specification.find_all_by_name('dotenv').any?
  require 'dotenv'
  Dotenv.load
end

require_relative 'app/app'
SinatraApp.run!
