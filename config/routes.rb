Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  resources :welcome, only: [:index]
  resources :events, only: [:show]
end
