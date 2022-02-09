module SupportInterface
  class ApplicationController < ActionController::Base
    include Localisation

    layout 'application_support'
  end
end
