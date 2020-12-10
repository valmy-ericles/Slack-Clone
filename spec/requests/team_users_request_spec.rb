require 'rails_helper'

RSpec.describe "TeamUsers", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/team_users/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/team_users/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
