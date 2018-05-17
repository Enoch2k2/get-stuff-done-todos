Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:show] do
    resources :action_items, except: [:show]
    post '/action_items/:id/complete', to: 'action_items#complete', as: 'action_item_complete'
    post '/action_items/:id/incomplete', to: 'action_items#incomplete', as: 'action_item_incomplete'
  end
end
