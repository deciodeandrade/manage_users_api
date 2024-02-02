Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth/user'

  get '/home', to: 'home#index'

  root 'home#index'

  namespace :admin, defaults: { format: :json } do
    get 'home', to: 'home#index'

    resources :users

    resources :dashboard do
      collection do
        get 'total_users_number'
      end
    end

    resources :etl do
      collection do
        post 'make_etl_users'
        get 'etl_users_progress'
      end
    end
  end

  namespace :no_admin, defaults: { format: :json } do
    get 'home', to: 'home#index'
    
    resources :profile, only: [:show, :update, :destroy]
  end
end
