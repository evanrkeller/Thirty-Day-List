class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_primary_tab = 'Home'
  end

  private

  expose(:my_items) { Item.where(:user_id => current_user.id).order('items.created_at DESC') }
end
