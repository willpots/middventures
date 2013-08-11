Middventures::Application.routes.draw do



  get "pages/index"
  get "/login" => "login#index", :as => "login"
  post "/login" => "login#login"
  match "/register" => "login#register"


  get "/board" => "pages#board", :as => "board"
  get "/author/:id" => "posts#author", :as => "author"
  resources :posts

  
  namespace :api do
    namespace :v1 do
      match "add_article" => "posts#add_article"      
      resources :posts
    end
  end
  root :to => 'pages#index'

end
