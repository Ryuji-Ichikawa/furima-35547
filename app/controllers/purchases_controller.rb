class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
  end

  def create
    @purchase = Purchase.create(purchase_params)
    Address.create(address_params)
    redirect_to root_path
  end

  private

  def purchase_params
    params.permit(:price).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name).merge(purchase_id: @purchase.id)
  end
end