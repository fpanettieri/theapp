Theapp::Application.routes.draw do
  devise_for :users, path: 'u', path_names: {sign_in: 'login', sign_out: 'logout'}
  
  get 'c/:name/map' => 'communities#map'
  get 'c/:name/list' => 'communities#list'
  get 'c/:name/feed' => 'communities#feed'
  
  resources :community, path: 'c'
  resources :categories, path: 'x'
  resources :topics, path: 't'
  resources :locations, path: 'l'
  resources :comments, path: 'r'
  
  root 'communities#map' 
end
