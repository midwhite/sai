Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root to: 'homes#index'

  # Omniauth
  get '/auth/:provider/callback', to: 'users#create',       as: :auth_callback
  get '/auth/failure',            to: 'users#auth_failure', as: :auth_failure

  # API
  namespace :api do
    # Topics
    resources :topics do
      member do
        resources :comments
        post 'good'
        post 'bad'
      end
    end

    resources :users do
      collection do
        get 'me'
      end
    end
  end

  get '*path', to: 'application#render_404'
end
