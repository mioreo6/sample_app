Rails.application.routes.draw do

  get 'top' => 'home#top'
  resources :lists
end
