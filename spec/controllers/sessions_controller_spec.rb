require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do
  let!(:user) { Fabricate(:user) }

  describe "GET #new" do
    context "unauthenticated users " do
      it "returns a successful http request status code" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "authenticated users" do

    end
  end

  describe "POST #create" do
    context "successful sign in" do
      before do
        post :create, {email: user.email, password: user.password}
      end
      it "redirects to the roo path" do
        expect(response).to redirect_to root_path
      end

      it "sets success flash message" do
        expect(flash[:success]).to eq('Sign in Successful')
      end

      it "creates a session record for valid inputs" do
        expect(session[:user_id]).to eq(user.id)
      end
    end

    context "unsuccessful sign in" do

    end
  end

end
