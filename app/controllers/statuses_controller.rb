class StatusesController < ApplicationController
  def show
    @services = Service.locale(locale).all
  end
end
