require 'rails_helper'

RSpec.describe "Welcomes", type: :request do

  describe "GET /index" do
    it "returns http success" do
      root "/welcome/index"
      expect(response).to have_http_status(:success)
    end
  end

end
