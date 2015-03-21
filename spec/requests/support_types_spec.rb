require 'rails_helper'

RSpec.describe "SupportTypes", :type => :request do
  describe "GET /support_types" do
    it "works! (now write some real specs)" do
      get support_types_path
      expect(response).to have_http_status(200)
    end
  end
end
