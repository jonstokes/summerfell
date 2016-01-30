require 'rails_helper'

RSpec.describe "admin/guests/new", type: :view do
  before(:each) do
    assign(:admin_guest, Admin::Guest.new())
  end

  it "renders new admin_guest form" do
    render

    assert_select "form[action=?][method=?]", admin_guests_path, "post" do
    end
  end
end
