FactoryBot.define do
  
  factory :product do
    name            {"名前"}
    detail          {"詳細"}
    size_id            {"1"}
    price           {100}
    condition_id       {"1"}
    shippingaddress_id {"北海道"}
    shippingdate_id    {"1~2日で発送"}
    payer_id           {"1"}
    category_id     {"1"}
    user_id         {1}
  end

end