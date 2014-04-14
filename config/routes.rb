StackDunk::Application.routes.draw do

  root to: 'questions#index'

  devise_for :users
  resources :answers
  resources :questions do
    resources :answers
  end

end
