require 'rails_helper'

RSpec.describe "admin/packages/show", type: :view do
  before(:each) do
    @admin_package = assign(:admin_package, Admin::Package.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
