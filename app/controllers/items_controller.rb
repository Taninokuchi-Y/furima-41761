class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

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
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item), notice: '商品情報が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # def destroy
  # end
  
  private
  
  def item_params
    params.require(:item).permit(:name, :description, :item_category_id, :item_condition_id, 
                                 :item_postage_id, :prefecture_id, :item_shipping_time_id, :price, :image)
          .merge(user_id: current_user.id)
  end

  def correct_user
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to root_path, alert: "他のユーザーの商品は編集できません。"
    end
  end
  
end
