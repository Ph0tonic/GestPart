Rails.application.routes.draw do
  resources :storages
  resources :storage_types
  resources :pdf_files
  resources :pieces do
    member do
      post 'add_file'
      post 'config_file'
      post 'add_genre'
      post 'remove_genre'
      post 'add_author'
      post 'remove_author'
      post 'add_arranger'
      post 'remove_arranger'
    end
  end
  resources :genres
  resources :compositors
  resources :publishing_houses
  resources :voices

  resources :pdf_voices do
    member do
      get 'download'
      post 'send_email'
    end
  end

  root 'static#dashboard'
  # For static pages
  get "/:page" => "static#show"
end
