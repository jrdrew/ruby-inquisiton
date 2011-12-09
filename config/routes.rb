Inquisition::Application.routes.draw do
  resources :questions do
    resources :replies
  end

  get "home/index"

  devise_for :users

  root :to => "questions#index"
  
  match "/questions/users/:user_id" => "questions#users", :as => :questions_users
  
  match "/questions/tags/:tag_prefix" => "questions#tags_prefix_search", :as => :questions_tags
end
