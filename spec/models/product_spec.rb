require 'rails_helper'

describe Product do
  describe '#create' do

    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a detail" do
      product = build(:product, detail: nil)      
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "is invalid without a size" do
      product = build(:product, size: nil)      
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end
    
    it "is invalid without a price" do
      product = build(:product, price: nil)      
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: nil)      
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shippingaddress" do
      product = build(:product, shippingaddress: nil)      
      product.valid?
      expect(product.errors[:shippingaddress]).to include("can't be blank")
    end
    
    it "is invalid without a shippingdate" do
      product = build(:product, shippingdate: nil)      
      product.valid?
      expect(product.errors[:shippingdate]).to include("can't be blank")
    end

    it "is invalid without a payer" do
      product = build(:product, payer: nil)      
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end
    
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)      
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      product = build(:product, category_id: nil)      
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end
  end

  describe '#update' do

    it "is invalid without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a detail" do
      product = build(:product, detail: nil)      
      product.valid?
      expect(product.errors[:detail]).to include("can't be blank")
    end

    it "is invalid without a size" do
      product = build(:product, size: nil)      
      product.valid?
      expect(product.errors[:size]).to include("can't be blank")
    end
    
    it "is invalid without a price" do
      product = build(:product, price: nil)      
      product.valid?
      expect(product.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition" do
      product = build(:product, condition: nil)      
      product.valid?
      expect(product.errors[:condition]).to include("can't be blank")
    end

    it "is invalid without a shippingaddress" do
      product = build(:product, shippingaddress: nil)      
      product.valid?
      expect(product.errors[:shippingaddress]).to include("can't be blank")
    end
    
    it "is invalid without a shippingdate" do
      product = build(:product, shippingdate: nil)      
      product.valid?
      expect(product.errors[:shippingdate]).to include("can't be blank")
    end
    
    it "is invalid without a category_id" do
      product = build(:product, category_id: nil)      
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a user_id" do
      product = build(:product, category_id: nil)      
      product.valid?
      expect(product.errors[:category_id]).to include("can't be blank")
    end

  end
end