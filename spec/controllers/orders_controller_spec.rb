require 'rails_helper'
require 'support/macros'

 RSpec.describe OrdersController, :type => :controller do
   let(:carlos) { Fabricate(:user) }
   before { set_current_user(carlos) }

   describe "GET #new" do
 	  it "returns a successful http request status code" do
       get :new

       expect(response).to have_http_status(:success)
     end
   end
 end
