class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
  end

  def edit
  end

  def show
  end

  
end

private
def item_params
  params.require(:item).permit(:item_name, :introduction, :price, :item_condition_id, :postage_memu_id, :preparation_day_id, :sipping_area_id, :category_id).merge(user_id: current_user.id)
end