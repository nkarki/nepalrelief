Rails.application.routes.draw do
  
  resources :how_tos

  devise_for :users
  authenticated :user do
    resources :news, only: [:new, :create, :edit, :update, :destroy]
    resources :dashboard, only: [:new, :create, :edit, :update, :destroy]
    resources :users, only: [:new, :create, :edit, :update, :destroy]
    resources :items, only: [:new, :create, :edit, :update, :destroy]
    resources :organizations, only: [:new, :create, :edit, :update, :destroy]
    resources :sites, only: [:new, :create, :edit, :update, :destroy]
    resources :contact_people, only: [:new, :create, :edit, :update, :destroy]
    resources :needed_items, only: [:new, :create, :edit, :update, :destroy]
    resources :volunteers, only: [:new, :create, :edit, :update, :destroy]
  end

  resources :volunteers, only: [:index, :show]
  resources :news, only: [:index, :show]
  resources :dashboard, only: [:index, :show]
  resources :users, only: [:index, :show]
  resources :items, only: [:index, :show]
  resources :organizations, only: [:index, :show]
  resources :sites, only: [:index, :show]
  resources :contact_people, only: [:index, :show]
  resources :needed_items, only: [:index, :show]


  root "dashboard#index"

  resources :users, path: "user" do
    collection do
      get "inactive"
      post "activate"
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
