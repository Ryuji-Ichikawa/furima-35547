class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :price, :user_id, :postal_code, :prefecture_id, :city, :addresse, :building, :phone_number
  
  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'is invalid' }
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is invalid"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "is invalid"}

  def save
    purchase = Purchase.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end