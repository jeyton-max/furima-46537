class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birth_date, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: '半角英数字を混合で入力してください' }

  VALID_FULL_WIDTH_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  validates :last_name, format: { with: VALID_FULL_WIDTH_REGEX, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, format: { with: VALID_FULL_WIDTH_REGEX, message: '全角（漢字・ひらがな・カタカナ）で入力してください' }

  VALID_KATAKANA_REGEX = /\A[ァ-ヶー]+\z/
  validates :last_name_kana, format: { with: VALID_KATAKANA_REGEX, message: '全角カタカナで入力してください' }
  validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX, message: '全角カタカナで入力してください' }
end
