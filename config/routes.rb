Rails.application.routes.draw do
  devise_for :admins

  root to: "pages#index"
  get 'pages' => 'pages#index'

  resources :clients do
    member do
      resources :tasks do
        member do
          post 'match'
        end
      end
    end
  end
  resources :volunteers do
    member do
      get 'available'
      get 'unavailable'
    end
  end
  resources :texts do
    member do
      post 'volunteer'
    end
  end

  post 'snow' => 'texts#snow_text'
  get 'settings' => 'settings#index'
  get 'settings/emails/list' => 'settings#email', as: 'email_list_settings'
  get 'match/:id' => 'match_task_volunteers#match', as: 'match'
  post 'match_one_volunteer/:id/:volunteer' => 'tasks#match_one_volunteer', as: 'match_one_volunteer'
  # get 'admins' => 'admins#index'
  resources :admins

  put 'client_called/:id' => 'tasks#client_called', as: 'client_called'

  put 'task_completed/:id' => 'tasks#task_completed', as: 'task_completed'


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
