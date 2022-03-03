class PortalController < ApplicationController
  def index
    @popular_services = Service.locale(I18n.locale).order(Arel.sql('RANDOM()')).limit(5)
    @topics = Topic.top_level_topics.locale(I18n.locale).order(:name)
  end
end
