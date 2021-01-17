Rails.application.routes.draw do

  resources :static_pages
  get 'search', to: 'static_pages#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#search'
end
