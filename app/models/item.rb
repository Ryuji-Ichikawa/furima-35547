class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_fee
  belongs_to :scheduled_delivery

  with_options presence: true do
    validates :image
    validates :name
    validates :info
    validates :price, format: { with: /\A3[0-9]{2}|[0-9]{7}+\z/}
  end

  validates :category_id, numericality: { other_than: 1 } 
  validates :status_id, numericality: { other_than: 1 } 
  validates :shipping_fee_id, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 1 } 
  validates :scheduled_delivery_id, numericality: { other_than: 1 } 
  
end
