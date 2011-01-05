class ApplicationController < ActionController::Base

  layout 'public'

  protect_from_forgery

  protected

  expose(:title) { @title || '30daylist.com' }
  expose(:current_primary_tab) { '' }

end
