class SearchController < ApplicationController
  def index
    puts I18n.locale
    @search_term = search_term
    @services = Service.where(locale: I18n.locale)
                       .and(Service.where('lower(name) like ?', "%#{search_term.downcase}%"))
                       .or(Service.where('lower(description) like ?', "%#{search_term.downcase}%"))
  end

  private

  def search_term
    params.permit(:search_term)[:search_term]
  end
end
