Rails.application.routes.draw do
  resources :users
  resource :session
  resources :subs, except: [:destroy]
  resources :posts, except: [:index] do
    resources :comments, only:[:new]
  end
  resources :comments, only:[:create, :show]

end
