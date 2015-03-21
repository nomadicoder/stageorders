require "rails_helper"

RSpec.describe SupportTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/support_types").to route_to("support_types#index")
    end

    it "routes to #new" do
      expect(:get => "/support_types/new").to route_to("support_types#new")
    end

    it "routes to #show" do
      expect(:get => "/support_types/1").to route_to("support_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/support_types/1/edit").to route_to("support_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/support_types").to route_to("support_types#create")
    end

    it "routes to #update" do
      expect(:put => "/support_types/1").to route_to("support_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/support_types/1").to route_to("support_types#destroy", :id => "1")
    end

  end
end
