require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        name: "Name",
        price: "Price",
        text: "Text",
        status: "Status",
        size: "Size",
        shipping_fee: "Shipping Fee",
        shipping_date: 2,
        user: nil,
        category: nil,
        brand: nil
      ),
      Item.create!(
        name: "Name",
        price: "Price",
        text: "Text",
        status: "Status",
        size: "Size",
        shipping_fee: "Shipping Fee",
        shipping_date: 2,
        user: nil,
        category: nil,
        brand: nil
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Price".to_s, count: 2
    assert_select "tr>td", text: "Text".to_s, count: 2
    assert_select "tr>td", text: "Status".to_s, count: 2
    assert_select "tr>td", text: "Size".to_s, count: 2
    assert_select "tr>td", text: "Shipping Fee".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
