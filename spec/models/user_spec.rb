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

    context '新規登録できない場合' do
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "birth_dateが空では登録できない" do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it "passwordとpassword_comfirmationの値が一致しないと登録できない" do
        @user.password = "a123456"
        @user.password_confirmation = "a123457"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが6文字以上でなければ登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordの値が半角英数字混合でなければ登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password 半角英数字を混合で入力してください")
      end

      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailが'@を含んでいないと登録できない" do
        @user.email = "testmail"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.last_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない" do
        @user.first_name = "taro"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角（漢字・ひらがな・カタカナ）で入力してください")
      end

      it "last_name_kanaが全角カタカナ以外では登録できないでは登録できない" do
        @user.last_name_kana = "鈴木"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナで入力してください")
      end

      it "first_name_kanaが全角カタカナ以外では登録できないでは登録できない" do
        @user.first_name_kana = "一郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナで入力してください")
      end
      
    end
  end
end
