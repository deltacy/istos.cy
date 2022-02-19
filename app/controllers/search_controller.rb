class SearchController < ApplicationController
  def index
    @search_term = search_term
    @services = search_term&.length > 1 ? Service.localised_results(search_term, I18n.locale) : []
  end

  private

  def search_term
    params.permit(:search_term)[:search_term]
  end
end
