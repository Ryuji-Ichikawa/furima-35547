class PurchasesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item_id, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    binding.pry
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number, :item_id).merge(user_id: current_user.id,price: @item.price,token: params[:token])
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

end