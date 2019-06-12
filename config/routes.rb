Rails.application.routes.draw do
  resources :payments
  resources :articles

  root to: "root#index"
end
