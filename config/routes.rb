Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    root to: 'status#index'

    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]
  end
end
