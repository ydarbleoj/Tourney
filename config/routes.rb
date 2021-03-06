Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses

  resources :users, only: [:index, :show, :edit, :update]

  resources :user_statistics

  resources :password_resets, only: [:create] do
    collection do
      get ':token', action: :edit, as: :edit
      patch ':token', action: :update
    end
  end

  namespace :api do
    namespace :v2 do

      resources :tournaments, only: [:index, :create]
      resources :user_scores

      namespace :leaderboards do
        resources :strokes, only: [:index]
        resources :putts, only: [:index]
        resources :skins, only: [:index]
        resources :teams, only: [:index]
      end

      namespace :rounds do
        resources :courses, only: [:index]
        resources :lists, only: [:index]
        resources :scorecards, only: [:index, :update]
        resources :team_scorecards, only: [:show]
      end

      namespace :tournaments do
        resources :rounds, only: [:create]

        resources :summary, only: [:index]

        namespace :admin do
          resources :user_scorecards
          resources :users
          resources :invitations do
            member do
              patch :accepted
            end
            collection do
              get :accept
            end
          end
          resources :tee_times
          resource :edits
        end
      end

      namespace :users do
        resources :profiles
      end

    end
  end

  # NEED TO REFACTOR!!
  # resources :tournaments do
  #   # BUild routing for admin
  #   #
  #   resources :courses
  #   resources :rounds

  #   resources :leaderboards, only: [:update]

  #   namespace :leaderboards do
  #     namespace :skins do
  #       resources :previews, only: [:index]
  #       resources :totals, only: [:index]
  #     end
  #     resources :stroke_previews, only: [:index]
  #     resources :putting_previews, only: [:index]
  #     namespace :teams do
  #       resources :previews, only: [:index]
  #       resources :totals, only: [:index]
  #     end
  #   end

  #   namespace :info do
  #     namespace :money_list do
  #       resources :previews, only: [:index]
  #       resources :totals, only: [:index]
  #     end

  #     namespace :stats do
  #       resources :previews, only: [:index]
  #       resources :totals, only: [:index]
  #     end
  #   end

  #   namespace :stats do
  #     resources :courses, only: [:index]
  #   end

  #   resources :new_courses
  #   resources :players
  #   resources :tee_times
  #   resources :stroke_leaderboard, only: [:index]
  #   resources :putting_leaderboard, only: [:index]

  #   resources :invitations, only: [:index, :new, :create, :destroy] do
  #     member do
  #       get :accept
  #       patch :accepted
  #     end
  #   end

  #   # routing for tournament show page...
  #   member do
  #     get 'skins_leaderboard'
  #     get 'net_skins_leaderboard'
  #     # get 'stroke_leaderboard'
  #     get 'putting_leaderboard'
  #     get 'tee_times'
  #   end

  #   collection do
  #     get 'history'
  #   end
  #   resources :tournament_rounds
  #   # resources :rounds
  #   resources :scorecards, only: [:show] do
  #     resources :user_scores
  #   end
  # end

  # resources :scorecards, only: [:index] do
  #   resources :user_scores
  #   member do
  #     get 'display'
  #   end
  # end

  root to: "home#index"
  # mount Knock::Engine => "/knock"
end
