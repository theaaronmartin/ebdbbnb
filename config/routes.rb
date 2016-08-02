Rails.application.routes.draw do
  root 'places#index'

  resources :places, shallow: true do
    collection do
      get :search
      get :search_results
    end
    resources :reviews
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
