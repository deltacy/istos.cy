Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'portal#index'

    resources :search, only: :index, as: :searches
  end
end
