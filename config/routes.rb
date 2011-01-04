ThirtyDayList::Application.routes.draw do
  devise_for :users

  get 'privacy_policy' => 'public#privacy_policy', :as => :privacy_policy
  root :to => 'public#home_page'

end
