require 'rails_helper'

RSpec.describe "Admin::Guests", type: :request do
  describe "GET /admin_guests" do
    it "works! (now write some real specs)" do
      get admin_guests_path
      expect(response).to have_http_status(200)
    end
  end
end
