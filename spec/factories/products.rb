FactoryBot.define do
  
  factory :product do
    name            {"名前"}
    detail          {"詳細"}
    size            {"S"}
    price           {100}
    condition       {"新品"}
    shippingaddress {"北海道"}
    shippingdate    {"1~2日で発送"}
    payer           {"1"}
    category_id     {"1"}
    user_id         {1}
  end

end