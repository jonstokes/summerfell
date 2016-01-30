require 'rails_helper'

RSpec.describe "admin/packages/new", type: :view do
  before(:each) do
    assign(:admin_package, Admin::Package.new())
  end

  it "renders new admin_package form" do
    render

    assert_select "form[action=?][method=?]", admin_packages_path, "post" do
    end
  end
end
