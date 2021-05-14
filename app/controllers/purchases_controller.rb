class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id, only: [:index, :create]
  before_action :unless_item, only: :index

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], price: @item.price, token: params[:token]
    )
  end

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: purchase_params[:price],
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def unless_item
    redirect_to root_path if @item.user_id == current_user.id
    redirect_to root_path if @item.purchase.present?
  end
end
