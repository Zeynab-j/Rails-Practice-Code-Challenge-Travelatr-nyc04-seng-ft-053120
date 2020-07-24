Rails.application.routes.draw do
  get 'posts/index'

  get 'destinations/index'

  root 'bloggers#index'
  resources :bloggers, only: [:index, :show]
  resources :posts do
    member do
      get 'like'
    end
  end
  resources :destinations, only: [:index, :show]
end
