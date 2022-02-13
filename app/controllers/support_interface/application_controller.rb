module SupportInterface
  class ApplicationController < ActionController::Base
    include Localisation

    layout 'application_support'

    before_action :authenticate_user!

    def authenticate_user!
      redirect_to new_support_interface_session_path if session[:user_id].nil?
    end
  end
end
