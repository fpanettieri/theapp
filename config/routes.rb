Exodia::Application.routes.draw do
  devise_for :users, path: 'u', path_names: {sign_in: 'login', sign_out: 'logout'}
  resources :community, path: '/c/:name'
  resources :categories, path: 'x'
  resources :topics, path: 't'
  resources :locations, path: 'l'
  resources :comments, path: 'r'
  
  root 'categories#bitcoin' 
end
