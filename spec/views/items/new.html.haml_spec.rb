require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      name: "MyString",
      price: "MyString",
      text: "MyString",
      status: "MyString",
      size: "MyString",
      shipping_fee: "MyString",
      shipping_date: 1,
      user: nil,
      category: nil,
      brand: nil
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[name]"

      assert_select "input[name=?]", "item[price]"

      assert_select "input[name=?]", "item[text]"

      assert_select "input[name=?]", "item[status]"

      assert_select "input[name=?]", "item[size]"

      assert_select "input[name=?]", "item[shipping_fee]"

      assert_select "input[name=?]", "item[shipping_date]"

      assert_select "input[name=?]", "item[user_id]"

      assert_select "input[name=?]", "item[category_id]"

      assert_select "input[name=?]", "item[brand_id]"
    end
  end
end
