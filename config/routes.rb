Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  ActiveAdmin.routes(self)

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :orders

  resources :addresses, except: [:show]

  resources :items

  resources :pages , only: [] do
    collection do
      get :home, :menu, :dashboard, :edit_menu, :manager_orders
    end
  end





  post "/cart", to: "orders#add_cart"
  post "/remove_item", to: "orders#remove_cart"
  put "/clear_cart", to: "orders#clear_cart"
end
