Rails.application.routes.draw do
  namespace :hooks do
    post 'stripe/events'
  end
  resources :payments
  resources :articles

  get ".well-known/apple-developer-merchantid-domain-association" => "verifications#apple"
  root to: "root#index"
end
