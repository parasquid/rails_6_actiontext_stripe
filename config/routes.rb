Rails.application.routes.draw do
  resources :payments
  resources :articles

  get ".well-known/apple-developer-merchantid-domain-association" => "verifications#apple"
  root to: "root#index"
end
