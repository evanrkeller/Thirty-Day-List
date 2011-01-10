ThirtyDayList::Application.routes.draw do
  devise_for :users

  resources :items, :only => [:index, :new, :create]

  get 'privacy_policy' => 'public#privacy_policy', :as => :privacy_policy
  get 'about' => 'public#about', :as => :about

  root :to => 'items#index'

end
