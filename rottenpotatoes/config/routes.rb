Rottenpotatoes::Application.routes.draw do
  get '/movies/find_by_director', to: 'movies#find_by_director'
  resources :movies
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
  
end
