Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  root to: 'homes#index'

  get '/auth/:provider/callback', to: 'users#create',       as: :auth_callback
  get '/auth/failure',            to: 'users#auth_failure', as: :auth_failure

  get '*path', to: 'application#render_404'
end
