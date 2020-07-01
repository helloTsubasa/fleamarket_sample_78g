require 'rails_helper'

RSpec.describe "orders/index", type: :view do
  before(:each) do
    assign(:orders, [
      Order.create!(
        family_name: "Family Name",
        first_name: "First Name",
        family_name_kana: "Family Name Kana",
        first_name_kana: "First Name Kana",
        zip_code: "Zip Code",
        prefecture: "Prefecture",
        city: "City",
        local: "Local",
        building_name: "Building Name",
        phone_number: "Phone Number",
        user: nil
      ),
      Order.create!(
        family_name: "Family Name",
        first_name: "First Name",
        family_name_kana: "Family Name Kana",
        first_name_kana: "First Name Kana",
        zip_code: "Zip Code",
        prefecture: "Prefecture",
        city: "City",
        local: "Local",
        building_name: "Building Name",
        phone_number: "Phone Number",
        user: nil
      )
    ])
  end

  it "renders a list of orders" do
    render
    assert_select "tr>td", text: "Family Name".to_s, count: 2
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Family Name Kana".to_s, count: 2
    assert_select "tr>td", text: "First Name Kana".to_s, count: 2
    assert_select "tr>td", text: "Zip Code".to_s, count: 2
    assert_select "tr>td", text: "Prefecture".to_s, count: 2
    assert_select "tr>td", text: "City".to_s, count: 2
    assert_select "tr>td", text: "Local".to_s, count: 2
    assert_select "tr>td", text: "Building Name".to_s, count: 2
    assert_select "tr>td", text: "Phone Number".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
