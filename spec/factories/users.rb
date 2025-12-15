FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    # 英数字混合で合計文字数が6文字以上となるように設定しています。
    password { "a1#{Faker::Internet.password(min_length: 4)}" }
    password_confirmation { password }

    # 全角（漢字・ひらがな・カタカナ）のバリデーションを通過させるため、固定値としています。
    last_name             { '鈴木' }
    first_name            { '一郎' }
    # 全角カタカナのバリデーションを通過させるため、固定値としています。
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'イチロウ' }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: '2019-12-31') }
  end
end
