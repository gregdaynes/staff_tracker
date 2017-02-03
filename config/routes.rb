Rails.application.routes.draw do
  resources :staff_members

  root 'welcome#index'
end
