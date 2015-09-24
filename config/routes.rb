Rails.application.routes.draw do
  root 'static_pages#home'
  get  'sign_in', to: 'static_pages#sign_in'
end
