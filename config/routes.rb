Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    root to: 'status#index'

    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks]


    resources :users, only: [:show]  do
      collection do
        get 'artifacts'  => 'artifacts#user_artifacts'
      end

      member do
        resources :artifact_requests, only: [:index, :show, :create, :update, :destroy]
      end
    end

    resources :community, only: [:index, :show] do
      collection do
        get 'search' => 'community#search'
      end

      member do
        get 'artifacts' => 'community#artifacts'
        get 'causes' => 'community#causes'
      end
    end

    resources :causes, only: [:show]

    resources :artifacts, only: [:index, :show, :create, :update, :destroy] do
      collection do
        get 'search' => 'artifacts#search'
      end

      member do
        post 'bid/:user_id' => 'artifacts#bid_show'
        post 'bid/:bid_id/approve' => 'artifacts#bid_approval'
      end
    end
  end
end
