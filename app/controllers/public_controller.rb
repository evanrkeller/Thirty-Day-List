class PublicController < ApplicationController

  def home_page
    @current_primary_tab = 'Home'
  end

  protected

  expose(:current_primary_tab) { @current_primary_tab }
end
