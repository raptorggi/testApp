require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.enable_dependency_loading = true
    config.autoload_paths << Rails.root.join('lib')
    config.autoload_paths << Rails.root.join('app', 'sweepers')
    config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
    config.action_mailer.default_url_options = { host: 'localhost:3000' }

    config.eager_load_paths = Dir.glob("#{Rails.root}/app/*").reject do |path|
        path.include?("admin")
    end
  end
end
