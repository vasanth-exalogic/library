Rails.application.routes.draw do
  root "home#index", as: "home"
  resources :records, except: [:new]
  get '/records/new/:id' => "records#new", as: "new_record"
  resources :books
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
end