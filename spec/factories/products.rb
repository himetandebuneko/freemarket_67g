FactoryBot.define do
  
  factory :product do
    user_id         {1}
    name            {"名前"}
    detail          {"詳細"}
    category_id     {"1"}
    size            {"S"}
    condition       {"新品"}
    shippingaddress {"北海道"}
    shippingdate    {"1~2日で発送"}
    price           {100}
  end

end