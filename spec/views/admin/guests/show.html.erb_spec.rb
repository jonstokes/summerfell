require 'rails_helper'

RSpec.describe "admin/guests/show", type: :view do
  before(:each) do
    @admin_guest = assign(:admin_guest, Admin::Guest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
