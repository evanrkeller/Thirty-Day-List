ThirtyDayList::Application.routes.draw do
  devise_for :users

  resources :item, :only => [:index]

  get 'privacy_policy' => 'public#privacy_policy', :as => :privacy_policy
  root :to => 'items#index'

end
