require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of email" do
        post :create, params: { user: {email: "",
                                       password: ""}}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end

      it "validates the password is 6 characters long" do
        post :create, params: { user: { email: "testing@testing.com",
                                        password: "123"}}
        expect(response).to render_template("new")
        expect(flash[:errors]).to be_present
      end
    end

    context "with valid params" do
      it "redirect user to new session for sign in" do
        post :create, params: { user: { email: "testing@testing.com",
                                        password: "password"}}
        expect(response).to render_template("new")
      end
    end

  end
end
