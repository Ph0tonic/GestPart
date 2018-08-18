Rails.application.routes.draw do
  resources :storages
  resources :storage_types
  resources :pdf_files
  resources :pieces
  resources :kinds
  resources :compositors
  resources :publishing_houses
  resources :voices
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
