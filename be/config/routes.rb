Rails.application.routes.draw do
  resources :users do
    resources :tweets
  end
  get '/signup', to: 'users#new'
end
