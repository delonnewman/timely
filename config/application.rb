# frozen_string_literal: true

require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
# require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
# require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative '../lib/core_ext/date'

module Kindly
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
    config.time_zone = 'Eastern Time (US & Canada)'

    config.hosts << 'kindly.test'
    config.hosts << 'time.delonnewman.name'

    config.autoload_lib(ignore: %w[tasks assets core_ext])

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
