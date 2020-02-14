require 'rails_helper'
describe Image do
  describe '#create' do
    it "is invalid without a image" do
      image = build(:image, image: nil)
      image.valid?
      expect(image.errors[:image]).to include("can't be blank")
    end
  end
end

