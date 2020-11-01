FactoryBot.define do
  factory :item do
    name               {"テスト"}
    description        {"テストテスト"}
    price              {1000}
    category_id        {3}
    item_condition_id  {3}
    shipping_payer_id  {3}
    prefecture_code_id {3}
    preparation_day_id {3}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
