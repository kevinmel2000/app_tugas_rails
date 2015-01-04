Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

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
    resources :users
    resources :categories
    resources :galleries
    resources :provinces
    resources :products
    resources :addresses
    resources :profiles
    resources :web_settings
  end
end
