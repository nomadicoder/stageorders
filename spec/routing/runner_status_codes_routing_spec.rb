require "rails_helper"

RSpec.describe RunnerStatusCodesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/runner_status_codes").to route_to("runner_status_codes#index")
    end

    it "routes to #new" do
      expect(:get => "/runner_status_codes/new").to route_to("runner_status_codes#new")
    end

    it "routes to #show" do
      expect(:get => "/runner_status_codes/1").to route_to("runner_status_codes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/runner_status_codes/1/edit").to route_to("runner_status_codes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/runner_status_codes").to route_to("runner_status_codes#create")
    end

    it "routes to #update" do
      expect(:put => "/runner_status_codes/1").to route_to("runner_status_codes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/runner_status_codes/1").to route_to("runner_status_codes#destroy", :id => "1")
    end

  end
end
