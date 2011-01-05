class ApplicationController < ActionController::Base

  layout 'public'

  protect_from_forgery

  protected

  expose(:title) { @title || '30daylist.com' }
  expose(:current_primary_tab) { @current_primary_tab || controller_name }

end
