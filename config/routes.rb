Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  resources :users, only: [:index, :show, :edit, :update]
  resources :courses
  resources :leaderboards

  resources :tournaments do
    member do
      get 'skins_leaderboard'
      get 'net_skins_leaderboard'
      get 'stroke_leaderboard'
      get 'putting_leaderboard'
      get 'tee_times'
    end
    collection do
      get 'history'
    end
    resources :tournament_rounds
    resources :rounds
  end

  resources :scorecards
  root to: "home#index"
end

__END__
                          Prefix Verb   URI Pattern                                                      Controller#Action
                new_user_session GET    /users/sign_in(.:format)                                         devise/sessions#new
                    user_session POST   /users/sign_in(.:format)                                         devise/sessions#create
            destroy_user_session DELETE /users/sign_out(.:format)                                        devise/sessions#destroy
                   user_password POST   /users/password(.:format)                                        devise/passwords#create
               new_user_password GET    /users/password/new(.:format)                                    devise/passwords#new
              edit_user_password GET    /users/password/edit(.:format)                                   devise/passwords#edit
                                 PATCH  /users/password(.:format)                                        devise/passwords#update
                                 PUT    /users/password(.:format)                                        devise/passwords#update
        cancel_user_registration GET    /users/cancel(.:format)                                          registrations#cancel
               user_registration POST   /users(.:format)                                                 registrations#create
           new_user_registration GET    /users/sign_up(.:format)                                         registrations#new
          edit_user_registration GET    /users/edit(.:format)                                            registrations#edit
                                 PATCH  /users(.:format)                                                 registrations#update
                                 PUT    /users(.:format)                                                 registrations#update
                                 DELETE /users(.:format)                                                 registrations#destroy
                           users GET    /users(.:format)                                                 users#index
                       edit_user GET    /users/:id/edit(.:format)                                        users#edit
                            user GET    /users/:id(.:format)                                             users#show
                                 PATCH  /users/:id(.:format)                                             users#update
                                 PUT    /users/:id(.:format)                                             users#update
                         courses GET    /courses(.:format)                                               courses#index
                                 POST   /courses(.:format)                                               courses#create
                      new_course GET    /courses/new(.:format)                                           courses#new
                     edit_course GET    /courses/:id/edit(.:format)                                      courses#edit
                          course GET    /courses/:id(.:format)                                           courses#show
                                 PATCH  /courses/:id(.:format)                                           courses#update
                                 PUT    /courses/:id(.:format)                                           courses#update
                                 DELETE /courses/:id(.:format)                                           courses#destroy
                    leaderboards GET    /leaderboards(.:format)                                          leaderboards#index
                                 POST   /leaderboards(.:format)                                          leaderboards#create
                 new_leaderboard GET    /leaderboards/new(.:format)                                      leaderboards#new
                edit_leaderboard GET    /leaderboards/:id/edit(.:format)                                 leaderboards#edit
                     leaderboard GET    /leaderboards/:id(.:format)                                      leaderboards#show
                                 PATCH  /leaderboards/:id(.:format)                                      leaderboards#update
                                 PUT    /leaderboards/:id(.:format)                                      leaderboards#update
                                 DELETE /leaderboards/:id(.:format)                                      leaderboards#destroy
    skins_leaderboard_tournament GET    /tournaments/:id/skins_leaderboard(.:format)                     tournaments#skins_leaderboard
net_skins_leaderboard_tournament GET    /tournaments/:id/net_skins_leaderboard(.:format)                 tournaments#net_skins_leaderboard
   stroke_leaderboard_tournament GET    /tournaments/:id/stroke_leaderboard(.:format)                    tournaments#stroke_leaderboard
  putting_leaderboard_tournament GET    /tournaments/:id/putting_leaderboard(.:format)                   tournaments#putting_leaderboard
            tee_times_tournament GET    /tournaments/:id/tee_times(.:format)                             tournaments#tee_times
             history_tournaments GET    /tournaments/history(.:format)                                   tournaments#history
    tournament_tournament_rounds GET    /tournaments/:tournament_id/tournament_rounds(.:format)          tournament_rounds#index
                                 POST   /tournaments/:tournament_id/tournament_rounds(.:format)          tournament_rounds#create
 new_tournament_tournament_round GET    /tournaments/:tournament_id/tournament_rounds/new(.:format)      tournament_rounds#new
