Rails.application.routes.draw do

  get 'dashboard', to: "users#dashboard" #, as: :dashboard
  get '/users/:id', to: "users#show", as: :user

  get '/selling_orders', to: "orders#selling_orders"
  get '/buying_orders', to: "orders#buying_orders"

  get '/all-requests', to: "requests#list"
  get 'request_offers/:id', to: "requests#offers", as: 'request_offers'
  get '/my_offers', to: "offers#my_offers"

  get '/search', to: "pages#search"

  post "users/edit", to: "users#update"
  put '/orders/:id/complete',  to: "orders#complete", as: 'complete_order'

  post "/offers", to: "offers#create"
  put '/offers/:id/accept', to: 'offers#accept', as: :accept_offer
  put '/offers/:id/reject', to: 'offers#reject', as: :reject_offer

  post '/reviews', to: 'reviews#create'

  post 'users/edit_phone', to: 'users#callback_phone'

  devise_for :users,
             path: '',
             path_names: { sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  get 'pages/home'

  root to: "pages#home"

  resources :gigs do
    member do
      delete :delete_photo
      post :upload_photo
    end

    resources :orders, only: [:create] # POST gigs/:gig_id/orders
  end

  resources :requests

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
