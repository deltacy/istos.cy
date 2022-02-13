Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    root 'portal#index'

    resources :search, only: :index, as: :searches
    resources :services, only: :show

    namespace :support_interface, path: '/support' do
      root 'services#index'

      resources :sessions, only: :new
      resources :services, only: %i[new create update edit]
    end
  end

  post '/auth/:provider/callback', to: 'support_interface/sessions#create'
  post '/auth/failure', to: 'support_interface/sessions#failure'
  get '/auth/failure', to: 'support_interface/sessions#failure'
  get '/logout', to: 'support_interface/sessions#destroy'
end
