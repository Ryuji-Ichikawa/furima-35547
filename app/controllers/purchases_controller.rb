class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      redirect_to item_purchases_path
    end
  
  end

  private
  def purchase_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id)
  end

end