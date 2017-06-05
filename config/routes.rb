Rails.application.routes.draw do
  resource :students
  root 'students#index'
end
