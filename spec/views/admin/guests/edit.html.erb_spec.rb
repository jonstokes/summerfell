require 'rails_helper'

RSpec.describe "admin/guests/edit", type: :view do
  before(:each) do
    @admin_guest = assign(:admin_guest, Admin::Guest.create!())
  end

  it "renders the edit admin_guest form" do
    render

    assert_select "form[action=?][method=?]", admin_guest_path(@admin_guest), "post" do
    end
  end
end
