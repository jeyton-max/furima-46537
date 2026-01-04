FactoryBot.define do
  factory :order_address do
    postcode      { '123-4567' }
    prefecture_id { 41 }
    city          { '糸島市' }
    house_number  { '志摩初1' }
    building_name { 'プロムナード' }
    phone_number  { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end