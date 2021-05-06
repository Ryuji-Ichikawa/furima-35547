class Item < ApplicationRecord
  
  include ActiveHash::Associations
  has_many :articles
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A[¥]?3[0-9]{2}|[¥]?[0-9]{7}+\z/}
    validates :category_id
    validates :status_id
    validates :sipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  
end
