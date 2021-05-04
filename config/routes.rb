Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  
  scope '/users' do
    get '/events/:id', to: 'events#user_events', as: :user_events
    get '/events/:event_id/timeslots/:id', to: 'timeslots#show', as: :event_timeslot
  end
  resources :welcome, only: [:index]
  resources :events, only: [:index, :show]
end
