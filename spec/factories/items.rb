FactoryBot.define do
  factory :item do
    name { "MyString" }
    description { "MyString" }
    unit_price { "10000" }
    merchant
  end
end
