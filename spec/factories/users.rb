FactoryBot.define do
  factory :user do
    first_name            { '山田' }
    family_name           { '花子' }
    first_name_kana       { 'ヤマダ' }
    family_name_kana      { 'ハナコ' }
    nickname              { Faker::Name.initials(number: 2) }
    email                 { '0a0a0a@1a2a2a' }
    password              { 'abc12345' }
    password_confirmation { password }
    birthday              { '2020-01-01' }
  end
end
