require 'rails_helper'

RSpec.describe "admin/packages/index", type: :view do
  before(:each) do
    assign(:admin_packages, [
      Admin::Package.create!(),
      Admin::Package.create!()
    ])
  end

  it "renders a list of admin/packages" do
    render
  end
end
