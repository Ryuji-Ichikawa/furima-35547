class PurchaseAddress

  include ActiveModel::Model
  attr_accessor :price, :user_id, :prefecture_id, :postal_code, :city, :addresse, :building
  with_options presence: true do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                                      message: 'is invalid' }
    validates :user_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "is invalid"}

  def save
    purchase = Purchase.create(price: price, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, building: building, purchase_id: purchase.id)
  end
end