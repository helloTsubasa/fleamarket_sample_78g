require 'rails_helper'

RSpec.describe "items/show", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Price/)
    expect(rendered).to match(/Text/)
    expect(rendered).to match(/Status/)
    expect(rendered).to match(/Size/)
    expect(rendered).to match(/Shipping Fee/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
