require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'paperclip'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AppTugas
  class Application < Rails::Application

    config.i18n.available_locales = [:id, :en]
    config.i18n.default_locale = :id

    config.assets.enabled = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.initialize_on_precompile = true
    config.assets.precompile += %w( .svg .eot .woff .ttf )
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/
  end
end
