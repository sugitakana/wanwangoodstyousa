Rails.application.routes.draw do
  
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  namespace :admin do
  end

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }
  devise_scope :public do
    post 'customers/guest_sign_in', to: 'customers/sessions#guest_sign_in'
  end
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    get '/customers/confirm_withdraw' => 'customers#confirm_withdraw', as: 'confirm_withdraw'
    patch '/customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    resources :customers, only:[:show, :edit, :update]
    resources :reviews
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
