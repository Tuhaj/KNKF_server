KNKF::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  namespace :api do
    namespace :v1 do
      resources :meetings, :readings
    end
  end

  resources :readings do
    post "vote"
    post "unvote"
    resources :notes, :only => [:new, :create, :index] do
      member do
        get "oauth_callback"
      end
    end
  end
  resources :meetings do
    post "add_me"
    delete "remove_me"
    post "end_voting"
    collection do
      get "my" => "meetings#index", :my => true
    end
  end

  get "home/index"
  get "user/edit"
  get "home/about_us"
  get "messages/new"
  post "messages/create"
#these are for evernote:
  resources :evernote
  get '/auth/evernote/callback' => 'login#callback'
  get '/logout' => 'login#logout', :as => 'logout'
  get '/oauth_failure' => 'login#oauth_failure'

  devise_for :users
  devise_for :admins, path: :moderators
  root :to => "home#index"
end
