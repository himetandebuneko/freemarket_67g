require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
  describe '#create' do
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include(“can’t be blank”)
    end
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include(“can’t be blank”)
    end
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include(“can’t be blank”)
    end
    it "is invalid without a lastname" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include(“can’t be blank”)
    end
    it "is invalid without a firstname" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include(“can’t be blank”)
    end
    it "is invalid without a lastnamekana" do
      user = build(:user, lastnamekana: nil)
      user.valid?
      expect(user.errors[:lastnamekana]).to include(“can’t be blank”)
    end
    it "is invalid without a firstnamekana" do
      user = build(:user, firstnamekana: nil)
      user.valid?
      expect(user.errors[:firstnamekana]).to include(“can’t be blank”)
    end
    it "is invalid without a birthday" do
      user = build(:user, birthday: nil)
      user.valid?
      expect(user.errors[:birthday]).to include(“can’t be blank”)
    end
    it "is valid with a nickname, email, password, lastname, firstname, lastnamekana, firstnamekana, birthday" do
      user = build(:user)
      expect(user).to be_valid
    end
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end
end