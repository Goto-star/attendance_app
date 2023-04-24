Rails.application.routes.draw do
  root 'static_pages#top'
  resources :attendances
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
