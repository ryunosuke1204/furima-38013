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
