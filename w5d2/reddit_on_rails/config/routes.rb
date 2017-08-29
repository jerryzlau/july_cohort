Rails.application.routes.draw do
  resources :users
  resource :session
  resources :subs, except: [:destroy]
  resources :posts, except: [:index, :upvote, :downvote] do
    member do
      post 'upvote'
      post 'downvote'
    end
    resources :comments, only:[:new]
  end
  
  resources :comments, only:[:create, :show] do
    member do
      post 'upvote'
      post 'downvote'
    end
  end

end
