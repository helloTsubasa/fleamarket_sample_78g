require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        image: "Image",
        item: nil
      ),
      Image.create!(
        image: "Image",
        item: nil
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: "Image".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
