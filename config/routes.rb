Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :highlights, except: :new

  post '/highlights/ocr', to: 'highlights#ocr'

  resources :books
end
