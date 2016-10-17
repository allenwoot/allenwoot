require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Allenwoot
  class Application < Rails::Application
    config.serve_static_files = true
    config.assets.compile = true
    config.assets.enabled = true
    config.assets.precompile += ['application.css', 'application.js']
  end
end
