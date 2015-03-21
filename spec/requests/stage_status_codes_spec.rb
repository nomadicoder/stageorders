require 'rails_helper'

RSpec.describe "StageStatusCodes", :type => :request do
  describe "GET /stage_status_codes" do
    it "works! (now write some real specs)" do
      get stage_status_codes_path
      expect(response).to have_http_status(200)
    end
  end
end
