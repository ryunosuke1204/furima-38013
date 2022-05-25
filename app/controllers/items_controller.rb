class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
    item = Itme.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Itme.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  
end

private
def item_params
  params.require(:item).permit(:nickname,:email,:password,:last_name,:first_name,:last_name_kana,:first_name_kana,:birth_day).merge(user_id: current_user.id)
end