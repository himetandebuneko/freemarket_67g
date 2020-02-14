FactoryBot.define do
  
  factory :image do
    image {"画像"}
    association :product, factory: :product
  end

end