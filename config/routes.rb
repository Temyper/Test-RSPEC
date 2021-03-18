Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:new, :create, :index, :show, :update, :edit] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  get 'home/about' => 'homes#about'
end