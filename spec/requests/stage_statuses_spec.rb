require 'rails_helper'

RSpec.describe "StageStatuses", :type => :request do
  describe "GET /stage_statuses" do
    it "works! (now write some real specs)" do
      get stage_statuses_path
      expect(response).to have_http_status(200)
    end
  end
end
