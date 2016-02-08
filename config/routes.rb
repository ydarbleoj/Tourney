Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }
  # get ':username', to: 'users#show', as: :user
  resources :users, only: [:index, :show, :edit, :update]
  resources :courses
  resources :rounds
  resources :tournaments do
    collection do
      get 'history'
    end
  end
  root to: "home#index"
end

__END__
    new_user_session GET    /users/sign_in(.:format)       devise/sessions#new
        user_session POST   /users/sign_in(.:format)       devise/sessions#create
destroy_user_session DELETE /users/sign_out(.:format)      devise/sessions#destroy
       user_password POST   /users/password(.:format)      devise/passwords#create
   new_user_password GET    /users/password/new(.:format)  devise/passwords#new
  edit_user_password GET    /users/password/edit(.:format) devise/passwords#edit
                     PATCH  /users/password(.:format)      devise/passwords#update
                     PUT    /users/password(.:format)      devise/passwords#update
               users GET    /users(.:format)               users#index
                     POST   /users(.:format)               users#create
            new_user GET    /users/new(.:format)           users#new
           edit_user GET    /users/:id/edit(.:format)      users#edit
                user GET    /users/:id(.:format)           users#show
                     PATCH  /users/:id(.:format)           users#update
                     PUT    /users/:id(.:format)           users#update
                     DELETE /users/:id(.:format)           users#destroy
             courses GET    /courses(.:format)             courses#index
                     POST   /courses(.:format)             courses#create
          new_course GET    /courses/new(.:format)         courses#new
         edit_course GET    /courses/:id/edit(.:format)    courses#edit
              course GET    /courses/:id(.:format)         courses#show
                     PATCH  /courses/:id(.:format)         courses#update
                     PUT    /courses/:id(.:format)         courses#update
                     DELETE /courses/:id(.:format)         courses#destroy
              rounds GET    /rounds(.:format)              rounds#index
                     POST   /rounds(.:format)              rounds#create
           new_round GET    /rounds/new(.:format)          rounds#new
          edit_round GET    /rounds/:id/edit(.:format)     rounds#edit
               round GET    /rounds/:id(.:format)          rounds#show
                     PATCH  /rounds/:id(.:format)          rounds#update
                     PUT    /rounds/:id(.:format)          rounds#update
                     DELETE /rounds/:id(.:format)          rounds#destroy
         tournaments GET    /tournaments(.:format)          tournaments#index
                     POST   /tournaments(.:format)          tournaments#create
      new_tournament GET    /tournaments/new(.:format)      tournaments#new
     edit_tournament GET    /tournaments/:id/edit(.:format) tournaments#edit
          tournament GET    /tournaments/:id(.:format)      tournaments#show
                     PATCH  /tournaments/:id(.:format)      tournaments#update
                     PUT    /tournaments/:id(.:format)      tournaments#update
                     DELETE /tournaments/:id(.:format)      tournaments#destroy
                root GET    /                              home#index