require 'rails_helper'

RSpec.describe "Teams", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/teams/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/teams/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/teams/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/teams/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
