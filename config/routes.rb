Rails.application.routes.draw do
  resources :test_passages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: [:index, :show] do
    resources :questions, except: [:index, :show], shallow: true
  end
end
