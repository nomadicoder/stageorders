Stageorders::Application.routes.draw do
  devise_for :users

  get "admin/login"

  get "admin/logout"

  get "admin/index"

  resources :users

  resources :blogs

  get "status/index"

  get "status/refresh"

  resources :status

  get "stage_statuses/index"

  get "stage_statuses/refresh"

  resources :stage_statuses

  resources :stage_status_codes

  resources :support_units

  resources :support_status_codes

  resources :support_types

  get "results/index"

  get "results/refresh"

  resources :results

  resources :runners

  resources :runner_status_codes

  resources :teams

  resources :stages

  match '/results/change_team' => 'results#change_team'
  match '/results/refresh' => 'results#refresh'
  match '/status/change_team' => 'status#change_team'
  match '/status/refresh' => 'status#refresh'
  match '/stage_statuses/change_team' => 'stage_statuses#change_team'
  match '/stage_statuses/refresh' => 'stage_statuses#refresh'
  match '/stage_statuses/update_results' => 'stage_statuses#update_results'
  match '/stage_statuses/update_blog' => 'stage_statuses#update_blog'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'product/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'

  root :to => "home#index"

end
