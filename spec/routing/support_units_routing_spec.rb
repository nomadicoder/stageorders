require "rails_helper"

RSpec.describe SupportUnitsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/support_units").to route_to("support_units#index")
    end

    it "routes to #new" do
      expect(:get => "/support_units/new").to route_to("support_units#new")
    end

    it "routes to #show" do
      expect(:get => "/support_units/1").to route_to("support_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/support_units/1/edit").to route_to("support_units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/support_units").to route_to("support_units#create")
    end

    it "routes to #update" do
      expect(:put => "/support_units/1").to route_to("support_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/support_units/1").to route_to("support_units#destroy", :id => "1")
    end

  end
end
