Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      resources :publications
      resources :categories
      resources :sessions, only: %i[create destroy]
    end
  end
end
