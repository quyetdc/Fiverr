Rails.application.routes.draw do
  get 'gigs/new'
  get 'gigs/create'
  get 'gigs/edit'
  get 'gigs/update'
  get 'gigs/show'
  get 'dashboard', to: "users#dashboard" #, as: :dashboard
  get '/users/:id', to: "users#show", as: :user

  get '/selling_orders', to: "orders#selling_orders"
  get '/buying_orders', to: "orders#buying_orders"

  post "users/edit", to: "users#update"


  put '/orders/:id/complete',  to: "orders#complete", as: 'complete_order'

  devise_for :users,
             path: '',
             path_names: { sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  get 'pages/home'

  root to: "users#dashboard"

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end

    resources :orders, only: [:create] # POST gigs/:gig_id/orders
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
