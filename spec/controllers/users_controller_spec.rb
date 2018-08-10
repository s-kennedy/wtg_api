require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "POST #create" do
    it "creates a new user when the correct data is entered" do
      post :create, params: {
        user: {
          name: "User",
          email: "user@email.com",
          password: "testpassword",
          password_confirmation: "testpassword"
        }
      }

      new_user = User.last
      expect(new_user.name).to eq("User")
      expect(new_user.email).to eq("user@email.com")
      expect(new_user.password_digest).to_not eq("testpassword")
      expect(new_user.authenticate("testpassword")).to be new_user
      expect(new_user.valid?).to be(true)
    end

    it "returns error if validation errors" do
      post :create, params: {
        user: {
          email: "email@email.com",
           password: "password",
           password_confirmation: "password"
         }
       }
      expect(response).to have_http_status(400)
    end
  end
end
