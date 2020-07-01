FactoryBot.define do
  factory :item do
    name { "MyString" }
    price { "MyString" }
    text { "MyString" }
    status { "MyString" }
    size { "MyString" }
    shipping_fee { "MyString" }
    shipping_date { 1 }
    user { nil }
    category { nil }
    brand { nil }
  end
end
