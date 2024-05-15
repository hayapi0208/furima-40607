require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'userが紐づいていないと購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが空だと購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank",
                                                               'Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeにハイフン(-)がないと購入できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが3桁ハイフン(-)4桁でないと購入できない' do
        @order_address.post_code = '1234-567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeに半角英字が入力されていると購入できない' do
        @order_address.post_code = 'asd-fghj'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeに全角が入力されていると購入できない' do
        @order_address.post_code = '１２３-４５６７'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが1(---)だと購入できない' do
        @order_address.prefecture_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空だと購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_addressが空だと購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street address can't be blank")
      end
      it 'telephoneが空だと購入できない' do
        @order_address.telephone = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneに半角英字が入力されていると購入できない' do
        @order_address.telephone = 'asdfghjklow'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is not a number', 'Telephone is invalid')
      end
      it 'telephoneに全角が入力されていると購入できない' do
        @order_address.telephone = '１２３４５６７８９１２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is not a number', 'Telephone is invalid')
      end
      it 'telephoneが9桁以下だと購入できない' do
        @order_address.telephone = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is too short (minimum is 10 characters)')
      end
      it 'telephoneが12桁以上だと購入できない' do
        @order_address.telephone = '123456789123'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Telephone is too long (maximum is 11 characters)')
      end
    end
  end
end
