module SupportInterface
  class ApplicationController < ActionController::Base
    include Localisation

    layout 'application_support'

    before_action :authenticate_user!

    helper_method :current_user

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id].present?
    end

    def authenticate_user!
      redirect_to new_support_interface_session_path if session[:user_id].nil?
    end
  end
end
