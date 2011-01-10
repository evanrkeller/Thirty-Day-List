class PublicController < ApplicationController

  def home_page
    @current_primary_tab = 'Home'
    if current_user.present?
      render 'item/index'
    end
  end

  def about
    @current_primary_tab = 'About'
  end

  protected

  expose(:current_primary_tab) { @current_primary_tab }
end
