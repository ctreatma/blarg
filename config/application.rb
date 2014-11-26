require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Blarg
  class Application < Rails::Application
    config.base_urls = ActiveSupport::OrderedOptions.new
    config.base_urls.github = 'http://github.com'
    config.base_urls.linkedin = 'http://linkedin.com/in'
    config.base_urls.stack_overflow = 'http://stackoverflow.com/users'
    config.base_urls.twitter = 'http://twitter.com'
  end
end
