ThirtyDayList::Application.routes.draw do
  devise_for :users

  root :to => 'public#home_page'

end
