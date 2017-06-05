Rails.application.routes.draw do
  resources :students
  resources :colleges

  root 'students#home'
end
