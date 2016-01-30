require 'rails_helper'

RSpec.describe "guests/index", type: :view do
  before(:each) do
    assign(:guests, [
      Guest.create!(),
      Guest.create!()
    ])
  end

  it "renders a list of guests" do
    render
  end
end
