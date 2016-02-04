require File.expand_path('../boot', __FILE__)
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

## TODO Test LTI HERE
## require File.expand_path('../boot', __FILE__)

module Lambda
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.quiet_assets = true
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.test_framework :rspec
      generate.view_specs false
    end
    config.action_controller.action_on_unpermitted_parameters = :raise
    config.active_record.raise_in_transactional_callbacks = true
    config.active_job.queue_adapter = :delayed_job

    # Used to autoload Dce_Lti which isn't being used as a gem.
    config.autoload_paths += %W(#{config.root}/lib)

  end
end
