require 'rails_helper'

RSpec.describe "admin/guests/index", type: :view do
  before(:each) do
    assign(:admin_guests, [
      Admin::Guest.create!(),
      Admin::Guest.create!()
    ])
  end

  it "renders a list of admin/guests" do
    render
  end
end