edit_tournament_tournament_round GET    /tournaments/:tournament_id/tournament_rounds/:id/edit(.:format) tournament_rounds#edit
     tournament_tournament_round GET    /tournaments/:tournament_id/tournament_rounds/:id(.:format)      tournament_rounds#show
                                 PATCH  /tournaments/:tournament_id/tournament_rounds/:id(.:format)      tournament_rounds#update
                                 PUT    /tournaments/:tournament_id/tournament_rounds/:id(.:format)      tournament_rounds#update
                                 DELETE /tournaments/:tournament_id/tournament_rounds/:id(.:format)      tournament_rounds#destroy
               tournament_rounds GET    /tournaments/:tournament_id/rounds(.:format)                     rounds#index
                                 POST   /tournaments/:tournament_id/rounds(.:format)                     rounds#create
            new_tournament_round GET    /tournaments/:tournament_id/rounds/new(.:format)                 rounds#new
           edit_tournament_round GET    /tournaments/:tournament_id/rounds/:id/edit(.:format)            rounds#edit
                tournament_round GET    /tournaments/:tournament_id/rounds/:id(.:format)                 rounds#show
                                 PATCH  /tournaments/:tournament_id/rounds/:id(.:format)                 rounds#update
                                 PUT    /tournaments/:tournament_id/rounds/:id(.:format)                 rounds#update
                                 DELETE /tournaments/:tournament_id/rounds/:id(.:format)                 rounds#destroy
                     tournaments GET    /tournaments(.:format)                                           tournaments#index
                                 POST   /tournaments(.:format)                                           tournaments#create
                  new_tournament GET    /tournaments/new(.:format)                                       tournaments#new
                 edit_tournament GET    /tournaments/:id/edit(.:format)                                  tournaments#edit
                      tournament GET    /tournaments/:id(.:format)                                       tournaments#show
                                 PATCH  /tournaments/:id(.:format)                                       tournaments#update
                                 PUT    /tournaments/:id(.:format)                                       tournaments#update
                                 DELETE /tournaments/:id(.:format)                                       tournaments#destroy
           scorecard_user_scores GET    /scorecards/:scorecard_id/user_scores(.:format)                  user_scores#index
                                 POST   /scorecards/:scorecard_id/user_scores(.:format)                  user_scores#create
        new_scorecard_user_score GET    /scorecards/:scorecard_id/user_scores/new(.:format)              user_scores#new
       edit_scorecard_user_score GET    /scorecards/:scorecard_id/user_scores/:id/edit(.:format)         user_scores#edit
            scorecard_user_score GET    /scorecards/:scorecard_id/user_scores/:id(.:format)              user_scores#show
                                 PATCH  /scorecards/:scorecard_id/user_scores/:id(.:format)              user_scores#update
                                 PUT    /scorecards/:scorecard_id/user_scores/:id(.:format)              user_scores#update
                                 DELETE /scorecards/:scorecard_id/user_scores/:id(.:format)              user_scores#destroy
                      scorecards GET    /scorecards(.:format)                                            scorecards#index
                                 POST   /scorecards(.:format)                                            scorecards#create
                   new_scorecard GET    /scorecards/new(.:format)                                        scorecards#new
                  edit_scorecard GET    /scorecards/:id/edit(.:format)                                   scorecards#edit
                       scorecard GET    /scorecards/:id(.:format)                                        scorecards#show
                                 PATCH  /scorecards/:id(.:format)                                        scorecards#update
                                 PUT    /scorecards/:id(.:format)                                        scorecards#update
                                 DELETE /scorecards/:id(.:format)                                        scorecards#destroy
                            root GET    /                                                                home#index