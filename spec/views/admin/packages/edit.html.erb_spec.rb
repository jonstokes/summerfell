require 'rails_helper'

RSpec.describe "admin/packages/edit", type: :view do
  before(:each) do
    @admin_package = assign(:admin_package, Admin::Package.create!())
  end

  it "renders the edit admin_package form" do
    render

    assert_select "form[action=?][method=?]", admin_package_path(@admin_package), "post" do
    end
  end
end
