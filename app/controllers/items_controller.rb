class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :item_category_id, :item_condition_id, 
                                 :item_postage_id, :prefecture_id, :item_shipping_time_id, :price, :image)
          .merge(user_id: current_user.id)
  end
  
end
