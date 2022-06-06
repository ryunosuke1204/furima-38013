class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :show,:update,:destroy]
  before_action :active_item, only: [:edit,:destroy]

  def index
     @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show

  end

  def edit
    if @item.user_id == current_user.id || @item.purchase_management != nil
    else
      redirect_to root_path
    end
  end

def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
end

def destroy
    @item.destroy
    redirect_to action: :index
end

  private

  def item_params
    params.require(:item).permit(:item_name, :introduction, :price, :item_condition_id, :postage_memu_id, :preparation_day_id,
                                 :sipping_area_id, :category_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def active_item
    unless current_user.id == @item.user_id
      redirect_to root_path 
   end
  end

end
