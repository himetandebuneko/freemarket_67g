require 'rails_helper'
describe Address do
  describe '#create' do
    it "is invalid without a postcode" do
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include(“can’t be blank”)
    end
    it "is invalid without a prefecture_id" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include(“can’t be blank”)
    end
    it "is invalid without a city" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include(“can’t be blank”)
    end
    it "is invalid without a housenumber" do
      address = build(:address, housenumber: nil)
      address.valid?
      expect(address.errors[:housenumber]).to include(“can’t be blank”)
    end
    it "is invalid without a housename" do
      address = build(:address, housename: nil)
      address.valid?
      expect(address.errors[:housename]).to include(“can’t be blank”)
    end
    it "is invalid without a phonenumber" do
      address = build(:address, phonenumber: nil)
      address.valid?
      expect(address.errors[:phonenumber]).to include(“can’t be blank”)
    end
    it "is valid with a postcode, prefecture_id, city, housenumber, housename, phonenumber" do
      address = build(:address)
      expect(address).to be_valid
    end
    it "is invalid with a duplicate phonenumber" do
      address = create(:address)
      another_address = build(:address)
      another_address.valid?
      expect(another_address.errors[:phonenumber]).to include("has already been taken")
    end
  end
end