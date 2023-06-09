Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do
    root to: 'homes#top'
    resources :tags, only:[:index, :create, :edit, :update]
    resources :reviews, only:[:show, :destroy]
    resources :customers, only:[:index, :show, :edit, :update]
  end

  devise_for :customer,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    devise_scope :customer do
      post 'guest_sign_in', to: 'sessions#guest_sign_in'
    end
    resources :customers, only:[:show, :edit, :update] do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
      member do
        get 'favorites'
      end
    end
    resources :tags, only:[:show]
    resources :reviews do
      resources :comments, only:[:create, :destroy]
      resource :favorites, only: [:create, :destroy]
        collection do
          get 'search'
        end
      end
    end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
