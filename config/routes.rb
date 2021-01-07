Rails.application.routes.draw do
  devise_for :users
  root to: 'orders#index'
  resources :orders do
    resources :bids
    resource :closure do
      get 'addresses', to: 'closures#new_address'
      post 'addresses', to: 'closures#create_address'
    end
  end

end
