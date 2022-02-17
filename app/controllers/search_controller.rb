class SearchController < ApplicationController
  def index
    @search_term = search_term
    @services = search_term&.length > 1 ? Service.locale(I18n.locale).results(search_term) : []
  end

  private

  def search_term
    params.permit(:search_term)[:search_term]
  end
end
