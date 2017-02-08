Rails.application.routes.draw do
  resources :users

  resources :staff_members

  root 'welcome#index'
end
