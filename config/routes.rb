Rails.application.routes.draw do
  resources :transactions
  resources :invoice_items
  resources :items
  resources :merchants
  resources :invoices
  resources :customers


  namespace :admin do
    resources :invoices, only: %i[index show update]
  end 

  get '/merchants/:id/dashboard', to: 'merchants#dashboard'
  get '/merchants/:id/items', to: 'merchant#items_index'

end
