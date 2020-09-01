FactoryBot.define do
  factory :order_address do
    prefecture_id          { Prefecture.all.sample }
    postal_code            { '123-4567' }
    city                   { '横浜市緑区' }
    house_number           { '青山１−２' }
    phone                  { '0123456789' }
  end
end
