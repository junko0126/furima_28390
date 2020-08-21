FactoryBot.define do
  factory :item do
    name { 'あああああ' }
    content              { Faker::Lorem.sentence }
    category             { Category.all.sample }
    status               { Status.all.sample }
    payment              { Payment.all.sample }
    prefecture           { Prefecture.all.sample }
    days                 { Days.all.sample }
    price                { '1000' }
    association :user
  end
end
