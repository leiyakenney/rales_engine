FactoryBot.define do
  factory :item do
    name { "Banana" }
    description { "Bananarific" }
    unit_price { "100" }
    merchant
  end
end
