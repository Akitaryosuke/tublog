Rails.application.routes.draw do

 # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


#ホーム画面
root to: "public/homes#top"
get 'search' => 'homes#search'
  namespace :public do
    resources :customers, only: [:index, :show, :edit, :update, :destroy] do
      member do
        get :favorites
        get :shares
        get :follows
      end
      resource :relationships, only: [:create, :destroy]
      get 'followings', on: :member
      get 'followers', on: :member
    end
    resources :posts, only: [:new, :show, :edit, :create, :update, :destroy] do
      collection do
        get "search"
      end
      member do
        get :lists
      end
      resource :favorites, only: [:create, :destroy]
      resource :shares, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
    resources :post_details, only: [:new, :show, :destroy]
  end
end
