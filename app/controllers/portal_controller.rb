class PortalController < ApplicationController
  def index
    @popular_services = Service.where(locale: I18n.locale).order(Arel.sql('RANDOM()')).limit(5)

    @services = Service.where(locale: I18n.locale)
  end
end
