Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'tests#index'

  devise_for :users,
             controllers: { sessions: 'users/sessions' },
             path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }


  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: [:show, :update] do
    get :result, on: :member
  end

  resources :gists, only: :create

  get '/badges/(:filter)' => 'badges#index', as: :badges

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end

    resources :gists, only: :index

    resources :badges
  end
end
