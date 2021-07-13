require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Jinderr
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
        controller_specs: true,
        fixtures: true,
        helper_specs: true,
        model_specs: true,
        request_spec: false,
        routing_specs: false,
        view_specs: false
    end

    config.time_zone = 'Tokyo'
    # config.i18n.default_locale = :ja
    config.beginning_of_week = :sunday
    # config/application.rb
    config.i18n.available_locales = [:en, :de, :fr]
    config.i18n.default_locale = :en


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
