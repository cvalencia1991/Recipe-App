Rails.application.routes.draw do
  root 'public_recipe#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users, only: %i[index] do
    resources :recipes do
      resources :recipe_foods, only: %i[index new create]
      resources :foods, only: %i[index show new create edit update destroy]
      resources :shopinglists, only: %i[index new create]
    end
  end
end
