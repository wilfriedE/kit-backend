Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    root to: 'status#index'

    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]


    resources :artifacts, only: [:index, :show, :create, :update, :destroy] do
      collection do
        get 'search' => 'api/artifacts#search'
      end
    end
  end
end
