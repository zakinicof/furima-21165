FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_code_id { 1 }
    city { '札幌市' }
    house_number { '北７条東9丁目1-1' }
    building_name { 'サッポロビール博物館' }
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
