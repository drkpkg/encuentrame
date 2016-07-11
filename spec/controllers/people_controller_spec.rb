require 'rails_helper'

RSpec.describe PeopleController, type: :controller do

  before :each do
    @nino = fixture_file_upload("#{Rails.root}/spec/fixtures/files/nino.jpg", "image/jpg")
    @hombre = fixture_file_upload("#{Rails.root}/spec/fixtures/files/hombre.jpg", "image/jpg")
    @mujer = fixture_file_upload("#{Rails.root}/spec/fixtures/files/mujer.jpg", "image/jpg")
    @kappa = fixture_file_upload("#{Rails.root}/spec/fixtures/files/kappa.jpg", "image/jpg")
  end

  describe "GET #index" do
    it "returns http success" do
      get :index, {country: 'BO'}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #info" do
    it "returns http success" do
      get :info
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delete" do
    it "returns http success" do
      get :delete
      expect(response).to have_http_status(:success)
    end
  end

end
