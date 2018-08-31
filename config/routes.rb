Rails.application.routes.draw do
  resources :storages
  resources :storage_types
  resources :pdf_files
  resources :pieces do
    member do
      post 'add_file'
      post 'config_file'
    end
  end
  resources :genres
  resources :compositors
  resources :publishing_houses
  resources :voices

  resources :pdf_voices do
    member do
      get 'download'
    end
  end

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
