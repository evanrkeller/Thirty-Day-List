class ItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @current_primary_tab = 'Home'
  end

  def create
    item[:user_id] = current_user.id
    if item.save
      flash[:notice] = "#{item.name} was added to your list."
      redirect_to root_path
    else
      render :action => "new"
    end

  end

  private

  expose(:my_items) { Item.where(:user_id => current_user.id).order('items.created_at DESC') }
  expose(:item)

end
