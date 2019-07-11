Rails.application.routes.draw do
  get 'dashboard', to: "users#dashboard" #, as: :dashboard
  get '/users/:id', to: "users#show"

  post "users/edit", to: "users#update"

  devise_for :users,
             path: '',
             path_names: { sign_up: 'register', sign_in: 'login', edit: 'profile', sign_out: 'logout' },
             controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }
  get 'pages/home'
  root to: "users#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
