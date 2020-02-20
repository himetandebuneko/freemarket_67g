FactoryBot.define do
  factory :user do
    nickname              {"テスト"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastnamekana          {"ヤマダ"}
    firstnamekana         {"タロウ"}
    birthday              {"1988/2/14"}
    after(:build) do |user|
      user.address<< build(:address, user: user)
    end
  end
end
