require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe "GET list_catalog" do
    it "returns http success" do
      get :list_catalog
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET list_product" do
    it "returns http success" do
      get :list_product, id: 1
      expect(response).to have_http_status(:success)
    end
  end

end
