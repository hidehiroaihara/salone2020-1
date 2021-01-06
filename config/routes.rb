Rails.application.routes.draw do
  # devise_for :users, controllers: {
  #   omniauth_callbacks: 'users/omniauth_callbacks'}
  # get 'reservations/index'
  # get 'reservations/show'
  # get 'reservations/edit'
  # resources :reservations
  # resources :user, only: [:index, :edit, :show, :update]
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
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
    # get 'admins/regular_holiday' => 'admins/salon_details#new_regular'
    # post 'admins/regular_holiday' => 'admins/salon_details#create_regular'
    # get 'admins/spcial_holiday' => 'admins/salon_details#new_spcial'
    # post 'admins/spcial_holiday' => 'admins/salon_details#create_spcial'
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
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get 'user_details', to: 'users/registrations#new_detail'
    post 'user_details', to: 'users/registrations#create_detail'
    get "times", to: 'users/reservations#new_time'
  end
  
  namespace :users do
    resources :stylists
    resources :reservations do
      collection do 
        get :confirm
      end
      member do
        get :edit_menu
        get :edit_confirm
        patch :update_menu
      end
    end
    resources :users
   
  end
  namespace :admins do
    resources :users do
      resources :user_options
    end 
    resources :reservations
    resources :stylists 
    resources :menus
    resources :salons do
      resources :salon_details do
        collection do
          get :new_regular
          post :create_regular
          get :new_spcial
          post :create_spcial
        end
      end
      resources :shifts
    end
      resources :spcial_holidays
  end
  root to: "users/users#index"
end
