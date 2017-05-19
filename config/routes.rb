Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"

  resources :cocktails do
    resources :doses, only: [ :new, :create ]
  end

  resources :doses, only: [ :destroy ]

  root to: "cocktails#index"
end
