Rails.application.routes.draw do
  
  root 'owners#index'
  # root 'tops#index'

  resources :owners do
    collection do
      get :download
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'users/show'

  resources :plan_pins, only: [:create,:destroy] do
    collection do
      post :create_in_planform
    end
    member do
      delete :destroy_in_planform
    end
  end

  # ドラッグアンドドロップによるプランピン並び替えの登録用
  patch 'plan/:id/sort', to: 'plans#sort'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: "users/registrations"
  }
  # devise_for :users

  # ユーザープロフィール画面は独自に作成する
  resources :users, only: [:show,:edit,:update]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
