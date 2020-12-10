require 'rails_helper'

RSpec.describe "Channels", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/channels/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/channels/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/channels/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
