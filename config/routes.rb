Rails.application.routes.draw do
  root 'static_pages#roster'
  get 'sign_in', to: 'static_pages#sign_in', as: 'sign_in'
  get '/auth/teamsnap/callback', to: 'sessions#create'
  get '/signout', to: 'sessions#destroy', as: 'signout'
end
