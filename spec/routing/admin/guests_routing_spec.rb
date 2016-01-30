require "rails_helper"

RSpec.describe Admin::GuestsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/guests").to route_to("admin/guests#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/guests/new").to route_to("admin/guests#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/guests/1").to route_to("admin/guests#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/guests/1/edit").to route_to("admin/guests#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/guests").to route_to("admin/guests#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/guests/1").to route_to("admin/guests#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/guests/1").to route_to("admin/guests#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/guests/1").to route_to("admin/guests#destroy", :id => "1")
    end

  end
end
