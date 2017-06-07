Rails.application.routes.draw do
  root 'students#home'

  resources :students
  get 'colleges/search', to: 'colleges#search'
  post 'colleges/search', to: 'colleges#search'
  resources :colleges

  get 'enrollment', to: 'colleges#enrollment'
end
