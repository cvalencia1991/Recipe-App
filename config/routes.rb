Rails.application.routes.draw do
  root 'public_recipe#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  resources :users do
    resources :recipes do
      resources :foods do
        resources :recipe_foods
      end
      resources :general_shoping_list
    end
  end
end
