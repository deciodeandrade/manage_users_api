Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/user'

  get '/home', to: 'home#index'

  root 'home#index'

  namespace :admin, defaults: { format: :json } do
    get 'home', to: 'home#index'
  end

  namespace :no_admin, defaults: { format: :json } do
    get 'home', to: 'home#index'
  end
end
