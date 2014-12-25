Rails.application.routes.draw do
  resources :flash_cards
  resources :translation_cards, :controller => :flash_cards, defaults: {type: TranslationCard.name}
  resources :original_cards, :controller => :flash_cards,  defaults: {type: OriginalCard.name}

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'flash_cards#index'
end
