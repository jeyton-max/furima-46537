require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "email、password、password_comfirmation、nickname、last_name、first_name、last_name_kana、first_name_kana、birth_dateが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
  end
end
