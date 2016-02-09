class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Session helpers give usaccess to consumer_key and consumer_secret
  include DceLti::SessionHelpers
  
  # We store the original request parameters in the session for use later on.
  # This allows us to re-create a tool provider instance whenever we need.
  # The TP instance could be used from many controllers
  # TODO: This doesn't yet support multiple app key / secret combos.
  def get_tool_provider
    launch_params = session[:launch_params]
    if launch_params
      IMS::LTI::ToolProvider.new(
        consumer_key, consumer_secret, launch_params
      )
    else
      return nil
    end
  end
end
