Rails.application.routes.draw do
  root "home#index", as: "home"
  get '/record/:id/renew' => "home#create", as: "renew_book"

  resources :records, only: [:create, :destroy]
  get '/records/new/:id' => "records#new", as: "new_record"
  get '/records/:id' => "records#show", as: "show_record"
  resources :books

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    delete '/users/:id',  to: 'home#delete', as: "delete_user"
  end
end
