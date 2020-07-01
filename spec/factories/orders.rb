FactoryBot.define do
  factory :order do
    family_name { "MyString" }
    first_name { "MyString" }
    family_name_kana { "MyString" }
    first_name_kana { "MyString" }
    zip_code { "MyString" }
    prefecture { "MyString" }
    city { "MyString" }
    local { "MyString" }
    building_name { "MyString" }
    phone_number { "MyString" }
    user { nil }
  end
end
