Rails.application.routes.draw do

  # get 'leaderboards/index'
  # get 'leaderboards/new'
  # get 'leaderboards/edit'
  # get 'leaderboards/create'
  # get 'leaderboards/execute'

  devise_for :users, controllers: { registrations: 'registrations' }
  # get ':username', to: 'users#show', as: :user
  resources :users, only: [:index, :show, :edit, :update]
  resources :courses
  resources :leaderboards
  resources :tournaments do
    member do
      get 'stroke_leaderboard'
      get 'putting_leaderboard'
      get 'tee_times'
    end
    collection do
      get 'history'
    #   get 'current_tournament'
    end
    resources :rounds
  end
  root to: "home#index"
  get '*path', to: 'home#index'
end

__END__
                          Prefix Verb   URI Pattern                                           Controller#Action
               new_user_session GET    /users/sign_in(.:format)                              devise/sessions#new
                   user_session POST   /users/sign_in(.:format)                              devise/sessions#create
           destroy_user_session DELETE /users/sign_out(.:format)                             devise/sessions#destroy
                  user_password POST   /users/password(.:format)                             devise/passwords#create
              new_user_password GET    /users/password/new(.:format)                         devise/passwords#new
             edit_user_password GET    /users/password/edit(.:format)                        devise/passwords#edit
                                PATCH  /users/password(.:format)                             devise/passwords#update
                                PUT    /users/password(.:format)                             devise/passwords#update
                          users GET    /users(.:format)                                      users#index
                      edit_user GET    /users/:id/edit(.:format)                             users#edit
                           user GET    /users/:id(.:format)                                  users#show
                                PATCH  /users/:id(.:format)                                  users#update
                                PUT    /users/:id(.:format)                                  users#update
                        courses GET    /courses(.:format)                                    courses#index
                                POST   /courses(.:format)                                    courses#create
                     new_course GET    /courses/new(.:format)                                courses#new
                    edit_course GET    /courses/:id/edit(.:format)                           courses#edit
                         course GET    /courses/:id(.:format)                                courses#show
                                PATCH  /courses/:id(.:format)                                courses#update
                                PUT    /courses/:id(.:format)                                courses#update
                                DELETE /courses/:id(.:format)                                courses#destroy
                   leaderboards GET    /leaderboards(.:format)                               leaderboards#index
                                POST   /leaderboards(.:format)                               leaderboards#create
                new_leaderboard GET    /leaderboards/new(.:format)                           leaderboards#new
               edit_leaderboard GET    /leaderboards/:id/edit(.:format)                      leaderboards#edit
                    leaderboard GET    /leaderboards/:id(.:format)                           leaderboards#show
                                PATCH  /leaderboards/:id(.:format)                           leaderboards#update
                                PUT    /leaderboards/:id(.:format)                           leaderboards#update
                                DELETE /leaderboards/:id(.:format)                           leaderboards#destroy
            history_tournaments GET    /tournaments/history(.:format)                        tournaments#history
 stroke_leaderboard_tournaments GET    /tournaments/stroke_leaderboard(.:format)             tournaments#stroke_leaderboard
putting_leaderboard_tournaments GET    /tournaments/putting_leaderboard(.:format)            tournaments#putting_leaderboard
          tee_times_tournaments GET    /tournaments/tee_times(.:format)                      tournaments#tee_times
              tournament_rounds GET    /tournaments/:tournament_id/rounds(.:format)          rounds#index
                                POST   /tournaments/:tournament_id/rounds(.:format)          rounds#create
           new_tournament_round GET    /tournaments/:tournament_id/rounds/new(.:format)      rounds#new
          edit_tournament_round GET    /tournaments/:tournament_id/rounds/:id/edit(.:format) rounds#edit
               tournament_round GET    /tournaments/:tournament_id/rounds/:id(.:format)      rounds#show
                                PATCH  /tournaments/:tournament_id/rounds/:id(.:format)      rounds#update
                                PUT    /tournaments/:tournament_id/rounds/:id(.:format)      rounds#update
                                DELETE /tournaments/:tournament_id/rounds/:id(.:format)      rounds#destroy
                    tournaments GET    /tournaments(.:format)                                tournaments#index
                                POST   /tournaments(.:format)                                tournaments#create
                 new_tournament GET    /tournaments/new(.:format)                            tournaments#new
                edit_tournament GET    /tournaments/:id/edit(.:format)                       tournaments#edit
                     tournament GET    /tournaments/:id(.:format)                            tournaments#show
                                PATCH  /tournaments/:id(.:format)                            tournaments#update
                                PUT    /tournaments/:id(.:format)                            tournaments#update
                                DELETE /tournaments/:id(.:format)                            tournaments#destroy
                           root GET    /