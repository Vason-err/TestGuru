Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end
end
