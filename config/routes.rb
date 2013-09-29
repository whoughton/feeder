Feeder::Application.routes.draw do
	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'overview#index'

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products
	
	resources :users

	scope "/:user_id", module: "current_user" do
		resources :feeds, as: 'individual_feeds'
		resources :entries, as: 'individual_entries'
		
		get ":feed_id/entries", to: 'feeds#entries', as: 'individual_feed_entries'
	end
	
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


#== Route Map
# Generated on 28 Sep 2013 18:41
#
#                    root GET    /                                    overview#index
#                   users GET    /users(.:format)                     users#index
#                         POST   /users(.:format)                     users#create
#                new_user GET    /users/new(.:format)                 users#new
#               edit_user GET    /users/:id/edit(.:format)            users#edit
#                    user GET    /users/:id(.:format)                 users#show
#                         PATCH  /users/:id(.:format)                 users#update
#                         PUT    /users/:id(.:format)                 users#update
#                         DELETE /users/:id(.:format)                 users#destroy
#        individual_feeds GET    /:user_id/feeds(.:format)            current_user/feeds#index
#                         POST   /:user_id/feeds(.:format)            current_user/feeds#create
#     new_individual_feed GET    /:user_id/feeds/new(.:format)        current_user/feeds#new
#    edit_individual_feed GET    /:user_id/feeds/:id/edit(.:format)   current_user/feeds#edit
#         individual_feed GET    /:user_id/feeds/:id(.:format)        current_user/feeds#show
#                         PATCH  /:user_id/feeds/:id(.:format)        current_user/feeds#update
#                         PUT    /:user_id/feeds/:id(.:format)        current_user/feeds#update
#                         DELETE /:user_id/feeds/:id(.:format)        current_user/feeds#destroy
#      individual_entries GET    /:user_id/entries(.:format)          current_user/entries#index
#                         POST   /:user_id/entries(.:format)          current_user/entries#create
#    new_individual_entry GET    /:user_id/entries/new(.:format)      current_user/entries#new
#   edit_individual_entry GET    /:user_id/entries/:id/edit(.:format) current_user/entries#edit
#        individual_entry GET    /:user_id/entries/:id(.:format)      current_user/entries#show
#                         PATCH  /:user_id/entries/:id(.:format)      current_user/entries#update
#                         PUT    /:user_id/entries/:id(.:format)      current_user/entries#update
#                         DELETE /:user_id/entries/:id(.:format)      current_user/entries#destroy
# individual_feed_entries GET    /:user_id/:feed_id/entries(.:format) current_user/feeds#entries
