require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    User.new(email: "testing@testing.com", password: "password")
  end

  describe "validations" do
    describe "validates presence of email" do
      it { should validate_presence_of(:email)}
    end

    describe "validates presence of password_digest" do
      it { should validate_presence_of(:password_digest)}
    end

    describe "validates presence of session_token" do
      it { should validate_presence_of(:session_token)}
    end

    describe "validates password length is at least 6" do
      it { should validate_length_of(:password).is_at_least(6).on(:create)}
    end
  end

  describe "User class methods" do
    describe "::find_by_credentials" do
      before { user.save!}
      it "find the user by credentials" do
        expect(User.find_by_credentials("testing@testing.com", "password")).to eq(user)
      end
    end

    describe "#is_password?" do
      it "validates the user credentials" do
        expect(user.is_password?("password")).to be true
      end
    end

    describe "#reset_session_token!" do
      it "reset the user's session_token" do
        old = user.session_token
        expect(old).to be_truthy
        reset = user.reset_session_token!
        expect(old == reset).to be false
      end
    end

    describe "ensure_session_token" do
      it "ensure the user has a session_token" do
        expect(user.session_token).to be_truthy
      end
    end
  end

end
