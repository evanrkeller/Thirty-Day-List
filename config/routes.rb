ThirtyDayList::Application.routes.draw do
  devise_for :users

  resources :items, :only => [:index, :new, :create]

  get 'privacy_policy' => 'public#privacy_policy', :as => :privacy_policy
  root :to => 'items#index'

end
