Rails.application.routes.draw do
  resources :people, :staff

  root 'welcome#index'
end
