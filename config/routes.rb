HotelProjet::Application.routes.draw do\
  root to: 'chambres#index'

  match '/home',  to: 'chambres#index'

  match '/list_jungle' => 'chambres#list_jungle', :as => 'list_jungle'
  match '/list_mer' => 'chambres#list_mer', :as => 'list_mer'

  match '/list_all' => 'chambres#list_all', :as => 'list_all'
  match '/list_simple' => 'chambres#list_simple', :as => 'list_simple'
  match '/list_double' => 'chambres#list_double', :as => 'list_double'
  match '/list_executive' => 'chambres#list_executive', :as => 'list_executive'
  match '/list_presidentielle' => 'chambres#list_presidentielle', :as => 'list_presidentielle'

  devise_for :users

  # admin_chambres GET    /admin/chambres(.:format)               admin/chambres#index
  # POST   /admin/chambres(.:format)               admin/chambres#create
  # new_admin_chambre GET    /admin/chambres/new(.:format)           admin/chambres#new
  # edit_admin_chambre GET    /admin/chambres/:id/edit(.:format)      admin/chambres#edit
  # admin_chambre GET    /admin/chambres/:id(.:format)           admin/chambres#show
  # PUT    /admin/chambres/:id(.:format)           admin/chambres#update
  # DELETE /admin/chambres/:id(.:format)           admin/chambres#destroy
  # admin_reservations GET    /admin/reservations(.:format)           admin/reservations#index
  # POST   /admin/reservations(.:format)           admin/reservations#create
  # new_admin_reservation GET    /admin/reservations/new(.:format)       admin/reservations#new
  # edit_admin_reservation GET    /admin/reservations/:id/edit(.:format)  admin/reservations#edit
  # admin_reservation GET    /admin/reservations/:id(.:format)       admin/reservations#show
  # PUT    /admin/reservations/:id(.:format)       admin/reservations#update
  # DELETE /admin/reservations/:id(.:format)       admin/reservations#destroy

  namespace :admin do
    resources :users
    resources :chambres 
    resources :reservations
  end

  resources :chambres, only: [:show]
  resources :reservations, only: [:show, :new, :create]
  resources :users, only: [:show]

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  get '/show_filtered_room', to: 'reservations#show_filtered_room' 

  # resources :reservations do
  #   collection do
  #     get 'show_filtered_room'
  #   end
  # end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #match '/profile/:id' => 'users#show', :as => :profile
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
end
