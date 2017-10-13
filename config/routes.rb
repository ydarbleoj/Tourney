Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses
  resources :users, only: [:index, :show, :edit, :update]
  resources :user_statistics
  resources :leaderboards

  resources :tournaments do
    # BUild routing for admin
    resources :new_courses
    resources :players
    resources :round_tee_times
    resources :stroke_leaderboard, only: [:index]
    resources :putting_leaderboard, only: [:index]

    resources :invitations, only: [:index, :new, :create, :destroy] do
      member do
        get :accept
        patch :accepted
      end
    end

    # routing for tournament show page...
    member do
      get 'skins_leaderboard'
      get 'net_skins_leaderboard'
      # get 'stroke_leaderboard'
      get 'putting_leaderboard'
      get 'tee_times'
    end
    collection do
      get 'history'
    end
    resources :tournament_rounds
    # resources :rounds
    resources :scorecards, only: [:show] do
      resources :user_scores
    end
  end

  resources :scorecards, only: [:index] do
    member do
      get 'display'
    end
  end

  root to: "home#index"
  # mount Knock::Engine => "/knock"
end
