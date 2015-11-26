LightAdviser::Application.routes.draw do
  resources :mykeys

  resources :keys

  resources :alerts

  devise_for :users
  
  get  "home/index"
  root 'home#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  get 'showdata/:server_hash/:metric_name' => 'home#showdata'  
  get ':key/metric/:server/:metric_name/:data' =>  'home#metric'
  get ':key/:message' => 'home#index'
  get ':status'   => 'home#index'


  get 'delete/alert/:key/:alert_id' => 'home#delete_alert'
  get 'show/alert/:key' => 'home#alert'

  get 'mymetrics' => 'home#mymetrics'  

  

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
