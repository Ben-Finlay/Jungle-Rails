require 'rails_helper'

RSpec.describe "Admin::Categories", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admin/category/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/admin/category/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/admin/category/create"
      expect(response).to have_http_status(:success)
    end
  end

end
