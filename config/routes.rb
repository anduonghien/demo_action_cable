Rails.application.routes.draw do
  
  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do
    resources :messages, only: :create
  end
  root to: 'home#index'

  resources :chat, only: :index
end
