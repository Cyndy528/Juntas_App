Rails.application.routes.draw do

  resources :paperclip_images

  root to: 'welcome#index'
  
  resources :users, except: [:new]
  resources :sessions, only: [:create]
  resources :interests, only: [:show]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create' 
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/signup', to: 'users#new', as:'signup'
  get '/interests', to: 'interests#show', as:'interests'


end


       # welcome_index GET    /welcome/index(.:format)             welcome#index
       #          root GET    /                                    welcome#index
       #         users GET    /users(.:format)                     users#index
       #               POST   /users(.:format)                     users#create
       #     edit_user GET    /users/:id/edit(.:format)            users#edit
       #          user GET    /users/:id(.:format)                 users#show
       #               PATCH  /users/:id(.:format)                 users#update
       #               PUT    /users/:id(.:format)                 users#update
       #               DELETE /users/:id(.:format)                 users#destroy
       #      sessions POST   /sessions(.:format)                  sessions#create
       #         login GET    /login(.:format)                     session#new
       #               POST   /login(.:format)                     session#create
       #        logout GET    /logout(.:format)                    sessions#destroy
       #        signup GET    /signup(.:format)                    users#new
