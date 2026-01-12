require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'postcode、city、house_number、user_id、item_id、phone_number、token、prefecture_idが存在すれば購入できる' do
        expect(@order_address).to be_valid
      end

      it 'buildingが空でも購入できる' do
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'postcodeが空では購入できない' do
        @order_address.postcode = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postcode can't be blank")
      end

      it 'cityが空では購入できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end

      it 'house_numberが空では購入できない' do
        @order_address.house_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end

      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では購入できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'prefecture_idが1では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'user_idが空では購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end

      it 'postcodeにハイフンが含まれていないと購入できない' do
        @order_address.postcode = '0123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeが全角の数値だと購入できない' do
        @order_address.postcode = '０１２-３４５６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'postcodeに英字などが含まれていると購入できない' do
        @order_address.postcode = 'O12-3456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postcode is invalid. Include hyphen(-)')
      end

      it 'phone_numberにハイフンが含まれていると購入できない' do
        @order_address.phone_number = '012-3456-7890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが全角の数値だと購入できない' do
        @order_address.phone_number = '０１２３４５６７８９０'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberに英字などが含まれていると購入できない' do
        @order_address.phone_number = 'O1234567890'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが9桁以下の数値では購入できない' do
        @order_address.phone_number = '012345678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'phone_numberが12桁以上の数値では購入できない' do
        @order_address.phone_number = '810123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
