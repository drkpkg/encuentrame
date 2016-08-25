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

  describe "Post #create" do
    it "redirects to people index" do
      post :create, person: {:name => 'Ariel',
                             :lastname => 'Vega',
                             :age => 28,
                             :sex => 'm',
                             :country => 'BO',
                             :state => 'S',
                             :city => '3',
                             :last_location => [0.0,0.0],
                             :description => 'Estaba saliendo de la U cuando zas se lo llevaron',
                             :contact_info_hash => {email:"email@server.com", phone: [1234567, 8765443]},
                             :photo => @hombre,
                             :complextion => 'normal',
                             :stature => '1.73'}
      expect(response).to have_http_status(:created)
    end
  end

  # describe "PATCH #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end
  #
  # describe "GET #delete" do
  #   it "redirects to people index" do
  #     delete :delete
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
