require "rails_helper"

RSpec.describe StageStatusesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stage_statuses").to route_to("stage_statuses#index")
    end

    it "routes to #new" do
      expect(:get => "/stage_statuses/new").to route_to("stage_statuses#new")
    end

    it "routes to #show" do
      expect(:get => "/stage_statuses/1").to route_to("stage_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stage_statuses/1/edit").to route_to("stage_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stage_statuses").to route_to("stage_statuses#create")
    end

    it "routes to #update" do
      expect(:put => "/stage_statuses/1").to route_to("stage_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stage_statuses/1").to route_to("stage_statuses#destroy", :id => "1")
    end

  end
end
