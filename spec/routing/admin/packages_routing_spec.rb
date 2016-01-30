require "rails_helper"

RSpec.describe Admin::PackagesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/admin/packages").to route_to("admin/packages#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/packages/new").to route_to("admin/packages#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/packages/1").to route_to("admin/packages#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/packages/1/edit").to route_to("admin/packages#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/packages").to route_to("admin/packages#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/packages/1").to route_to("admin/packages#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/packages/1").to route_to("admin/packages#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/packages/1").to route_to("admin/packages#destroy", :id => "1")
    end

  end
end
