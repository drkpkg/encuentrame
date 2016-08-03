require 'rails_helper'

RSpec.describe UtilsController, type: :controller do

  describe "GET #countries" do
    it "returns http success" do
      get :countries
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #cities" do
    it "returns http success" do
      get :cities
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #states" do
    it "returns http success" do
      get :states
      expect(response).to have_http_status(:success)
    end
  end

end
