FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name             { '松本' }
    first_name            { '行弘' }
    last_name_kana        { 'マツモト' }
    first_name_kana       { 'ユキヒロ' }
    birthday              { '2000/01/01' }
  end
end
