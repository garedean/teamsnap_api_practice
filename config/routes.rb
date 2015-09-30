Rails.application.routes.draw do
  root 'static_pages#roster'

  # Note: teamsnap callback url must be in format, http://localhost:3000/auth/teamsnap/callback
  get '/auth/teamsnap/callback', to: 'sessions#create'
  get 'sign_in',  to: 'static_pages#sign_in', as: 'sign_in'
  get '/signout', to: 'sessions#destroy',     as: 'signout'

  get 'home',         to: 'static_pages#home',         as: 'home'
  get 'roster',       to: 'static_pages#roster',       as: 'roster'
  get 'schedule',     to: 'static_pages#schedule',     as: 'schedule'
  get 'availability', to: 'static_pages#availability', as: 'availability'
  get 'tracking',     to: 'static_pages#tracking',     as: 'tracking'
  get 'payments',     to: 'static_pages#payments',     as: 'payments'
  get 'statistics',   to: 'static_pages#statistics',   as: 'statistics'
  get 'refreshments', to: 'static_pages#refreshments', as: 'refreshments'
  get 'messages',     to: 'static_pages#messages',     as: 'messages'
  get 'preferences',  to: 'static_pages#preferences',  as: 'preferences'
  get 'manager',      to: 'static_pages#manager',      as: 'manager'
end
