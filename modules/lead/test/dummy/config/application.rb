require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)
require "lead"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    
    config.generators do |g|
      g.orm :active_record, primary_key_type: :uuid
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

