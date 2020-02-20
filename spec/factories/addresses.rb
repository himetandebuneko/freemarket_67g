FactoryBot.define do
  factory :address do
    postcode              {"123-4567"}
    prefecture_id         {""}
    city                  {"横浜市緑区"}
    housenumber           {"青山1-1-1"}
    housename             {"柳ビル"}
    phonenumber           {"08012345678"}
    association  :user, factory: :user
  end
end