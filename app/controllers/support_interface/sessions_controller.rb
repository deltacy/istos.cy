module SupportInterface
  class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :create
    skip_before_action :authenticate_user!, only: %i[new create failure]

    def create
      user = User.find_by(provider: auth_hash['provider'], uid: auth_hash['uid'], user_type: 'support_user')
      return create_user_and_request_activation if user.nil?

      session[:user_id] = user.id
      redirect_to support_interface_root_path, notice: t('.success')
    end

    def destroy
      session[:user_id] = nil
      redirect_to new_support_interface_session_path, notice: t('.success')
    end

    def failure
      redirect_to new_support_interface_session_path, notice: 'Authentication failed'
    end

    protected

    def auth_hash
      request.env['omniauth.auth']
    end

    def create_user_and_request_activation
      User.create_from_omniauth(auth_hash)
      redirect_to logout_path, notice: t('.activation_required')
    end
  end
end
