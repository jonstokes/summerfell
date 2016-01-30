require 'rails_helper'

RSpec.describe "guests/show", type: :view do
  before(:each) do
    @guest = assign(:guest, Guest.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
