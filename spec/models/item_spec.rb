require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/test-image.png')
  end

  describe '出品商品登録' do
    context '商品登録できるとき' do
      it '全項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが300以上であれば登録できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999以下であれば登録できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context '商品登録できないとき' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it 'nameが空だと保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it 'infoが空だと保存できないこと' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Info can't be blank"
      end
      it 'category_idが空だと保存できないこと' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it 'category_idが0(初期値)だと保存できないこと' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category is invalid'
      end
      it 'status_idが空だと保存できないこと' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it 'status_idが0(初期値)だと保存できないこと' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status is invalid'
      end
      it 'shipping_fee_idが空だと保存できないこと' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping fee can't be blank"
      end
      it 'shipping_fee_idが0(初期値)だと保存できないこと' do
        @item.shipping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Shipping fee is invalid'
      end
      it 'prefecture_idが空だと保存できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'prefecture_idが0(初期値)だと保存できないこと' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture is invalid'
      end
      it 'scheduled_delivery_idが空だと保存できないこと' do
        @item.scheduled_delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Scheduled delivery can't be blank"
      end
      it 'scheduled_delivery_idが0(初期値)だと保存できないこと' do
        @item.scheduled_delivery_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include 'Scheduled delivery is invalid'
      end
      it 'priceが空だと保存できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it 'priceが299以下では登録できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが10,000,000以上では登録できないこと' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'priceが全角数字では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is invalid'
      end
      it 'ユーザーが紐付いていなければ登録できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'User must exist'
      end
    end
  end
end
