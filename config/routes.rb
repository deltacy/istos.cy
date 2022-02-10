Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'portal#index'

    resources :search, only: :index, as: :searches
    resources :services, only: :show

    namespace :support_interface, path: '/support' do
      root 'services#index'

      resources :services, only: %i[new create update edit]
    end
  end
end
