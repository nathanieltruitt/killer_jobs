Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'auth/registrations', sessions: 'auth/sessions', passwords: 'auth/passwords' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#home'
  get 'page_not_found', to: 'pages#page_not_found'
  resources :jobs do
    resources :applications, only: %i[create destroy]
  end
  resources :companies do
    resources :locations, except: :index
  end

  # my company routes
  get 'my_company/recruiters', to: 'companies#recruiters'
  get 'my_company/locations', to: 'companies#locations'
end
