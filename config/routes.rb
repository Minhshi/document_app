Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  # root to: 'pages#home'
  resources :messages do

    resources :message_attachments, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
