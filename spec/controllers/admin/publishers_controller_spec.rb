require 'rails_helper'

RSpec.describe Admin::PublishersController, :type => :controller do
  describe "GET #index" do
    it "returns a successful http request stutus code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful http request status code" do
      publisher = Fabricate(:publisher)

      get :show, id: publisher.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a successful http request status code" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "a successful create" do
      it "save the new publisher object" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(Publisher.count).to eq(1)
      end

      it "redirects to the publisher show action" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(response).to redirect_to publisher_path(Publisher.last) #or Publisher.first. publisher_path requires the id of the publisher
      end

      it "an unsuccessful create" do
        post :create, publisher: Fabricate.attributes_for(:publisher)
        expect(flash[:success]).to eq("Publisher has been created")
      end
    end

    context "an unsuccessful create" do
      it "does not save the publisher object with invalid input" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(Publisher.count).to eq(0)
      end

      it "sets the failure flash message" do
        post :create, publisher: Fabricate.attributes_for(:publisher, name: nil)
        expect(flash[:danger]).to eq("Publisher has not been created")
      end
    end
  end

  describe "GET #edit" do
    let(:publisher) { Fabricate(:publisher) }

    it "sends a successful edit request" do
      get :edit, id: publisher
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successful update" do
      let(:carlos) { Fabricate(:publisher, name: "Carlos") }

      it "updates the modified publisher object" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Charles"), id: carlos.id
        expect(Publisher.last.name).to eq("Charles")
        expect(Publisher.last.name).not_to eq("Carlos")
      end

      it "sets the success flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Charles"), id: carlos.id
        expect(flash[:success]).to eq("Publisher has been updated")
      end

      it "redirect to the show action" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: "Charles"), id: carlos.id
        expect(response).to redirect_to(publisher_path(Publisher.last))
      end
    end

    context "unsuccessful update" do
      let(:carlos) { Fabricate(:publisher, name: "Carlos") }

      it "does not updates the publisher object with invalid inputs" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: nil), id: carlos.id
        expect(Publisher.last.name).to eq("Carlos")
      end

      it "sets the failure flash message" do
        put :update, publisher: Fabricate.attributes_for(:publisher, name: nil), id: carlos.id
        expect(flash[:danger]).to eq("Publisher has not been updated")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:publisher) { Fabricate(:publisher) }

    it "deletes the publisher with the given id" do
      delete :destroy, id: publisher.id
      expect(Publisher.count).to eq(0)
    end

    it "sets the flash message" do
      delete :destroy, id: publisher.id
      expect(flash[:success]).to eq("Publisher has been deleted")
    end

    it "redirects to the index action" do
      delete :destroy, id: publisher.id
      expect(response).to redirect_to publishers_path
    end
  end


end
