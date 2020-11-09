FactoryBot.define do
  factory :user do
    nickname                  { 'テスト' }
    email                     { Faker::Internet.free_email }
    password                  { Faker::Internet.password(min_length: 6) }
    password_confirmation     { password }
    first_name                { '佐藤' }
    last_name                 { '次郎' }
    first_name_kana           { 'サトウ' }
    last_name_kana            { 'ジロウ' }
    birthday                  { '1930-01-01' }
  end
end
