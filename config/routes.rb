Rails.application.routes.draw do
  resources :user, only: [:index, :edit, :show, :update]
  # devise_for :users
  # devise_for :admins
  # devise_for :admins, controllers: {
  #   confirmaions: 'admin/sessions'
  # }
  # devise_for :admins, controllers: {
  #   sessions: 'admins/sessions'
  # }
  devise_for :admins , skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#cereate', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#delete', as: 'destroy_admin_session'
    # get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
    # post 'admins' => 'admins/registrations#create', as: 'admin_registration'
    # get 'admins/cancel' => 'admins/registrations#cancel', as: 'cancel_admin_registration'
    # get 'admins/edit' => 'admins/registrations#edit', as: 'edit_admin_registration'
    # patch 'admins' => 'admins/registrations#update', as: 'admin_registration'
    # put 'admins' => 'admins/registrations#update', as: 'admin_registration'
    # delete 'admins' => 'admins/registrations#delete', as: 'admin_registration'
  end
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
    get 'users/password/edit' => 'users/passwords#edit', as: 'edit_user_password'        
    patch 'users/password' => 'users/password#update', as: 'user_password' 
    put 'users/password' => 'users/password#update'  
    post 'users/password' => 'users/password#create'         
    get 'users/cancel' => 'users/registrations#cancel', as: 'cancel_user_registration'
    get 'users/edit' => 'users/registrations#edit', as: 'edit_user_registration'
    patch 'users' => 'users/registrations#update'
    put 'users' => 'users/registrations#update'
    delete 'users' => 'users/registrations#delete'
  end
  namespace :users do

  end
  namespace :admins do
    resources :users  
  end
end
