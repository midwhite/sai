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
        post 'good'
        post 'bad'
      end
    end
  end

  get '*path', to: 'application#render_404'
end
