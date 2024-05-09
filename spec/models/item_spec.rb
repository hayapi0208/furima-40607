require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '必要な情報９項目が適切に入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない場合' do
      it 'imagが入力されていないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'itemが入力されていないと出品できない' do
        @item.item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")
      end
      it 'item_commentが入力されていないと出品できない' do
        @item.item_comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item comment can't be blank")
      end
      it 'item_category_idが入力されていないと出品できない' do
        @item.item_category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it 'item_condition_idが入力されていないと出品できない' do
        @item.item_condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it 'delivery_charge_idが入力されていないと出品できない' do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it 'prefecture_idが入力されていないと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'delivery_tame_idが入力されていないと出品できない' do
        @item.delivery_tame_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery tame can't be blank")
      end
      it 'priceが入力されていないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは半角数値以外が入力されていると出品できない' do
        @item.price = '１２３４５６'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'priceは¥299以下では出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceは¥10,000,000以上では出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
