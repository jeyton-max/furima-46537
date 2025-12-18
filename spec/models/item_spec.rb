require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'image、name、description、price、category_id、condition_id、shipping_fee_id、prefecture_id、shipping_day_idが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
end
