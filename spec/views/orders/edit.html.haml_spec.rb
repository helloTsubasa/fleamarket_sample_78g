require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      family_name: "MyString",
      first_name: "MyString",
      family_name_kana: "MyString",
      first_name_kana: "MyString",
      zip_code: "MyString",
      prefecture: "MyString",
      city: "MyString",
      local: "MyString",
      building_name: "MyString",
      phone_number: "MyString",
      user: nil
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[family_name]"

      assert_select "input[name=?]", "order[first_name]"

      assert_select "input[name=?]", "order[family_name_kana]"

      assert_select "input[name=?]", "order[first_name_kana]"

      assert_select "input[name=?]", "order[zip_code]"

      assert_select "input[name=?]", "order[prefecture]"

      assert_select "input[name=?]", "order[city]"

      assert_select "input[name=?]", "order[local]"

      assert_select "input[name=?]", "order[building_name]"

      assert_select "input[name=?]", "order[phone_number]"

      assert_select "input[name=?]", "order[user_id]"
    end
  end
end
