Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users,
              controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root 'publics#home'
  
  get 'catalog',      to: 'publics#catalog',        as: 'catalog'
  get 'single_post',  to: 'publics#single_post',    as: 'single_post'
  get 'about_us',     to: 'publics#about_us',       as: 'about_us'
  get 'forum_diskusi',to: 'publics#forum_diskusi',  as: 'forum_diskusi'
  get 'contact',      to: 'publics#contact',        as: 'contact'
  get 'questions',    to: 'publics#questions',      as: 'questions'
  get 'sign_in',      to: 'publics#sign_in',        as: 'sign_in'
  get 'sign_up',      to: 'publics#sign_up',        as: 'sign_up'

  namespace :backend do
    get '/', to: 'home#index'
    # devise_for :admins, :controllers => { sessions: "backend/admins/sessions" }
    
    resources :categories
    resources :galleries
    resources :provinces
    resources :products
    resources :addresses
    resources :profiles
  end
  
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
