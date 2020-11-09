FactoryBot.define do
  factory :item do
    product_name              { 'テスト' }
    description_of_item       { 'テストの説明' }
    category_id               { 2 }
    product_status_id         { 2 }
    shipping_fee_burden_id    { 2 }
    shipment_source_id        { 2 }
    days_to_ship_id           { 2 }
    price                     { 3000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
