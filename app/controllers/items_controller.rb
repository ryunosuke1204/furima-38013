class ItemsController < ApplicationController
  before_action :authenticate_user!,except: [:index,:show]
  

  def index
    @items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    
  end

  def create
   @item = Item.new(item_params)
    
  if @item.save
    redirect_to action: :index
  else
    render :new
  end
  end

  def edit
  end

  def show
  end


private
def item_params
  params.require(:item).permit(:item_name,:introduction, :price, :item_condition_id, :postage_memu_id, :preparation_day_id, :sipping_area_id, :category_id,:image).merge(user_id: current_user.id)
end

end