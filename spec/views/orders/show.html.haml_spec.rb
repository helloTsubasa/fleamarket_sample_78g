require 'rails_helper'

RSpec.describe "orders/show", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Family Name/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Family Name Kana/)
    expect(rendered).to match(/First Name Kana/)
    expect(rendered).to match(/Zip Code/)
    expect(rendered).to match(/Prefecture/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Local/)
    expect(rendered).to match(/Building Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(//)
  end
end
