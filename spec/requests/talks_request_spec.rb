require 'rails_helper'

RSpec.describe "Talks", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/talks/show"
      expect(response).to have_http_status(:success)
    end
  end

end
