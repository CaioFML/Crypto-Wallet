require 'rails_helper'

RSpec.describe "MiningTypes", type: :request do
  describe "GET /mining_types" do
    it "works! (now write some real specs)" do
      get mining_types_path
      expect(response).to have_http_status(200)
    end
  end
end
