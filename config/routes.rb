# frozen_string_literal: true

Rails.application.routes.draw do
  resources :animal_requests
  resources :post, shallow: true do
    resources :reports
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Reviews
  # CREATE
  post 'reviews/new', to: 'reviews#new', as: 'reviews_new'
  post 'reviews', to: 'reviews#create'
  # READ
  get 'reviews', to: 'reviews#index', as: 'reviews_index'
  get 'reviews/show/:id', to: 'reviews#show', as: 'reviews_show'
  get 'reviews/reviews_page'

  # UPDATE
  get 'reviews/:id/edit', to: 'reviews#edit', as: 'reviews_edit'
  patch 'reviews/:id', to: 'reviews#update', as: 'reviews_update'

  # DELETE
  delete 'reviews/:id', to: 'reviews#delete', as: 'reviews_delete'

  resources :requests
  post 'requests/change_state'

  get 'chats/show'
  get 'chats/change_active_chat'
  devise_for :users, controllers: { registrations: :registrations }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get 'home/my_account'
  get 'home/profile_page'
  resources :messages
  mount ActionCable.server => '/cable'

  ## POSTS
  # CREATE
  get 'posts/new', to: 'posts#new', as: 'posts_new'
  post 'posts', to: 'posts#create'

  # READ
  get 'posts', to: 'posts#index', as: 'posts_index'
  get 'posts/:id', to: 'posts#show', as: 'posts_show'

  # UPDATE
  get 'posts/:id/edit', to: 'posts#edit', as: 'posts_edit'
  patch 'posts/:id', to: 'posts#update', as: 'posts_update'

  # DELETE
  delete 'posts/:id', to: 'posts#delete', as: 'posts_delete'

  # SEARCH
  post 'posts/search'
  post 'posts/find_by_category'
  post 'posts/find_by_type'
  post 'posts/find_by_price'

  ## COMMENTS
  # CREATE
  get 'comments/new', to: 'comments#new', as: 'comments_new'
  post 'comments', to: 'comments#create'

  # READ
  get 'comments', to: 'comments#index', as: 'comments_index'
  get 'comments/:id', to: 'comments#show', as: 'comments_show'

  # UPDATE
  get 'comments/:id/edit', to: 'comments#edit', as: 'comments_edit'
  patch 'comments/:id', to: 'comments#update', as: 'comments_update'

  # DELETE
  delete 'comments/:id', to: 'comments#delete', as: 'comments_delete'

  get 'tinder/home'
end
