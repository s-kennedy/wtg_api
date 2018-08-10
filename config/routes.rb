Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  get '/search', to: 'wiki#search'
  get '/preview', to: 'wiki#preview'

  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users, except: [:index] do
    resources :guides do
      resources :articles, only: [:destroy]
    end
  end
end
