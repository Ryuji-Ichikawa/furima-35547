class AddUserToItems < ActiveRecord::Migration[6.0]
  def change
    add_column    :items, :price,                 :integer, null: false
    add_column    :items, :category_id,           :integer, null: false
    add_column    :items, :status_id,             :integer, null: false
    add_column    :items, :shippin_fee_id,        :integer, null: false
    add_column    :items, :prefecture_id,         :integer, null: false
    add_column    :items, :scheduled_delivery_id, :integer, null: false
    add_reference :items, :user,  null: false, foreign_key: true
  end
end
