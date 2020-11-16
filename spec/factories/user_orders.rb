FactoryBot.define do
  factory :user_order do
    token                     { 'tok_abcdefghijk00000000000000000' }
    postal_code               { '123-1234' }
    prefecture_id             { 2 }
    municipality              { '中標津町' }
    address                   { '青山１−１' }
    building_name             { 'モリビル' }
    phone_number              { '09012345678' }
  end
end
