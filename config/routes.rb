Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create

  resource :session, only: :create

  resources :tests, only: [:index, :show] do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end

    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
  end
end
