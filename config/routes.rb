Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :publications
      resources :categories
    end
  end
end
