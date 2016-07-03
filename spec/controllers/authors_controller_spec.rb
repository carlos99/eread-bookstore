require 'rails_helper'

RSpec.describe AuthorsController, :type => :controller do
  describe "GET #index" do
    it "returns a successful http request stutus code" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns a successful http request status code" do
      author = Fabricate(:author)

      get :show, id: author.id
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
      it "save the new author object" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(Author.count).to eq(1)
      end

      it "redirects to the author show action" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(response).to redirect_to author_path(Author.last) #or Author.first. author_path requires the id of the author
      end

      it "an unsuccessful create" do
        post :create, author: Fabricate.attributes_for(:author)
        expect(flash[:success]).to eq("Author has been created")
      end
    end

    context "an unsuccessful create" do
      it "does not save the author object with invalid input" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(Author.count).to eq(0)
      end

      it "sets the failure flash message" do
        post :create, author: Fabricate.attributes_for(:author, first_name: nil)
        expect(flash[:danger]).to eq("Author has not been created")
      end
    end
  end

  describe "GET #edit" do
    let(:author) { Fabricate(:author) }

    it "sends a successful edit request" do
      get :edit, id: author
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    context "successful update" do
      let(:carlos) { Fabricate(:author, first_name: "Carlos") }

      it "updates the modified author object" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Charles"), id: carlos.id
        expect(Author.last.first_name).to eq("Charles")
        expect(Author.last.first_name).not_to eq("Carlos")
      end

      it "sets the success flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Charles"), id: carlos.id
        expect(flash[:success]).to eq("Author has been updated")
      end

      it "redirect to the show action" do
        put :update, author: Fabricate.attributes_for(:author, first_name: "Charles"), id: carlos.id
        expect(response).to redirect_to(author_path(Author.last))
      end
    end

    context "unsuccessful update" do
      let(:carlos) { Fabricate(:author, first_name: "Carlos") }

      it "does not updates the author object with invalid inputs" do
        put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: carlos.id
        expect(Author.last.first_name).to eq("Carlos")
      end

      it "sets the failure flash message" do
        put :update, author: Fabricate.attributes_for(:author, first_name: nil), id: carlos.id
        expect(flash[:danger]).to eq("Author has not been updated")
      end

    end
  end

  describe "DELETE #destroy" do
    let(:author) { Fabricate(:author) }

    it "deletes the author with the given id" do
      delete :destroy, id: author.id
      expect(Author.count).to eq(0)
    end

    it "sets the flash message" do
      delete :destroy, id: author.id
      expect(flash[:success]).to eq("Author has been deleted")
    end

    it "redirects to the index action" do
      delete :destroy, id: author.id
      expect(response).to redirect_to authors_path
    end
  end
end
