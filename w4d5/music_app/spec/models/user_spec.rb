require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
     User.new(email: "testing@testing.com", password: "password")
  end

  describe "validation" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_length_of(:password).is_at_least(6).on(:create)}
  end

  describe "class methods" do
    describe "#is_password?" do
      it "validates the password is the user password_digest" do
        expect(user.is_password?("password")).to be true
      end
    end

    describe "#reset_session_token!" do
      it "reset the user session_token" do
        original = user.session_token
        user.reset_session_token!
        expect(original == user.session_token).to be false
      end
    end

    describe "::find_by_credentials" do
      before { user.save! }
      it "find the user object by credentials" do
        expect(User.find_by_credentials("testing@testing.com", "password")).to eq(user)
      end
    end
  end

end
