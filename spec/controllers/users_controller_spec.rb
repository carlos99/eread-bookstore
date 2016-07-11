require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "GET #index" do
    it "returns a successful http request stutus code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful http request status code" do
      user = Fabricate(:user)

      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

end
